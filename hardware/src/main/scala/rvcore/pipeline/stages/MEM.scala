package rvcore.pipeline.stages

import rvcore.pipeline.lib.Interfaces._
import chisel3._
import chisel3.util._
import rvcore.lib.Helper._
import rvcore.systembus.{MasterChannel, SlaveChannel, SysBusCmd, SysBusMasterIO}


class MEM extends MultiIOModule {
  val in = IO(Input(new EX_MEM))
  val out = IO(Output(new MEM_WB))
  val sysBusMaster = IO(Output(new MasterChannel))
  val ctrl = IO(new Bundle {
    val rd = Output(UInt(5.W))
    val aluRes = Output(SInt(32.W))
  })

  //TODO: commands need to be stopped when pipeline is stalled due to waiting on read or write response
  sysBusMaster.holdLow()
  when(in.mem.write){
    sysBusMaster.addr   := in.aluRes.asUInt()
    sysBusMaster.cmd    := SysBusCmd.WRITE
    sysBusMaster.wrData := in.regOp2.asUInt()
    sysBusMaster.strb   := MuxCase(VecInit(Seq.fill(4)(1.B)), Seq(
      in.mem.byte       -> VecInit(1.B, 0.B, 0.B, 0.B),
      in.mem.halfWord   -> VecInit(1.B, 1.B, 0.B, 0.B)
    ))
  }.elsewhen(in.mem.read){
    sysBusMaster.addr := in.aluRes.asUInt()
    sysBusMaster.cmd := SysBusCmd.READ
  }




  out.wb := in.wb
  out.wbSrc := in.wbSrc
  out.rd := in.rd
  out.mem := in.mem
  out.aluRes := in.aluRes
  ctrl.aluRes := in.aluRes
  ctrl.rd := in.rd
}

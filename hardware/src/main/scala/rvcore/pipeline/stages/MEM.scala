package rvcore.pipeline.stages

import rvcore.pipeline.lib.Interfaces._
import chisel3._
import chisel3.util._
import rvcore.lib.Helper._
import rvcore.systembus.{SlaveChannel, SysBusCmd, SysBusMasterIO}


class MEM extends MultiIOModule {
  val in = IO(Input(new EX_MEM))
  val out = IO(Output(new MEM_WB))
  val sysBusSlave = IO(Input(new SlaveChannel))
  val ctrl = IO(new Bundle {
    val rd = Output(UInt(5.W))
    val aluRes = Output(SInt(32.W))
  })

  val rdData = WireDefault(VecInit(Seq.fill(4)(0.U(8.W))))
  when(in.mem.read){
    rdData := DatatoByteVec(sysBusSlave.rdData)
  }

  out.memRes := 0.S
  when(in.mem.byte){
    out.memRes := Cat(VecInit(Seq.fill(24)(in.mem.signed & rdData(0)(7))).asUInt, rdData(0)).asSInt
  }.elsewhen(in.mem.halfWord){
    out.memRes := Cat(VecInit(Seq.fill(16)(in.mem.signed & rdData(1)(7))).asUInt, rdData(1), rdData(0)).asSInt
  }.otherwise{
    out.memRes := (rdData(3) ## rdData(2) ## rdData(1) ## rdData(0)).asSInt
  }


  out.wb := in.wb
  out.wbSrc := in.wbSrc
  out.rd := in.rd
  out.aluRes := in.aluRes
  ctrl.aluRes := in.aluRes
  ctrl.rd := in.rd
}

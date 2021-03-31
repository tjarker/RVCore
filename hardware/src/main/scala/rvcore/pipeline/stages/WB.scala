package rvcore.pipeline.stages

import rvcore.pipeline.lib.Interfaces._
import chisel3._
import chisel3.util.Cat
import rvcore.lib.Helper.DatatoByteVec
import rvcore.systembus.SlaveChannel

class WB extends MultiIOModule {
  val in = IO(Input(new MEM_WB))
  val out = IO(Output(new WB_ID))
  val ctrl = IO(new Bundle {
    val rd = Output(UInt(5.W))
    val res = Output(SInt(32.W))
  })
  val sysBusSlave = IO(Input(new SlaveChannel))

  val rdData = WireDefault(VecInit(Seq.fill(4)(0.U(8.W))))
  when(in.mem.read){
    rdData := DatatoByteVec(sysBusSlave.rdData)
  }

  val memRes = WireDefault(0.S)
  when(in.mem.byte){
    memRes := Cat(VecInit(Seq.fill(24)(in.mem.signed & rdData(0)(7))).asUInt, rdData(0)).asSInt
  }.elsewhen(in.mem.halfWord){
    memRes := Cat(VecInit(Seq.fill(16)(in.mem.signed & rdData(1)(7))).asUInt, rdData(1), rdData(0)).asSInt
  }.otherwise{
    memRes := (rdData(3) ## rdData(2) ## rdData(1) ## rdData(0)).asSInt
  }


  val resSig = Mux(in.wbSrc, memRes, in.aluRes)
  out.res := resSig
  ctrl.rd := in.rd
  ctrl.res := resSig
  out.rd := in.rd
  out.wb := in.wb

}

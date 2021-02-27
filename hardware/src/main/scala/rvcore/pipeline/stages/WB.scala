package rvcore.pipeline.stages

import rvcore.pipeline.lib.Interfaces._
import chisel3._

class WB extends MultiIOModule {
  val in = IO(Input(new MEM_WB))
  val out = IO(Output(new WB_ID))
  val ctrl = IO(new Bundle {
    val rd = Output(UInt(5.W))
    val res = Output(SInt(32.W))
  })
  val resSig = Mux(in.wbSrc, in.memRes, in.aluRes)
  out.res := resSig
  ctrl.rd := in.rd
  ctrl.res := resSig
  out.rd := in.rd
  out.wb := in.wb

}

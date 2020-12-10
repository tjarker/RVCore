package rvcore.PipelineStages

import rvcore.lib.Interfaces._
import rvcore.submodules.{DataMemory0, DataMemory1}
import chisel3._


class MEM(memorySize: Int) extends MultiIOModule {
  val in = IO(Input(new EX_MEM))
  val out = IO(Output(new MEM_WB))
  val ctrl = IO(new Bundle {
    val rd = Output(UInt(5.W))
    val aluRes = Output(SInt(32.W))
  })
  val mem = Module(new DataMemory1(memorySize))

  mem.io.memOp := in.mem
  mem.io.address := in.aluRes.asUInt
  mem.io.wrData := in.regOp2

  out.memRes := mem.io.rdData

  val delayedAluRes = RegNext(in.aluRes)

  out.wb := in.wb
  out.wbSrc := in.wbSrc
  out.rd := in.rd
  out.aluRes := delayedAluRes
  ctrl.aluRes := delayedAluRes
  ctrl.rd := in.rd
}

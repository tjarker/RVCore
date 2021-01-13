package rvcore.PipelineStages

import rvcore.lib.Interfaces._
import rvcore.submodules.{DataMemory0, DataMemory1}
import chisel3._


class MEM extends MultiIOModule {
  val in = IO(Input(new EX_MEM))
  val out = IO(Output(new MEM_WB))
  val ctrl = IO(new Bundle {
    val rd = Output(UInt(5.W))
    val aluRes = Output(SInt(32.W))
    val memBus = new memoryInterface
  })

  ctrl.memBus.memOp := in.mem
  ctrl.memBus.addr := in.aluRes.asUInt
  ctrl.memBus.wrData := in.regOp2

  out.memRes := ctrl.memBus.memOut

  val delayedAluRes = RegNext(in.aluRes)

  out.wb := in.wb
  out.wbSrc := in.wbSrc
  out.rd := in.rd
  out.aluRes := delayedAluRes
  ctrl.aluRes := delayedAluRes
  ctrl.rd := in.rd
}

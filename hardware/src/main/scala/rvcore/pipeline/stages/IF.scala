package rvcore.pipeline.stages

import chisel3._
import rvcore.pipeline.lib.Interfaces._
import rvcore.lib.OpcodesRV32I
import rvcore.pipeline.lib.InstrBus
import rvcore.pipeline.submodules._


class IF(branchPredictorGen: () => BranchPredictor) extends MultiIOModule {
  val in = IO(Input(new EX_IF))
  val out = IO(Output(new IF_ID))
  val instrBus = IO(new InstrBus)
  val ctrl = IO(new Bundle {
    val pcEn = Input(Bool())
    val instr = Output(SInt(32.W))
  })

  val pc = RegInit((0xFFFFFFFFL-3).U(32.W))
  val nextPC = WireDefault(pc)
  pc := nextPC

  val branchGen = Module(new BranchGen)
  val instr = instrBus.instr.asSInt

  instrBus.pc := nextPC //TODO: how can we make this read synchronous? -> start pc at 0-4 and send next_pc to icache

  val branchPredictor = Module(branchPredictorGen())
  val branchPrediction = branchPredictor.io.takeBranchGuess && instr(6, 0) === OpcodesRV32I.BEQ.opcode

  branchGen.io.pc           := pc
  branchGen.io.instruction  := instr.asSInt()
  branchPredictor.io.pc     := pc
  branchPredictor.io.newPc  := branchGen.io.newPc
  //For index prediction
  branchPredictor.io.takeBranchEx := in.branch
  branchPredictor.io.pcSrc        := in.pcSrc
  branchPredictor.io.index        := in.branchIndex

  out.instr             := instr
  ctrl.instr            := instr
  out.pc                := pc
  out.branchPrediction  := branchPrediction


  when(ctrl.pcEn) {
    nextPC := pc + 4.U
    when(in.branch) {
      nextPC := in.pcNext
    }.elsewhen(branchPrediction) {
      nextPC := branchGen.io.newPc
    }
  }

}

package rvcore.pipeline.stages

import chisel3._
import rvcore.pipeline.lib.Interfaces._
import rvcore.lib.OpcodesRV32I
import rvcore.pipeline.submodules._
import rvcore.systembus.InstrBus

class IF(branchPredictionScheme: String = "") extends MultiIOModule {
  val in = IO(Input(new EX_IF))
  val out = IO(Output(new IF_ID))
  val instrBus = IO(new InstrBus)
  val ctrl = IO(new Bundle {
    val pcEn = Input(Bool())
    val instr = Output(SInt(32.W))
  })

  val pc = RegInit(0.U(32.W))

  val branchGen = Module(new BranchGen)
  val instr = instrBus.instr.asSInt

  instrBus.pc := pc //TODO: how can we make this read synchronous?

  val branchPredictor = Module(branchPredictionScheme match {
    case "Always" => new BranchPredictorAlwaysTaken
    case "Never" => new BranchPredictorNeverTaken
    case "Loop" => new BranchPredictorLoopcheck
    case "Index1" => new BranchPredictorIndex1
    case "Index2" => new BranchPredictorIndex2
    case _ => new BranchPredictorNeverTaken
  })
  val branchPrediction = branchPredictor.io.takeBranchGuess && instr(6, 0) === OpcodesRV32I.BEQ.opcode

  branchGen.io.pc := pc
  branchGen.io.instruction := instr.asSInt()
  branchPredictor.io.pc := pc
  branchPredictor.io.newPc := branchGen.io.newPc
  //For index prediction
  branchPredictor.io.takeBranchEx := in.branch
  branchPredictor.io.pcSrc := in.pcSrc
  branchPredictor.io.index := in.branchIndex

  out.instr := instr
  ctrl.instr := instr
  out.pc := pc
  out.branchPrediction := branchPrediction

  pc := pc
  when(ctrl.pcEn) {
    pc := pc + 4.U
    when(in.branch) {
      pc := in.pcNext
    }.elsewhen(branchPrediction) {
      pc := branchGen.io.newPc
    }
  }

}

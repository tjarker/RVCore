package rvcore.PipelineStages

import rvcore.lib.Interfaces._
import rvcore.lib.OpcodesRV32I
import rvcore.submodules._
import chisel3._
import chisel3.util._

class IF(program: Array[Int], branchPredictionScheme : String = "") extends MultiIOModule {
  val in = IO(Input(new EX_IF))
  val out = IO(Output(new IF_ID))
  val ctrl = IO(new Bundle {
    val pcEn = Input(Bool())
    val instr = Output(SInt(32.W))
  })

  val imem = VecInit(program.map(_.U(8.W)))
  val pc = RegInit(0.U(32.W))
  val branchGen = Module(new BranchGen)
  var branchPredictor = branchPredictionScheme match {
    case "Always" => Module(new BranchPredictorAlwaysTaken)
    case "Never" => Module(new BranchPredictorNeverTaken)
    case "Loop" => Module(new BranchPredictorLoopcheck)
    case "Index1" => Module(new BranchPredictorIndex1)
    case "Index2" => Module(new BranchPredictorIndex2)
    case _ => Module(new BranchPredictorNeverTaken)
  }
  val instr = Cat(imem(pc + 3.U), imem(pc + 2.U), imem(pc + 1.U), imem(pc)).asSInt()
  val branchPrediction = branchPredictor.io.takeBranchGuess && instr(6,0) === OpcodesRV32I.BEQ.opcode

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
    }.elsewhen(branchPrediction){
      pc := branchGen.io.newPc
    }
  }

}

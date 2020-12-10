package rvcore.PipelineStages

import rvcore.lib.Interfaces._
import rvcore.submodules._
import chisel3._
import chisel3.util._

class EX extends MultiIOModule {
  val in = IO(Input(new ID_EX))
  val out = IO(Output(new EX_MEM))
  val ctrl = IO(new Bundle {
    val rs1 = Output(UInt(5.W))
    val rs2 = Output(UInt(5.W))
    val rd = Output(UInt(5.W))
    val fwdA = Input(SInt(32.W))
    val fwdB = Input(SInt(32.W))
    val fwdA_en = Input(Bool())
    val fwdB_en = Input(Bool())
    val branchOut = Output(new EX_IF)
  })
  //Bubble control signals
  ctrl.rs1 := in.rs1
  ctrl.rs2 := in.rs2
  out.rd := in.rd
  ctrl.rd := in.rd
  out.wb := in.wb
  out.mem := in.mem
  out.wbSrc := in.wbSrc
  out.rd := in.rd

  val alu = Module(new ALU)
  val branchControl = Module(new BranchControl)
  val fwdRegOp1 = Mux(ctrl.fwdA_en, ctrl.fwdA, in.regOp1)
  val fwdRegOp2 = Mux(ctrl.fwdB_en, ctrl.fwdB, in.regOp2)

  branchControl.io.funct3 := in.funct3
  branchControl.io.jump := in.jump
  branchControl.io.registerS1 := fwdRegOp1
  branchControl.io.registerS2 := fwdRegOp2

  ctrl.branchOut.branch := ((branchControl.io.takeBranch ^ in.branchPrediction)) & in.pcSrc
  ctrl.branchOut.pcNext := Mux(in.brSrc, (fwdRegOp1.asSInt() + in.imm).asUInt, (in.pc.asSInt() + in.imm).asUInt())
  ctrl.branchOut.pcSrc := in.pcSrc && !in.jump
  ctrl.branchOut.branchIndex := in.pc(7,0)
  when(in.branchPrediction && !branchControl.io.takeBranch){
    ctrl.branchOut.pcNext := in.pc + 4.U
  }

  alu.io.source1 := fwdRegOp1
  alu.io.source2 := fwdRegOp2
  alu.io.operation := in.aluOp

  switch(in.aluSrc1) {
    is(0.U) {
      alu.io.source1 := fwdRegOp1
    }
    is(1.U) {
      alu.io.source1 := in.pc.asSInt
    }
    is(2.U) {
      alu.io.source1 := 0.S
    }
  }
  switch(in.aluSrc2) {
    is(0.U) {
      alu.io.source2 := fwdRegOp2
    }
    is(1.U) {
      alu.io.source2 := in.imm
    }
    is(2.U) {
      alu.io.source2 := 4.S
    }
  }

  out.aluRes := alu.io.output
  out.regOp2 := fwdRegOp2
}

package rvcore.pipeline.submodules

import chisel3._
import chisel3.util._

class BranchControl extends Module {
  val io = IO(new Bundle {
    val funct3 = Input(UInt(3.W))
    val registerS1 = Input(SInt(32.W))
    val registerS2 = Input(SInt(32.W))
    val jump = Input(Bool())
    val takeBranch = Output(Bool())
  })

  val equal = io.registerS1 === io.registerS2
  val lessThan = io.registerS1 < io.registerS2
  val lessThanU = io.registerS1.asUInt() < io.registerS2.asUInt()

  io.takeBranch := false.B

  switch(io.funct3) {
    is(0.U) {
      io.takeBranch := equal
    }
    is(1.U) {
      io.takeBranch := !equal
    }
    is(4.U) {
      io.takeBranch := lessThan
    }
    is(5.U) {
      io.takeBranch := !lessThan
    }
    is(6.U) {
      io.takeBranch := lessThanU
    }
    is(7.U) {
      io.takeBranch := !lessThanU
    }
  }
  when(io.jump) {
    io.takeBranch := true.B
  }

}

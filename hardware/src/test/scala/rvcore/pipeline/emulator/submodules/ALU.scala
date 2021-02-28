package rvcore.pipeline.emulator.submodules

import rvcore.pipeline.lib.ALUOps._
import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    val source1 = Input(SInt(32.W))
    val source2 = Input(SInt(32.W))
    val operation = Input(UInt(4.W))
    val output = Output(SInt(32.W))
  })
  // add
  // sub
  // shift left
  // shift right
  // shift right arithmetic
  // or
  // and
  // xor
  // set less than
  // TODO: add mux in front of ALU source 1 with rs1 or PC or 0

  io.output := io.source1 + io.source2

  switch(io.operation) {
    is(add) {
      io.output := io.source1 + io.source2
    }
    is(sub) {
      io.output := io.source1 - io.source2
    }
    is(sl) {
      io.output := (io.source1.asUInt << io.source2(4, 0).asUInt).asSInt
    }
    is(sr) {
      io.output := (io.source1.asUInt >> io.source2(4, 0).asUInt).asSInt
    }
    is(sra) {
      io.output := (io.source1 >> io.source2(4, 0).asUInt).asSInt
    }
    is(or) {
      io.output := io.source1 | io.source2
    }
    is(and) {
      io.output := io.source1 & io.source2
    }
    is(xor) {
      io.output := io.source1 ^ io.source2
    }
    is(slt) {
      io.output := (io.source1 < io.source2).asSInt()
    }
  }
}

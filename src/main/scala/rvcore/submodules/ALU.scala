package rvcore.submodules

import rvcore.lib.ALUOps._
import chisel3._
import chisel3.util._

abstract class ALUType extends Module {
  val io = IO(new Bundle {
    val source1 = Input(SInt(32.W))
    val source2 = Input(SInt(32.W))
    val operation = Input(UInt(4.W))
    val output = Output(SInt(32.W))
  })
}


class ALU extends ALUType {

  io.output := io.source1 + io.source2

  switch(io.operation) {
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

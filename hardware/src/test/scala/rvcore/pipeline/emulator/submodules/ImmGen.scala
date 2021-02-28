package rvcore.pipeline.emulator.submodules

import rvcore.lib.OpcodesRV32I._
import chisel3._
import chisel3.util._

class ImmGen extends Module {
  val io = IO(new Bundle {
    val instruction = Input(SInt(32.W))
    val immediate = Output(SInt(32.W))
  })

  val funct3 = io.instruction(14, 12)
  //Constructing immediate signals
  val Utype = Cat(io.instruction(31, 12), 0.S(12.W))
  val UJtype = Cat(io.instruction(31), io.instruction(19, 12), io.instruction(20), io.instruction(30, 22))
  val Stype = Cat(io.instruction(31, 25), io.instruction(11, 7))
  val SBtype = Cat(io.instruction(31), io.instruction(7), io.instruction(30, 25), io.instruction(11, 8))
  val Itype = io.instruction(31, 20)

  io.immediate := Cat(VecInit(Seq.fill(20)(io.instruction(31))).asUInt(), Itype).asSInt()
  when(funct3 === 2.U || funct3 === 3.U) {
    io.immediate := Itype.asSInt()
  }


  switch(io.instruction(6, 0)) {
    is(LUI.opcode) {
      io.immediate := Utype.asSInt()
    }
    is(JAL.opcode) {
      io.immediate := Cat(VecInit(Seq.fill(10)(io.instruction(31))).asUInt(), UJtype, 0.U(2.W)).asSInt()
    }
    is(SB.opcode) {
      io.immediate := Cat(VecInit(Seq.fill(20)(io.instruction(31))).asUInt(), Stype).asSInt()
    }
    is(BEQ.opcode) {
      io.immediate := Cat(VecInit(Seq.fill(18)(io.instruction(31))).asUInt(), SBtype, 0.U(1.W)).asSInt()
    }
  }

}

/*package RVSim.RVSingle.submodules

import RVSim.lib.OpcodesRV32I._
import chisel3._
import chisel3.util._

class ImmGen extends Module {
  val io = IO(new Bundle {
    val instruction = Input(SInt(32.W))
    val funct3 = Input(UInt(3.W))
    val immediate = Output(SInt(32.W))
  })

  //Constructing immediate signals
  val Utype = Cat(io.instruction(31, 12), 0.S(12.W))
  val UJtype = Cat(io.instruction(31), io.instruction(19, 12), io.instruction(20), io.instruction(30, 22))
  val Stype = Cat(io.instruction(31, 25), io.instruction(11, 7))
  val SBtype = Cat(io.instruction(31), io.instruction(7), io.instruction(30, 25), io.instruction(11, 8))
  val Itype = io.instruction(31, 20)
  val JALRItype = io.instruction(31, 22)

  io.immediate := Cat(VecInit(Seq.fill(20)(io.instruction(31))).asUInt(), Itype).asSInt()
  when(io.funct3 === 2.U || io.funct3 === 3.U) {
    io.immediate := Itype.asSInt()
  }


  switch(io.instruction(6, 0)) {
    is(LUI.opcode) {
      io.immediate := Utype.asSInt()
    }
    is(JAL.opcode) {
      io.immediate := Cat(VecInit(Seq.fill(13)(io.instruction(31))).asUInt(), UJtype).asSInt()
    }
    is(JALR.opcode) {
      io.immediate := Cat(VecInit(Seq.fill(22)(io.instruction(31))).asUInt(), JALRItype).asSInt()
    }
    is(SB.opcode) {
      io.immediate := Cat(VecInit(Seq.fill(20)(io.instruction(31))).asUInt(), Stype).asSInt()
    }
    is(BEQ.opcode) {
      io.immediate := Cat(VecInit(Seq.fill(21)(io.instruction(31))).asUInt(), SBtype(11, 1)).asSInt()
    }
  }

}*/

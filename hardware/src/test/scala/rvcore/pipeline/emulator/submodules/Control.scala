package rvcore.pipeline.emulator.submodules


import chisel3._
import chisel3.util._
import rvcore.lib.OpcodesRV32I._

class Control extends Module {
  val io = IO(new Bundle {
    val opcode = Input(UInt(7.W))
    val funct3 = Input(UInt(3.W))
    val memWrite = Output(UInt(2.W))
    val aluSource1 = Output(UInt(2.W))
    val aluSource2 = Output(Bool())
    val registerWriteEn = Output(Bool())
    val memToReg = Output(Bool())
    val pcSrc = Output(Bool())
    val link = Output(Bool())
  })

  //Default assignments
  io.memWrite := 0.U
  //aluSource1 : 0 -> rs1 : 1 -> 0 : 2 -> PC
  io.aluSource1 := 0.U
  io.aluSource2 := false.B
  io.registerWriteEn := true.B
  io.memToReg := false.B
  io.pcSrc := false.B
  io.link := false.B

  switch(io.opcode) {
    is(LB.opcode) {
      io.memToReg := true.B
      io.aluSource2 := true.B
    }
    is(ADDI.opcode) {
      io.aluSource2 := true.B
    }
    is(AUIPC.opcode) {
      io.aluSource1 := 2.U
      io.aluSource2 := true.B
    }
    is(SB.opcode) {
      io.aluSource2 := true.B
      io.registerWriteEn := false.B
      switch(io.funct3) {
        is(SB.funct3) {
          io.memWrite := 1.U
        }
        is(SH.funct3) {
          io.memWrite := 2.U
        }
        is(SW.funct3) {
          io.memWrite := 3.U
        }
      }
    }
    is(ADD.opcode) {

    }
    is(BEQ.opcode) {
      io.pcSrc := true.B
      io.registerWriteEn := false.B
      io.aluSource1 := 2.U
      io.aluSource2 := true.B
    }
    is(LUI.opcode) {
      io.aluSource1 := 1.U
      io.aluSource2 := true.B
    }
    is(JALR.opcode) {
      io.aluSource2 := true.B
      io.pcSrc := true.B
      io.link := true.B
    }
    is(JAL.opcode) {
      io.aluSource1 := 2.U
      io.aluSource2 := true.B
      io.pcSrc := true.B
      io.link := true.B
    }
  }

}

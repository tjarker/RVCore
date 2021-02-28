package rvcore.pipeline.emulator.submodules

import rvcore.pipeline.lib.ALUOps._
import rvcore.lib.OpcodesRV32I._
import chisel3._
import chisel3.util._

class ALUcontrol extends Module {
  val io = IO(new Bundle {
    val opcode = Input(UInt(7.W))
    val funct3 = Input(UInt(3.W))
    val funct7_30 = Input(Bool())
    val operation = Output(UInt(4.W))
  })

  io.operation := add

  switch(io.opcode) {
    is(ADDI.opcode) {
      switch(io.funct3) {
        is(ADDI.funct3) {
          io.operation := add
        }
        is(SLLI.funct3) {
          io.operation := sl
        }
        is(SLTI.funct3) {
          io.operation := slt
        }
        is(SLTIU.funct3) {
          io.operation := slt
        }
        is(XORI.funct3) {
          io.operation := xor
        }
        is(SRLI.funct3) {
          io.operation := sr
          when(io.funct7_30) {
            io.operation := sra
          }
        }
        is(ORI.funct3) {
          io.operation := or
        }
        is(ANDI.funct3) {
          io.operation := and
        }
      }
    }
    is(ADD.opcode) {
      switch(io.funct3) {
        is(ADD.funct3) {
          io.operation := add
          when(io.funct7_30) {
            io.operation := sub
          }
        }
        is(SLL.funct3) {
          io.operation := sl
        }
        is(SLT.funct3) {
          io.operation := slt
        }
        is(SLTU.funct3) {
          io.operation := slt
        }
        is(XOR.funct3) {
          io.operation := xor
        }
        is(SRL.funct3) {
          io.operation := sr
          when(io.funct7_30) {
            io.operation := sra
          }
        }
        is(OR.funct3) {
          io.operation := or
        }
        is(AND.funct3) {
          io.operation := and
        }
      }
    }
  }
}
package rvcore.lib

import chisel3._

object OpcodesRV32I {

  object LUI {
    val opcode = "b0110111".U
  }

  object AUIPC {
    val opcode = "b0010111".U
  }

  object JAL {
    val opcode = "b1101111".U
  }

  object JALR {
    val opcode = "b1100111".U
    val funct3 = "b000".U
  }

  object BEQ {
    val opcode = "b1100011".U
    val funct3 = "b000".U
  }

  object BNE {
    val opcode = "b1100011".U
    val funct3 = "b001".U
  }

  object BLT {
    val opcode = "b1100011".U
    val funct3 = "b100".U
  }

  object BGE {
    val opcode = "b1100011".U
    val funct3 = "b101".U
  }

  object BLTU {
    val opcode = "b1100011".U
    val funct3 = "b110".U
  }

  object BGEU {
    val opcode = "b1100011".U
    val funct3 = "b111".U
  }

  object LB {
    val opcode = "b0000011".U
    val funct3 = "b000".U
  }

  object LH {
    val opcode = "b0000011".U
    val funct3 = "b001".U
  }

  object LW {
    val opcode = "b0000011".U
    val funct3 = "b010".U
  }

  object LBU {
    val opcode = "b0000011".U
    val funct3 = "b100".U
  }

  object LHU {
    val opcode = "b0000011".U
    val funct3 = "b101".U
  }

  object SB {
    val opcode = "b0100011".U
    val funct3 = "b000".U
  }

  object SH {
    val opcode = "b0100011".U
    val funct3 = "b001".U
  }

  object SW {
    val opcode = "b0100011".U
    val funct3 = "b010".U
  }

  object ADDI {
    val opcode = "b0010011".U
    val funct3 = "b000".U
  }

  object SLTI {
    val opcode = "b0010011".U
    val funct3 = "b010".U
  }

  object SLTIU {
    val opcode = "b0010011".U
    val funct3 = "b011".U
  }

  object XORI {
    val opcode = "b0010011".U
    val funct3 = "b100".U
  }

  object ORI {
    val opcode = "b0010011".U
    val funct3 = "b110".U
  }

  object ANDI {
    val opcode = "b0010011".U
    val funct3 = "b111".U
  }

  object SLLI {
    val opcode = "b0010011".U
    val funct3 = "b001".U
    val funct7 = "b0000000".U
  }

  object SRLI {
    val opcode = "b0010011".U
    val funct3 = "b101".U
    val funct7 = "b0000000".U
  }

  object SRAI {
    val opcode = "b0010011".U
    val funct3 = "b101".U
    val funct7 = "b0100000".U
  }

  object ADD {
    val opcode = "b0110011".U
    val funct3 = "b000".U
    val funct7 = "b0000000".U
  }

  object SUB {
    val opcode = "b0110011".U
    val funct3 = "b000".U
    val funct7 = "b0100000".U
  }

  object SLL {
    val opcode = "b0110011".U
    val funct3 = "b001".U
    val funct7 = "b0000000".U
  }

  object SLT {
    val opcode = "b0110011".U
    val funct3 = "b010".U
    val funct7 = "b0000000".U
  }

  object SLTU {
    val opcode = "b0110011".U
    val funct3 = "b011".U
    val funct7 = "b0000000".U
  }

  object XOR {
    val opcode = "b0110011".U
    val funct3 = "b100".U
    val funct7 = "b000000".U
  }

  object SRL {
    val opcode = "b0110011".U
    val funct3 = "b101".U
    val funct7 = "b0000000".U
  }

  object SRA {
    val opcode = "b0110011".U
    val funct3 = "b101".U
    val funct7 = "b0100000".U
  }

  object OR {
    val opcode = "b0110011".U
    val funct3 = "b110".U
    val funct7 = "b0000000".U
  }

  object AND {
    val opcode = "b0110011".U
    val funct3 = "b111".U
    val funct7 = "b0000000".U
  }

  object ECALL {
    val opcode = "b1110011".U
  }

}

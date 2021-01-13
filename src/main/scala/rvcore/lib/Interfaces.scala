package rvcore.lib

import chisel3._

object Interfaces {

  class IF_ID extends Bundle {
    val pc = UInt(32.W)
    val instr = SInt(32.W)
    val branchPrediction = Bool()
  }

  class ID_EX extends Bundle {
    // data
    val pc = UInt(32.W)
    val imm = SInt(32.W)
    val regOp1 = SInt(32.W)
    val regOp2 = SInt(32.W)
    val rs1 = UInt(5.W)
    val rs2 = UInt(5.W)
    val rd = UInt(5.W)
    // control
    val aluOp = UInt(4.W)
    val aluSrc1 = UInt(2.W)
    val aluSrc2 = UInt(2.W)
    val brSrc = Bool()
    val pcSrc = Bool()
    val wb = Bool()
    val wbSrc = Bool()
    val mem = UInt(4.W)
    val jump = Bool()
    val funct3 = UInt(3.W)
    val branchPrediction = Bool()
  }

  class EX_MEM extends Bundle {
    // data
    val aluRes = SInt(32.W)
    val regOp2 = SInt(32.W)
    val rd = UInt(5.W)
    // control
    val wb = Bool()
    val wbSrc = Bool()
    val mem = UInt(4.W)
  }

  class MEM_WB extends Bundle {
    // data
    val memRes = SInt(32.W)
    val aluRes = SInt(32.W)
    val rd = UInt(5.W)
    // control
    val wb = Bool()
    val wbSrc = Bool()
  }

  class WB_ID extends Bundle {
    val rd = UInt(5.W)
    val res = SInt(32.W)
    val wb = Bool()
  }

  class EX_IF extends Bundle {
    val pcNext = UInt(32.W)
    val branch = Bool()
    val pcSrc = Bool()
    val branchIndex = UInt(8.W)
  }

  class memoryInterface extends Bundle {
    val memOp = Output(UInt(4.W))
    val wrData = Output(SInt(32.W))
    val addr = Output(SInt(32.W))
    val memOut = Input(SInt(32.W))
  }

}

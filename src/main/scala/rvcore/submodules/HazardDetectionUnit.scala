package rvcore.submodules

import chisel3._

class HazardDetectionUnit extends Module {
  val io = IO(new Bundle {
    val pcEn = Output(Bool())
    val flushIF = Output(Bool())
    val flushID = Output(Bool())
    val enableIF_ID = Output(Bool())
    val rd_EX = Input(UInt(5.W))
    val instr = Input(SInt(32.W)) // TODO: is whole instruction necessary?
    val wbSrc_EX = Input(Bool())
    val branch_EX = Input(Bool())
  })

  io.pcEn := true.B
  io.flushIF := false.B
  io.flushID := false.B
  io.enableIF_ID := true.B

  when((io.rd_EX === io.instr(19, 15) || io.rd_EX === io.instr(24, 20)) && io.wbSrc_EX) {
    io.pcEn := false.B
    io.flushID := true.B
    io.enableIF_ID := false.B
  }

  when(io.branch_EX) {
    io.flushIF := true.B
    io.flushID := true.B
    io.enableIF_ID := false.B
  }

}

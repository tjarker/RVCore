package rvcore.pipeline.submodules

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
// if one of the registers accessed in ID are waiting for a memory result => wait one cycle
  val rs1 = io.instr(19, 15)
  val rs2 = io.instr(24, 20)
  val rs1IsAccessed = io.rd_EX === rs1
  val rs2IsAccessed = io.rd_EX === rs2
  val loadUseHazard = (rs1IsAccessed || rs2IsAccessed) && io.wbSrc_EX //io.wbSrc_EX = we have a mem access in ex
  when(loadUseHazard || RegNext(loadUseHazard)) {
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

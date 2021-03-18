package rvcore.pipeline.submodules

import chisel3._

class ForwardingUnit extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(5.W))
    val rs2 = Input(UInt(5.W))
    val rd_MEM = Input(UInt(5.W))
    val wb_MEM = Input(Bool())
    val rd_WB = Input(UInt(5.W))
    val wb_WB = Input(Bool())
    val aluRes_MEM = Input(SInt(32.W))
    val res_WB = Input(SInt(32.W))
    val fwdA = Output(SInt(32.W))
    val fwdB = Output(SInt(32.W))
    val fwdA_en = Output(Bool())
    val fwdB_en = Output(Bool())
  })


  io.fwdA_en := false.B
  //Forward from MEM stage
  when(io.rs1 === io.rd_MEM && io.wb_MEM) {
    io.fwdA_en := true.B
    io.fwdA := io.aluRes_MEM
    //Forward from WB stage
  }.elsewhen(io.rs1 === io.rd_WB && io.wb_WB) {
    io.fwdA_en := true.B
    io.fwdA := io.res_WB
  }.otherwise {
    io.fwdA := 0.S
  }
  //Forward from MEM stage
  io.fwdB_en := false.B
  when(io.rs2 === io.rd_MEM && io.wb_MEM) {
    io.fwdB_en := true.B
    io.fwdB := io.aluRes_MEM
    //Forward from WB stage
  }.elsewhen(io.rs2 === io.rd_WB && io.wb_WB) {
    io.fwdB_en := true.B
    io.fwdB := io.res_WB
  }.otherwise {
    io.fwdB := 0.S
  }
}
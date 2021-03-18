package rvcore.pipeline.emulator.submodules

import chisel3._

class RegFile extends Module {
  val io = IO(new Bundle {
    val registerS1Index = Input(UInt(5.W))
    val registerS2Index = Input(UInt(5.W))
    val registerWIndex = Input(UInt(5.W))
    val registerWData = Input(SInt(32.W))
    val writeEn = Input(Bool())
    val registerS1Data = Output(SInt(32.W))
    val registerS2Data = Output(SInt(32.W))
    val regFilePort = Output(Vec(32, SInt(32.W)))
  })

  val regFile = RegInit(VecInit(Seq.fill(32)(0.S(32.W))))

  when(io.writeEn) {
    regFile(io.registerWIndex) := io.registerWData
  }

  //Outputs
  io.registerS1Data := regFile(io.registerS1Index)
  io.registerS2Data := regFile(io.registerS2Index)

  //x0 is always 0
  regFile(0) := 0.S

  io.regFilePort := regFile
}

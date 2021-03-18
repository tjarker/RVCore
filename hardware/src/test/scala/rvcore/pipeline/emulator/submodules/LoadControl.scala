package rvcore.pipeline.emulator.submodules

import chisel3._
import chisel3.util._

class LoadControl extends Module {
  val io = IO(new Bundle {
    val funct3 = Input(UInt(3.W))
    val rawReadData = Input(Vec(4, UInt(8.W)))
    val readData = Output(SInt(32.W))
  })
  io.readData := 0.S
  switch(io.funct3) {
    is(0.U) {
      io.readData := Cat(VecInit(Seq.fill(24)(io.rawReadData(0)(7))).asUInt, io.rawReadData(0)).asSInt()
    }
    is(1.U) {
      io.readData := Cat(VecInit(Seq.fill(16)(io.rawReadData(1)(7))).asUInt, io.rawReadData(1), io.rawReadData(0)).asSInt()
    }
    is(2.U) {
      io.readData := io.rawReadData.asUInt().asSInt()
    }
    is(3.U) {
      // 64-bit architecture
    }
    is(4.U) {
      io.readData := Cat(0.U(24.W),io.rawReadData(0)).asSInt()
    }
    is(5.U) {
      io.readData := Cat(0.U(16.W),io.rawReadData(1), io.rawReadData(0)).asSInt()
    }
    is(6.U) {
      io.readData := io.rawReadData.asUInt().asSInt()
    }
  }
}

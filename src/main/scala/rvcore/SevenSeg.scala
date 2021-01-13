package rvcore

import chisel3._
import chisel3.util._

class SevenSeg extends Module{
  val io = IO(new Bundle{
    val in = Input(UInt(16.W))
    val sevAn = Output(UInt(4.W))
    val sevData = Output(UInt(7.W))
  })

  def tickCounter(max: Int, tick: Bool) = {
    val cntReg = RegInit(0.U(log2Ceil(max).W))
    when(tick) {
      cntReg := Mux(cntReg === max.U, 0.U, cntReg + 1.U)
    }
    cntReg
  }
  def tickGen(frequency: Int) = {
    val cntReg = RegInit(0.U((if (frequency == 0 || log2Ceil(100000000 / frequency) == 0) 1 else log2Ceil(100000000 / frequency)).W))
    val tick = cntReg === (if (frequency != 0) 100000000 / frequency else 0).U
    cntReg := Mux(tick, 0.U, cntReg + 1.U)
    tick
  }

  io.sevData := 0.U
  io.sevAn := 0.U

  val ticker = tickGen(200)
  val sevAnCounter = tickCounter(3, ticker)

  val hex2Sev = VecInit(
    "b1000000".U,
    "b1111001".U,
    "b0100100".U,
    "b0110000".U,
    "b0011001".U,
    "b0010010".U,
    "b0000010".U,
    "b1111000".U,
    "b0000000".U,
    "b0010000".U,
    "b0001000".U,
    "b0000011".U,
    "b1000110".U,
    "b0100001".U,
    "b0000110".U,
    "b0001110".U
  )

  //sevAn
  switch(sevAnCounter) {
    is(0.U) {
      io.sevData := hex2Sev(io.in(15,12))
      io.sevAn := "b0111".U
    }
    is(1.U) {
      io.sevData := hex2Sev(io.in(11,8))
      io.sevAn := "b1011".U
    }
    is(2.U) {
      io.sevData := hex2Sev(io.in(7,4))
      io.sevAn := "b1101".U
    }
    is(3.U) {
      io.sevData := hex2Sev(io.in(3,0))
      io.sevAn := "b1110".U
    }
  }
}

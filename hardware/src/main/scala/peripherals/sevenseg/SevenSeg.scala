package peripherals.sevenseg

import chisel3._
import chisel3.util._
import trash.{MemoryMappedModule, SystemBus}

object SevenSeg {
  def apply(sysBus: SystemBus, baseAddr: Int) : SevenSeg = {
    val sev = Module(new SevenSeg(baseAddr))
    sev.sysBus.addr := sysBus.addr
    sev.sysBus.wrData := sysBus.wrData
    sev.sysBus.we := sysBus.we
    sev.sysBus.w := sysBus.w
    sev
  }
}

class SevenSeg(baseAddr: Int) extends MemoryMappedModule{
  val sev = IO(Output(new SevenSegIO))

  val data = RegInit(0.U(16.W))

  sysBus.mapReg(data, baseAddr)

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

  sev.segment := 0.U
  sev.anode := 0.U

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
      sev.segment  := hex2Sev(data(15,12))
      sev.anode := "b0111".U
    }
    is(1.U) {
      sev.segment  := hex2Sev(data(11,8))
      sev.anode := "b1011".U
    }
    is(2.U) {
      sev.segment  := hex2Sev(data(7,4))
      sev.anode := "b1101".U
    }
    is(3.U) {
      sev.segment  := hex2Sev(data(3,0))
      sev.anode := "b1110".U
    }
  }
}

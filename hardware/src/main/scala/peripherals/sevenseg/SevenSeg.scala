package peripherals.sevenseg

import util.Timing.{tickCounter, tickGen}
import chisel3._
import rvcore.systembus.{RegBusModule, RegField, RegFieldType}
import chisel3.util._

class SevenSeg(baseAddr: Int) extends RegBusModule("SEVEN_SEGMENT_DISPLAY",baseAddr,8){
  val sev = IO(Output(new SevenSegIO))

  class ConfigType extends Bundle {
    val active = Bool()
  }

  val data    = RegInit(0.U(16.W))
  val config  = RegInit(0.U.asTypeOf(new ConfigType))

  val accessors = regMap(
    0x00 -> RegField(data, RegFieldType.rw),
    0x04 -> RegField(config, RegFieldType.rw)
  )

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
  when(config.active) {
    sev.anode := "b1111".U
    val selData = WireDefault(0.U(4.W))
    switch(sevAnCounter) {
      is(0.U) {
        selData := data(15, 12)
        sev.anode := "b0111".U
      }
      is(1.U) {
        selData := data(11, 8)
        sev.anode := "b1011".U
      }
      is(2.U) {
        selData := data(7, 4)
        sev.anode := "b1101".U
      }
      is(3.U) {
        selData := data(3, 0)
        sev.anode := "b1110".U
      }
    }
    sev.segment := hex2Sev(selData)
  }.otherwise{
    sev.segment := "b111_1111".U
    sev.anode := "b1111".U
  }
}

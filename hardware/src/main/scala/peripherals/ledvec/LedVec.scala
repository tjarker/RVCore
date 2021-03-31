package peripherals.ledvec

import chisel3._
import rvcore.systembus.{Accessor, RegBusModule, RegField, RegFieldType}





class LedVec(baseAddr: Int) extends RegBusModule("LED_VEC",baseAddr,8){

  val led = IO(Output(new LedVecIO))

  class ConfigType extends Bundle {
    val active = Bool()
  }

  val data    = RegInit(0x0000.U(16.W))
  val config  = RegInit(0.U.asTypeOf(new ConfigType))

  val accessors = regMap(
    0x00 -> RegField(data, RegFieldType.rw),
    0x04 -> RegField(config, RegFieldType.rw)
  )

  when(config.active) {
    led.led := data
  }.otherwise{
    led.led := 0.U
  }



}




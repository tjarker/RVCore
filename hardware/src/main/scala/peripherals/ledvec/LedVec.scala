package peripherals.ledvec

import chisel3._
import rvcore.systembus.{Accessor, RegBusModule, RegField}





class LedVec(baseAddr: Int) extends RegBusModule("LED_VEC",baseAddr,8){

  class ConfigType extends Bundle {
    val active = Bool()
  }

  val led = IO(Output(new LedVecIO))

  val data = RegInit(0x00.U(16.W))
  val config = RegInit(0.U.asTypeOf(new ConfigType))
  val accessors = Wire(Vec(2,new Accessor))
  accessors := regMap(
    0x00 -> RegField(data, "data", "data register"),
    0x04 -> RegField(config, "config", "Configuration Register")
  )

  when(config.active) {
    led.led := data
  }.otherwise{
    led.led := 0.U
  }



}




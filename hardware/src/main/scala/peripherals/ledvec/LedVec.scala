package peripherals.ledvec

import chisel3._
import rvcore.systembus.{Accessor, RegBusModule, RegField}





class LedVec(refName: String, baseAddr: Int) extends RegBusModule("led_t",refName,baseAddr,2){

  class ConfigType extends Bundle {
    val active = Bool()
  }

  val led = IO(Output(new LedVecIO))

  val data = RegInit(0x00.U(16.W))
  val config = RegInit(0.U.asTypeOf(new ConfigType))
  val accessors = Wire(Vec(2,new Accessor))

  when(config.active) {
    led.led := data
  }.otherwise{
    led.led := 0.U
  }

  accessors := regMap(
    0x00 -> RegField(data, "data", "data register"),
    0x01 -> RegField(config, "config", "Configuration Register")
  )

  when(accessors(0).isWritten){
    led.led := data | (1<<15).U
  }
}




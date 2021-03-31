package peripherals.charvga

import peripherals.charvga.lib.Interfaces.VGAPort
import chisel3._
import chisel3.util._
import peripherals.charvga.submodules.VGA_Timer
import rvcore.systembus.{RegBusModule, RegField, RegFieldType}

class CharVGA(baseAddr: Int) extends RegBusModule("VGA",baseAddr,4) {
  val out = IO(Output(new VGAPort))

  val data = RegInit(0.U(12.W))

  val accessors = regMap(
    0x00 -> RegField(data,RegFieldType.rw)
  )

  val timer = Module(new VGA_Timer)
  out.hsync := timer.io.hSync
  out.vsync := timer.io.vSync
  out.red := data(11,8)
  out.green := data(7,4)
  out.blue := data(3,0)
}

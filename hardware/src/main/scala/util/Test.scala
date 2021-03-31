package util

import chisel3._
import peripherals.charvga.lib.Interfaces.VGAPort
import peripherals.charvga.submodules.Resolution.R640x480
import peripherals.charvga.submodules.VGA_Timer

class Test extends MultiIOModule {
  val out = IO(Output(new VGAPort))
  val led = IO(Output(UInt(12.W)))
  val sw = IO(Input(UInt(12.W)))

  val counter = RegInit(0.U(12.W))
  counter := RegNext(sw)

  val timer = Module(new VGA_Timer(R640x480))


  out.hsync := timer.io.hSync
  out.vsync := timer.io.vSync
  out.red := Mux(timer.io.show, counter(11,8), 0.U)
  out.green := Mux(timer.io.show, counter(7,4), 0.U)
  out.blue := Mux(timer.io.show, counter(3,0), 0.U)
  led := counter
}

object Test extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Test)
}
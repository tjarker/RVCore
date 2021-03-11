package rvcore.util

import chisel3._
import chisel3.experimental._
import chisel3.util._

object LCDParams {
  // data is sampled on the falling edge of enable
  val tCycle = 1200/10 // Enable cycle time
  val tPulseWid = 140/10 // Enable pulse width
  val tAddrSU = 0 // Address setup time
  val tAddrH = 10/10 // Address hold time
  val tDataSU = 40/10 // Data setup time
  val tDataH = 10/10 // Data hold time
  val tDDR = 100/10 // Read data setup time
}

class LCDtest extends Module {
  val io = IO(new Bundle{
    val in = Input(UInt(6.W))
    val send = Input(Bool())
    val RS = Output(Bool())
    val RW = Output(Bool())
    val En = Output(Bool())
    val D = Analog(4.W)
    val leds = Output(UInt(4.W))
  })

  val drvr = Module(new LCDBusDriver)
  attach(drvr.io.bus ,io.D)
  drvr.io.dOut := io.in(3,0)
  drvr.io.listen := io.RW

  io.RS := io.in(5)
  io.RW := io.in(4)
  io.En := io.send

  io.leds := drvr.io.dIn

}

object LCDtest extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new LCDtest)
}

class LCDBusDriver extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle{
    val dIn = Output(UInt(4.W))
    val dOut = Input(UInt(4.W))
    val bus = Analog(4.W)
    val listen = Input(Bool())
  })

  setInline("LCDBusDriver.v",
    s"""
       |module LCDBusDriver(
       |    output [3:0] dIn,
       |    input [3:0] dOut,
       |    inout [3:0] bus,
       |    input listen);
       |
       |    assign bus = !listen ? dOut : 4'bzzzz;
       |    assign dIn = bus;
       |endmodule
       |""".stripMargin)

}
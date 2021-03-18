package util

import chisel3._
import chisel3.experimental.Analog
import chisel3.util.HasBlackBoxInline

/**
 * This module allows to connect to tri-state busses with Chisel by using a Verilog blackbox.
 * @param width The width of the tri-state bus
 */
class TriStateDriver(width: Int) extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle{
    val busData =     Output(UInt(width.W))   // data on the bus
    val driveData =   Input(UInt(width.W))    // data put on the bus if io.drive is asserted
    val bus =         Analog(width.W)         // the tri-state bus
    val drive =       Input(Bool())           // when asserted the module drives the bus
  })

  setInline("LCDBusDriver.v",
    s"""
       |module LCDBusDriver(
       |    output [${width-1}:0] busData,
       |    input [${width-1}:0] driveData,
       |    inout [${width-1}:0] bus,
       |    input drive);
       |
       |    assign bus = drive ? driveData : {(${width}){1'bz}};
       |    assign busData = bus;
       |endmodule
       |""".stripMargin
  )
}
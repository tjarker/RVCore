package peripherals.Lcd12x2

import util.TriStateDriver
import chisel3._
import chisel3.experimental._
import chisel3.util.log2Ceil
import rvcore.systembus.{RegBusModule, RegField, RegFieldType}

class LCDPort extends Bundle {
  val rs = Output(Bool())
  val rw = Output(Bool())
  val en = Output(Bool())
  val data = Analog(4.W)
}

trait LCDParams {
  // data is sampled on the falling edge of enable ??
  val tCycle = 1200/10    // Enable cycle time
  val tPulseWid = 140/10  // Enable pulse width
  val tAddrSU = 0         // Address setup time
  val tAddrH = 10/10      // Address hold time
  val tDataSU = 40/10     // Data setup time
  val tDataH = 10/10      // Data hold time
  val tDDR = 100/10       // Read data setup time
}

class LcdDriver(baseAddr: Int) extends RegBusModule("LCD12x2",baseAddr,4) with LCDParams {
  val lcdPort = IO(new LCDPort)

  val data = RegInit(0.U(8.W))

  val accessors = regMap(
    0x00 -> RegField(data,RegFieldType.rw)
  )

  val timer = RegInit(0.U(log2Ceil(tAddrSU+tCycle).W))

  val setEnable   = timer === tAddrSU.U
  val clearEnable = timer === (tAddrSU+tPulseWid).U
  val resetTimer  = timer === (tAddrSU+tCycle).U
  val rdDataValid = timer === (tAddrSU+tDDR).U
  val putWrData   = timer === (tAddrSU+tPulseWid-tDataSU).U
  val remWrData   = timer === (tAddrSU+tPulseWid+tDataH).U

  timer := Mux(resetTimer, 0.U, timer + 1.U)



  val drvr = Module(new TriStateDriver(4))
  attach(drvr.io.bus ,lcdPort.data)
  drvr.io.driveData := 0.U
  drvr.io.drive := 0.B


}
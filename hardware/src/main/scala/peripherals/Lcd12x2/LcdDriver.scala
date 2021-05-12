package peripherals.Lcd12x2

import util._
import chisel3._
import chisel3.experimental._
import util.log2Ceil
import rvcore.systembus.{RegBusModule, RegField, RegFieldType}

class LCDPort extends Bundle {
  val rs = Output(Bool())
  val rw = Output(Bool())
  val en = Output(Bool())
  val data = Analog(4.W)
}

class LcdDataFrame extends Bundle {
  val data = UInt(4.W)
  val isRead = Bool()
  val isCmd = Bool()
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

class LcdDriver(baseAddr: Int) extends RegBusModule("LCD12x2",baseAddr,4) {
  val lcdPort = IO(new LCDPort)

  val data = RegInit(0.U(8.W))

  val accessors = regMap(
    0x00 -> RegField(data,RegFieldType.rw)
  )

  val lcdTiming = Module(new LCDTimingManager)



}

private class LCDTimingManager extends Module with LCDParams {
  val io = IO(new Bundle{
    val enq = new FIFO.EnqueuerIO[LcdDataFrame]
    val lcdPort = new LCDPort
  })

  val fifo = Module(new FIFO[LcdDataFrame](16))
  fifo.enq <> io.enq

  val timer = RegInit(0.U(log2Ceil(tAddrSU+tCycle).W))

  val setEnable   = timer === tAddrSU.U
  val clearEnable = timer === (tAddrSU+tPulseWid).U
  val resetTimer  = timer === (tAddrSU+tCycle).U
  val rdDataValid = timer === (tAddrSU+tDDR).U
  val putWrData   = timer === (tAddrSU+tPulseWid-tDataSU).U
  val remWrData   = timer === (tAddrSU+tPulseWid+tDataH).U

  timer := Mux(resetTimer, 0.U, timer + 1.U)


  val drvr = Module(new TriStateDriver(4))
  attach(drvr.io.bus ,io.lcdPort.data)
  drvr.io.driveData := 0.U
  drvr.io.drive := 0.B

  val current = RegInit(0.U.asTypeOf(new LcdDataFrame))



}
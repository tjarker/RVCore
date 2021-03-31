package peripherals.charvga

import peripherals.charvga.lib.Interfaces.VGAPort
import chisel3._
import chisel3.util._
import peripherals.charvga.submodules.Resolution.R640x480
import peripherals.charvga.submodules.{FontROM, VGA_Timer}
import rvcore.systembus.{RegBusModule, RegField, RegFieldType}

class CharVGA(baseAddr: Int) extends RegBusModule("VGA",baseAddr,4+2400) {
  val out = IO(Output(new VGAPort))

  val data = RegInit(0.U(8.W))



  val accessors = regMap(
    0x00 -> RegField(data,RegFieldType.rw)
  )

  //val frameBuffer = SyncReadMem(2560,UInt(8.W))

  //val bufOut = frameBuffer.read()


  val timer = Module(new VGA_Timer(R640x480))
  out.hsync := timer.io.hSync
  out.vsync := timer.io.vSync

  val fontRom = VecInit(FontROM.font.map(v => ("b"+v.reverse).U(8.W)))
  val romLine = fontRom(data ## timer.io.y(4,1))


  val pixel = romLine(timer.io.x(3,1))
  val rgbOut = VecInit(Seq.fill(4)(pixel)).asUInt
  when(timer.io.show){
    out.red := rgbOut
    out.green := rgbOut
    out.blue := rgbOut
  }.otherwise{
    out.red := 0.U
    out.green := 0.U
    out.blue := 0.U
  }

}

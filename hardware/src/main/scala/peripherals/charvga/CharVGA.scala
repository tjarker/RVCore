package peripherals.charvga

import peripherals.charvga.lib.Interfaces.VGAPort
import chisel3._
import chisel3.util._
import peripherals.charvga.submodules.Resolution.R640x480
import peripherals.charvga.submodules.{FontROM, VGA_Timer}
import rvcore.systembus.{RegBusModule, RegField, RegFieldType, SysBusCmd}

class CharVGA(
               baseAddr: Int
             ) extends RegBusModule("VGA",baseAddr,32*80*4) {

  val out = IO(Output(new VGAPort))

  class Color extends Bundle {
    val r = UInt(1.W)
    val g = UInt(1.W)
    val b = UInt(1.W)
  }
  class Character extends Bundle {
    val code = UInt(8.W)
    val fg = new Color
    val bg = new Color
  }

  addCustomDef(s"#define VGA_RES 1")


  val frameBuffer = SyncReadMem(32*80,new Character)
  // lower 5 bits decode the row
  // the upper bits decode the column

  when(sysBusIO.m.cmd === SysBusCmd.WRITE){
    val wrData = Wire(new Character)
    wrData.code := sysBusIO.m.wrData(7,0)
    wrData.fg := sysBusIO.m.wrData(10,8).asTypeOf(new Color)
    wrData.bg := sysBusIO.m.wrData(13,11).asTypeOf(new Color)
    frameBuffer.write((sysBusIO.m.addr - baseAddr.U)(31,2), wrData)
  }



  val timer = Module(new VGA_Timer(R640x480))
  out.hsync := timer.io.hSync
  out.vsync := timer.io.vSync

  val curColumn = WireDefault(0.U)
  curColumn := timer.io.x(9,3)
  val curRow = WireDefault(0.U(5.W))
  curRow := timer.io.y(8,4)
  val currentChar = frameBuffer.read(Cat(curColumn,curRow))

  val fontRom = VecInit(FontROM.font.map(v => ("b"+v.reverse).U(8.W)))
  val romLine = fontRom(currentChar.code ## timer.io.y(3,0))


  val pixel = romLine(timer.io.x(2,0))
  when(timer.io.show){
    out.red := Mux(pixel, VecInit(Seq.fill(4)(currentChar.fg.r)).asUInt, VecInit(Seq.fill(4)(currentChar.bg.r)).asUInt)
    out.green := Mux(pixel, VecInit(Seq.fill(4)(currentChar.fg.g)).asUInt, VecInit(Seq.fill(4)(currentChar.bg.g)).asUInt)
    out.blue := Mux(pixel, VecInit(Seq.fill(4)(currentChar.fg.b)).asUInt, VecInit(Seq.fill(4)(currentChar.bg.b)).asUInt)
  }.otherwise{
    out.red := 0.U
    out.green := 0.U
    out.blue := 0.U
  }

}

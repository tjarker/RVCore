import chisel3._
import lib.Interfaces.{PS2Port, SevenSegment, VGAPort}
import rvcore.RVCore
import rvcore.lib.BinaryLoader
import rvcore.submodules.DataMemory1

class Top extends Module{
  val io = new Bundle{
    val ps2 = new PS2Port
    val svseg = new SevenSegment
    val vga = new VGAPort
  }

  val mp = Module(new RVCore(BinaryLoader.loadProgramFromRes("t11").byteBinaries, simFlag = false))

  val ram = Module(new DataMemory1(186600))
  ram.io.address := mp.io.memBus.addr
  ram.io.wrData := mp.io.memBus.wrData
  mp.io.memBus.memOut := ram.io.rdData
  when(!mp.io.memBus.addr(31)){
    ram.io.memOp := mp.io.memBus.memOp
  }.otherwise{
    ram.io.memOp := 0.U
  }


}

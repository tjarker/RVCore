package rvcore.pipeline.emulator.submodules

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class Memory(memorySize: Int, init: String) extends Module {
  val io = IO(new Bundle {
    val memWrite = Input(UInt(2.W))
    val addressD = Input(UInt(32.W))
    val addressI = Input(UInt(32.W))
    val writeData = Input(Vec(4, UInt(8.W)))
    val readData = Output(Vec(4, UInt(8.W)))
    val readInstr = Output(SInt(32.W))
  })
  val mem = Mem(memorySize, UInt(8.W))
  io.readData(0) := mem.read(io.addressD)
  io.readData(1) := mem.read(io.addressD + 1.U)
  io.readData(2) := mem.read(io.addressD + 2.U)
  io.readData(3) := mem.read(io.addressD + 3.U)
  when(io.memWrite >= 1.U) {
    //mem.write(io.address, io.writeData(0))
    mem(io.addressD) := io.writeData(0)
  }
  when(io.memWrite >= 2.U) {
    //mem.write(io.address + 1.U, io.writeData(1))
    mem(io.addressD + 1.U) := io.writeData(1)
  }
  when(io.memWrite >= 3.U) {
    //mem.write(io.address + 2.U, io.writeData(2))
    //mem.write(io.address + 3.U, io.writeData(3))
    mem(io.addressD + 2.U) := io.writeData(2)
    mem(io.addressD + 3.U) := io.writeData(3)
  }
  io.readInstr := Cat(mem(io.addressI + 3.U),mem(io.addressI + 2.U),mem(io.addressI + 1.U),mem(io.addressI)).asSInt

  if (init != null) {
    loadMemoryFromFile(mem, init)
  }

}

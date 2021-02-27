package rvcore.memory

import chisel3._
import chisel3.util.Cat
import rvcore.systembus.{CoreModule, CoreObject, InstrBus, SysBus, SysBusSlaveIO}

object InstructionROM extends CoreObject {
  def apply(refName: String, baseAddr: Int, program: Array[Int]) : InstructionROM = {
    val rom = Module(new InstructionROM(refName, program, baseAddr))
    rom
  }
}

class InstructionROM(refName: String, program: Array[Int], baseAddr: Int) extends CoreModule(refName, baseAddr, program.length){
  val instrBus = IO(Flipped(new InstrBus))

  val imem = VecInit(program.map(_.U(8.W)))

  instrBus.instr := Cat(imem(instrBus.pc + 3.U), imem(instrBus.pc + 2.U), imem(instrBus.pc + 1.U), imem(instrBus.pc))


  sysBusIO.s.rdData := Cat(imem(sysBusIO.m.addr + 3.U), imem(sysBusIO.m.addr + 2.U), imem(sysBusIO.m.addr + 1.U), imem(sysBusIO.m.addr))



}

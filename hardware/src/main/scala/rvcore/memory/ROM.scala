package rvcore.memory

import chisel3.util.Cat
import chisel3._
import rvcore.pipeline.lib.InstrBus
import rvcore.systembus.memoryType.rx
import rvcore.systembus.{BusModule, MemoryBusModule, SysBusCmd, SysBusResp}
import rvcore.util.Program

object ROM {
  def apply(refName: String, baseAddr: Int, maxSize: Int, program: Program) : ROM = {
    val rom = Module(new ROM(refName, program, baseAddr, maxSize))
    rom
  }
}

class ROM(refName: String, program: Program, baseAddr: Int, maxSize: Int) extends MemoryBusModule(refName, baseAddr, maxSize, rx){
  if(program.length > maxSize) throw new Exception("Error: The program is too large to fit in this ROM!")
  val instrBus = IO(Flipped(new InstrBus))

  sysBusIO.s.resp := SysBusResp.SUC

  sysBusIO.s.rdData := 0.U

  val romMod = Module(new RealROM(program))
  romMod.io.addr := instrBus.pc
  instrBus.instr := romMod.io.data

  //val imem = VecInit(program.wordBinaries.map(_.U(32.W)))

  //val addr = RegNext(instrBus.pc(31,2))
  // non synchronous access for now
  //instrBus.instr := imem(addr)

  /*
  val addr = RegNext(sysBusIO.m.addr)
  sysBusIO.s.rdData := 0.U
  when(RegNext(sysBusIO.m.cmd === SysBusCmd.READ)){
    sysBusIO.s.rdData := Cat(imem(addr + 3.U), imem(addr + 2.U), imem(addr + 1.U), imem(addr))
  }
  */
}


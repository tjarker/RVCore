package rvcore.memory

import chisel3.util.Cat
import chisel3._
import rvcore.pipeline.lib.InstrBus
import rvcore.systembus.{BusModule, MemoryBusModule, SysBusCmd, SysBusResp}
import rvcore.util.Program

object ROM {
  def apply(refName: String, baseAddr: Int, program: Program) : ROM = {
    val rom = Module(new ROM(refName, program.byteBinaries, baseAddr))
    rom
  }
}

class ROM(refName: String, program: Array[Int], baseAddr: Int) extends MemoryBusModule(refName, baseAddr, program.length){
  val instrBus = IO(Flipped(new InstrBus))

  sysBusIO.s.resp := SysBusResp.SENT

  val imem = VecInit(program.map(_.U(8.W)))

  // non synchronous access for now
  instrBus.instr := Cat(imem(instrBus.pc + 3.U), imem(instrBus.pc + 2.U), imem(instrBus.pc + 1.U), imem(instrBus.pc))

  val addr = RegNext(sysBusIO.m.addr)
  sysBusIO.s.rdData := 0.U
  when(RegNext(sysBusIO.m.cmd === SysBusCmd.READ)){
    sysBusIO.s.rdData := Cat(imem(addr + 3.U), imem(addr + 2.U), imem(addr + 1.U), imem(addr))
  }
}


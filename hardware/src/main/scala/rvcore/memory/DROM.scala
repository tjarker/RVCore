package rvcore.memory

import chisel3.util.Cat
import chisel3._
import rvcore.lib.Helper.{DatatoByteVec, byteVecToUInt}
import rvcore.pipeline.lib.InstrBus
import rvcore.systembus.memoryType.{r, rx}
import rvcore.systembus.{BusModule, MemoryBusModule, SysBusCmd, SysBusResp}
import rvcore.util.Program

object DROM {
  def apply(refName: String, baseAddr: Int, maxSize: Int, program: Program) : DROM = {
    val drom = Module(new DROM(refName, program, baseAddr, maxSize))
    drom
  }
}

class DROM(refName: String, program: Program, baseAddr: Int, maxSize: Int) extends MemoryBusModule(refName, baseAddr, maxSize, r){
  if(program.length > maxSize) throw new Exception("Error: The program is too large to fit in this ROM!")



  val dataColumns = Seq.tabulate(4)(i => program.byteBinaries.sliding(4,4).map(arr => arr(i)).toSeq)

  // rename master inputs and split data into byte vec
  val wrData = DatatoByteVec(sysBusIO.m.wrData)
  val strobes = sysBusIO.m.strb
  val addr = sysBusIO.m.addr

  /* row and column calculation */
  val offset = addr(1,0) // offset = addr % 4
  val rows = Wire(Vec(4,UInt((31-2).W))) // vector selecting the row in each bank
  rows := VecInit(Seq.tabulate(4){ i =>
    Mux(offset > i.U, addr(31,2) + 1.U, addr(31,2))
  })
  val rdColumns = Wire(Vec(4,UInt(2.W))) // again due to wrapping, we need a translation from bank columns to read data columns
  rdColumns := VecInit(Seq.tabulate(4){ i =>
    RegNext(offset + i.U)  // the bytes from the read port need to be rotated to the right by the offset on the clock cycle after read rq
  })

  // enable signals
  val readEn = dontTouch(sysBusIO.m.cmd === SysBusCmd.READ)
  val writeEn = sysBusIO.m.cmd === SysBusCmd.WRITE


  // the 4 memory banks and read ports
  val memoryBanks = Seq.tabulate(4)(i => VecInit(dataColumns(i).map(_.U(8.W))))
  val readPorts = VecInit(memoryBanks.zip(rows).map{ case (bank,row) =>
    bank(row)
  })

  // the data from the read ports needs to be shuffled to undo endianness and wrapping
  val shuffledReadPorts = dontTouch(VecInit(rdColumns.map{ column =>
    readPorts(column)
  }))

  // output control
  // a success response is given under any circumstances
  when(RegNext(readEn)){
    sysBusIO.s.rdData := byteVecToUInt(shuffledReadPorts)
    sysBusIO.s.resp := SysBusResp.SUC
  }.elsewhen(RegNext(writeEn)){
    sysBusIO.s.rdData := 0.U
    sysBusIO.s.resp := SysBusResp.FAIL
  }.otherwise {
    sysBusIO.s.rdData := 0.U
    sysBusIO.s.resp := SysBusResp.NULL
  }
}

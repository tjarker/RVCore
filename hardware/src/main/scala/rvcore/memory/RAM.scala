package rvcore.memory

import rvcore.systembus.{MemoryBusModule, SysBusCmd, SysBusResp}
import chisel3._
import rvcore.lib.Helper.{DatatoByteVec, byteVecToUInt}
import rvcore.systembus.memoryType._

/**
 * A byte addressable random access memory
 * The byte-addressability is achieved by using 4 memory banks which support data "wrapping" over from one
 * bank row to another.
 * @param refName     The name used in "MemoryMap.h"
 * @param baseAddr    The start address of the memory
 * @param size        The size of the memory (must be divisible by 4)
 */
class RAM(
           refName: String,
           baseAddr: Int,
           size: Int
         ) extends MemoryBusModule(refName, baseAddr, size, rw, true) {
  //--------------------------------------------------------------------------------------------------------------------
  require(size%4==0,"Memory size in bytes needs to be divisible by 4!")
  //--------------------------------------------------------------------------------------------------------------------

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
  val wrColumns = Wire(Vec(4,UInt(2.W))) // due to wrapping, bank columns need to be translated to data (byte) columns
  wrColumns := VecInit(Seq.tabulate(4){ i =>
    i.U - offset // the whole byte vec is rotated to the left by the offset
  })
  val rdColumns = Wire(Vec(4,UInt(2.W))) // again due to wrapping, we need a translation from bank columns to read data columns
  rdColumns := VecInit(Seq.tabulate(4){ i =>
    RegNext(offset + i.U)  // the bytes from the read port need to be rotated to the right by the offset on the clock cycle after read rq
  })

  // enable signals
  val readEn = dontTouch(sysBusIO.m.cmd === SysBusCmd.READ)
  val writeEn = sysBusIO.m.cmd === SysBusCmd.WRITE


  // the 4 memory banks and read ports
  val memoryBanks = Seq.fill(4)(SyncReadMem(size/4, UInt(8.W)))
  val readPorts = VecInit(memoryBanks.zip(rows).map{ case (bank,row) =>
    bank.read(row)
  })

  // the write data and connected strobes are shuffled to fit endianness and wrapping
  val shuffledWriteData = dontTouch(VecInit(wrColumns.map { column => wrData(column) }))
  val shuffledStrobes = VecInit(wrColumns.map { column => strobes(column)})

  // write operation
  when(writeEn){
    memoryBanks.zip(rows).zip(shuffledWriteData).zip(shuffledStrobes).map { case (((bank,row),data),strobe) =>
      when(strobe) {
        bank.write(row, data)
      }
    }
  }

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
    sysBusIO.s.resp := SysBusResp.SUC
  }.otherwise {
    sysBusIO.s.rdData := 0.U
    sysBusIO.s.resp := SysBusResp.NULL
  }

}

object RAM {
  def apply(refName: String, baseAddr: Int, size: Int) : RAM = {
    val ram = Module(new RAM(refName, baseAddr, size))
    ram
  }
}

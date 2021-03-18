package rvcore.pipeline.submodules

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import chiseltest._

abstract class DataMemoryType(memorySize: Int) extends Module {
  val io = IO(new Bundle {
    val memOp = Input(UInt(4.W))
    val address = Input(UInt(32.W))
    val wrData = Input(SInt(32.W))
    val rdData = Output(SInt(32.W))
  })
  val memSize = memorySize
}

// generate Verilog
object DataMemoryType extends App {
  chisel3.Driver.execute(args, () => new DataMemory1(256))
}

class DataMemory0(memorySize: Int, init: String = null) extends DataMemoryType(memorySize) {

  val mem = Mem(memorySize, UInt(8.W))
  val syncAddr = RegNext(io.address)
  val rdPorts = VecInit(mem(syncAddr), mem(syncAddr + 1.U), mem(syncAddr + 2.U), mem(syncAddr + 3.U))

  io.rdData := 0.S
  switch(io.memOp(1, 0)) {
    is("b01".U) {
      io.rdData := Cat(VecInit(Seq.fill(24)(io.memOp(2) & rdPorts(0)(7))).asUInt, rdPorts(0)).asSInt
    }
    is("b10".U) {
      io.rdData := Cat(VecInit(Seq.fill(16)(io.memOp(2) & rdPorts(1)(7))).asUInt, rdPorts(1), rdPorts(0)).asSInt
    }
    is("b11".U) {
      io.rdData := (Cat(rdPorts(3), rdPorts(2), rdPorts(1), rdPorts(0))).asSInt
    }
  }
  val wrBytes = VecInit(io.wrData(7, 0), io.wrData(15, 8), io.wrData(23, 16), io.wrData(31, 24))
  when(io.memOp(3)) {
    when(io.memOp(1, 0) >= 1.U) {
      //mem.write(io.address, io.writeData(0))
      mem(syncAddr) := wrBytes(0)
    }
    when(io.memOp(1, 0) >= 2.U) {
      //mem.write(io.address + 1.U, io.writeData(1))
      mem(syncAddr + 1.U) := wrBytes(1)
    }
    when(io.memOp(1, 0) >= 3.U) {
      //mem.write(io.address + 2.U, io.writeData(2))
      //mem.write(io.address + 3.U, io.writeData(3))
      mem(syncAddr + 2.U) := wrBytes(2)
      mem(syncAddr + 3.U) := wrBytes(3)
    }
  }
  if(init != null) loadMemoryFromFile(mem, init)
}

class DataMemory1(memorySize: Int, init: Array[String] = null) extends DataMemoryType(memorySize) {

  io.rdData := 0.S

  val banks = Seq.fill(4)(Mem(memorySize / 4, UInt(8.W)))

  val address = RegNext(io.address)

  val byteOffset = address(1, 0)

  val rdPorts = VecInit(Seq.tabulate(4)(i => banks(i).read(Mux(address(1, 0) > i.U, address(31, 2) + 1.U, address(31, 2)))))
  val rdData = VecInit(Seq.tabulate(4)(i => rdPorts(byteOffset + i.U)))
  switch(io.memOp(1, 0)) {
    is("b01".U) {
      io.rdData := Cat(VecInit(Seq.fill(24)(io.memOp(2) & rdData(0)(7))).asUInt, rdData(0)).asSInt
    }
    is("b10".U) {
      io.rdData := Cat(VecInit(Seq.fill(16)(io.memOp(2) & rdData(1)(7))).asUInt, rdData(1), rdData(0)).asSInt
    }
    is("b11".U) {
      io.rdData := (rdData(3) ## rdData(2) ## rdData(1) ## rdData(0)).asSInt
    }
  }

  val wrDataInVec = WireDefault(VecInit(Seq.tabulate(4)(i => io.wrData((i * 8) + 7, i * 8).asUInt).reverse)) //TODO: find a way without using reverse :D
  val wrVec = WireDefault(VecInit(Seq.tabulate(4)(i => wrDataInVec(byteOffset + i.U)).reverse))
  val wrEn = WireDefault(VecInit(Seq.fill(4)(false.B)))

  switch(io.memOp(1, 0)) {
    is("b01".U) {
      wrEn(byteOffset) := true.B
    }
    is("b10".U) {
      wrEn(byteOffset) := true.B
      wrEn(byteOffset + 1.U) := true.B
    }
    is("b11".U) {
      wrEn := VecInit(Seq.fill(4)(true.B))
    }
  }
  when(io.memOp(3)) {
    Seq.tabulate(4)(i => when(wrEn(i)) {
      banks(i).write(Mux(address(1, 0) > i.U, address(31, 2) + 1.U, address(31, 2)), wrVec(i))
    })
  }

  if (init != null) {
    Seq.tabulate(4)(i => loadMemoryFromFile(banks(i), init(i)))
  }

}


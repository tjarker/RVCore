package rvcore.memory

import chisel3._
import rvcore.lib.Helper.byteVecToUInt
import rvcore.systembus.{MemoryMappedModule, SystemBus}

class RAM(baseAddr: Int, size: Int) extends MemoryMappedModule {

  val banks = Seq.fill(4)(Mem(size / 4, UInt(8.W)))

  val address = RegNext(sysBus.addr)
  val internalWrite = WireDefault(0.B)

  sysBus.sendRq.rq := 0.B
  when(address >= baseAddr.U && address < (baseAddr+size).U ){
    sysBus.sendRq.rq := 1.B
    internalWrite := sysBus.w
  }

  val byteOffset = Wire(UInt(2.W))
  byteOffset := address(1, 0)

  val rdPorts = VecInit(Seq.tabulate(4)(i => banks(i).read(Mux(address(1, 0) > i.U, address(31, 2) + 1.U, address(31, 2)))))
  sysBus.sendRq.rdData := byteVecToUInt(VecInit(Seq.tabulate(4)(i => rdPorts(byteOffset + i.U))))

  val wrDataInVec = WireDefault(VecInit(Seq.tabulate(4)(i => sysBus.wrData((i * 8) + 7, i * 8).asUInt).reverse)) //TODO: find a way without using reverse :D
  val wrVec = WireDefault(VecInit(Seq.tabulate(4)(i => wrDataInVec(byteOffset + i.U)).reverse))
  val enVec = VecInit(Seq.tabulate(4)(i => sysBus.we(byteOffset + i.U)))

  val addressVec = Wire(Vec(4,UInt(30.W)))
  addressVec := VecInit(Seq.tabulate(4)(i => Mux(address(1, 0) > i.U, address(31, 2) + 1.U, address(31, 2))))

  when(internalWrite) {
    for(i <- 0 until 4){
      when(enVec(i)) {
        banks(i).write(addressVec(i), wrVec(i))
      }
    }
  }
}

object RAM {
  def apply(sysBus: SystemBus, baseAddr: Int, size: Int) : RAM = {
    val ram = Module(new RAM(baseAddr,size))
    ram.sysBus.addr := sysBus.addr
    ram.sysBus.wrData := sysBus.wrData
    ram.sysBus.we := sysBus.we
    ram.sysBus.w := sysBus.w
    ram
  }
}

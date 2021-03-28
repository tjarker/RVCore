package rvcore.memory

import chisel3._
import rvcore.lib.Helper.byteVecToUInt
import rvcore.systembus.memoryType.rw
import rvcore.systembus.{BusModule, MemoryBusModule, SysBusCmd, SysBusResp}

class RAM_old(refName: String, baseAddr: Int, size: Int) extends MemoryBusModule(refName, baseAddr, size, rw) {

  val banks = Seq.fill(4)(Mem(size / 4, UInt(8.W)))

  val addr = sysBusIO.m.addr
  val delAddr = RegNext(addr)

  val byteOffset = Wire(UInt(2.W))
  byteOffset := addr(1, 0)

  val rdPorts = VecInit(Seq.tabulate(4)(i => banks(i).read(Mux(delAddr(1, 0) > i.U, delAddr(31, 2) + 1.U, delAddr(31, 2)))))
  sysBusIO.s.rdData := 0.U
  sysBusIO.s.resp := SysBusResp.NULL
  when(RegNext(sysBusIO.m.cmd === SysBusCmd.READ)){
    sysBusIO.s.resp := SysBusResp.SUC
    sysBusIO.s.rdData := byteVecToUInt(VecInit(Seq.tabulate(4)(i => rdPorts(byteOffset + i.U))))
  }

  val wrDataInVec = WireDefault(VecInit(Seq.tabulate(4)(i => sysBusIO.m.wrData((i * 8) + 7, i * 8).asUInt).reverse)) //TODO: find a way without using reverse :D
  val wrVec = WireDefault(VecInit(Seq.tabulate(4)(i => wrDataInVec(byteOffset + i.U)).reverse))
  //val strobes = VecInit((Seq.tabulate(4)(i => sysBusIO.m.strb(i))).reverse)
  val enVec = VecInit(Seq.tabulate(4)(i => sysBusIO.m.strb(byteOffset + i.U)))

  val addressVec = Wire(Vec(4,UInt(30.W)))
  addressVec := VecInit(Seq.tabulate(4)(i => Mux(addr(1, 0) > i.U, addr(31, 2) + 1.U, addr(31, 2))))

  when(sysBusIO.m.cmd === SysBusCmd.WRITE) {
    for(i <- 0 until 4){
      when(enVec(i)) {
        banks(i).write(addressVec(i), wrVec(i))
      }
    }
  }
}

object RAM_old {
  def apply(refName: String, baseAddr: Int, size: Int) : RAM = {
    val ram = Module(new RAM(refName, baseAddr, size))
    ram
  }
}
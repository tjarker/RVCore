package rvcore.memory

import chisel3._
import rvcore.lib.Helper.byteVecToUInt
import rvcore.systembus.{CoreModule, SysBusCmd, SysBusResp}

class RAM(refName: String, baseAddr: Int, size: Int) extends CoreModule(refName, baseAddr, size) {

  val banks = Seq.fill(4)(SyncReadMem(size / 4, UInt(8.W)))

  val addr = sysBusIO.m.addr

  val byteOffset = Wire(UInt(2.W))
  byteOffset := addr(1, 0)

  val rdPorts = VecInit(Seq.tabulate(4)(i => banks(i).read(Mux(addr(1, 0) > i.U, addr(31, 2) + 1.U, addr(31, 2)))))
  sysBusIO.s.rdData := 0.U
  sysBusIO.s.resp := SysBusResp.NULL
  when(RegNext(sysBusIO.m.cmd === SysBusCmd.READ)){
    sysBusIO.s.resp := SysBusResp.SENT
    sysBusIO.s.rdData := byteVecToUInt(VecInit(Seq.tabulate(4)(i => rdPorts(byteOffset + i.U))))
  }

  val wrDataInVec = WireDefault(VecInit(Seq.tabulate(4)(i => sysBusIO.m.wrData((i * 8) + 7, i * 8).asUInt).reverse)) //TODO: find a way without using reverse :D
  val wrVec = WireDefault(VecInit(Seq.tabulate(4)(i => wrDataInVec(byteOffset + i.U)).reverse))
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

object RAM {
  def apply(refName: String, baseAddr: Int, size: Int) : RAM = {
    val ram = Module(new RAM(refName, baseAddr, size))
    ram
  }
}

package rvcore.systembus

import chisel3._

abstract class CoreObject {

}

abstract class CoreModule(val refName: String, val baseAddr: Int, val size: Int) extends MultiIOModule{
  val sysBusIO = IO(new SysBusSlaveIO)

  def isSelected(addr: UInt) : Bool = addr >= this.baseAddr.U && addr < (this.baseAddr+this.size).U

  override def toString: String = s"CoreModule $refName: %08X-%08X".format(baseAddr,baseAddr+size)
}

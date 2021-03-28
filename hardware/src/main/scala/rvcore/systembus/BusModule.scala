package rvcore.systembus

import chisel3._
import chisel3.util.{MuxLookup, PriorityMux}
import rvcore.systembus.RegField.{DEFAULT, RegFieldType}
import rvcore.systembus.memoryType.memoryType


abstract class BusModule(val defName: String, val baseAddr: Int, val size: Int) extends MultiIOModule{
  val sysBusIO = IO(new SysBusSlaveIO)

  val range = baseAddr until (baseAddr+size)

  def isSelected(addr: UInt) : Bool = addr >= this.baseAddr.U && addr < (this.baseAddr+this.size).U

  override def toString: String = s"CoreModule $defName: %08X-%08X".format(baseAddr,baseAddr+size)
  def getDef: String = ""
}
object memoryType extends Enumeration {
  protected case class memoryTypeVal(val str: String) extends super.Val {
    override def toString(): String = str
  }
  val r = memoryTypeVal("r")
  val rw = memoryTypeVal("rw")
  val rx = memoryTypeVal("rx")
  val rwx = memoryTypeVal("rwx")
  type memoryType = Value
}
/**
 * [[BusModule]]
 *
 * @param defName
 * @param baseAddr
 * @param size
 */
abstract class MemoryBusModule(defName: String, baseAddr: Int, size: Int, val memoryType: memoryType, val hostsStack: Boolean = false) extends BusModule(defName, baseAddr, size) {

  override def getDef: String = s"#define %-${defName.length+4}s 0x%08X\n".format(defName, baseAddr) +
                                s"#define %-${defName.length+4}s 0x%08X\n\n".format(defName+"_LEN",size)
}

abstract class RegBusModule(defName: String, baseAddr: Int, size: Int) extends BusModule(defName, baseAddr, size) {

  var regs: Seq[RegField] = null


  override def getDef: String = s"#define $defName 0x%08X\n\n".format(baseAddr)

  def regMap(pairs: (Int, RegField)*) : Vec[Accessor] = {

    regs = pairs.map(_._2)

    sysBusIO.s.holdLow()

    // select the correct register
    sysBusIO.s.rdData := Mux(RegNext(sysBusIO.m.cmd === SysBusCmd.READ), MuxLookup(RegNext(sysBusIO.m.addr), 0.U(32.W),
      pairs.map { case (addr,reg) =>
        (this.baseAddr + addr).U -> reg.reg.asUInt()
      }
    ), 0.U)

    // create access indicators and write control
    VecInit(pairs.map { case (addr,reg) =>
      val accessor = Wire(new Accessor)
      val isAccessed = sysBusIO.m.addr === (addr+this.baseAddr).U
      accessor.isRead := RegNext(isAccessed && sysBusIO.m.cmd === SysBusCmd.READ)
      accessor.isWritten := isAccessed && sysBusIO.m.cmd === SysBusCmd.WRITE

      when(accessor.isWritten){
        reg.reg := sysBusIO.m.wrData.asTypeOf(reg.reg)
      }
      when(RegNext(accessor.isWritten)){
        sysBusIO.s.resp := SysBusResp.SUC
      }
      when(accessor.isRead){
        sysBusIO.s.resp := SysBusResp.SUC
      }

      accessor
    })
  }
}

class Accessor extends Bundle {
  val isRead = Bool()
  val isWritten = Bool()
}

class RegField {
  var description: String = ""
  var name: String = ""
  var reg: Data = 0.B
  var t: RegFieldType = DEFAULT
}

object RegField {
  class RegFieldType
  val READONLY = new RegFieldType
  val WRITEONLY = new RegFieldType
  val DEFAULT = new RegFieldType

  def apply(reg: Data, name: String, t: RegFieldType, description: String) : RegField = {
    val n = new RegField
    n.name = name
    n.description = description
    n.reg = reg
    n.t = t
    n
  }
  def apply(reg: Data, name: String, t: RegFieldType) : RegField = {
    apply(reg, name, t, "")
  }
  def apply(reg: Data, name: String, description: String) : RegField = {
    apply(reg, name, DEFAULT, description)
  }
  def apply(reg: Data, name: String) : RegField = {
    apply(reg, name, DEFAULT, "")
  }
}
package rvcore.systembus

import chisel3._
import chisel3.util.{MuxLookup, PriorityMux}
import rvcore.systembus.RegField.{DEFAULT, RegFieldType}

abstract class BusModule(val refName: String, val baseAddr: Int, val size: Int) extends MultiIOModule{
  val sysBusIO = IO(new SysBusSlaveIO)

  val range = baseAddr until (baseAddr+size)

  def isSelected(addr: UInt) : Bool = addr >= this.baseAddr.U && addr < (this.baseAddr+this.size).U

  override def toString: String = s"CoreModule $refName: %08X-%08X".format(baseAddr,baseAddr+size)
  def toStruct: String = s"//$refName${"/"*(60-refName.length)}\n"
}

/**
 * [[BusModule]]
 *
 * @param refName
 * @param baseAddr
 * @param size
 */
abstract class MemoryBusModule(refName: String, baseAddr: Int, size: Int) extends BusModule(refName, baseAddr, size) {

  override def toStruct: String = {
    val sb = new StringBuilder
    sb.append(super.toStruct)
    sb.append(s"volatile int* const %-${refName.length+6}s = (int*) 0x%08X; // Start address of $refName\n".format(refName.toLowerCase+"_start",baseAddr))
    sb.append(s"volatile int* const %-${refName.length+6}s = (int*) 0x%08X; // Stop address of $refName\n".format(refName.toLowerCase+"_stop",baseAddr+size-1))
    sb.append("\n\n").toString()
  }
}

abstract class RegBusModule(val typeName: String, refName: String, baseAddr: Int, size: Int) extends BusModule(refName, baseAddr, size) {

  var regs: Seq[RegField] = null

  override def toStruct: String = {
    val sb = new StringBuilder
    val name = this.refName // -> given at instantiation
    val typeName = this.typeName
    val fields = regs.map(_.name)
    val descr = regs.map(_.description)
    val baseAddr = this.baseAddr

    sb.append(super.toStruct)
    sb.append("typedef struct {\n")
    val l1 = fields.maxBy(_.length).length+1
    val l2 = descr.maxBy(_.length).length
    fields.zip(descr).zipWithIndex.foreach{ case ((s,d),i) =>
      val string = s"  int %${l1}s  // 0x%08X: %-${l2}s\n"
      sb.append(string.format(s+";",baseAddr+4*i,d))
    }
    sb.append(s"} ${typeName};\n")
    sb.append(s"volatile ${typeName}* const $name = (${typeName}*) 0x%08X;\n\n".format(baseAddr))
    sb.toString()
  }

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
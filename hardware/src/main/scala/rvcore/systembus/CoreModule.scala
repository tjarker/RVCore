package rvcore.systembus

import chisel3._

abstract class CoreObject {

}

abstract class CoreModule(val refName: String, val baseAddr: Int, val size: Int) extends MultiIOModule{
  val sysBusIO = IO(new SysBusSlaveIO)

  def isSelected(addr: UInt) : Bool = addr >= this.baseAddr.U && addr < (this.baseAddr+this.size).U

  override def toString: String = s"CoreModule $refName: %08X-%08X".format(baseAddr,baseAddr+size)
  def toStruct: String = s"//$refName${"/"*(40-refName.length)}\n"
}

/**
 * [[CoreModule]]
 * @param refName
 * @param baseAddr
 * @param size
 */
abstract class MemoryModule(refName: String, baseAddr: Int, size: Int) extends CoreModule(refName, baseAddr, size) {
  override def toStruct: String = {
    val sb = new StringBuilder
    sb.append(super.toStruct)
    sb.append(s"volatile int* %${refName.length+6}s = (int*) 0x%08X; // Start address of $refName\n".format(refName.toLowerCase+"_start",baseAddr))
    sb.append(s"volatile int* %${refName.length+6}s  = (int*) 0x%08X; // Stop address of $refName\n".format(refName.toLowerCase+"_stop",baseAddr+size-1))
    sb.append("\n\n").toString()
  }
}

abstract class IOModule(refName: String, baseAddr: Int, size: Int) extends CoreModule(refName, baseAddr, size) {

  val regs : Seq[Data]

  /*private def getRegisters: Seq[VisibleReg] = {
    val fields = (Map[String, Any]() /: this.getClass.getDeclaredFields) { (a, f) =>
      f.setAccessible(true)
      a + (f.getName -> f.get(this))
    }

    fields.filter(p => p._2.isInstanceOf[VisibleReg]).map(_._2.asInstanceOf[VisibleReg]).toSeq
  }*/

  override def toStruct: String = {
    val sb = new StringBuilder
    val name = this.refName // -> given at instantiation
    val typeName = "UART"
    val fields = Seq("status","config","data")
    val descr = Seq("The status register","The config register","The data register")
    val baseAddr = this.baseAddr

    sb.append("typedef struct {\n")
    val l1 = fields.maxBy(_.length).length+1
    val l2 = descr.maxBy(_.length).length
    fields.zip(descr).zipWithIndex.foreach{ case ((s,d),i) =>
      val string = s"  int %${l1}s  // 0x%08X: %-${l2}s\n"
      sb.append(string.format(s+";",baseAddr+4*i,d))
    }
    sb.append(s"} ${typeName}_t;\n")
    sb.append(s"volatile ${typeName}_t* const $name = (${typeName}_t*)0x%08X\n\n".format(baseAddr))
    sb.toString()
  }
}
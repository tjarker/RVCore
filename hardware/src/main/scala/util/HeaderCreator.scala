package util

import rvcore.systembus.{CoreModule, MemoryModule}

import java.io.PrintWriter

class HeaderCreator(devs: Seq[MemoryModule]) {

  val sb = new StringBuilder

  for(dev <- devs){
    println(dev.toStruct)
    sb.append(dev.toStruct)
  }

  /*
  val name = dev.refName // -> given at instantiation
    val typeName = "UART"
    val fields = Seq("status","config","data")
    val descr = Seq("The status register","The config register","The data register")
    val baseAddr = dev.baseAddr

    sb.append("typedef struct {\n")
    val l1 = fields.maxBy(_.length).length+1
    val l2 = descr.maxBy(_.length).length
    fields.zip(descr).zipWithIndex.foreach{ case ((s,d),i) =>
      val string = s"  int %${l1}s  // 0x%08X: %-${l2}s\n"
      sb.append(string.format(s+";",baseAddr+4*i,d))
    }
    sb.append(s"} ${typeName}_t;\n")
    sb.append(s"volatile ${typeName}_t* const $name = (${typeName}_t*)0x%08X\n\n".format(baseAddr))
   */



  new PrintWriter("Header2.h") { write(sb.toString()); close }

}

object HeaderCreator {
  def apply(devs: Seq[MemoryModule]) : Unit = {
    new HeaderCreator(devs)
  }
}
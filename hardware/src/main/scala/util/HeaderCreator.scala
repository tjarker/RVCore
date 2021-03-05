package util

import rvcore.systembus.{BusModule, MemoryBusModule, RegBusModule}

import java.io.PrintWriter

class HeaderCreator(mem: Seq[MemoryBusModule], mod: Seq[RegBusModule]) {

  val sb = new StringBuilder

  sb.append(s"//Memory${"/"*80}\n\n")
  for(dev <- mem){
    println(dev.toStruct)
    sb.append(dev.toStruct)
  }
  sb.append(s"//Devices${"/"*79}\n\n")
  for(dev <- mod){
    println(dev.toStruct)
    sb.append(dev.toStruct)
  }

  new PrintWriter("Header2.h") { write(sb.toString()); close }

}

object HeaderCreator {
  def apply(mem: Seq[MemoryBusModule], mod: Seq[RegBusModule]) : Unit = {
    new HeaderCreator(mem,mod)
  }
}
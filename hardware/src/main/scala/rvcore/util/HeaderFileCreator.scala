package rvcore.util

import rvcore.systembus.{MemoryBusModule, RegBusModule}

import java.io.PrintWriter

class HeaderFileCreator(mem: Seq[MemoryBusModule], mod: Seq[RegBusModule],path: String) {

  val sb = new StringBuilder

  sb.append(s"//Memory${"/"*80}\n\n")
  for(dev <- mem){
    sb.append(dev.toStruct)
  }
  sb.append(s"//Devices${"/"*79}\n\n")
  for(dev <- mod){
    sb.append(dev.toStruct)
  }
  println(sb)
  new PrintWriter(path) { write(sb.toString()); close }

}

object HeaderFileCreator {
  def apply(mem: Seq[MemoryBusModule], mod: Seq[RegBusModule], path: String) : Unit = {
    new HeaderFileCreator(mem,mod,path)
  }
}
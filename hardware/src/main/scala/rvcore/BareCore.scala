package rvcore
import chisel3._
import rvcore.coreDevices.HWInfo
import rvcore.pipeline.RVPipeline
import rvcore.systembus.{BusModule, MemoryBusModule, RegBusModule, SysBus}

import java.io.PrintWriter


abstract class BareCore extends MultiIOModule{

  val pipeline = Module(new RVPipeline)
  val sysBus = Wire(new SysBus)
  sysBus <> pipeline.io.sysBusIO


  // TODO: these can be optimized (can they be merged into a general function?
  private def getBusModules: Seq[BusModule] = {
    val fields = (Map[String, Any]() /: this.getClass.getDeclaredFields) { (a, f) =>
      f.setAccessible(true)
      a + (f.getName -> f.get(this))
    }

    fields.filter(p => p._2.isInstanceOf[BusModule]).map(_._2.asInstanceOf[BusModule]).toSeq
  }
  private def getMemoryBusModules: Seq[MemoryBusModule] = {
    val fields = (Map[String, Any]() /: this.getClass.getDeclaredFields) { (a, f) =>
      f.setAccessible(true)
      a + (f.getName -> f.get(this))
    }

    fields.filter(p => p._2.isInstanceOf[MemoryBusModule]).map(_._2.asInstanceOf[MemoryBusModule]).toSeq
  }
  private def getRegBusModules: Seq[RegBusModule] = {
    val fields = (Map[String, Any]() /: this.getClass.getDeclaredFields) { (a, f) =>
      f.setAccessible(true)
      a + (f.getName -> f.get(this))
    }

    fields.filter(p => p._2.isInstanceOf[RegBusModule]).map(_._2.asInstanceOf[RegBusModule]).toSeq
  }
  def connectCoreModules() : Unit = {
    checkForMemorySpaceOverlap()
    val mods = this.getBusModules
    println(mods.map(_.toString).mkString("\n"))
    sysBus.connect(mods)
  }
  def generateHeader(path: String) : Unit = {
    checkForMemorySpaceOverlap()

    val mem = getMemoryBusModules
    val mod = getRegBusModules

    val sb = new StringBuilder

    sb.append(s"//Memory${"/"*80}\n\n")
    for(dev <- mem){
      sb.append(dev.getDef)
    }
    sb.append(s"//Devices${"/"*79}\n\n")
    for(dev <- mod){
      sb.append(dev.getDef)
    }
    println(sb)
    new PrintWriter(path) { write(sb.toString()); close() }
  }
  def checkForMemorySpaceOverlap() : Unit = {
    val ms = getBusModules.toList
    ms.combinations(2).foreach { pair =>
      val m1 = pair.head
      val m2 = pair(1)
      if(!m1.equals(m2) && (m1.range intersect m2.range).nonEmpty) throw new Exception(s"Error: Memory space of modules ${m1.defName} and ${m2.defName} overlap!")
    }
    for(m1 <- ms){
      for(m2 <- ms){
        if(!m1.equals(m2) && (m1.range intersect m2.range).nonEmpty) throw new Exception(s"Error: Memory space of modules ${m1.defName} and ${m2.defName} overlap!")
      }
    }
  }
}

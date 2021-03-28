package rvcore
import chisel3._
import rvcore.coreDevices.HWInfo
import rvcore.pipeline.RVPipeline
import rvcore.systembus.{BusModule, MemoryBusModule, RegBusModule, SysBus}
import rvcore.util.MemoryMapGen.{generateLinkerScript, generateMemoryMap}

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
  def generateLayoutFiles(path: String) : Unit = {
    checkForMemorySpaceOverlap()

    val mem = getMemoryBusModules
    val mod = getRegBusModules
    generateMemoryMap(mem,mod,path+"/MemoryMap.h")
    generateLinkerScript(mem, path + "/linker.ld")
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

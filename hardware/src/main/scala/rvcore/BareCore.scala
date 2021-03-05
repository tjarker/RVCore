package rvcore
import util.HeaderCreator
import chisel3._
import rvcore.pipeline.RVPipeline
import rvcore.systembus.{BusModule, MemoryBusModule, RegBusModule, SysBus}


abstract class BareCore extends MultiIOModule{

  val pipeline = Module(new RVPipeline)
  val sysBus = Wire(new SysBus)
  sysBus <> pipeline.io.sysBusIO

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
    val mods = this.getBusModules
    sysBus.connect(mods)
  }
  def generateHeader() : Unit = {
    HeaderCreator(getMemoryBusModules,getRegBusModules)
  }
}

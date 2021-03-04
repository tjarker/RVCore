package rvcore
import util.HeaderCreator
import chisel3._
import rvcore.pipeline.RVPipeline
import rvcore.systembus.{CoreModule, MemoryModule, SysBus}


abstract class BareCore extends MultiIOModule{

  val pipeline = Module(new RVPipeline)
  val sysBus = Wire(new SysBus)
  sysBus <> pipeline.io.sysBusIO

  private def getCoreModules: Seq[CoreModule] = {
    val fields = (Map[String, Any]() /: this.getClass.getDeclaredFields) { (a, f) =>
      f.setAccessible(true)
      a + (f.getName -> f.get(this))
    }

    fields.filter(p => p._2.isInstanceOf[CoreModule]).map(_._2.asInstanceOf[CoreModule]).toSeq
  }
  private def getMemoryModules: Seq[MemoryModule] = {
    val fields = (Map[String, Any]() /: this.getClass.getDeclaredFields) { (a, f) =>
      f.setAccessible(true)
      a + (f.getName -> f.get(this))
    }

    fields.filter(p => p._2.isInstanceOf[MemoryModule]).map(_._2.asInstanceOf[MemoryModule]).toSeq
  }
  def connectCoreModules() : Unit = {
    val mods = this.getCoreModules
    sysBus.connect(mods)
  }
  def generateHeader() : Unit = {
    val mods = this.getMemoryModules
    HeaderCreator(mods)
  }
}

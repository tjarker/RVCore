package rvcore.systembus

import util.BinaryLoader
import chisel3._
import rvcore.RVCore
/*
object Implicits {
  implicit class GetCoreModuleAccessors(c: AnyRef) {
    def getAccessorMap: Seq[CoreModule] = {
      val fields = (Map[String, Any]() /: c.getClass.getDeclaredFields) { (a, f) =>
        f.setAccessible(true)
        a + (f.getName -> f.get(c))
      }

      fields.filter(p => p._2.isInstanceOf[CoreModule]).map(_._2.asInstanceOf[CoreModule]).toSeq
    }
  }
}*/

object MemoryMapper {
  def apply(core: RVCore) : Unit = {

    //import Implicits._
    val am = core.getAccessorMap
    println(am)

  }
}
package util

import rvcore.BareCore
import rvcore.systembus.CoreModule

object CoreGenerator {
  def apply(core: BareCore) : BareCore = {
    print("hello world")
    core.connectCoreModules()
    core.generateHeader()
    core
  }
  implicit class GetCoreModuleAccessors(c: BareCore) {
    def generateHeaderFile(): Unit = {
      c.generateHeader()
    }
  }
}

object Implicits {
  implicit class CaseClassToString(c: AnyRef) {
    def toStringWithFields: String = {
      val fields = (Map[String, Any]() /: c.getClass.getDeclaredFields) { (a, f) =>
        f.setAccessible(true)
        a + (f.getName -> f.get(c))
      }

      s"${c.getClass.getName}(${fields.mkString(", ")})"
    }
  }
}

case class PriceMove(price: Double, delta: Double)

object Test extends App {
  import Implicits._
  println(PriceMove(1.23, 2.56).toStringWithFields)
}

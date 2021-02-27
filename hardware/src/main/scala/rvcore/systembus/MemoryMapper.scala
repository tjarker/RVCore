package rvcore.systembus

import chisel3._

object SysBusController {
  def apply(sysBus: SysBus, coreModules: Seq[CoreModule]) : SysBusController = {
    val c = Module(new SysBusController(coreModules))

    c
  }
}

class SysBusController(coreModules: Seq[CoreModule]) extends MultiIOModule{
  val sysBus = new SysBusSlaveIO
  val selectors = IO(Output(Vec(coreModules.length, Bool())))

  coreModules.zip(selectors).foreach{case (cm, sel) =>
    sel := 0.B
  }

}
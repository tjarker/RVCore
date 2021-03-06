package trash

import chisel3.UInt
import chisel3.util.PriorityMux

object ReadValueArbiter {
  def apply(drivers: Seq[MemoryMappedModule]): UInt = {
    PriorityMux(drivers.map(_.sysBus.sendRq).map(d => (d.rq, d.rdData)))
  }
}

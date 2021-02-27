package rvcore.systembus

import chisel3._
import chisel3.util._

object ReadValueArbiter {
  def apply(drivers: Seq[MemoryMappedModule]) : UInt = {
    PriorityMux(drivers.map(_.sysBus.sendRq).map(d => (d.rq,d.rdData)))
  }
}

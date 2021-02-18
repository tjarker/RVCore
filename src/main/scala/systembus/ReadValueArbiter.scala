package systembus

import chisel3._
import chisel3.util._

object ReadValueArbiter {
  def apply(drivers: Vec[SendRqBundle]) : UInt = {
    PriorityMux(drivers.map(d => (d.rq,d.rdData)))
  }
}

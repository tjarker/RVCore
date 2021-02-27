import chisel3._
import chiseltest._
import org.scalatest.FreeSpec
import peripherals.ledvec.LedVec
import rvcore.systembus.SystemBusIO

class LedVecTest extends FreeSpec with ChiselScalatestTester{

  val addr = 0x2000

  def read(clk: Clock, bus: SystemBusIO, addr: Int) : Int = {
    bus.addr.poke(addr.U)
    clk.step(1)
    bus.addr.poke(0.U)
    bus.sendRq.rq.expect(1.B)
    bus.sendRq.rdData.peek.litValue.toInt
  }
  def write(clk: Clock, bus: SystemBusIO, addr: Int, data: Int) : Unit = {
    bus.addr.poke(addr.U)
    clk.step(1)
    bus.addr.poke(0.U)
    bus.wrData.poke(data.U)
    bus.w.poke(1.B)
    clk.step(1)
    bus.w.poke(0.B)
  }
  "PS2 should pass" in {
    test(new LedVec(addr)) { dut =>
      dut.clock.step(10)
      write(dut.clock,dut.sysBus,addr,0xFFFF)
      dut.clock.step(10)
      println(read(dut.clock,dut.sysBus,addr).toHexString)
      dut.clock.step(5)
    }
  }
}

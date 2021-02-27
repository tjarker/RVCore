import chisel3._
import chiseltest._
import org.scalatest.FreeSpec
import peripherals.keyboard.Keyboard
import rvcore.systembus.SystemBusIO

class KeyboardTest extends FreeSpec with ChiselScalatestTester{

  val addr = 0x500

  def parity(num: Int) : Boolean = {
    var isOdd = true
    var x = num
    var i = 1
    while(x != 0){
      if((x & i) != 0){
        isOdd = !isOdd
        x &= ~i
      }
      i = i << 1
    }
    return isOdd
  }
  def sendBit(dut: Keyboard, bit: Boolean) : Unit = {
    dut.ps2.data.poke(bit.B)

    dut.clock.step(1)

    dut.ps2.clk.poke(0.B)

    dut.clock.step(1)
    dut.ps2.clk.poke(1.B)
  }
  def sendMsg(dut: Keyboard, char: Int) : Unit = {
    // send start bit
    sendBit(dut,false)

    // send 8-bit message
    for(i <- 0 until 8){
      sendBit(dut,((char>>i)&0x01)==0x01)
    }

    // send parity
    sendBit(dut,parity(char))

    // send stop bit
    sendBit(dut,false)
  }
  def readChar(dut: Keyboard) : Int = {
    read(dut.clock, dut.sysBus, addr+8)
  }
  def setActivated(dut: Keyboard, a: Int) : Unit = {
    write(dut.clock, dut.sysBus, addr+4, a)
  }
  def getActivated(dut: Keyboard) : Boolean = {
    read(dut.clock, dut.sysBus, addr+4) == 1
  }
  def hasChar(dut: Keyboard) : Boolean = {
    read(dut.clock, dut.sysBus, addr) == 1
  }
  def read(clk: Clock, bus: SystemBusIO, addr: Int) : Int = {
    bus.addr.poke(addr.U)
    clk.step(1)
    bus.addr.poke(0.U)
    //bus.sendRq.rq.expect(1.B)
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
    test(new Keyboard(addr)){ dut =>


      dut.ps2.clk.poke(1.B)
      dut.clock.step(10)
      assert(getActivated(dut))

      val values = Seq(0x55,0xAA,0xFF,0x12,0x2A,0x11,0x23,0x28)
      for(char <- values){
        sendMsg(dut,char)
      }

      for(char <- values){
        assert(hasChar(dut))
        val res = readChar(dut)
        assert(char == res,s"${char.toHexString} :: ${res.toHexString}")
      }

      val values2 = Seq(0xFF,0xFF,0xEF)
      for(char <- values2){
        sendMsg(dut,char)
      }

      for(char <- values2){
        assert(hasChar(dut))
        val res = readChar(dut)
        assert(char == res,s"${char.toHexString} :: ${res.toHexString}")
      }

    }
  }
}

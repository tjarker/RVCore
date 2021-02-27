import chiseltest._
import chisel3._
import org.scalatest.FreeSpec
import peripherals.keyboard.PS2_old
import rvcore.pipeline.submodules.DataMemory1

class PS2OldTest extends FreeSpec with ChiselScalatestTester{
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
  def sendBit(dut: PS2_old, bit: Boolean) : Unit = {
    dut.ps2.clk.poke(0.B)
    dut.ps2.data.poke(bit.B)

    dut.clock.step(1)

    dut.ps2.clk.poke(1.B)
    dut.clock.step(1)
  }
  def sendMsg(dut: PS2_old, char: Int) : Unit = {
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
  def readChar(dut: PS2_old) : Int = {
    dut.bus.clear.poke(1.B)
    val read = dut.bus.data.peek.litValue
    dut.clock.step(1)
    dut.bus.clear.poke(0.B)
    return read.toInt
  }
  "PS2 should pass" in {
    test(new PS2_old){ dut =>

      dut.ps2.clk.poke(1.B)
      dut.clock.step(10)

      val values = Seq(0x55,0xAA,0xFF,0x12,0x2A)
      for(char <- values){
        sendMsg(dut,char)
      }

      for(char <- values){
        assert(dut.bus.flag.peek.litValue == 1)
        assert(char == readChar(dut))
      }

    }
  }
}

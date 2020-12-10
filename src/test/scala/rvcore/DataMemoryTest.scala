package rvcore

import rvcore.submodules._
import chisel3._
import chiseltest._
import org.scalatest.FreeSpec

import scala.util.Random

class DataMemoryTest extends FreeSpec with ChiselScalatestTester{

  // wrapper functions
  def read(dut: DataMemoryType, addr: Int, op: Int) : Int = {
    dut.io.address.poke(addr.U)
    dut.io.memOp.poke(0.U)
    dut.clock.step(1)
    dut.io.memOp.poke(op.U)
    dut.io.rdData.peek.litValue.toInt
  }
  def write(dut: DataMemoryType, addr: Int, data: Int, op: Int) : Unit = {
    dut.io.address.poke(addr.U)
    dut.io.memOp.poke(0.U)
    dut.clock.step(1)
    dut.io.memOp.poke((op | 0x08).U)
    dut.io.wrData.poke(data.S)
    dut.clock.step(1)
    dut.io.memOp.poke(0.U)
  }

  /////////////////////////////////////////////////Tests////////////////////////////////////////////////////////////////

  "Memory should read an unsigned byte" in {
    test(new DataMemory1(128,Array.tabulate(4)(i => s"src/main/resources/memory_sim/bank$i.txt"))){ dut =>
      for(i <- 0 until 0x21) assert(read(dut,i,0x01) == i,
        s"${"%08x".format(dut.io.rdData.peek.litValue)}"
      )
      for(i <- 0 until 0x21) assert(read(dut,i+0x24,0x01) == (i+0x80),
        s"${"%08x".format(dut.io.rdData.peek.litValue)}"
      )
    }
  }
  "Memory should read a signed byte" in {
    test(new DataMemory1(128,Array.tabulate(4)(i => s"src/main/resources/memory_sim/bank$i.txt"))){ dut =>
      for(i <- 0 until 0x21){
        val exp = if((i & 0x80) != 0) 0xFFFFFF00 | i else i
        assert(read(dut,i,0x05) == exp,
          s"${"%08x".format(dut.io.rdData.peek.litValue)}"
        )
      }
      for(i <- 0 until 0x21){
        val idx = i+0x80
        val exp = if((idx & 0x80) != 0) 0xFFFFFF00 | idx else idx
        assert(read(dut,i+0x24,0x05) == exp,
          s"${"%08x".format(dut.io.rdData.peek.litValue)}"
        )
      }
    }
  }
  "Memory should read an unsigned half word" in {
    test(new DataMemory1(128,Array.tabulate(4)(i => s"src/main/resources/memory_sim/bank$i.txt"))){ dut =>
      for(i <- 0 until 0x21) assert(read(dut,i,0x02) == (i|(i+1)<<8),
          s"${"%08x".format(dut.io.rdData.peek.litValue)}"
      )
      for(i <- 0 until 0x21){
        val idx = i+0x80
        assert(read(dut,i+0x24,0x02) == (idx|(idx+1)<<8),
          s"${"%08x".format(dut.io.rdData.peek.litValue)}"
        )
      }
    }
  }
  "Memory should read a signed half word" in {
    test(new DataMemory1(128,Array.tabulate(4)(i => s"src/main/resources/memory_sim/bank$i.txt"))){ dut =>
      for(i <- 0 until 0x21){
        val exp = if(((i+1) & 0x80) != 0) 0xFFFF0000 | i | (i+1)<<8 else i | (i+1)<<8
        assert(read(dut,i,0x06) == exp,
          s"${"%08x".format(dut.io.rdData.peek.litValue)}"
        )
      }
      for(i <- 0 until 0x21){
        val idx = i+0x80
        val exp = if((idx & 0x80) != 0) 0xFFFF0000 | idx | (idx+1)<<8 else idx | (idx+1)<<8
        assert(read(dut,i+0x24,0x06) == exp,
          s"${"%08x".format(dut.io.rdData.peek.litValue)}"
        )
      }
    }
  }
  "Memory should read a word" in {
    test(new DataMemory1(128,Array.tabulate(4)(i => s"src/main/resources/memory_sim/bank$i.txt"))){ dut =>
      for(i <- 0 until 0x21) assert(read(dut,i,0x03) == (i|(i+1)<<8|(i+2)<<16|(i+3)<<24),
          s"${"%08x".format(dut.io.rdData.peek.litValue)}"
      )
      for(i <- 0 until 0x21){
        val idx = i+0x80
        val exp = idx | (idx+1)<<8 | (idx+2)<<16 | (idx+3)<<24
        assert(read(dut,i+0x24,0x03) == exp,
          s"${"%08x".format(dut.io.rdData.peek.litValue)}"
        )
      }
    }
  }
  "Memory should write a byte" in {
    test(new DataMemory1(128)){ dut =>

      for(i <- 0 until 0x21) write(dut,i,i,0x01)

      for(i <- 0 until 0x21) assert(read(dut,i,0x01) == i,
        s"${"%08x".format(dut.io.rdData.peek.litValue)}"
      )
    }
  }
  "Memory should write a half word" in {
    test(new DataMemory1(128)){ dut =>

      for(i <- 0 until 0x21 by 2) write(dut,i,i,0x02)

      for(i <- 0 until 0x21 by 2) assert(read(dut,i,0x02) == i,
        s"${"%08x".format(dut.io.rdData.peek.litValue)}"
      )

    }
  }
  "Memory should write a word" in {
    test(new DataMemory1(128)){ dut =>

      for(i <- 0 until 0x21 by 4) write(dut,i,i+0xEFFF0000,0x03)

      for(i <- 0 until 0x21 by 4) assert(read(dut,i,0x03) == i+0xEFFF0000,
        s"${"%08x".format(dut.io.rdData.peek.litValue)}"
      )

    }
  }

  "Data memory should pass random test" in {
    val memSize = 1048576
    test(new DataMemory1(memSize)){ dut =>
      val model = new MemoryReference(memSize)
      val rand = new Random()

      def test() : Unit = {
        if (rand.nextInt(2) == 1) { // write
          // generate random pokes
          val wrAddr = rand.nextInt(memSize - 4)
          val wrVal = rand.nextInt(Math.pow(2, 32).toInt)
          val wrType = rand.nextInt(3) + 1

          //println(s"write ${"%08x".format(wrVal)} at $wrAddr with type ${wrType.toBinaryString}")

          // poke model and dut
          write(dut, wrAddr, wrVal, wrType)
          model.write(wrAddr, wrVal, wrType)

        } else { // read
          // generate random pokes
          val rdAddr = rand.nextInt(memSize - 4)
          val rdType = (rand.nextInt(3) + 1) | rand.nextInt(2)<<2

          //println(s"read at $rdAddr with type ${rdType.toBinaryString}")

          // check for correct read result
          assert(read(dut, rdAddr, rdType) == model.read(rdAddr, rdType),
            s"DUT: ${read(dut, rdAddr, rdType)}, Model: ${model.read(rdAddr, rdType)}"
          )
        }
      }

      for(i <- 0 until 100000) test()

    }
  }
  "Data memory should pass directed test" in {
    test(new DataMemory1(128)){ dut =>
      val model = new MemoryReference(128)

      write(dut,1,0xDEADBEEF,3)
      model.write(1,0xDEADBEEF,3)

      assert(read(dut,1,1)==0xEF)
      assert(model.read(1,1)==0xEF)
      assert(read(dut,1,0x03) == 0xDEADBEEF)
      assert(model.readWord(1)==0xDEADBEEF)
      assert(read(dut,2,0x02) == 0xADBE)
      assert(model.readHalfWord(2) == 0xADBE)
    }
  }
}

/**
 * A software model of a byte addressable memory
 * @param size the byte size
 */
class MemoryReference(size: Int){
  val mem = Array.fill(size/4)(Array.fill(4)(0))

  def writeByte(addr: Int, data: Int) : Unit = {
    mem(addr/4)(addr%4) = data & 0xFF
  }
  def writeHalfWord(addr: Int, data: Int) : Unit = {
    mem(addr/4)(addr%4) = data & 0xFF
    mem((addr+1)/4)((addr+1)%4) = (data>>8) & 0xFF
  }
  def writeWord(addr: Int, data: Int) : Unit = {
    mem((addr)/4)((addr)%4) = data & 0xFF
    mem((addr+1)/4)((addr+1)%4) = (data>>8) & 0xFF
    mem((addr+2)/4)((addr+2)%4) = (data>>16) & 0xFF
    mem((addr+3)/4)((addr+3)%4) = (data>>24) & 0xFF
  }
  def readByte(addr: Int) : Int = {
    mem(addr/4)(addr%4)
  }
  def readByteSigned(addr: Int) : Int = {
    val r = readByte(addr)
    if((r & 0x80) != 0) r | 0xFFFFFF00 else r
  }
  def readHalfWord(addr: Int) : Int = {
    mem(addr/4)(addr%4) | mem((addr+1)/4)((addr+1)%4)<<8
  }
  def readHalfWordSigned(addr: Int) : Int = {
    val r = readHalfWord(addr)
    if((r & 0x8000) != 0) r | 0xFFFF0000 else r
  }
  def readWord(addr: Int) : Int = {
    mem(addr/4)(addr%4) | mem((addr+1)/4)((addr+1)%4)<<8 | mem((addr+2)/4)((addr+2)%4)<<16 | mem((addr+3)/4)((addr+3)%4)<<24
  }
  def write(addr: Int, data: Int, op: Int) : Unit = {
    op match {
      case 0x01 => writeByte(addr,data)
      case 0x02 => writeHalfWord(addr,data)
      case 0x03 => writeWord(addr,data)
      case others =>
    }
  }
  def read(addr: Int, op: Int) : Int = {
    op match {
      case 0x01 => readByte(addr)
      case 0x02 => readHalfWord(addr)
      case 0x03 => readWord(addr)
      case 0x05 => readByteSigned(addr)
      case 0x06 => readHalfWordSigned(addr)
      case 0x07 => readWord(addr)
      case others => 0
    }
  }
  def printMem() : Unit = {
    println(s"${"-"*20}\n${mem.map(_.map(_.toHexString).mkString(",")).mkString("\n")}")
  }
}

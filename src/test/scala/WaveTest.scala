import chisel3.iotesters.PeekPokeTester
import org.scalatest.{FlatSpec, Matchers}
import rvcore.RVCore
import rvcore.lib.{BinaryLoader, Program}



class WaveTester(dut: Top) extends PeekPokeTester(dut) {
  step(400)
}

class WaveTest extends FlatSpec with Matchers {

  s"Top with waveforms" should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new Top(BinaryLoader.loadProgram("output/blink2/blink2.bin"))) {
      c => new WaveTester(c) } should be(true)
  }
}
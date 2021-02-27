import chisel3.iotesters.PeekPokeTester
import org.scalatest.{FlatSpec, Matchers}
import rvcore.lib.{BinaryLoader, Program}
import rvcore.pipeline.RVPipline



class WaveTester(dut: Top) extends PeekPokeTester(dut) {
  step(1000)
}

class WaveTest extends FlatSpec with Matchers {

  s"Top with waveforms" should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new Top(BinaryLoader.loadProgram("output/key/key.bin"))) {
      c => new WaveTester(c) } should be(true)
  }
}
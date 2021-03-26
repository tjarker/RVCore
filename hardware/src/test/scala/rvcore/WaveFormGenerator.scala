package rvcore

import chisel3.iotesters.PeekPokeTester
import org.scalatest._
import projects.template.Template
import rvcore.util.Constructor
import chiseltest._
import chiseltest.experimental.TestOptionBuilder.ChiselScalatestOptionBuilder
import chiseltest.internal.WriteVcdAnnotation


class WaveFormTest(dut: Template) extends PeekPokeTester(dut) {
  step(1000)
}

class WaveFormGenerator extends FlatSpec with Matchers {

  s"Top with waveforms" should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on", "--target-dir", "../projects/template/output"), () => Constructor(new Template)) {
      c => new WaveFormTest(c)
    } should be(true)
  }
}

class WaveFormGenerator2 extends FreeSpec with ChiselScalatestTester{
  "Generated_wavforms" in {
    test(Constructor(new Template)).withFlags(Array("--target-dir", "../projects/template/output")).withAnnotations(Seq(WriteVcdAnnotation)){ dut =>
      dut.clock.setTimeout(0)
      dut.clock.step(1000)
    }
  }
}


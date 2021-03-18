package rvcore

import chisel3.iotesters.PeekPokeTester
import org.scalatest.{FlatSpec, Matchers}
import projects.template.Template
import rvcore.util.Constructor


class WaveFormTest(dut: Template) extends PeekPokeTester(dut) {
  step(1000)
}

class WaveFormGenerator extends FlatSpec with Matchers {

  s"Top with waveforms" should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on","--target-dir","../projects/template/output"), () => Constructor(new Template)) {
      c => new WaveFormTest(c) } should be(true)
  }
}


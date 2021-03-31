package rvcore

import chisel3.iotesters.PeekPokeTester
import org.scalatest._
import projects.template.Template
import rvcore.util.Constructor
import chiseltest._
import chiseltest.experimental.TestOptionBuilder.ChiselScalatestOptionBuilder
import chiseltest.internal.{VerilatorBackendAnnotation, WriteVcdAnnotation}



class WaveFormGenerator extends FreeSpec with ChiselScalatestTester{
  "Generated_wavforms" in {
    test(Constructor(new Template)).withFlags(Array("--target-dir", "../projects/template/output")).withAnnotations(Seq(VerilatorBackendAnnotation,WriteVcdAnnotation)){ dut =>
      dut.clock.setTimeout(0)
      dut.clock.step(1000)
    }
  }
}


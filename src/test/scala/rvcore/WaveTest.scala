package rvcore

import rvcore.RVCore
import rvcore.lib.{BinaryLoader, Program}
import rvcore.submodules.DataMemory0
import chisel3.iotesters.PeekPokeTester
import org.scalatest.{FlatSpec, Matchers}



class WaveTester(dut: RVCore, program: Program) extends PeekPokeTester(dut) {
  while(peek(dut.io.instr) != 0x00000073) step(1)
  step(5)
  println(program.toString+"\nSimulated regfile state:\n"+Seq.tabulate(32)(i => "%3s=0x%08x".format(s"x$i",peek(dut.io.regFilePort.get(i)).toInt)).sliding(4,4).map(_.mkString("\t\t")).mkString("\n")+s"\n${"="*94}")
}

class WaveTest extends FlatSpec with Matchers {

  val program = BinaryLoader.loadProgramFromRes("t11")

  s"${program.name} with waveforms" should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new RVCore(program.byteBinaries, 1048576)) {
      c => new WaveTester(c,program) } should be(true)
  }
}
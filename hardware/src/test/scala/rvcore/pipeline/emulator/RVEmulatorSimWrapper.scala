package rvcore.pipeline.emulator

import rvcore.pipeline.emulator.RVEmulator
import util.{BinaryDumper, Program}
import chiseltest._
import rvcore.lib.OpcodesRV32I.ECALL

class RVEmulatorSimWrapper(dut: RVEmulator, program: Program) {

  // simulates the processor until a finishing exit ecall occurs
  def run(): Int = {

    // no run time restriction
    dut.clock.setTimeout(0)

    // setup simulation vars
    var running = true
    val output = new StringBuilder
    var cycles = 0
    var ret = 0
    var ecallPipe = false

    // simulation loop
    while (running) {

      dut.clock.step(1)

      // an ecall occured 1 cycle ago

      if (ecallPipe) {
        // fetch argument registers
        val a0 = dut.io.regFilePort(10).peek.litValue.toInt
        val a1 = dut.io.regFilePort(11).peek.litValue.toInt

        // decode type of ecall
        a0 match {
          case 1 => output.append(s"$cycles: $a1\n")
          case 10 => running = false
          case 11 => output.append("%d: %c\n".format(cycles,a1.toChar))
          case 17 =>
            running = false
            ret = a1
          case _ => output.append(s"$cycles: ecall '$a0' not supported\n")
        }
      }
      // delay ecall by 1 cycle
      ecallPipe = dut.io.instr.peek.litValue == ECALL.opcode.litValue
      cycles += 1
    }

    //BinaryDumper.BinaryDump(regFileToSeq,s"test_run_dir/${program.name}_single_dump.bin")
    // print report
    //if(printRes) println(s"${"=" * 38}Single Cycle Model${"=" * 38}${program.toString}\nProgram execution stopped after $cycles cycles\n${"-" * 94}\nSimulated regfile state:\n$regFileToString ${if (output.nonEmpty) s"\n${"-" * 94}\nOutput:\n$output" else ""}\n${"=" * 94}")
    return cycles
  }

  def regFileToString: String = {
    Seq.tabulate(32)(i => "%3s = %10s".format(s"x$i", "0x%02X".format(dut.io.regFilePort(i).peek.litValue.toInt))).sliding(4, 4).map(_.mkString("  |  ")).mkString("\n")
  }
  def regFileToSeq: Seq[BigInt] = {
    Seq.tabulate(32)(i => dut.io.regFilePort(i).peek.litValue)
  }
}
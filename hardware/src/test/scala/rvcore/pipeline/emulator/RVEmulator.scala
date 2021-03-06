package rvcore.pipeline.emulator

import java.io.{File, PrintWriter}
import rvcore.pipeline.emulator.submodules._
import chisel3._
import rvcore.util.BinaryLoader


class RVEmulator(program: Array[Int], memorySize: Int) extends Module {
  val io = IO(new Bundle {
    val regFilePort = Output(Vec(32, UInt(32.W)))
    val instr = Output(SInt(32.W))
  })

  // convert program to text file which is used to initialize the memory
  val dir = new File("test_run_dir/" )
  if (!dir.exists()){
    dir.mkdir();
  }
  val file = new File("test_run_dir/prog.txt" )
  val pw = new PrintWriter(file)
  pw.write(program.map(_.toHexString).mkString("\n"))
  pw.close

  //ControlUnits
  val control = Module(new Control)
  val branchControl = Module(new BranchControl)
  val aluControl = Module(new ALUcontrol)
  val loadControl = Module(new LoadControl)

  //Arithmathic units
  val alu = Module(new ALU)
  val immGen = Module(new ImmGen)
  val memory = Module(new Memory(memorySize,"test_run_dir/prog.txt"))
  val regFile = Module(new RegFile)
  io.regFilePort := regFile.io.regFilePort.map(_.asUInt())

  val pc = RegInit(0.U(32.W))
  memory.io.addressI := pc

  val instruction = memory.io.readInstr
  io.instr := instruction
  val opcode = instruction(6, 0)
  val funct3 = instruction(14, 12)

  //RVSim.RVSingle.submodules.Control inputs
  control.io.opcode := opcode
  control.io.funct3 := funct3

  //Branch control inputs
  branchControl.io.funct3 := funct3
  branchControl.io.registerS1 := regFile.io.registerS1Data
  branchControl.io.registerS2 := regFile.io.registerS2Data
  branchControl.io.jump := opcode(2)

  //RVSim.RVSingle.submodules.ALU control inputs
  aluControl.io.opcode := opcode
  aluControl.io.funct3 := funct3
  aluControl.io.funct7_30 := instruction(30)

  //Load control inputs
  loadControl.io.funct3 := funct3
  loadControl.io.rawReadData := memory.io.readData


  //RVSim.RVSingle.submodules.ALU inputs
  alu.io.operation := aluControl.io.operation

  alu.io.source1 := regFile.io.registerS1Data
  when(control.io.aluSource1 === 2.U) {
    alu.io.source1 := pc.asSInt()
  }.elsewhen(control.io.aluSource1 === 1.U) {
    alu.io.source1 := 0.S
  }

  alu.io.source2 := regFile.io.registerS2Data
  when(control.io.aluSource2) {
    alu.io.source2 := immGen.io.immediate
  }

  //RVSim.RVSingle.submodules.ImmGen inputs
  immGen.io.instruction := instruction
  //immGen.io.funct3 := funct3

  //RVSim.RVSingle.submodules.Memory inputs
  memory.io.memWrite := control.io.memWrite
  memory.io.addressD := alu.io.output.asUInt()

  memory.io.writeData(3) := regFile.io.registerS2Data(31, 24)
  memory.io.writeData(2) := regFile.io.registerS2Data(23, 16)
  memory.io.writeData(1) := regFile.io.registerS2Data(15, 8)
  memory.io.writeData(0) := regFile.io.registerS2Data(7, 0)

  //Register inputs
  regFile.io.registerS1Index := instruction(19, 15)
  regFile.io.registerS2Index := instruction(25, 20)
  regFile.io.registerWIndex := instruction(11, 7)
  regFile.io.writeEn := control.io.registerWriteEn

  regFile.io.registerWData := alu.io.output
  when(control.io.link) {
    regFile.io.registerWData := (pc + 4.U).asSInt
  }
  when(control.io.memToReg) {
    regFile.io.registerWData := loadControl.io.readData
  }

  pc := pc + 4.U
  when(control.io.pcSrc && branchControl.io.takeBranch) {
    pc := alu.io.output.asUInt()
  }
}


// generate Verilog
object RVEmulator extends App {
  val program = BinaryLoader.loadProgramFromRes("loop")
  chisel3.Driver.execute(args, () => new RVEmulator(program.wordBinaries,1048576))
}
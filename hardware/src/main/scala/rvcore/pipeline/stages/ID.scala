package rvcore.pipeline.stages

import rvcore.pipeline.lib.Interfaces._
import rvcore.pipeline.lib.ALUOps._
import rvcore.lib.OpcodesRV32I._
import chisel3._
import chisel3.util._
import rvcore.pipeline.submodules.{ImmGen, RegFile}


class ID(sim: Boolean = false) extends MultiIOModule {
  val in = IO(Input(new IF_ID))
  val out = IO(Output(new ID_EX))
  val wb = IO(Input(new WB_ID))
  val ctrl = IO(new Bundle {
    val flushID = Input(Bool())
    val instr = Output(SInt(32.W))
    val regFilePort = if(sim) Some(Output(Vec(32, SInt(32.W)))) else None
  })


  val regFile = Module(new RegFile(sim))
  if(sim) ctrl.regFilePort.get := regFile.io.regFilePort.get
  val immGen = Module(new ImmGen)

  val opcode = in.instr(6, 0)
  val funct3 = in.instr(14, 12)
  val rs1 = in.instr(19, 15)
  val rs2 = in.instr(24, 20)
  val rd = in.instr(11, 7)

  out.jump              := opcode(2)
  out.funct3            := funct3
  out.branchPrediction  := in.branchPrediction

  regFile.io.registerS1Index  := rs1
  regFile.io.registerS2Index  := rs2
  out.regOp1                  := regFile.io.registerS1Data
  out.regOp2                  := regFile.io.registerS2Data

  regFile.io.registerWIndex := wb.rd
  regFile.io.registerWData  := wb.res
  regFile.io.writeEn        := wb.wb

  immGen.io.instruction := in.instr
  out.imm               := immGen.io.immediate

  out.rs1     := rs1
  out.rs2     := rs2
  out.rd      := rd
  out.pc      := in.pc
  out.wb      := false.B
  out.aluSrc1 := 0.U // 0=rs1 , 1=pc, 2=0
  out.aluSrc2 := 0.U // 0=rs2, 1=imm , 2=1//TODO: should be bool?
  out.aluOp   := add
  out.pcSrc   := false.B
  out.wbSrc   := false.B // alu
  out.brSrc   := false.B // 0=pc, 1=reg
  out.mem.nop()

  switch(opcode) {
    is(LB.opcode) {
      out.wb      := true.B
      out.aluSrc2 := 1.U
      out.wbSrc   := true.B
      switch(funct3) {
        is(LB.funct3) {
          out.mem.read      := 1.B
          out.mem.write     := 0.B
          out.mem.signed    := 1.B
          out.mem.byte      := 1.B
          out.mem.halfWord  := 0.B
        }
        is(LBU.funct3) {
          out.mem.read      := 1.B
          out.mem.write     := 0.B
          out.mem.signed    := 0.B
          out.mem.byte      := 1.B
          out.mem.halfWord  := 0.B
        }
        is(LH.funct3) {
          out.mem.read      := 1.B
          out.mem.write     := 0.B
          out.mem.signed    := 1.B
          out.mem.byte      := 0.B
          out.mem.halfWord  := 1.B
        }
        is(LHU.funct3) {
          out.mem.read      := 1.B
          out.mem.write     := 0.B
          out.mem.signed    := 0.B
          out.mem.byte      := 0.B
          out.mem.halfWord  := 1.B
        }
        is(LW.funct3) {
          out.mem.read      := 1.B
          out.mem.write     := 0.B
          out.mem.signed    := 0.B
          out.mem.byte      := 0.B
          out.mem.halfWord  := 0.B
        }
      }
    }
    is(SB.opcode) {
      out.aluSrc2 := 1.U
      switch(funct3) {
        is(SB.funct3) {
          out.mem.read      := 0.B
          out.mem.write     := 1.B
          out.mem.signed    := 0.B
          out.mem.byte      := 1.B
          out.mem.halfWord  := 0.B
        }
        is(SH.funct3) {
          out.mem.read      := 0.B
          out.mem.write     := 1.B
          out.mem.signed    := 0.B
          out.mem.byte      := 0.B
          out.mem.halfWord  := 1.B
        }
        is(SW.funct3) {
          out.mem.read      := 0.B
          out.mem.write     := 1.B
          out.mem.signed    := 0.B
          out.mem.byte      := 0.B
          out.mem.halfWord  := 0.B
        }
      }
    }
    is(ADDI.opcode) {
      out.wb      := true.B
      out.aluSrc2 := 1.U
      switch(funct3) {
        is(ADDI.funct3) {
          out.aluOp := add
        }
        is(SLLI.funct3) {
          out.aluOp := sl
        }
        is(SLTI.funct3) {
          out.aluOp := slt
        }
        is(SLTIU.funct3) {
          out.aluOp := slt
        }
        is(XORI.funct3) {
          out.aluOp := xor
        }
        is(SRLI.funct3) {
          out.aluOp := sr
          when(in.instr(30)) {
            out.aluOp := sra
          }
        }
        is(ORI.funct3) {
          out.aluOp := or
        }
        is(ANDI.funct3) {
          out.aluOp := and
        }
      }
    }
    is(ADD.opcode) {
      out.wb := true.B
      switch(funct3) {
        is(ADD.funct3) {
          out.aluOp := add
          when(in.instr(30)) {
            out.aluOp := sub
          }
        }
        is(SLL.funct3) {
          out.aluOp := sl
        }
        is(SLT.funct3) {
          out.aluOp := slt
        }
        is(SLTU.funct3) {
          out.aluOp := slt
        }
        is(XOR.funct3) {
          out.aluOp := xor
        }
        is(SRL.funct3) {
          out.aluOp := sr
          when(in.instr(30)) {
            out.aluOp := sra
          }
        }
        is(OR.funct3) {
          out.aluOp := or
        }
        is(AND.funct3) {
          out.aluOp := and
        }
      }
    }
    is(AUIPC.opcode) {
      out.wb      := true.B
      out.aluSrc1 := 1.U //pc
      out.aluSrc2 := 1.U //imm
    }
    is(LUI.opcode) {
      out.wb      := true.B
      out.aluSrc1 := 2.U // 0
      out.aluSrc2 := 1.U // imm
    }
    is(BEQ.opcode) {
      out.wb    := false.B
      out.pcSrc := true.B
    }
    is(JAL.opcode) {
      out.wb      := true.B
      out.aluSrc1 := 1.U // pc
      out.aluSrc2 := 2.U // 1
      out.pcSrc   := true.B
    }
    is(JALR.opcode) {
      out.wb      := true.B
      out.brSrc   := true.B
      out.aluSrc1 := 2.U // pc
      out.aluSrc2 := 2.U // 1
      out.pcSrc   := true.B
    }
  }

  ctrl.instr := in.instr
  when(ctrl.flushID) {
    out.wb    := 0.U
    out.aluOp := 0.U
    out.wbSrc := 0.B
    out.pcSrc := false.B
    out.mem.nop()
  }
}
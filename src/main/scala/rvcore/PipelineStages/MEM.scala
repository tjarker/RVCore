package rvcore.PipelineStages

import rvcore.lib.Interfaces._
import chisel3._
import chisel3.util._
import rvcore.lib.DataBusIO
import rvcore.lib.Helper._


class MEM extends MultiIOModule {
  val in = IO(Input(new EX_MEM))
  val out = IO(Output(new MEM_WB))
  val dataBus = IO(Flipped(new DataBusIO))
  val ctrl = IO(new Bundle {
    val outputAddr = Input(Bool())
    val rd = Output(UInt(5.W))
    val aluRes = Output(SInt(32.W))
  })

  // control byte enable lines
  dataBus.we := VecInit(Seq.fill(4)(0.B))
  dataBus.w := in.mem(3)
  when(in.mem(3)){
    switch(in.mem(1,0)) {
      is("b01".U) {
        dataBus.we := VecInit(1.B,0.B,0.B,0.B)
      }
      is("b10".U){
        dataBus.we := VecInit(1.B,1.B,0.B,0.B)
      }
      is("b11".U){
        dataBus.we := VecInit(Seq.fill(4)(1.B))
      }
    }
  }
  dataBus.addr := Mux(ctrl.outputAddr, in.aluRes.asUInt, 0.U)
  dataBus.wrData := in.regOp2.asUInt

  val rdData = toByteVec(dataBus.rdData)

  out.memRes := 0.S
  switch(in.mem(1, 0)) {
    is("b01".U) {
      out.memRes := Cat(VecInit(Seq.fill(24)(in.mem(2) & rdData(0)(7))).asUInt, rdData(0)).asSInt
    }
    is("b10".U) {
      out.memRes := Cat(VecInit(Seq.fill(16)(in.mem(2) & rdData(1)(7))).asUInt, rdData(1), rdData(0)).asSInt
    }
    is("b11".U) {
      out.memRes := (rdData(3) ## rdData(2) ## rdData(1) ## rdData(0)).asSInt
    }
  }

  val delayedAluRes = RegNext(in.aluRes)

  out.wb := in.wb
  out.wbSrc := in.wbSrc
  out.rd := in.rd
  out.aluRes := delayedAluRes
  ctrl.aluRes := delayedAluRes
  ctrl.rd := in.rd
}

package rvcore.pipeline

import chisel3._
import rvcore.pipeline.lib.Interfaces._
import rvcore.pipeline.lib.{DebugPort, InstrBus}
import rvcore.pipeline.stages.{EX, ID, IF, MEM, WB}
import rvcore.pipeline.submodules.{BranchPredictor, BranchPredictorNeverTaken, ForwardingUnit, HazardDetectionUnit}
import rvcore.systembus.SysBusMasterIO

class RVPipeline(branchPredictor : () => BranchPredictor = () => new BranchPredictorNeverTaken, sim: Boolean = false) extends Module {
  val io = IO(new Bundle{
    val debugPort = if(sim) Some(Output(new DebugPort)) else None
    val sysBusIO = new SysBusMasterIO
    val instrBus = new InstrBus
  })

  //pipeline stages
  val ifStage = Module(new IF(branchPredictor))
  val idStage = Module(new ID(sim))
  val exStage = Module(new EX)
  val memStage = Module(new MEM)
  val wbStage = Module(new WB)

  if(sim){
    io.debugPort.get.regfile := idStage.ctrl.regFilePort.get.map(_.asUInt)
    io.debugPort.get.instr := ifStage.ctrl.instr.asUInt()
    io.debugPort.get.pc := ifStage.out.pc
  }

  val forwardingUnit = Module(new ForwardingUnit)
  val hazardDetectionUnit = Module(new HazardDetectionUnit)

  val if_id = RegInit(0.U.asTypeOf(new IF_ID))
  val id_ex = RegInit(0.U.asTypeOf(new ID_EX))
  val ex_mem = RegInit(0.U.asTypeOf(new EX_MEM))
  val mem_wb = RegInit(0.U.asTypeOf(new MEM_WB))

  // IF stage connections
  ifStage.instrBus <> io.instrBus
  ifStage.in <> exStage.ctrl.branchOut
  ifStage.ctrl.pcEn := hazardDetectionUnit.io.pcEn
  when(hazardDetectionUnit.io.enableIF_ID) {
    ifStage.out <> if_id
  }

  // ID stage connections
  hazardDetectionUnit.io.instr := idStage.ctrl.instr
  idStage.ctrl.flushID := hazardDetectionUnit.io.flushID
  idStage.wb <> wbStage.out
  idStage.in <> if_id
  idStage.out <> id_ex


  // EX stage connections
  exStage.in <> id_ex
  ex_mem <> exStage.out
  forwardingUnit.io.rs1 := exStage.ctrl.rs1
  forwardingUnit.io.rs2 := exStage.ctrl.rs2
  hazardDetectionUnit.io.rd_EX := exStage.ctrl.rd
  hazardDetectionUnit.io.branch_EX := exStage.ctrl.branchOut.branch
  hazardDetectionUnit.io.wbSrc_EX := exStage.out.wbSrc
  exStage.ctrl.fwdA := forwardingUnit.io.fwdA
  exStage.ctrl.fwdB := forwardingUnit.io.fwdB
  exStage.ctrl.fwdA_en := forwardingUnit.io.fwdA_en
  exStage.ctrl.fwdB_en := forwardingUnit.io.fwdB_en


  // MEM stage connections
  memStage.in <> ex_mem
  memStage.out <> mem_wb
  forwardingUnit.io.rd_MEM := memStage.ctrl.rd
  forwardingUnit.io.aluRes_MEM := memStage.ctrl.aluRes
  forwardingUnit.io.wb_MEM := memStage.out.wb

  // WB stage connections
  wbStage.in <> mem_wb
  forwardingUnit.io.rd_WB := wbStage.ctrl.rd
  forwardingUnit.io.res_WB := wbStage.ctrl.res
  forwardingUnit.io.wb_WB := wbStage.out.wb

  io.sysBusIO.m <> memStage.sysBusMaster
  io.sysBusIO.s <> wbStage.sysBusSlave

  // flushes
  when(hazardDetectionUnit.io.flushIF) {
    if_id := 0.U.asTypeOf(new IF_ID)
  }

}



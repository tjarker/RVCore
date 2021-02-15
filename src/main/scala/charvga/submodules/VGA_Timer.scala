package charvga.submodules

import chisel3._

class VGA_Timer extends Module{
  val io = IO(new Bundle{
    val hSync = Output(UInt(1.W))
    val vSync = Output(UInt(1.W))
  })
  // Constants
  val VISIBLE_AREA_H = 640.U
  val FRONT_PORCH_H = 16.U
  val SYNC_PULSE_H = 96.U
  val BACK_PORCH_H = 48.U
  val LINE = 800.U

  val VISIBLE_AREA_V = 480.U
  val FRONT_PORCH_V = 10.U
  val SYNC_PULSE_V = 2.U
  val BACK_PORCH_V = 33.U
  val FRAME = 525.U

  // Clock divider
  val clkDivReg = RegInit(0.U(2.W))
  clkDivReg := clkDivReg + 1.U
  val clock_tick = clkDivReg === 3.U
  when(clock_tick){
    clkDivReg := 0.U
  }

  // horizontal counter
  val hCounterReg = RegInit(0.U(11.W))
  val hSyncReg = RegInit(0.U(1.W))

  when(clock_tick){
    when(hCounterReg === LINE-1.U){
      hCounterReg := 0.U
    }otherwise {
      hCounterReg := hCounterReg + 1.U
    }
    when((hCounterReg === VISIBLE_AREA_H+BACK_PORCH_H-1.U)||(hCounterReg===VISIBLE_AREA_H+BACK_PORCH_H+SYNC_PULSE_H-1.U)){
      hSyncReg := ~hSyncReg
    }
  }

  // ripple clock
  val rippleTick = hCounterReg === LINE-1.U

  // vertical counter
  val vCounterReg = RegInit(0.U(10.W))
  val vSyncReg = RegInit(0.U(1.W))

  when(rippleTick){
    when(vCounterReg === FRAME-1.U){
      vCounterReg := 0.U
    }otherwise {
      vCounterReg := vCounterReg + 1.U
    }
    when((vCounterReg === VISIBLE_AREA_V + BACK_PORCH_V-1.U) || (vCounterReg === VISIBLE_AREA_V + BACK_PORCH_V + SYNC_PULSE_V-1.U)){
      vSyncReg := ~vSyncReg
    }
  }

  // connect IO
  io.vSync := vSyncReg
  io.hSync := hSyncReg
}




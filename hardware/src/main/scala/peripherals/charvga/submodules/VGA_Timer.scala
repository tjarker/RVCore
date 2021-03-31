package peripherals.charvga.submodules

import chisel3._
import chisel3.util.{MuxCase, log2Ceil}
import peripherals.charvga.submodules.Resolution.Resolution

object Resolution extends Enumeration {
  protected case class ResolutionVal(val pixelFreq: Int)(

                                      val VISIBLE_AREA_H    :   Int,
                                      val FRONT_PORCH_H     :   Int,
                                      val SYNC_PULSE_H      :   Int,
                                      val BACK_PORCH_H      :   Int,

                                      val VISIBLE_AREA_V    :   Int,
                                      val FRONT_PORCH_V     :   Int,
                                      val SYNC_PULSE_V      :   Int,
                                      val BACK_PORCH_V      :   Int

                                    ) extends super.Val {
    val LINE          =   VISIBLE_AREA_H + FRONT_PORCH_H + SYNC_PULSE_H + BACK_PORCH_H
    val FRAME         =   VISIBLE_AREA_V + FRONT_PORCH_V + SYNC_PULSE_V + BACK_PORCH_V
    val START_H_SYNC  =   VISIBLE_AREA_H + FRONT_PORCH_H
    val END_H_SYNC    =   VISIBLE_AREA_H + FRONT_PORCH_H + SYNC_PULSE_H
    val START_V_SYNC  =   VISIBLE_AREA_V + FRONT_PORCH_V
    val END_V_SYNC    =   VISIBLE_AREA_V + FRONT_PORCH_V + SYNC_PULSE_V

  }

  import scala.language.implicitConversions
  implicit def valueToResolutionVal(x: Value): ResolutionVal = x.asInstanceOf[ResolutionVal]

  val R640x480    =   ResolutionVal(25175000)(640, 16, 96, 48, 480, 10, 2, 33)

  type Resolution = Value

}

class VGA_Timer(res: Resolution) extends Module{
  val io = IO(new Bundle{
    val hSync = Output(Bool())
    val vSync = Output(Bool())
    val show = Output(Bool())
    val x = Output(UInt(log2Ceil(res.VISIBLE_AREA_H).W))
    val y = Output(UInt(log2Ceil(res.VISIBLE_AREA_V).W))
  })


  // Generate an approximation of the pixel clock
  val divider     =   Math.ceil(100000000.0/res.pixelFreq).toInt
  println(s"div is $divider and width is ${log2Ceil(divider)}")
  val tickGenReg  =   RegInit(0.U(log2Ceil(divider).W))
  val pixelTick   =   tickGenReg === (divider-1).U

  tickGenReg := Mux(pixelTick, 0.U, tickGenReg + 1.U)

  // horizontal counter
  val hCounterReg = RegInit(0.U(log2Ceil(res.LINE).W))
  val hSyncReg = RegInit(0.B)

  // ripple
  val lineCompleted = hCounterReg === (res.LINE - 1).U

  when(pixelTick){
    hCounterReg := Mux(lineCompleted, 0.U, hCounterReg + 1.U)

    hSyncReg := MuxCase(hSyncReg,Seq(
      (hCounterReg === (res.START_H_SYNC - 1).U)  -> 1.B,
      (hCounterReg === (res.END_H_SYNC - 1).U)    -> 0.B
    ))

  }

  // vertical counter
  val vCounterReg = RegInit(0.U(log2Ceil(res.FRAME).W))
  val vSyncReg = RegInit(0.B)

  val frameCompleted = vCounterReg === (res.FRAME - 1).U

  when(lineCompleted){
    when(pixelTick && lineCompleted){
      vCounterReg := Mux(frameCompleted, 0.U, vCounterReg + 1.U)
    }

    vSyncReg := MuxCase(vSyncReg,Seq(
      (vCounterReg === (res.START_V_SYNC - 1).U)  -> 1.B,
      (vCounterReg === (res.END_V_SYNC - 1).U)    -> 0.B
    ))
  }

  val show = (hCounterReg < res.VISIBLE_AREA_H.U) && (vCounterReg < res.VISIBLE_AREA_V.U)
  io.show := show

  io.x := Mux(show, hCounterReg, 0.U)
  io.y := Mux(show, vCounterReg, 0.U)

  // connect IO
  io.vSync := vSyncReg
  io.hSync := hSyncReg
}




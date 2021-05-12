package util

import util._
import chisel3._

trait Comparable[T <: Data] {
  def <(that: T) : Bool
  def >(that: T) : Bool
  def <=(that: T) : Bool
  def >=(that: T) : Bool
  def ===(that: T) : Bool
  def =/=(that: T) : Bool
}

class DeadLine extends Bundle with Comparable[DeadLine] {
  override def <(that: DeadLine): Bool = ???

  override def >(that: DeadLine): Bool = ???

  override def <=(that: DeadLine): Bool = ???

  override def >=(that: DeadLine): Bool = ???

  override def ===(that: DeadLine): Bool = ???

  override def =/=(that: DeadLine): Bool = ???
}


class PriorityQueue[QT <: Data with Comparable[QT]](size: Int, order: Int = 2){

}


object main extends App {
  val a = new DeadLine
  val b = new DeadLine
  when(a < b)
}
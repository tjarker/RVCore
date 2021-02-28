package util

class SimMemory(size: Int, init: Array[Int] = Array()){

  val mem: Array[Array[BigInt]] = Array.fill(size/4)(Array.fill(4)(BigInt(0)))
  for(i <- init.indices){
    writeWord(4*i, BigInt(init(i)) & BigInt(0xFFFFFFFF))
  }

  def writeWord(addr: BigInt, data: BigInt) : Unit = {
    var ad = addr.toInt
    if(ad < 0) ad = -ad
    //println(s"ad: $ad = $addr")
    mem((ad)/4)((ad)%4) = data & 0xFF
    mem((ad+1)/4)((ad+1)%4) = (data>>8) & 0xFF
    mem((ad+2)/4)((ad+2)%4) = (data>>16) & 0xFF
    mem((ad+3)/4)((ad+3)%4) = (data>>24) & 0xFF
  }
  def writeWord(addr: BigInt, data: BigInt, mask: Seq[Boolean]) : Unit = {
    var ad = addr.toInt
    if(ad < 0) ad = -ad
    //println(s"ad: $ad = $addr")
    if(mask(0)) mem((ad)/4)((ad)%4) = data & 0xFF
    if(mask(1)) mem((ad+1)/4)((ad+1)%4) = (data>>8) & 0xFF
    if(mask(2)) mem((ad+2)/4)((ad+2)%4) = (data>>16) & 0xFF
    if(mask(3)) mem((ad+3)/4)((ad+3)%4) = (data>>24) & 0xFF
  }
  def readWord(addr: BigInt) : BigInt = {
    var ad = addr.toInt
    if(ad < 0) ad = -ad
    //println(s"ad: $ad = $addr")
    mem(ad/4)(ad%4) | mem((ad+1)/4)((ad+1)%4)<<8 | mem((ad+2)/4)((ad+2)%4)<<16 | mem((ad+3)/4)((ad+3)%4)<<24
  }
  def printMem() : Unit = {
    println(s"${"-"*20}\n${mem.map(_.map(_.toInt.toHexString).mkString(",")).mkString("\n")}")
  }
  def printMem(until: Int) : Unit = {
    println(s"${"-"*20}\n${mem.slice(0,until).map(_.map(_.toInt.toHexString).mkString(",")).mkString("\n")}")
  }
}
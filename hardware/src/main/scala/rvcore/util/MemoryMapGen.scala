package rvcore.util

import rvcore.systembus.{MemoryBusModule, RegBusModule}

import java.io.PrintWriter

object MemoryMapGen {

  def generateLinkerScript(mems: Seq[MemoryBusModule], path: String): Unit = {
    val executionSource = mems.filter(_.memoryType.toString.contains("x"))
    val stackMem = mems.filter(_.hostsStack)

    if(executionSource.length > 1) throw new Exception("Error: Only one source of executable code is allowed!")
    if(stackMem.length > 1) throw new Exception("Error: Only one memory unit can host the stack")

    val memdefs = new StringBuilder
    mems.foreach { mem =>
      memdefs.append(s"|   ${mem.defName}\t\t(${mem.memoryType.toString})\t:\tORIGIN = 0x%08X, LENGTH = 0x%08X\n".format(mem.baseAddr,mem.size))
    }
    val ld = s"""MEMORY
       |{
       ${memdefs.toString}
       |}
       |
       |
       |STACK_SIZE = 0x800;
       |
       |ENTRY(_start)
       |
       |/* Section Definitions */
       |SECTIONS
       |{
       |    PROVIDE (__stack_top = ORIGIN(${stackMem.head.defName}) + LENGTH(${stackMem.head.defName}));
       |    PROVIDE (__global_pointer$$ = ORIGIN(${stackMem.head.defName}) + LENGTH(${stackMem.head.defName}));
       |    .text :
       |    {
       |        *(.text*)
       |    } > ${executionSource.head.defName}
       |
       |    /* .bss section which is used for uninitialized data */
       |    .bss (NOLOAD) :
       |    {
       |        *(.bss*)
       |        *(COMMON)
       |    } > ${stackMem.head.defName}
       |
       |    .data :
       |    {
       |        *(.data*);
       |    } > ${stackMem.head.defName} AT > ${executionSource.head.defName}
       |
       |    /* stack section */
       |    .stack (NOLOAD):
       |    {
       |        . = ALIGN(8);
       |        . = . + STACK_SIZE;
       |        . = ALIGN(8);
       |    } > ${stackMem.head.defName}
       |
       |    _end = . ;
       |}""".stripMargin
    println(ld)
    new PrintWriter(path) { write(ld); close() }
  }

  def generateMemoryMap(mems: Seq[MemoryBusModule], devs: Seq[RegBusModule], path: String): Unit = {
    val sb = new StringBuilder

    sb.append(s"//Memory${"/"*80}\n\n")
    for(dev <- mems){
      sb.append(dev.getDef)
    }
    sb.append(s"//Devices${"/"*79}\n\n")
    for(dev <- devs){
      sb.append(dev.getDef)
    }
    println(sb)
    new PrintWriter(path) { write(sb.toString()); close() }
  }

}

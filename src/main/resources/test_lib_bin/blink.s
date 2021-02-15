main:
  li x18, 0xDEADBEEF
  li x19, 0x2000
  li x20, 0x0
  li x22, 0x1000
  
loop:
  sw x18, 0(x20)
  sw x20, 0(x19)
  nop
  sw x0, 0(x19)
  nop
  lw x21, 0(x20)
  sw x21, 0(x19)
  bne x18, x21, error
  addi x20, x20, 1
  blt x20, x22, loop
passed:
  li x18, 0x55555555
  sw x18, 0(x19)
  j stay

error:
  li x18, 0xFFFF
  sw x18, 0(x19)
  j stay
stay:
  j stay  

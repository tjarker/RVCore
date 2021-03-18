
main:
  li s0, 0xDEADBEEF
  li s1, 0
  li s3, 0x1000
  li s4, 0x2000
  
loop:
  li s2, 0
  sw s0, 0(s1)
  lw s2, 0(s1)
  bne s2, s0, error
  addi s1, s1, 1
  blt s1, s3, loop
  j passed
error:
    li s0, 0xFFFFFFFF
    sw s0, 0(s4)
    sw s0, 0x100(s4)
    j stay 
passed:
    li s0, 0x55555555
    sw s0, 0(s4)
    sw s0, 0x100(s4)
stay:
    j stay
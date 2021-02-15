
main:
  li x18, 0
  
loop:
  addi x18, x18, 1
  sw x18, 0x500(x0)
  j loop

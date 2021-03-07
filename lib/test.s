
main:
  li x18, 0
  li x19, 0
  li x20, 0x2000
  li x21, 1
  sw x21, 4(x20)
  
loop:
  addi x18, x18, 1
  sw x18, 0(x20)
  j loop


main:
  li x18, 0
  li x19, 0
  li x20, 0x2000
  
loop:
  addi x18, x18, 1
  srli x19, x18, 16
  sw x19, 0(x20)
  sw x19, 0x100(x20)
  j loop

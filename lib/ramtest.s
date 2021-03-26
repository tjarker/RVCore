
main:
  li s0, 0xDEADBEEF
  li s1, 0x1000
  sw s0, 0(s1)
  lbu s2, 0(s1)
  lbu s2, 1(s1)
  lbu s2, 2(s1)
  lbu s2, 3(s1)
end:
    j end
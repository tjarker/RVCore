main:
    li s0, 0x200
    lw a5, 0(s0)
    lw a5, 0(a5)
loop:
    nop
    nop
    j loop
buildC:
ifdef f
	riscv32-unknown-elf-gcc -g -ffreestanding -O0 -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,rvcore.ld crt0.s -o ${f}.o ${f}.c
	riscv32-unknown-elf-objcopy ${f}.o --dump-section .text=${f}.bin
else
	@echo "Define the C file you want to build with `f=fileName.c`"
endif

buildAsm:
ifdef f
	riscv32-unknown-elf-as -o ${f}.o ${f}.s
	riscv32-unknown-elf-objcopy ${f}.o --dump-section .text=${f}.bin
else
	@echo "Define the C file you want to build with `f=fileName.s`"
endif
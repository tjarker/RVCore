build:
	riscv32-unknown-elf-gcc -g -ffreestanding -O0 -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,rvcore.ld crt0.s -o blink2.o blink2.c
	riscv32-unknown-elf-objcopy blink2.o --dump-section .text=blink2.bin

MEMORY
{
  rom      (rx)  : ORIGIN = 0x00000000, LENGTH = 0x00001000
  ram      (rw) : ORIGIN = 0x10000000, LENGTH = 0x00001000
}


STACK_SIZE = 0x800;

ENTRY(_start)

/* Section Definitions */
SECTIONS
{
    PROVIDE (__stack_top = ORIGIN(ram) + LENGTH(ram));
    PROVIDE (__global_pointer$ = ORIGIN(ram) + LENGTH(ram));
    .text :
    {
        *(.text*)
    } > rom

    /* .bss section which is used for uninitialized data */
    .bss (NOLOAD) :
    {
        *(.bss*)
        *(COMMON)
    } > ram

    .data :
    {
        *(.data*);
    } > ram AT >rom

    /* stack section */
    .stack (NOLOAD):
    {
        . = ALIGN(8);
        . = . + STACK_SIZE;
        . = ALIGN(8);
    } > ram

    _end = . ;
}
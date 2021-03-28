MEMORY
{
   RAM0		(rw)	:	ORIGIN = 0x00001000, LENGTH = 0x00001000
   ROM		(rx)	:	ORIGIN = 0x00000000, LENGTH = 0x00001000

}


STACK_SIZE = 0x800;

ENTRY(_start)

/* Section Definitions */
SECTIONS
{
    PROVIDE (__stack_top = ORIGIN(RAM0) + LENGTH(RAM0));
    PROVIDE (__global_pointer$ = ORIGIN(RAM0) + LENGTH(RAM0));
    .text :
    {
        *(.text*)
    } > ROM

    /* .bss section which is used for uninitialized data */
    .bss (NOLOAD) :
    {
        *(.bss*)
        *(COMMON)
    } > RAM0

    .data :
    {
        *(.data*);
    } > RAM0 AT > ROM

    /* stack section */
    .stack (NOLOAD):
    {
        . = ALIGN(8);
        . = . + STACK_SIZE;
        . = ALIGN(8);
    } > RAM0

    _end = . ;
}
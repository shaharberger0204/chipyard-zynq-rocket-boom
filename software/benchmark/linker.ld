OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    ram (rwx) : ORIGIN = 0x80000000, LENGTH = 0x40000000
}

SECTIONS
{
    . = ORIGIN(ram);

    .text : ALIGN(4)
    {
        KEEP(*(.text.init))
        *(.text .text.*)
        *(.rodata .rodata.*)
    } > ram

    .data : ALIGN(8)
    {
        *(.data .data.*)
    } > ram

    .tohost : ALIGN(64)
    {
        KEEP(*(.tohost))
        KEEP(*(.fromhost))
    } > ram

    .bss (NOLOAD) : ALIGN(64)
    {
        *(.bss .bss.*)
        *(COMMON)
    } > ram

    __heap_size = 0x20000;
    _end = .;
}

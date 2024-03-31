ENTRY(_start)

SECTIONS
{
  . = 2M;

  .text :
  {
    KEEP(*(.multiboot_header))
    *(.text)
  }
}

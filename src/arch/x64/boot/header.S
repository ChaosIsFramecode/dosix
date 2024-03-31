.section .multiboot_header
header_start:
  # MAGIC
  .long 0xe85250d6
  # ARCH
  .long 0 # protected mode i386
  # HEADER LEN
  .long header_end-header_start
  # CHECKSUM
  .long 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))
  # END
  .word 0
  .word 0
  .long 8 
header_end:

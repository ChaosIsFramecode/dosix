.global long_mode_start
.extern kmain

.section .text
.code64
long_mode_start:
  # Load null into all data segment registers
  movq $0, %rax
  movq %rax, %ss
  movq %rax, %ds
  movq %rax, %es
  movq %rax, %fs
  movq %rax, %gs

  movl $0x2f4b2f4f, %eax
  movl %eax, 0xb8000
  
  call kmain
  cli
  hlt

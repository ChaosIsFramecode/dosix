.global long_mode_start
.extern kmain

.section .text
.code64
long_mode_start:
  # Load null into all data segment registers
  movzx %ax, %rax
  movq %rax, %ss
  movq %rax, %ds
  movq %rax, %es
  movq %rax, %fs
  movq %rax, %gs

  call kmain
  cli
  hlt

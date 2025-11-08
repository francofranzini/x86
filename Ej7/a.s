.global main
main:
  movq $0, %rax
  movq $0x00000000ffffffff, %rax
  rorq $32, %rax
  ret

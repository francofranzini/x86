.global main
main:
  movb $0, %bl
  movq $0xaabbccddeeff0011, %rax
  movq $64, %rcx
  bucle:
    rorq $1, %rax
    adc $0, %bl
    loop bucle
  movq $0, %rax
  movb %bl, %al
  ret

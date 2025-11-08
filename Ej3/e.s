.global main
main:
  movb $0xA5, %al
  movb $0x78, %ah
  negb %ah
  addb %ah, %al
  ret

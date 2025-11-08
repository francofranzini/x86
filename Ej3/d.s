.global main
main:
  movb $0x78, %al
  movb $0xC8, %ah
  negb %ah
  addb %ah, %al
  ret


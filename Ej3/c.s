.global main
main:
  movb $0xC1, %al
  movb $0xA5, %ah
  addb %ah, %al
  ret

.global main
main:
  movb $0xC1, %al
  movb $0xC8, %ah
  addb %ah, %al
  ret

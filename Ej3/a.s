.global main
main:
  movb $0x64, %al
  movb $0x78, %ah
  addb %ah, %al
  ret

.global main
main:
  movb $0x78, %al
  movb $91, %ah
  negb %ah
  subb %al, %ah
  ret

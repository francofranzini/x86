.data
a:  .word -1
b:  .byte 0xaa, 99
c:  .float 1.5
str: .asciz "Hola mundo\n"

.text
.global main
main:
  leaq a, %rdx
  #ax = 0xffff
  movq (%rdx), %rax
  #al = 0x63
  leaq b+1, %rdx
  movq (%rdx), %rax
   
  #esi = "aloH"

  #edi = 03xfc00000

  movl %esi, (%rdx)
  ret

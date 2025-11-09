.data
a:  .long 1, 2, 3, 4
g:  .quad 0x1122334455667788
msg:  .asciz "Imprime %c\n"

.text
.global main
main:
  subq $8, %rsp
  movq $g, %rax
  movl g+4, %eax
  movq $3, %rbx
  movb a(,%rbx,4), %al
  leaq msg, %rdi
  movb (%rdi, %rbx, 2), %sil
  xorl %eax, %eax
  call printf
  addq $8, %rsp
  ret

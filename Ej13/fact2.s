
.global fact2
.data
a:  .byte 7
.text
fact2:
  #PROLOGO
  pushq %rbp
  movq %rsp, %rbp

  cmpq $1, %rdi
  jz caso_base_1

  cmpq $0, %rdi
  jz caso_base_1

  #recibo 'x' en rdi
  #devuelvo en rax
  subq $8, %rsp
  subq $1, %rdi
  call fact2
  addq $1, %rdi

  movq %rax, -8(%rbp)

  subq $2, %rdi
  call fact2
  addq $2, %rdi

  addq -8(%rbp), %rax
  jmp fin

  caso_base_1:
  movq $1, %rax
  jmp fin


#EPILOGO
  fin:
  movq %rbp, %rsp
  popq %rbp
  ret
.section .note.GNU-stack

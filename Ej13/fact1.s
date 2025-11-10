.text
.global fact1
fact1:
  cmpq $1, %rdi
  je caso_base
  cmpq $0, %rdi
  je caso_base

  
  #rax es ?
  subq $1, %rdi
  call fact1
  addq $1, %rdi
  #rax es fact1(x-1)
  mulq %rdi
  jmp fin

  caso_base:
    movq $1, %rax
    jmp fin

  fin:
    ret


  
.section .note.GNU-stack


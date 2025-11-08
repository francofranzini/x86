.global main
main:
  movl $-1, %eax
  movl $2, %ecx
  imull %ecx

  #(edx:eax = %ecx * %eax)
  movl %edx, %edx
  rolq $32, %rdx
  orq %rdx, %rax  

  xorq %rax, %rax
  movw $-1, %ax
  movw $2, %cx
  mulw %cx

  #(dx:ax = cx*ax)
  movw %dx, %dx
  roll $16, %edx
  orl %edx, %eax

  ret

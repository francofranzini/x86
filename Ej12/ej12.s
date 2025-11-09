.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length:  .byte 10
format: .asciz "La suma es: %d \n"
.text
/*

suma:
  #PROLOGO
  pushq %rbp
  movq %rsp, %rbp

  #Cuerpo de la funcion
  xorq %rax, %rax
  addq %rdi, %rax
  addq %rsi, %rax  

  #Epilogo
  movq %rbp, %rsp
  popq %rbp
  ret
*/
.global main
main:
  
  xor %rcx, %rcx
  movb length, %cl
  xorq %rax, %rax

  leaq list, %rbx  
  sumar_arreglo:
    addl (%ebx), %eax
    addq $4, %rbx
    loop sumar_arreglo
  

  movq %rax, %rsi      # Valor a imprimir (segundo argumento)
  leaq (format), %rdi  # Formato (primer argumento)
  xorq %rax, %rax      # 0 argumentos vectoriales para printf
  call printf

  xorq %rax, %rax
  ret
    
.section .note.GNU-stack    

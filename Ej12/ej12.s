.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length:  .byte 10
format: .asciz "La suma es: %d \n"
menorfmt: .asciz "El menor es: %d \n"
mayorfmt: .asciz "El mayor es: %d \n"
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
  

  xor %rcx, %rcx
  movb length, %cl
  subb $1, %cl


  xorq %rax, %rax
  leaq list, %rbx
  movl (list), %eax
  movl (list), %edx

  addq $4, %rbx 
  buscar_mayor_menor:
    #rax es el mayor
    #rdx es el menor
    cmpl (%rbx), %eax
    jl menor
    cmpl (%rbx), %edx
    ja mayor
    

    jmp fin
    menor:
      movl (%ebx), %eax
      jmp fin
    mayor:
      movl (%ebx), %edx
      jmp fin
    fin:
      addq $4, %rbx
      loop buscar_mayor_menor
 

  #preservamos el menor
  movq %rdx, %rbx

  #imprimir mayor
  leaq (mayorfmt), %rdi
  movq %rax, %rsi
  xorq %rax, %rax
  call printf 
  
  #imprimir menor
  leaq (menorfmt), %rdi
  movq %rbx, %rsi
  xorq %rax, %rax
  call printf


  xorq %rax, %rax
  ret
    
.section .note.GNU-stack    

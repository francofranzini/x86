.data
a:  .byte 1, 2, 3, 4
l:  .byte 4

.text
invertir:
  #rsp registro del stack

  #PROLOGO
  pushq %rbp
  movq %rsp, %rbp
  
  #Cargo la cantidad de iteraciones
  movb l, %cl
  apilar:
    #Agrego el primer byte de 'a' a la pila
    pushq (%rbx)
    #Muevo el puntero rbx al siguiente byte
    incq %rbx
    loop apilar
  
  #Cargo la cantidad de iteraciones
  movb l, %cl
  #Devuelvo el puntero rbx al comienzo de 'a'
  leaq a, %rbx  
  
  desapilar:
    popq (%rbx)
    incq %rbx
    loop desapilar
  


  #EPILOGO
  movq %rbp, %rsp
  popq %rbp 
  ret

.global main
main:
  xorq %rcx, %rcx
  xorq %rbx, %rbx
  leaq a, %rbx
  call invertir
  ret

.section .note.GNU-stack

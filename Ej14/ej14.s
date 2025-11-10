.text
.extern atoi
.global suma_cuadrados
# RDI = CANTIDAD DE ARGUMENTOS
# RSI = STRING DE NUMEROS [0] ES EL NOMBRE DEL PROGRAMA

suma_cuadrados:
  #PROGOLO
  pushq %rbp
  movq %rsp, %rbp
  
  pushq %rbx
  pushq %r13
  pushq %r14

  movq %rdi, %r13
  #subq $1, %r13

  movq $0, %r14 #Resultado de la suma

  movq %rsi, %rbx
  addq $8, %rsi

  sumar:
    movq (%rbx), %rdi #numero en string
    call atoi


    #resultado en %rax
    imulq %rax, %rax #obtengo rax = rax*rax
    addq %rax, %r14 #lo sumo a la solucion
    

    addq $8, %rbx #Paso al siguiente valor
    subq $1, %r13 # Reduzco las iteraciones
    jnz sumar

  #EPILOGO
  movq %r14, %rax
  popq %r14
  popq %r13
  popq %rbx
  movq %rbp, %rsp
  popq %rbp
  ret
.section .note.GNU-stack

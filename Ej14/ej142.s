.text
.extern atoi

.global suma_cuadrados

suma_cuadrados:
    # PRÓLOGO
    pushq %rbp
    movq %rsp, %rbp
    
    # PRESERVAR REGISTROS
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %rbx
    
    # Inicializar
    movq %rdi, %r13         # argc
    movq %rsi, %rbx         # argv (preservar)
    
    # Verificar si hay argumentos
    cmpq $1, %r13
    jle .fin_suma           # Si argc <= 1, no hay números
    
    movq $0, %r14           # Resultado de la suma
    addq $8, %rbx           # Saltar argv[0]
    subq $1, %r13           # argc - 1

.sumar:
    # Cargar string y llamar atoi
    movq (%rbx), %rdi       # Cargar string (argv[i])
    call atoi
    
    # Calcular cuadrado y sumar
    movq %rax, %rdx
    imulq %rdx, %rdx        # rdx = rax * rax
    addq %rdx, %r14         # Sumar al resultado
    
    # Siguiente elemento
    addq $8, %rbx           # Siguiente argv
    subq $1, %r13           # Decrementar contador
    jnz .sumar

.fin_suma:
    # Preparar valor de retorno
    movq %r14, %rax
    
    # RESTAURAR REGISTROS
    popq %rbx
    popq %r14
    popq %r13
    popq %r12
    
    # EPÍLOGO
    movq %rbp, %rsp
    popq %rbp
    ret

.section .note.GNU-stack

.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
len: .byte 10
msg: .asciz "Suma: %d\nMaximo: %d\nMinimo: %d\nPromedio: %d\n"

.text

# mensaje: rdi
# suma: rsi
# max: rdx
# min: rcx
# promedio: r8d

.global main
main:
    movl $0, %eax
    xorq %rcx, %rcx

# temporales
# r8d para el maximo
# r9d para el minimo
# r10d para el promedio
# r11d para el actual

    movl $0, %r8d
    movl $0, %r9d
    movl $0, %r10d

    leaq msg(%rip), %rdi
    leaq list(%rip), %rdx
    movb len(%rip), %cl


  iteracion:
      movl (%rdx), %r11d
      addl %r11d, %eax

      cmpl %r8d, %r11d
      jg nuevo_max
    
      cmpl %r9d, %r11d
     jl nuevo_min
    
      jmp next

     nuevo_max:
          movl %r11d, %r8d
          jmp next
    
      nuevo_min:
          movl %r11d, %r9d
          jmp next
    
     next:
          addq $4, %rdx
          loop iteracion
    
# Aca ya estoy fuera del bucle y tengo
# Suma total en rax, la debo pasar a rsi
# Maximo en r8d, lo debo pasar a rdx
# Minimo en r9d, lo debo pasar a rcx
# Guardar promedio en r8d
      movl %eax, %eax
      movq %rax, %rsi
      xor %edx, %edx
    
      movzbl len(%rip), %ecx
      idivl %ecx
      movl %eax, %r10d # promedio r10

      movl %r8d, %edx # maximo edx
      movl %r10d, %r8d # promedio r8
      movl %r9d, %ecx # minimo ecx
      xorq %rax, %rax
    call printf
    ret
# mensaje: rdi
# suma: rsi
# maximo edx
# minimo rcx
# promedio r8d
# printf((char*)rdi, rsi, rdx, rcx, r8d)

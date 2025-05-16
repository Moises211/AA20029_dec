.data
    dividendo: .long 15      # Dividendo (32 bits)
    divisor:   .long 4       # Divisor (32 bits)
    cociente:  .long 0       # Cociente (32 bits)
    residuo:   .long 0       # Residuo (32 bits)
    formato_division: .asciz "El cociente es: %d, el residuo es: %d\n"
    formato_error:    .asciz "Error: División por cero\n"

.text
    .global main
    .extern printf
    .extern exit

main:
    # Cargar el dividendo en EAX y extenderlo a EDX:EAX
    movl dividendo, %eax
    movl $0, %edx         # Limpiar EDX (parte alta para división sin signo)

    # Cargar el divisor en EBX
    movl divisor, %ebx

    # Comprobar si el divisor es cero
    cmpl $0, %ebx
    je division_por_cero

    # Realizar la división (DIVide unsigned long)
    divl %ebx         # Dividendo en EDX:EAX, divisor en EBX
                      # Cociente en EAX, residuo en EDX

    # Guardar el cociente y el residuo
    movl %eax, cociente
    movl %edx, residuo

    # Preparar la llamada a printf para mostrar el resultado
    pushl residuo
    pushl cociente
    pushl $formato_division
    call printf

    # Limpiar la pila
    addl $12, %esp

    # Salir del programa
    mov $0, %eax       # Código de retorno 0
    ret

division_por_cero:
    # Preparar la llamada a printf para mostrar el error
    pushl $formato_error
    call printf

    # Limpiar la pila
    addl $4, %esp

    # Salir del programa con código de error
    mov $1, %eax       # Código de retorno 1 (error)
    ret
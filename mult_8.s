.data
    num1: .byte 10      # Primer numero: 10 (8 bits)
    num2: .byte 5       # Segundo número: 5  (8 bits)
    resultado: .word 0  # Resultado de la multiplicación (16 bits)
    formato: .asciz "El resultado es: %d\n" # Formato para imprimir entero

.text
    .global main
    .extern printf

main:
    # Cargar los valores de num1 y num2 en registros de 8 bits
    movb num1, %al
    movb num2, %bl

    # Realizar la multiplicación (8 bits * 8 bits = 16 bits en AX)
    mulb %bl         # Multiplica AL por BL. El resultado se almacena en AX (16 bits)

    # Guardar el resultado de 16 bits
    movw %ax, resultado

    # Preparar la llamada a printf (extender el resultado a 32 bits)
    movzwl resultado, %eax  # Mueve la palabra (16 bits) a EAX y rellena con ceros (extensión cero)
    pushl %eax           # Empujar el valor de 32 bits a la pila
    pushl $formato      # Empujar la dirección de la cadena de formato
    call printf

    # Limpiar la pila (8 bytes para dos argumentos de 4 bytes)
    addl $8, %esp

    # Salir del programa
    mov $0, %eax        # Código de retorno 0
    ret
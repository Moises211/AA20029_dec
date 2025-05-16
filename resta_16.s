.data
    num1: .word 15      # Primer numero: 15 (16 bits)
    num2: .word 7       # Segundo numero: 7  (16 bits)
    num3: .word 3       # Tercer numero: 3   (16 bits)
    resultado_16: .word 0  # Resultado de la resta (16 bits)
    resultado_32: .long 0  # Resultado de la resta (32 bits)
    formato: .asciz "El resultado es: %d\n" # Formato para imprimir entero y newline

.text
    .global main
    .extern printf

main:
    # Cargar los valores de num1, num2 y num3 en los registros ax, bx y cx (16 bits)
    movw num1, %ax
    movw num2, %bx
    movw num3, %cx

    # Restar los valores: ax = ax - bx - cx
    subw %bx, %ax
    subw %cx, %ax

    # Guardar el resultado en la variable resultado_16 (16 bits)
    movw %ax, resultado_16

    # **Conversion de 16 bits a 32 bits y guardar en resultado_32:**
    movzwl resultado_16, %eax
    movl %eax, resultado_32

    # Preparar la llamada a printf
    pushl resultado_32  # Empujar el valor de 32 bits desde la variable
    pushl $formato       # Empujar la direccion de la cadena de formato
    call printf

    # Limpiar la pila (8 bytes para dos argumentos de 4 bytes)
    addl $8, %esp

    # Salir del programa
    mov $0, %eax        # Codigo de retorno 0
    ret
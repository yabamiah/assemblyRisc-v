.data
eol:    .asciiz "\n"
str:    .space 255

.text
.globl main

main:
    # Leitura do tamanho da string
    li a7, 5
    ecall
    mv t0, a0   # tamanho da string
    addi t0, t0, 1   # tamanho + 1 para o caractere nulo '\0'

    # Leitura da string
    la a0, str
    mv a1, t0
    li a7, 8
    ecall

    # Chamar a função isPalindrome
    la a0, str
    jal ra, isPalindrome

    # Imprimir o resultado
    mv a0, a0
    li a7, 1
    ecall

    # Pular para o fim do programa
    j end

isPalindrome:
    mv t1, a0   # endereço da string
    mv t2, a1   # tamanho da string

    addi t2, t2, -1   # t2 = tamanho - 1

    li t3, 0    # t3 = índice inicial
    li t4, 0    # t4 = índice final

loop_compare:
    bge t3, t2, equal
    li a0, 0    # Não é um palíndromo
    jr ra

equal:
    lb a4, 0(t1)    # caractere inicial
    lb a5, 0(t2)    # caractere final

    beq a4, a5, continue
    li a0, 0    # Não é um palíndromo
    jr ra

continue:
    addi t3, t3, 1    # incrementa o índice inicial
    addi t4, t4, -1   # decrementa o índice final
    addi t1, t1, 1    # incrementa o endereço inicial
    addi t2, t2, -1    # decrementa o endereço final
    j loop_compare

end:
    # Imprimir nova linha
    la a0, eol
    li a7, 4
    ecall

    # Encerrar o programa
    li a7, 10
    ecall

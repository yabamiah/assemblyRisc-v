.data
eol: .string "\n"
sinal_positivo: .string "+\n"
sinal_negativo: .string "-\n"
output_format: .asciz "%0.7f\n"

.text
.globl main

main:
    # Ler um float
    li a7, 6
    ecall
    fmv.s ft1, fa0
    
    # Imprimir o valor formatado
    la a1, output_format
    li a7, 2
    ecall
    
    # Imprimir nova linha
    la a0, eol
    li a7, 4
    ecall
    
    # Verificar o sinal
    fmv.x.w a0, ft1
    slt t0, a0, x0  # Se a0 < 0, t0 = 1, senão t0 = 0
    
    beqz t0, positivo

negativo:
    la a0, sinal_negativo
    li a7, 4
    ecall
    
    j done
    
positivo:
    la a0, sinal_positivo
    li a7, 4
    ecall
    
done:
    fmv.x.w a0, ft1
    # Chamar a função countBits
    jal ra, countBits

    # Exibir o resultado
    mv a1, a0                  # Mover o valor retornado para a1 para exibição
    li a7, 1                    # Código da chamada do sistema para escrever
    ecall
 
    j exit

# Função countBits
countBits:
    # Salvar o registrador ra
    addi sp, sp, -4
    sw ra, 0(sp)

    # Inicializar variáveis
    li t6, 0                    # Contador de bits

    count_bits_loop:
        seqz t0, a0           # Verificar se a0 é igual a zero
        beqz t0, retorna      # Saltar para o fim se o número for igual a zero

        addi t6, t6, 1          # Incrementar o contador de bits

        srli a0, a0, 1           # Deslocar o número para a direita com preenchimento de zero

        j count_bits_loop

    retorna:
        # Restaurar o registrador ra
        lw ra, 0(sp)
        addi sp, sp, 4

        # Retorna o valor do contador
        mv a0, t6
        ret

exit:
    li a7, 10
    ecall

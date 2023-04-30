.data

eol: .string "\n" # end of line

.text

main:
	li a7, 5 # Tipo um scanf
	ecall

	add t0, a0, zero # Salva o a0 em t0

	li a7, 5 # Tipo um scanf
	ecall

	add t1, a0, t0 # t1 = t0 + a0

	addi a0, t1, 0 # Salva o t1 em a0
	li a7, 1
	ecall

	la a0, eol
	li a7, 4 # Printando o resultado da soma
	ecall

	li a0, 0
	li a7, 10 # Printando o \n
	ecall

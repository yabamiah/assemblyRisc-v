.data
eol: .string "\n"
palindromo: .space 255
pali1: .space 255
pali2: .space 255

.text
main:
	li a7, 5
	ecall
	mv t0, a0 # tamanho do palindromo
	addi t0, t0, 1 # por conta do '\0'

	srli t1, t0, 1 # metade do tamanho do palindromo2
	li t2, 0 # t2 = i

	la a0, palindromo
	mv a1, t0
	li a7, 8
	ecall
	
	la s0, palindromo
	
	la s1, pali1
	la s2, pali2

	# Preenchendo o pali1 e pali2	
loop:
	beq t2, t1, pausa
	
	lb a4, 0(s0)
	
	sb a4, 0(s1)
	
	addi t2, t2, 1
	
	addi s0, s0, 1
	addi s1, s1, 1
	
	b loop
	
pausa:
	addi s0, s0, -1
	
	# Preenchendo o pali2	
loop_pali2:
	beq t2, t0, compare
	
	lb a4, 0(s0)
	
	sb a4, 0(s2)
	
	addi t2, t2, 1
	
	addi s0, s0, -1
	addi s2, s2, 1
	
	b loop_pali2
	
compare:
	la s2, pali1
	la s3, pali2
	
loop_compare:
	lb a4, 0(s2)
	lb a5, 0(s3)

	mv a0, a4
	li a7, 11
	ecall

	mv a0, a5
	li a7, 11
	ecall

	bne a4, a5, not_equal
	beqz a4, equal
	
	addi s2, s2, 1
	addi s3, s3, 1
	
	b loop_compare
	
not_equal:
	li a0, 0
	j done
	
equal:
	li a0, 1

done:
	la a0, eol
	li a7, 4
	ecall

	# Loop para imprimir os caracteres
	la s2, pali1
	la s3, pali2

loop_print:
	lb a4, 0(s2)
	lb a5, 0(s3)

	mv a0, a4
	li a7, 11
	ecall

	mv a0, a5
	li a7, 11
	ecall

	addi s2, s2, 1
	addi s3, s3, 1

	lb a6, 0(s2)
	lb a7, 0(s3)
	
	bne a6, zero, loop_print

	la a0, eol
	li a7, 4
	ecall

	li a0, 0
	li a7, 10
	ecall

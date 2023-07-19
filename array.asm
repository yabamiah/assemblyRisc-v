.data
	array: .word 2, 4, 6, 8, 10
	size: .word 5
	eol: .asciz "\n"
	
.text

main:
	la t0, array
	lw t1, size
	li a0, 0
	
loop:
	beqz t1, exit
	
	lw t3, 0(t0)
	add a0, a0, t3
	
	addi t0, t0, 4
	addi t1, t1, -1
	
	j loop
exit:
	
	li a7, 1
	ecall
	
	la a0, eol
	li a7, 4
	ecall	
	
	li a7, 10
	ecall
.data
msg:
	.string "Ola Mundo\n"

.text

main:
	la a0, msg # la = Load Address, guardando o endereço da string msg
	li a7, 4
	ecall

	li a0, 0
	li a7, 10
	ecall

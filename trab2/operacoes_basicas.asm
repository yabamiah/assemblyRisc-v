.data

add:  .string "ADD: "
sub:  .string "SUB: "
and:  .string "AND: "
or:   .string "OR: "
xor:  .string "XOR: "
mask: .string "MASK: "
sll:  .string "SLL"
srl:  .string "SRL"
par1: .string "("
par2: .string "): "
eol:  .string "\n"

.text

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
    li a7, 5
    ecall
    mv t2, a0
    
operacao1:    
    la a0, add
    li a7, 4
    ecall

    add a0, t0, t1 # Somando
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall
    
operacao2:
    la a0, sub
    li a7, 4
    ecall
    
    sub a0, t0, t1 # Subtraindo
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall

operacao3:
    la a0, and
    li a7, 4
    ecall
    
    and a0, t0, t1
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall

operacao4:
    la a0, or
    li a7, 4
    ecall
    
    or a0, t0, t1
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall
    
operacao5:
    la a0, xor
    li a7, 4
    ecall
    
    xor a0, t0, t1
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall
    
operacao6:
    la a0, mask
    li a7, 4
    ecall
    
    andi a0, t2, 31
    andi t3, t2, 31
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall

operacao7:
    la a0, sll
    li a7, 4
    ecall
    
    la a0, par1
    li a7, 4
    ecall
    
    mv a0, t3
    li a7, 1
    ecall
    
    la a0, par2
    li a7, 4
    ecall
    
    sll a0, t0, t3
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall
    
operacao8:
    la a0, srl
    li a7, 4
    ecall
    
    la a0, par1
    li a7, 4
    ecall
    
    mv a0, t3
    li a7, 1
    ecall
    
    la a0, par2
    li a7, 4
    ecall
    
    srl a0, t1, t3
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall
    
    li a0, 0
    li a7, 10
    ecall

#include <xc.h>
    
.globl Parite
    

    
.text
    
.ent Parite
Parite:
    li t0, 0 #ma somme
    li t1, 1 #mon masque
    li t2, 0 #mon loop condiition
    li t3, 8 #condition de fin pour ma loop
    li t4, 2 #diviseur pour fin
    add t7, a0, zero
Loop:
    beq t2, t3, Check
    and t5, t1, a0
    beq t5, zero, Skip_Add
    addi t0, t0, 1
Skip_Add:
    srl a0, a0, 1
    addi t2, t2, 1
    j Loop
Check:
    div t0, t4
    mfhi t6
    beq t6, 0, Pair
    andi v0, t7, 0xFF
    jr ra
Pair:
    ori v0, t7, 0x100
    jr ra
.end Parite
    
    
#include <xc.h>
    
.globl Parite_Check
    

    
.text
    
.ent Parite_Check
Parite_Check:
    li t0, 0 #ma somme
    li t1, 0 #ma loop
    li t2, 8 #ma sortie de loop
    li t5, 2 #ma sortie
    andi t6, a0, 0x100
    srl t6, t6, 8
Loop_Parite_Check:
    beq t1, t2, Check_Parite
    andi t3, a0, 1
    add t0, t0, t3
    addi t1, t1, 1
    srl a0, a0, 1
    j Loop_Parite_Check
Check_Parite:
    andi t4, t0, 1
    bne t6, t4, No_Error
    li v0, 1
    jr ra
No_Error:
    li v0, 0
    jr ra
.end Parite_Check
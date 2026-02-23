#include <xc.h>
    
.globl Data_Transfert
    

    
.text
    
.ent Data_Transfert 
Data_Transfert:
    add t0, a0, 0
    add t1, a0, 0
    srl t0, t0, 2
    andi t0, t0, 0xFF
    sh   t0, 0(a1)
    sll t1, t1, 6
    andi t1, t1, 0xC0
    sh   t1, 0(a2)
    jr ra
.end Data_Transfert
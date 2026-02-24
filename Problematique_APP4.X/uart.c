#include "uart.h"

void uart4Init(void)
{
    U4BRG = 61;
    U4MODEbits.BRGH = 1;
    U4MODEbits.PDSEL = 0b11;  
    U4MODEbits.STSEL = 1;
    U4STAbits.URXEN = 1;
    U4STAbits.UTXEN = 1;
    U4STAbits.URXISEL = 0;
    IFS2bits.U4RXIF = 0;
    IEC2bits.U4RXIE = 1;
    IPC9bits.U4IP = 7;
    IPC9bits.U4IS = 2;
    U4MODEbits.LPBACK = 0;
    U4MODEbits.ON = 1;
}

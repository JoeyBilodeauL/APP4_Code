#include "timer.h"

volatile uint8_t Timer3Flag = 0;
volatile uint8_t Timer4Flag = 0;
volatile uint16_t TxTestFlag = 0;
volatile uint16_t TxTestRec = 0;

void initializeTimer2(void)
{
    PR2 = 1022;             //Fiche technique tableau 14-1
    TMR2 = 0;               //Fiche technique tableau 14-1
    T2CONbits.TCKPS = 0;    //Manuel de reference page 14-9
    T2CONbits.ON = 1;       //Manuel de reference page 14-9
}

void initializeTimer3(void)
{
    PR3 = 374;              //Fiche technique tableau 14-1
    TMR3 = 0;               //Fiche technique tableau 14-1
    T3CONbits.TCKPS = 0b100;//Manuel de reference page 14-9
    IFS0bits.T3IF = 0;      //Fiche technique tableau 7-1 et 7-2
    IEC0bits.T3IE = 1;      //Fiche technique tableau 7-1 et 7-2
    IPC3bits.T3IP = 5;      //Fiche technique tableau 7-1 et 7-2
    IPC3bits.T3IS = 0;      //Fiche technique tableau 7-1 et 7-2
    T3CONbits.ON = 1;       //Manuel de reference page 14-9
}

void __ISR(_TIMER_3_VECTOR, IPL5AUTO) Timer3ISR(void) 
{  
    Timer3Flag = 1;
    
    IFS0bits.T3IF = 0;     //Fiche technique tableau 7-1 et 7-2
}

int checkTimer(uint16_t reference, uint16_t *compteur)
{
    Timer3Flag = 0;
    
    while(Timer3Flag == 0) {}
    
    (*compteur)++;
    
    if (*compteur == reference)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}



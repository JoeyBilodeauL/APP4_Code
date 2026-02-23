#include "iopins.h"

void initializeBtn(void)
{
    TRISBbits.TRISB1 = 1;   //Manuel de reference page 12-3
    ANSELBbits.ANSB1 = 0;   //Manuel de reference page 12-4
    TRISBbits.TRISB0 = 1;   //Manuel de reference page 12-3
    ANSELBbits.ANSB0 = 0;   //Manuel de reference page 12-4
    TRISFbits.TRISF0 = 1;   //Manuel de reference page 12-3
    TRISBbits.TRISB8 = 1;   //Manuel de reference page 12-3
    ANSELBbits.ANSB8 = 0;   //Manuel de reference page 12-4
    TRISAbits.TRISA15 = 1;  //Manuel de reference page 12-3
    TRISFbits.TRISF3 = 1;
    TRISBbits.TRISB9 = 1;
    ANSELBbits.ANSB9 = 0;
    
}

void initializeLED(void)
{
    TRISA = 0;             //Manuel de reference page 12-3
    LATA = 0;              //Manuel de reference page 12-3
    LATAbits.LATA7 = 1;    //Manuel de reference page 12-3
}

void initializeSpk(void)
{
    TRISBbits.TRISB14 = 0; //Manuel de reference page 12-3
    RPB14R = 0b1100;       //Fiche technique tableau 12-2
}

void initializeMic(void)
{
    TRISBbits.TRISB4 = 1;  //Manuel de reference page 12-3
    ANSELBbits.ANSB4 = 1;  //Manuel de reference page 12-4
}

void initializeTxRx(void)
{
    TRISFbits.TRISF12 = 0;
    TRISFbits.TRISF13 = 1;
    U4RXR = 0x09;
    RPF12R = 0x02;
}

void initBoard(void)
{
    initializeLED();
    initializeBtn();
    initializeSpk();
    initializeMic();
    initializeADC();
    initializeTimer2();
    initializeTimer3();
    initializePWM();
    initializeTxRx();
    uart4Init();
}


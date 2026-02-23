#include "adc.h"

volatile uint8_t AdcFlag = 0;
volatile uint16_t MicValue = 0;

void initializeADC(void)
{
    AD1CON1bits.SSRC = 0b010;  //Manuel de reference page 17-6
    AD1CON1bits.ASAM = 1;      //Manuel de reference page 17-7
    AD1CON1bits.SAMP = 1;      //Manuel de reference page 17-7
    AD1CON3bits.SAMC = 1;      //Manuel de reference page 17-9
    AD1CHSbits.CH0SA = 4;      //Manuel de reference page 17-10
    IFS0bits.AD1IF = 0;        //Fiche technique tableau 7-1 et 7-2
    IEC0bits.AD1IE = 1;        //Fiche technique tableau 7-1 et 7-2
    IPC5bits.AD1IP = 6;        //Fiche technique tableau 7-1 et 7-2
    IPC5bits.AD1IS = 0;        //Fiche technique tableau 7-1 et 7-2
    AD1CON1bits.ON = 1;        //Manuel de reference page 17-6
}

void __ISR(_ADC_VECTOR, IPL6AUTO) ADCISR(void) 
{  
    MicValue = ADC1BUF0;       //Fiche technique tableau 23-1
    IFS0bits.AD1IF = 0;        //Fiche technique tableau 7-1 et 7-2
}
#include "pwm.h"


void initializePWM(void)
{
    OC1RS = 0;                 //Fiche technique tableau 17-1
    OC1CONbits.OCTSEL = 0;     //Manuel de reference page 16-4
    OC1CONbits.OCM = 0b110;    //Manuel de reference page 16-4
    OC1CONbits.ON = 1;         //Manuel de reference page 16-4
}
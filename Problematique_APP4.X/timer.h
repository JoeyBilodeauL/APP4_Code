#ifndef TIMER_H
#define TIMER_H

#include "adc.h"

extern volatile uint8_t Timer3Flag;
extern volatile uint16_t CompteurTxTest;
extern volatile uint16_t CompteurTxRec;

void initializeTimer2(void);
void initializeTimer3(void);
int checkTimer(uint16_t reference, uint16_t *compteur);

#endif
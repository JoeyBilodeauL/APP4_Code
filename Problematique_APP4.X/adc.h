#ifndef ADC_H
#define ADC_H

#include <xc.h>
#include <sys/attribs.h>

extern volatile uint16_t MicValue;

void initializeADC(void);

#endif
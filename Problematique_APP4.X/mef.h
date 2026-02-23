#ifndef MEF_H
#define MEF_H

#include "iopins.h"

#define BUFFER_SIZE 21753

struct Rx
{
    uint16_t compteur;
    uint8_t hasADC;
    uint16_t test;
    uint16_t del;
    uint16_t delFrq;
};

struct Tx
{
    uint16_t compteur;
    uint16_t test;
};

extern volatile uint16_t bufferRx[BUFFER_SIZE];

void setRxStruct(struct Rx *p, uint16_t compteur, uint8_t hasADC, uint16_t test, uint16_t del,
                 uint16_t delFrq);
void setTxStruct(struct Tx *p, uint16_t compteur, uint16_t test);
int executeRx(struct Rx *p, uint16_t *compteur, uint8_t state);
int executeTx(struct Tx *p, uint16_t *compteur, uint8_t state);

#endif
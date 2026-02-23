#ifndef MEF_H
#define MEF_H

#include "iopins.h"

#define BUFFER_SIZE 21753

struct Rx
{
    uint16_t compteur;
};

struct Tx
{
    uint16_t compteur;
};

extern volatile uint16_t bufferRx[BUFFER_SIZE];

void setRxStruct(struct Rx *p, uint16_t compteur);
void setTxStruct(struct Tx *p, uint16_t compteur);
int executeRx(struct Rx *p, uint16_t *compteur, uint8_t state);
int executeTx(struct Tx *p, uint16_t *compteur, uint8_t state);

#endif
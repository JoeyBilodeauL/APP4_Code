#include "mef.h"

#define TRAME_SIZE 40000
#define BUFFER_SIZE 21753
#define SINUS_SIZE 32000

uint16_t Trame[TRAME_SIZE] = {0};
uint16_t SinusTest[10] = {0x1FF, 0x32B, 0x3E4, 0x3E4, 0x32B,
                                        0x1FF, 0x0D2, 0x019, 0x019, 0x0D2,
                                                                        };
volatile uint16_t bufferRx[BUFFER_SIZE] = {0};

extern int Parite_Check(int val);
extern int Parite(int val);
extern void Data_Transfert(uint16_t input, uint16_t *msb, uint16_t *lsb);
uint16_t msb, lsb;
volatile uint16_t isrCompteur;


void setRxStruct(struct Rx *p, uint16_t compteur)
{
    p->compteur = compteur;
}

void setTxStruct(struct Tx *p, uint16_t compteur)
{
    p->compteur = compteur;
}

int executeRx(struct Rx *p, uint16_t *compteur, uint8_t state)
{
    uint8_t endOfCycle = 0;
    
    endOfCycle = checkTimer(p->compteur, compteur);

    if (state == 1)
    {
        LATAbits.LATA0 = 1;
        Trame[*compteur] = MicValue;
    }
    else if (state == 2)
    {
        OC1RS = Trame[*compteur];

        if(*compteur % 800 == 0)
        {
            LATAINV = 2;
        }
    }
    else if (state == 3)
    {
        OC1RS = SinusTest[*compteur % 10];
    }
    else if (state == 4)
    {
        OC1RS = (bufferRx[*compteur % BUFFER_SIZE]) & 0x3FF;
        bufferRx[*compteur % BUFFER_SIZE] = 0;
    }

    Timer3Flag = 0;
    
    if (endOfCycle == 1)
    {
        return 1;
    }
    
    return 0;    
}

int executeTx(struct Tx *p, uint16_t *compteur, uint8_t state)
{
    if (state == 1)
    {
            
        if (PORTBbits.RB9 == 0)
        {
            while (U4STAbits.UTXBF == 1) {}
            U4TXREG = Parite(Trame[*compteur] >> 2) & 0x1FF;
        }
        else
        {
            Data_Transfert(Trame[*compteur], &msb, &lsb);
            while (U4STAbits.UTXBF == 1) {}
            U4TXREG = (Parite(msb) & 0x1FF);
            while (U4STAbits.UTXBF == 1) {}
            U4TXREG = (Parite(lsb) & 0x1FF);
        }
    }
    else if (state == 2)
    {
                
        if(PORTBbits.RB9 == 0)
        {
            while (U4STAbits.UTXBF == 1) {}
            U4TXREG = Parite(SinusTest[*compteur % 10] >> 2) & 0x1FF;
        }
        else
        {
            Data_Transfert(SinusTest[*compteur % 10], &msb, &lsb);
            while (U4STAbits.UTXBF == 1) {}
            U4TXREG = (Parite(msb) & 0x1FF);
            while (U4STAbits.UTXBF == 1) {}
            U4TXREG = (Parite(lsb) & 0x1FF);
        }
    }
    else if (state == 3)
    {
        
        if (PORTBbits.RB9 == 0)
        {
            while (U4STAbits.UTXBF == 1) {}
            U4TXREG = (Parite(MicValue >> 2)) & 0x1FF;
        }
        else
        {
            Data_Transfert(MicValue, &msb, &lsb);
            while (U4STAbits.UTXBF == 1) {}
            U4TXREG = (Parite(msb) & 0x1FF);
            while (U4STAbits.UTXBF == 1) {}
            U4TXREG = (Parite(lsb) & 0x1FF); 
        }
    }
    
    if (state != 0)
    {
        (*compteur)++;
    }
    
    if (*compteur == p->compteur)
    {
        return 1;
    }
    
    return 0;
}
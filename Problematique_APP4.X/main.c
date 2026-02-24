#include <xc.h>
#include <sys/attribs.h>
#include "config.h"
#include "config_bits.h"
#include "uart.h"

enum StateRx
{
    ATTENTE_RX,
    ENREGISTREMENT,
    JOUER,
    TEST,
    RECEIVING
};

enum StateTx
{
    ATTENTE_TX,
    RESTITUTION,
    TEST_TX,
    INTERCOM
};

#define TRAME_SIZE 40000
#define SINUS_SIZE 32000
#define BUFFER_SIZE 21753
volatile uint8_t stateRx = ATTENTE_RX;
uint8_t stateTx = ATTENTE_TX;
uint16_t rxCompteur = 0;
uint16_t rxReceivingCompteur = 0;
extern volatile uint16_t isrCompteur;
uint16_t txCompteur = 0;
uint16_t rxFree = 1;
uint16_t txFree = 1;
static uint16_t waitingLsb = 0;
static uint16_t savedMsb = 0;
extern int Parite_Check(int val);


void main(void)
{
    
    initBoard();
    macro_enable_interrupts();
    
    struct Rx enregistrementData;
    struct Rx jouerData;
    struct Rx testData;
    struct Rx receivingData;
    
    struct Tx restitutionData;
    struct Tx testTxData;
    struct Tx intercomData;
    
    setRxStruct(&enregistrementData, TRAME_SIZE);
    setRxStruct(&jouerData, TRAME_SIZE);
    setRxStruct(&testData, SINUS_SIZE);
    setRxStruct(&receivingData, BUFFER_SIZE);
    
    setTxStruct(&restitutionData, TRAME_SIZE);
    setTxStruct(&testTxData, SINUS_SIZE);
    setTxStruct(&intercomData, BUFFER_SIZE);
    isrCompteur = 0;
    
    LATAbits.LATA7 = 1;
    while(1)
    {    
        if ((PORTBbits.RB8 == 1 && stateRx == ATTENTE_RX) || stateRx == ENREGISTREMENT)
        {
            stateRx = ENREGISTREMENT;
            rxFree = executeRx(&enregistrementData, &rxCompteur, stateRx);
        }
        else if ((PORTBbits.RB0 == 1 && stateRx == ATTENTE_RX) || stateRx == JOUER)
        {
            stateRx = JOUER;
            rxFree = executeRx(&jouerData, &rxCompteur, stateRx);
        }
        else if ((PORTFbits.RF0 == 1 && stateRx == ATTENTE_RX) || stateRx == TEST)
        {
            stateRx = TEST;
            rxFree = executeRx(&testData, &rxCompteur, stateRx);
        }
        else if (stateRx == RECEIVING)
        {
            rxFree = executeRx(&receivingData, &rxReceivingCompteur, stateRx);
                if (isrCompteur == rxReceivingCompteur && isrCompteur > 0)
                {
                    stateRx = ATTENTE_RX;
                }
        }
        else
        {
            stateRx = ATTENTE_RX;
        }
        
        if ((rxFree == 1 || stateRx == ATTENTE_RX) && PORTFbits.RF3 != 1)
        {
            LATACLR = 0x7F;
            stateRx = ATTENTE_RX;
            rxCompteur = 0; 
            isrCompteur = 0;
            rxReceivingCompteur = 0;
        }
        
        if (PORTFbits.RF3 == 1)
        {
            stateTx = INTERCOM;
            txFree = executeTx(&intercomData, &txCompteur, stateTx);
        }
        else
        {
            if ((PORTBbits.RB1 && stateTx == ATTENTE_TX) || stateTx == RESTITUTION)
            {
                stateTx = RESTITUTION;
                txFree = executeTx(&restitutionData, &txCompteur, stateTx);
            }
            else if ((PORTAbits.RA15 && stateTx == ATTENTE_TX) || stateTx == TEST_TX)
            {
                stateTx = TEST_TX;
                txFree = executeTx(&testTxData, &txCompteur, stateTx);
            }

            if (txFree == 1 && PORTFbits.RF3 == 0)
            {
                LATACLR = 0x7F;
                stateTx = ATTENTE_TX;
                txCompteur = 0;
            }
        }
        
        if (stateTx == INTERCOM && PORTFbits.RF3 == 0)
        {
            LATACLR = 0x7F;
            stateRx = ATTENTE_RX;
            stateTx = ATTENTE_TX;
            rxCompteur = 0; 
            isrCompteur = 0;
            rxReceivingCompteur = 0;
            txCompteur = 0;
        }
    }
}

void __ISR(_UART_4_VECTOR, IPL7AUTO) uart4_ISR(void)
{
    stateRx = RECEIVING;
    
    while (U4STAbits.URXDA == 1)
    {
        uint16_t data = U4RXREG & 0x1FF;
        
        if (PORTBbits.RB9 == 0)
        {
            uint16_t idx = isrCompteur % BUFFER_SIZE;
            bufferRx[idx] = data;
            LATAbits.LATA5 = Parite_Check(data);
            bufferRx[idx] &= 0xFF;
            bufferRx[idx] <<= 2;
            isrCompteur++;
            waitingLsb = 0;
        }
        else
        {
            if (waitingLsb == 0)
            {
                savedMsb = data;
                waitingLsb = 1;
            }
            else
            {
                LATAbits.LATA5 = Parite_Check(savedMsb) | Parite_Check(data);
                data &= 0xFF;
                savedMsb &= 0xFF;
                bufferRx[isrCompteur % BUFFER_SIZE] = ((savedMsb<<2) | (data>>6)) & 0x3FF;
                isrCompteur++;
                waitingLsb = 0;
            }
        }
    } 
    
    if (isrCompteur == BUFFER_SIZE-1)
    {
        isrCompteur = 0;
    }
    
    if (rxReceivingCompteur == BUFFER_SIZE-1)
    {
        rxReceivingCompteur = 0;
    }

    IFS2bits.U4RXIF = 0;
}

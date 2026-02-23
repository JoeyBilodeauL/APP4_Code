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
    
    setRxStruct(&enregistrementData, TRAME_SIZE, 1, 0, 1, 0);
    setRxStruct(&jouerData, TRAME_SIZE, 0, 0, 2, 5);
    setRxStruct(&testData, SINUS_SIZE, 0, 1, 0, 0);
    setRxStruct(&receivingData, BUFFER_SIZE, 0, 0, 0, 0);
    
    setTxStruct(&restitutionData, TRAME_SIZE, 0);
    setTxStruct(&testTxData, SINUS_SIZE, 1);
    setTxStruct(&intercomData, 512, 0);
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
            if (rxReceivingCompteur < isrCompteur)
            {
                rxFree = executeRx(&receivingData, &rxReceivingCompteur, stateRx);
            }
            else
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
            txFree = executeTx(&intercomData, &txCompteur, stateTx);
            stateTx = ATTENTE_TX;
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
    }
}

void __ISR(_UART_4_VECTOR, IPL7AUTO) uart4_ISR(void)
{
    stateRx = RECEIVING;
    
    if (PORTBbits.RB9 == 0)
    {
        while(U4STAbits.URXDA == 1)
        {
            bufferRx[isrCompteur % BUFFER_SIZE] = U4RXREG & 0x1FF;
            LATAbits.LATA5 = Parite_Check(bufferRx[isrCompteur % BUFFER_SIZE]);
            bufferRx[isrCompteur % BUFFER_SIZE] = bufferRx[isrCompteur % BUFFER_SIZE] << 2;
            isrCompteur++;
        }
    }
    else
    {
        while (U4STAbits.URXDA == 1)
        {
            uint16_t msb = U4RXREG & 0x1FF;
            
            while (U4STAbits.URXDA == 0) {}
            
            uint16_t lsb = U4RXREG & 0x1FF;
            
            LATAbits.LATA5 = Parite_Check(lsb) | Parite_Check(msb);
            
            bufferRx[isrCompteur % BUFFER_SIZE] = ((msb << 2) | (lsb >> 6)) & 0x3FF;
            isrCompteur++;
        }
    }
    
    if (isrCompteur > 65000 && stateTx == ATTENTE_TX)
    {
        isrCompteur = 0;    
    }

    IFS2bits.U4RXIF = 0;
}

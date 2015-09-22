//******************************************************************************
//   MSP430G2xx3 Demo - USCI_A0, SPI 3-Wire Master Incremented Data
//
//   Description: SPI master talks to SPI slave using 3-wire mode. Incrementing
//   data is sent by the master starting at 0x01. Received data is expected to
//   be same as the previous transmission.  USCI RX ISR is used to handle
//   communication with the CPU, normally in LPM0. If high, P1.0 indicates
//   valid data reception.
//   ACLK = n/a, MCLK = SMCLK = DCO ~1.2MHz, BRCLK = SMCLK/2
//
//   Use with SPI Slave Data Echo code example. If slave is in debug mode, P3.6
//   slave reset signal conflicts with slave's JTAG; to work around, use IAR's
//   "Release JTAG on Go" on slave device.  If breakpoints are set in
//   slave RX ISR, master must stopped also to avoid overrunning slave
//   RXBUF.
//
//                    MSP430G2xx3
//                 -----------------
//             /|\|              XIN|-
//              | |                 |
//              --|RST          XOUT|-
//                |                 |
//                |             P1.2|-> Data Out (UCA0SIMO)
//                |                 |
//          LED <-|P1.0         P1.1|<- Data In (UCA0SOMI)
//                |                 |
//  Slave reset <-|P1.5         P1.4|-> Serial Clock Out (UCA0CLK)
//******************************************************************************
/*
 * ======== Standard MSP430 includes ========
 */
#include <msp430.h>
#include <ti/mcu/msp430/Grace.h>
/*
 * ======== Grace related declaration ========
 */


/*
 *  ======== main ========
 */


unsigned int W_CTRL	=	(0x00 << 15)  /*Write flag*/|
						(0x00 << 12)  /*CTRL Reg Addr*/|
						(0x03 << 10)  /*DTIME*/|
						(0x03 << 8)   /*ISGAIN*/|
						(0x00 << 7)   /*EXSTALL*/|
						(0x02 << 3)   /*MODE*/ |
						(0x00 << 2)   /*RSTEP*/|
						(0x00 << 1)   /*RDIR*/|
						(0x01	  )   /*ENBL*/;

unsigned int W_TORQUE = (0x00 << 15)  /*Write flag*/|
						(0x01 << 12)  /*Torque Reg Addr*/|
						(0x00 << 8)   /*SIMPLTH*/|
						(0x5A	  )   /*TORQUE*/;

unsigned int W_OFF  = 	(0x00 << 15)  /*Write flag*/|
						(0x02 << 12)  /*OFF Reg Addr*/|
						(0x00 << 8)   /*PWM*/|
						(0x30	  )   /*TOFF*/;

unsigned int W_BLANK = 	(0x00 << 15)  /*Write flag*/|
						(0x03 << 12)  /*BLANK Reg Addr*/|
						(0x01 << 8)   /*ABT*/|
						(0x08     )   /*TBLANK*/;

unsigned int W_DECAY =  (0x00 << 15)  /*Write flag*/|
						(0x04 << 12)  /*DECAY Reg Addr*/|
						(0x05 << 8)   /*DECMOD*/|
						(0x10     )   /*TDECAY*/;

unsigned int W_STALL =  (0x00 << 15)  /*Write flag*/|
						(0x05 << 12)  /*STALL Reg Addr*/|
						(0x03 << 10)  /*VDIV*/|
						(0x03 << 8)   /*SDCNT*/|
						(0x40     )   /*SDTHR*/;

unsigned int W_DRIVE =  (0x00 << 15)  /*Write flag*/|
						(0x06 << 12)  /*DRIVE Reg Addr*/|
						(0x00 << 10)  /*IDRIVEP*/|
						(0x00 << 8)   /*IDRIVEN*/|
						(0x01 << 6)   /*TDRIVEP*/|
						(0x01 << 4)   /*TDRIVEN*/ |
						(0x01 << 2)   /*OCPDEG*/|
						(0x01     )   /*OCPTH*/;

unsigned int W_STATUS =	(0x00 << 15)  /*Write flag*/|
						(0x07 << 12)  /*STATUS Reg Addr*/|
						(0x00 << 7)  /*STDLAT*/|
						(0x00 << 6)   /*STD*/|
						(0x00 << 5)   /*UVLO*/|
						(0x00 << 4)   /*BPDF*/ |
						(0x00 << 3)   /*APDF*/|
						(0x00 << 2)   /*BOCP*/|
						(0x00 << 1)   /*AOCP*/ |
						(0x00 	  )   /*OTS*/;

#define nSleep BIT4
#define RESET  BIT5
#define nSTALL BIT6
#define nFAULT BIT7
#define STEP   BIT1
#define DIR    BIT2
void writeDRV8711SPI(unsigned int value);
void WriteAllRegisters();


int main(void)
{
	Grace_init();
	WriteAllRegisters();
	P1OUT |= nSleep;
	while(1)
	{

		__delay_cycles(100000);
		P2OUT |= STEP;
		int i;
		for (i = 0; i < 1000; i++) { __delay_cycles(1000); }
		P2OUT &= ~STEP;
	}

	//__bis_SR_register(LPM0_bits + GIE);       // CPU off, enable interrupts
}

void WriteAllRegisters()
{
	writeDRV8711SPI(W_CTRL);
	writeDRV8711SPI(W_TORQUE);
	writeDRV8711SPI(W_OFF);
	writeDRV8711SPI(W_BLANK);
	writeDRV8711SPI(W_DECAY);
	writeDRV8711SPI(W_STALL);
	writeDRV8711SPI(W_DRIVE);
	writeDRV8711SPI(W_STATUS);
}
void writeDRV8711SPI(unsigned int value)
{
	P2OUT |= BIT3;

	UCB0TXBUF = value >> 8;
	while (UCB0STAT & BUSY);

	UCB0TXBUF = value & 0x00FF;
	while (UCB0STAT & BUSY);

	P2OUT &= ~BIT3;

}

unsigned int readDRV8711SPI(unsigned int address)
{
	unsigned int readData = 0x00;

	P2OUT |= BIT3;

	UCB0TXBUF = 0x80 | (address << 4);
	while (UCB0STAT & BUSY);
	readData |= (UCB0RXBUF << 8);

	UCB0TXBUF = 0x00;
	while (UCB0STAT & BUSY);
	readData |= UCB0RXBUF;

	P2OUT &= ~BIT3;
	return readData;
}

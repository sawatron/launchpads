//******************************************************************************
//  MSP430G2xx3 Demo - Timer_A, PWM TA1, Up/Down Mode, DCO SMCLK
//
//  Description: This program generates one PWM output on P1.2 using
//  Timer_A configured for up/down mode. The value in CCR0, 128, defines the PWM
//  period/2 and the value in CCR1 the PWM duty cycles.
//  A 75% duty cycle is on P1.2.
//  SMCLK = MCLK = TACLK = default DCO
//
//               MSP430G2xx3
//            -----------------
//        /|\|              XIN|-
//         | |                 |
//         --|RST          XOUT|-
//           |                 |
//           |         P1.2/TA1|--> CCR1 - 75% PWM
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
#define SERVO_BIT BIT2
#define SM_clk 1100000
#define servo_freq 50
void init_servo()
{
	int PWM_period = SM_clk /servo_freq;
	P1DIR |= SERVO_BIT; //direction is set
	P1SEL |= SERVO_BIT;// port 1 function is set.
	TA0CCR0 = PWM_period; // pwm period
	TA0CCR1 = 1500; //duty cycle = TA0CCR0/ TA0CCR1
	TA0CCTL1 = CM_0 | CCIS_0 | OUTMOD_7;
}
void init_button()
{
	P1OUT |= BIT3;
	P1REN |=BIT3;
	P1IE |= BIT3; // P1.3 interrupt enabled
	P1IES |= BIT3; // P1.3 Hi/lo edge
	P1IFG &= ~BIT3; // P1.3 IFG cleared
}
void init_LED()
{
	P1DIR |= BIT0; // Set P1.0 to output direction
	P1OUT |= BIT0; // LED1 on
}
void main(void)
{
	WDTCTL = WDTPW | WDTHOLD; // Stop watchdog timer
	init_LED();
	init_button();
	init_servo();
	TA0CTL=TASSEL_2 | ID_0 | MC_1;
	_BIS_SR(LPM0_bits | GIE);
}

// Port 1 interrupt service routine
#pragma vector=PORT1_VECTOR
__interrupt void Port_1(void)
{
	P1IES ^= BIT3;
	if(P1IES & BIT3)P1OUT ^= BIT0, TA0CCR1 = P1OUT & BIT0 ?  1500 : 2400;
	__delay_cycles(40000);
	P1IFG &= ~BIT3;
}

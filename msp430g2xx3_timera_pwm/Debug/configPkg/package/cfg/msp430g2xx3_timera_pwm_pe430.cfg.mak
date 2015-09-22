# invoke SourceDir generated makefile for msp430g2xx3_timera_pwm.pe430
msp430g2xx3_timera_pwm.pe430: .libraries,msp430g2xx3_timera_pwm.pe430
.libraries,msp430g2xx3_timera_pwm.pe430: package/cfg/msp430g2xx3_timera_pwm_pe430.xdl
	$(MAKE) -f C:\Users\IBM_ADMIN\workspace_v6_1\msp430g2xx3_timera_pwm/src/makefile.libs

clean::
	$(MAKE) -f C:\Users\IBM_ADMIN\workspace_v6_1\msp430g2xx3_timera_pwm/src/makefile.libs clean


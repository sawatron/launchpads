## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,e430 linker.cmd package/cfg/msp430g2xx3_timera_pwm_pe430.oe430

# To simplify configuro usage in makefiles:
#     o create a generic linker command file name 
#     o set modification times of compiler.opt* files to be greater than
#       or equal to the generated config header
#
linker.cmd: package/cfg/msp430g2xx3_timera_pwm_pe430.xdl
	$(SED) 's"^\"\(package/cfg/msp430g2xx3_timera_pwm_pe430cfg.cmd\)\"$""\"C:/Users/IBM_ADMIN/workspace_v6_1/msp430g2xx3_timera_pwm/.config/xconfig_msp430g2xx3_timera_pwm/\1\""' package/cfg/msp430g2xx3_timera_pwm_pe430.xdl > $@
	-$(SETDATE) -r:max package/cfg/msp430g2xx3_timera_pwm_pe430.h compiler.opt compiler.opt.defs

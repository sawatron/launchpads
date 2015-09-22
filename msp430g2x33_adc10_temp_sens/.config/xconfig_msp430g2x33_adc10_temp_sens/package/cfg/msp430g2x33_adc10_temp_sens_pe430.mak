#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = ti.targets.msp430.elf.MSP430{1,0,4.4,5
#
ifeq (,$(MK_NOGENDEPS))
-include package/cfg/msp430g2x33_adc10_temp_sens_pe430.oe430.dep
package/cfg/msp430g2x33_adc10_temp_sens_pe430.oe430.dep: ;
endif

package/cfg/msp430g2x33_adc10_temp_sens_pe430.oe430: | .interfaces
package/cfg/msp430g2x33_adc10_temp_sens_pe430.oe430: package/cfg/msp430g2x33_adc10_temp_sens_pe430.c package/cfg/msp430g2x33_adc10_temp_sens_pe430.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) cle430 $< ...
	$(ti.targets.msp430.elf.MSP430.rootDir)/bin/cl430 --abi=eabi -c  --symdebug:dwarf -g --optimize_with_debug -qq -pdsw225  -vmsp -eo.oe430 -ea.se430  --embed_inline_assembly  -Dxdc_cfg__xheader__='"xconfig_msp430g2x33_adc10_temp_sens/package/cfg/msp430g2x33_adc10_temp_sens_pe430.h"'  -Dxdc_target_name__=MSP430 -Dxdc_target_types__=ti/targets/msp430/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_4_5 -O2 -g --optimize_with_debug  $(XDCINCS) -I$(ti.targets.msp430.elf.MSP430.rootDir)/include  -fs=./package/cfg -fr=./package/cfg -fc $<
	$(MKDEP) -a $@.dep -p package/cfg -s oe430 $< -C   --symdebug:dwarf -g --optimize_with_debug -qq -pdsw225  -vmsp -eo.oe430 -ea.se430  --embed_inline_assembly  -Dxdc_cfg__xheader__='"xconfig_msp430g2x33_adc10_temp_sens/package/cfg/msp430g2x33_adc10_temp_sens_pe430.h"'  -Dxdc_target_name__=MSP430 -Dxdc_target_types__=ti/targets/msp430/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_4_5 -O2 -g --optimize_with_debug  $(XDCINCS) -I$(ti.targets.msp430.elf.MSP430.rootDir)/include  -fs=./package/cfg -fr=./package/cfg
	-@$(FIXDEP) $@.dep $@.dep
	
package/cfg/msp430g2x33_adc10_temp_sens_pe430.oe430: export C_DIR=
package/cfg/msp430g2x33_adc10_temp_sens_pe430.oe430: PATH:=$(ti.targets.msp430.elf.MSP430.rootDir)/bin/;$(PATH)
package/cfg/msp430g2x33_adc10_temp_sens_pe430.oe430: Path:=$(ti.targets.msp430.elf.MSP430.rootDir)/bin/;$(PATH)

package/cfg/msp430g2x33_adc10_temp_sens_pe430.se430: | .interfaces
package/cfg/msp430g2x33_adc10_temp_sens_pe430.se430: package/cfg/msp430g2x33_adc10_temp_sens_pe430.c package/cfg/msp430g2x33_adc10_temp_sens_pe430.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) cle430 -n $< ...
	$(ti.targets.msp430.elf.MSP430.rootDir)/bin/cl430 --abi=eabi -c -n -s --symdebug:none --symdebug:dwarf -g --optimize_with_debug -qq -pdsw225  -vmsp -eo.oe430 -ea.se430   -Dxdc_cfg__xheader__='"xconfig_msp430g2x33_adc10_temp_sens/package/cfg/msp430g2x33_adc10_temp_sens_pe430.h"'  -Dxdc_target_name__=MSP430 -Dxdc_target_types__=ti/targets/msp430/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_4_5 -O2 -g --optimize_with_debug  $(XDCINCS) -I$(ti.targets.msp430.elf.MSP430.rootDir)/include  -fs=./package/cfg -fr=./package/cfg -fc $<
	$(MKDEP) -a $@.dep -p package/cfg -s oe430 $< -C  -n -s --symdebug:none --symdebug:dwarf -g --optimize_with_debug -qq -pdsw225  -vmsp -eo.oe430 -ea.se430   -Dxdc_cfg__xheader__='"xconfig_msp430g2x33_adc10_temp_sens/package/cfg/msp430g2x33_adc10_temp_sens_pe430.h"'  -Dxdc_target_name__=MSP430 -Dxdc_target_types__=ti/targets/msp430/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_4_5 -O2 -g --optimize_with_debug  $(XDCINCS) -I$(ti.targets.msp430.elf.MSP430.rootDir)/include  -fs=./package/cfg -fr=./package/cfg
	-@$(FIXDEP) $@.dep $@.dep
	
package/cfg/msp430g2x33_adc10_temp_sens_pe430.se430: export C_DIR=
package/cfg/msp430g2x33_adc10_temp_sens_pe430.se430: PATH:=$(ti.targets.msp430.elf.MSP430.rootDir)/bin/;$(PATH)
package/cfg/msp430g2x33_adc10_temp_sens_pe430.se430: Path:=$(ti.targets.msp430.elf.MSP430.rootDir)/bin/;$(PATH)

clean,e430 ::
	-$(RM) package/cfg/msp430g2x33_adc10_temp_sens_pe430.oe430
	-$(RM) package/cfg/msp430g2x33_adc10_temp_sens_pe430.se430

msp430g2x33_adc10_temp_sens.pe430: package/cfg/msp430g2x33_adc10_temp_sens_pe430.oe430 package/cfg/msp430g2x33_adc10_temp_sens_pe430.mak

clean::
	-$(RM) package/cfg/msp430g2x33_adc10_temp_sens_pe430.mak

# optional compiler flags
CCOPTS ?= --symdebug:dwarf -g --optimize_with_debug -qq -pdsw225 

# required C preprocessor flags
#    compiler   headers: "C:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.5/include"
#    device     headers: "C:/ti/ccsv6/ccs_base/msp430/include"
#    Grace      headers: "C:/ti/grace_3_10_00_82/packages"
CPPFLAGS = -D__MSP430G2553__ -I "C:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.5/include" -I "C:/ti/grace_3_10_00_82/packages"  -I "C:/ti/ccsv6/ccs_base/msp430/include" 

# the compiler and archiver commands
CC = "C:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.5/bin/cl430" --abi=eabi -c --obj_directory=objs/  -vmsp
AR = "C:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.5/bin/ar430" rq
RM = cmd.exe /q /c del /f
MKDIR = mkdir

# create object sub-directory, if necessary
ifeq (,$(wildcard objs/))
    $(shell $(MKDIR) objs\)
endif

all: grace.lib

# always add power advice options to the Grace generated files 
objs/Grace_init.obj objs/CSL_init.obj objs/GPIO_init.obj objs/BCSplus_init.obj objs/USCI_B0_init.obj objs/InterruptVectors_init.obj objs/System_init.obj objs/Timer0_A3_init.obj objs/WDTplus_init.obj: CCOPTS := $(CCOPTS) --advice:power=all

# supress power advice for driverlib by default; the user can override this by setting project options
:  CCOPTS := --advice:power_severity=suppress $(CCOPTS)

# pattern rule to compile .c source to an object file
objs/%.obj: %.c makefile
	@echo cle430 $< ...
	$(CC) $(CCOPTS) $(CPPFLAGS) "$<"

# rule to combine all objects into the grace.lib library
grace.lib: objs/Grace_init.obj objs/CSL_init.obj objs/GPIO_init.obj objs/BCSplus_init.obj objs/USCI_B0_init.obj objs/InterruptVectors_init.obj objs/System_init.obj objs/Timer0_A3_init.obj objs/WDTplus_init.obj
	@ echo are430 $@ $< ...
	$(AR) $@ $^

# clean removes all generated files
clean:
	-$(RM) grace.lib
	-$(RM) "objs\"*.obj


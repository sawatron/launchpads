#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/ti/grace_3_10_00_82/packages;C:/ti/msp430/MSPWare_2_30_00_49/driverlib/packages;C:/ti/msp430/MSPWare_2_30_00_49/driverlib;C:/ti/ccsv6/ccs_base;C:/Users/IBM_ADMIN/workspace_v6_1/msp430g2x33_adc10_temp_sens/.config
override XDCROOT = C:/ti/xdctools_3_31_01_33_core
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/ti/grace_3_10_00_82/packages;C:/ti/msp430/MSPWare_2_30_00_49/driverlib/packages;C:/ti/msp430/MSPWare_2_30_00_49/driverlib;C:/ti/ccsv6/ccs_base;C:/Users/IBM_ADMIN/workspace_v6_1/msp430g2x33_adc10_temp_sens/.config;C:/ti/xdctools_3_31_01_33_core/packages;..
HOSTOS = Windows
endif

# ==============================================================================
# Generated by qmake (2.01a) (Qt 4.7.0) on: sab 6. nov 01:27:45 2010
# This file is generated by qmake and should not be modified by the
# user.
#  Name        : Makefile_0xE8927856.mk
#  Part of     : i8910tuning
#  Description : This file is used to call necessary targets on wrapper makefile
#                during normal Symbian build process.
#  Version     : 
#
# ==============================================================================



MAKE = make

VISUAL_CFG = RELEASE
ifeq "$(CFG)" "UDEB"
VISUAL_CFG = DEBUG
endif

do_nothing :
	@rem do_nothing

MAKMAKE: create_temps pre_targetdeps store_build

LIB: create_temps pre_targetdeps store_build

BLD: create_temps pre_targetdeps store_build

ifeq "$(PLATFORM)" "WINSCW"
CLEAN: extension_clean winscw_deployment_clean deployment_clean
else
CLEAN: extension_clean deployment_clean
endif

CLEANLIB: do_nothing

RESOURCE: do_nothing

FREEZE: do_nothing

SAVESPACE: do_nothing

RELEASABLES: do_nothing

ifeq "$(PLATFORM)" "WINSCW"
FINAL: finalize winscw_deployment deployment
else
FINAL: finalize deployment
endif

pre_targetdeps : c:\Symbian\Carbide\workspace\i8910tuning\Makefile
	-$(MAKE) -f "c:\Symbian\Carbide\workspace\i8910tuning\Makefile" pre_targetdeps QT_SIS_TARGET=$(VISUAL_CFG)-$(PLATFORM)

create_temps : c:\Symbian\Carbide\workspace\i8910tuning\Makefile
	-$(MAKE) -f "c:\Symbian\Carbide\workspace\i8910tuning\Makefile" create_temps QT_SIS_TARGET=$(VISUAL_CFG)-$(PLATFORM)

extension_clean : c:\Symbian\Carbide\workspace\i8910tuning\Makefile
	-$(MAKE) -f "c:\Symbian\Carbide\workspace\i8910tuning\Makefile" extension_clean QT_SIS_TARGET=$(VISUAL_CFG)-$(PLATFORM)

finalize : c:\Symbian\Carbide\workspace\i8910tuning\Makefile
	-$(MAKE) -f "c:\Symbian\Carbide\workspace\i8910tuning\Makefile" finalize QT_SIS_TARGET=$(VISUAL_CFG)-$(PLATFORM)

winscw_deployment_clean : c:\Symbian\Carbide\workspace\i8910tuning\Makefile
	-$(MAKE) -f "c:\Symbian\Carbide\workspace\i8910tuning\Makefile" winscw_deployment_clean QT_SIS_TARGET=$(VISUAL_CFG)-$(PLATFORM)

winscw_deployment : c:\Symbian\Carbide\workspace\i8910tuning\Makefile
	-$(MAKE) -f "c:\Symbian\Carbide\workspace\i8910tuning\Makefile" winscw_deployment QT_SIS_TARGET=$(VISUAL_CFG)-$(PLATFORM)

deployment_clean : c:\Symbian\Carbide\workspace\i8910tuning\Makefile
	-$(MAKE) -f "c:\Symbian\Carbide\workspace\i8910tuning\Makefile" deployment_clean QT_SIS_TARGET=$(VISUAL_CFG)-$(PLATFORM)

deployment : c:\Symbian\Carbide\workspace\i8910tuning\Makefile
	-$(MAKE) -f "c:\Symbian\Carbide\workspace\i8910tuning\Makefile" deployment QT_SIS_TARGET=$(VISUAL_CFG)-$(PLATFORM)

store_build : c:\Symbian\Carbide\workspace\i8910tuning\Makefile
	-$(MAKE) -f "c:\Symbian\Carbide\workspace\i8910tuning\Makefile" store_build QT_SIS_TARGET=$(VISUAL_CFG)-$(PLATFORM)



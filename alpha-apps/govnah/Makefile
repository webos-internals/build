NAME     = govnah
TITLE    = Govnah
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 1.2.6
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Govnah
ICON	 = http://www.webos-internals.org/images/5/59/Icon_WebOSInternals_Govnah.png
DESCRIPTION = Govnah is an application for controlling your CPU performance characteristics.  It also displays and graphs the true internal CPU temperature, load averages and memory usage.
CHANGELOG = \
1.2.6: Added support for the Veer A-4 Skyhawk kernel.<br>\
1.2.5: Added support for the Pre 3 UberKernel and Warthog kernel.<br>\
1.2.4: Added support for the Pre 3 A-1 Skyraider kernel.<br>\
1.2.3: Added support for TouchPad webOS 3.0.4 Warthog kernel.<br>\
1.2.2: Added support for TouchPad webOS 3.0.4 F15C and F4 kernels.<br>\
1.2.1: Added support for TouchPad webOS 3.0.4 kernel defaults.<br>\
1.2.0: Added support for the new TouchPad governors.<br>\
1.1.1: Added Veer 1.2GHz support.<br>\
1.1.0: Added recognition of the F4 kernel.<br>\
1.0.9: Added support for Veer.<br>\
1.0.8: Added support for System Voltage frequencies on the Pre/Pre+.<br>\
1.0.7: Added support for UberKernel on the Pre 3.<br>\
1.0.6: Update for Pre3.<br>\
1.0.5: Reinstated screenstate3 1100 profile for UberKernel/Pre2.<br>\
1.0.3: Removed the unused screenstate3 150/1100 profile.<br>\
1.0.2: Fixed TouchPad exhibition mode graph width.<br>\
1.0.1: Improved the sampling rate quantisation.<br>\
1.0.0: Full support for all released webOS devices.<br>\
0.9.9: Added back button to graph scene for TouchPad.<br>\
0.9.8: Robustified the dual core handling on reset.<br>\
0.9.7: Fixed back button in preferences scene.<br>\
0.9.6: Added dual core support. Removed unimplemented dashboard preference. Removed manual settings preference.<br>\
0.9.5: Added profile support for IO schedulers.<br>\
0.9.4: Added support for TouchPad overclocking.<br>\
0.9.3: Added the missing device stylesheet.<br>\
0.9.2: Added back buttons for devices without a gesture area.<br>\
0.9.1: Added the Palm Default profile for the TouchPad.<br>\
0.9.0: Added support for the TouchPad, using the full screen area. Added CPU high temperature scaleback speed support.<br>\
0.8.12: Add battery temperature support for Veer and TouchPad<br>\
0.8.8: Added battery current support for the TouchPad.<br>\
0.8.6: Added battery current support for the Veer.<br>\
0.8.5: Added more detail in the help for various settings.<br>\
0.8.3: Small fix in profile for the Pre AV8B experimental kernel and the Pre F102A stable kernel.<br>\
0.8.2: Small fix in profile for the Pre 2 SR71 experimental kernel.<br>\
0.8.1: Only set new voltages if the user actually changes them.<br>\
0.8.0: On settings save, only set those parameters that have been modified by the user.<br>\
0.7.30: Updated the units for charger and vdemand polling rates.<br>\
0.7.29: Small fix in profile for the Pre 2 F104A experimental kernel.<br>\
0.7.28: Updated profiles for the Pre 2 F104A experimental kernel.<br>\
0.7.27: Display raw value as well as actual voltage for cpu and system.<br>\
0.7.26: Updated default profile for the F104A experimental kernel.<br>\
0.7.25: Added support for 10MB, 12MB and 14MB compcache limits.<br>\
0.7.24: Added support for 8MB compcache lower limit.<br>\
0.7.23: Added support for Pre 2 screenstate in SR71.<br>\
0.7.22: Added support for the 1.2GHz Pre 2 SR71 experimental kernel.<br>\
0.7.21: Added support for the F102B experimental kernel.<br>\
0.7.20: Selects correct default profiles when switching kernels.<br>\
0.7.19: Added support for the F14 Tomcat experimental kernel.<br>\
0.7.18: Added default profiles for experimental kernels.<br>\
0.7.17: Now supports display of experimental kernel versions.<br>\
0.7.16: Added the active kernel version to the main scene.<br>\
0.7.15: Gracefully handle governors that do not have governor-specific parameters.<br>\
0.7.14: More aggressive error reporting.<br>\
0.7.13: Display active kernel on the main scene.<br>\
0.7.12: Added support for screenstate-v2 governor.<br>\
0.7.11: Fixed Profile bug.<br>\
0.7.10: Added support for UberKernel System Voltage control.<br>\
0.7.9: Added voltage selector scene for CPU Voltage and System Voltage vdemand governor settings.<br>\
0.7.8: Added support for the vdemand governor.<br>\
0.7.7: Added default profiles for the Pre 2. Updated german translations, courtesy of Markus Leutwyler (swisstomcat) and Frank Adler (Ice8lue).<br>\
0.7.6: Updated the UberKernel Default profile.<br>\
0.7.5: Added a Changelog button to the Help scene.<br>\
0.7.4: Added Generate Support Email option to help scene. Added Disable Profile option to app-menu of profile list. Improved the help text.<br>\
0.7.3: Improved the help text.<br>\
0.7.2: Improved profile exact matching. Initial help mode implementation.<br>\
0.7.1: Reversed the order of the voltage popup, and fixed the profile saving.<br>\
0.7.0: Added voltage selection screen, and improved compcache settings handling.<br>\
0.6.9: Added more support for the latest cpufreq override module features.<br>\
0.6.8: Localization support and added French translations (courtesy of Yannick LE NY).<br>\
0.6.7: Added Screenstate 500/1000 default profile for Uber1G.<br>\
0.6.6: Added profile support for the voltage selection parameters.<br>\
0.6.4: Added profile support for the cpufreq override module.<br>\
0.6.3: Initial support for the cpufreq override module.<br>\
0.6.1: Rolled up all the 0.5.x alpha releases into a new public release. Major new features include current monitoring, and a revamped Advanced Settings screen now located in the Profiles area.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/ba/Govnah_ss1.png\",\
\"http://www.webos-internals.org/images/f/fb/Govnah_ss2.png\",\
\"http://www.webos-internals.org/images/4/44/Govnah_ss3.png\"\
]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/govnah.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src/bin build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} \
	  clobber ${NAME} \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build

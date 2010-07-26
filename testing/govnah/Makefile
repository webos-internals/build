NAME     = govnah
TITLE    = Govnah
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.6.1
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Govnah
ICON	 = http://www.webos-internals.org/images/5/59/Icon_WebOSInternals_Govnah.png
DESCRIPTION = Govnah is an application for controlling your CPU performance characteristics.  It also displays and graphs the true internal CPU temperature, load averages and memory usage.
CHANGELOG = \
0.6.1: Rolled up all the 0.5.x alpha releases into a new public release. Major new features include current monitoring, and a revamped Advanced Settings screen now located in the Profiles area.<br>\
0.5.9: Renamed the battery current display and inverted the polarity again. Disabled the compcache settings scene if compcache is not available.<br>\
0.5.8: Fixed memory leak, suspected of causing the eventual hang bug.<br>\
0.5.7: Revamped current draw display, including inverting the polarity. Added io schedulers and tcp congestion control (no profile support yet).<br>\
0.5.6: Improved current graphing on main screen.<br>\
0.5.5: First pass at adding current monitoring support.<br>\
0.5.0: Rolled up all the 0.4.x alpha releases into a new public release. Major new features include Pixi support, memory reporting and Compcache configuration.<br>\
0.4.17: Added Compcache configuration to saved profiles.<br>\
0.4.16: Fixed the obscure bug in applying a profile (new min greater than current max, new max less than current min).<br>\
0.4.15: Added the UberKernel Default profile.<br>\
0.4.14: Fixed the duplicate profiles bug.<br>\
0.4.13: Set the Palm Default profile back to 600MHz max.<br>\
0.4.12: Added getProfiles and setProfile methods to the service.<br>\
0.4.11: Updates settings screen after settings are applied. Fixed serious bug in compcache enable handling. Fixed some obscure error cases (new min greater than current max, new max less than current min).<br>\
0.4.10: Updates main screen values whenever the card is activated. New visually segmented advanced settings screen.<br>\
0.4.9: Fixed the profile save bug, please recreate any custom profiles. Added support in the service for sticky compcache settings.<br>\
0.4.8: Robustified parameter display and profile handling.<br>\
0.4.7: Added Pixi temperature and available frequency support. Created default and fixed speed 600 profiles for Pixi.<br>\
0.4.6: Now detects whether configurable compcache support is available.<br>\
0.4.5: Added error reporting for compcache configuration.<br>\
0.4.4: Report correct compcache memlimit.<br>\
0.4.3: Added memory usage and compcache control.<br>\
0.4.2: Fixed the unknown profile problem.<br>\
0.4.1: Added the startup splash screen and some initial default profiles.<br>\
0.4.0: Select a profile to have it automatically reapplied on each clean reboot.<br>\
0.3.1: Launch parameter support, and ignore_nice_load always shows true on profile screen bug fix<br>\
0.3.0: Profile support<br>\
0.2.5: Now only stores the latest 5 minutes of temperature data in memory<br>\
0.2.4: Graphing updates<br>\
0.2.3: Initial full-screen graphs<br>\
0.2.2: Major graphing overhaul<br>\
0.1.4: Fixed governor-specific controls, and added loadavg to the service<br>\
0.1.3: Initial version that is able to make changes<br>\
0.1.2: Update current governor on activate<br>\
0.1.1: Display of current governor and frequency<br>\
0.1.0: Fleshed out all the service methods<br>\
0.0.7: Better graphing<br>\
0.0.6: Added periodic updating when the app is open<br>\
0.0.5: First Public Release
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
include ../../support/head.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built build/i686.built
	touch $@

include ../../support/cross-compile.mk

build/%.built: build/.unpacked
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

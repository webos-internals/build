NAME     = govnah
TITLE    = Govnah
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.7.4
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Govnah
ICON	 = http://www.webos-internals.org/images/5/59/Icon_WebOSInternals_Govnah.png
DESCRIPTION = Govnah is an application for controlling your CPU performance characteristics.  It also displays and graphs the true internal CPU temperature, load averages and memory usage.
CHANGELOG = \
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

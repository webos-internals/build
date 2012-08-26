NAME     = lumberjack
TITLE    = Lumberjack
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.5.0
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Lumberjack
ICON	 = http://www.webos-internals.org/images/3/38/Icon_WebOSInternals_Lumberjack.png
DESCRIPTION = Lumberjack watches your logs.
CHANGELOG = \
0.5.0: Scene Timing and Email Log.<br>\
0.4.5: BetterListSelector and More Options in the AppMenu.<br>\
0.4.4: Added swipe-delete to the Retrieve Log scene.<br>\
0.4.3: Fixed webOS version check funkyness. Added ability to swipe-delete lines from the Follow Log scene just for Lisa, but everyone else can use it too.<br>\
0.4.2: Updates to work with webOS2.0 and the Pre2.<br>\
0.4.1: Better Resource Monitor Graphs. Clear log file options.<br>\
0.4.0: Added Resource Monitor. Added font size preference. Added a Changelog button to the Help scene.<br>\
0.3.1: Exclude logging messages from dbus capture.<br>\
0.3.0: Added DBus Capture for debugging services. Type-to-Search in get-log scene. More log level preferences.<br>\
0.2.0: Searching and Timestamps.<br>\
0.1.1: Cleaned up thread implementation in service.<br>\
0.1.0: Initial release.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/5/5d/Lumberjack_ss1.png\",\
\"http://www.webos-internals.org/images/6/65/Lumberjack_ss2.png\",\
\"http://www.webos-internals.org/images/4/44/Lumberjack_ss3.png\",\
\"http://www.webos-internals.org/images/9/96/Lumberjack_ss4.png\",\
\"http://www.webos-internals.org/images/5/57/Lumberjack_ss5.png\",\
\"http://www.webos-internals.org/images/8/86/Lumberjack_ss6.png\",\
\"http://www.webos-internals.org/images/f/f6/Lumberjack_ss7.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://github.com/webos-internals/lumberjack.git

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
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
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

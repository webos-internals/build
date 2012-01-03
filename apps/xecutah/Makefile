NAME     = xecutah
TITLE    = Xecutah
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.9.3
DEPENDS  = org.webosinternals.xserver, org.webosinternals.xterm
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Xecutah
ICON	 = http://www.webos-internals.org/images/a/a5/X.png
DESCRIPTION = Xecutah allows you to start an X Window System server in a webOS card, and run other X applications on that server.<br>\
Due to webOS security constraints, such applications cannot run directly.<br>\
The XServer requires webOS 3.0.2 or later for correct operation on the TouchPad.
CHANGELOG = \
0.9.3: Added support for starting multiple applications in separate cards. An XServer is now started automatically for each application instance.<br>\
0.9.0: First public feed release.<br>\
0.8.5: Added documentation of Ctrl and Esc on the TouchPad keyboard and Ctrl on phones.<br>\
0.8.4: Added support for running a Debian session (if installed).<br>\
0.8.3: Keyboard size and XTerm colours are now controlled using the Tweaks app.<br>\
0.8.2: Hold down the keyboard button (bottom right), choose XS and the keyboard will fit in the screen and not cover up the input area.<br>\
0.8.1: Removed the 3.0.2 warning text, and the request acknowledged button.<br>\
0.8.0: Added support for running a Ubuntu session (if installed).<br>\
0.7.2: New upstart-based execution architecture to support legacy webOS versions.<br>\
0.6.7: Made the Developer Beta firmware requirement even more explicit.<br>\
0.6.6: First testing release.
SCREENSHOTS = [\
 ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://github.com/webos-internals/xecutah.git

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
	( cd build/src/c-service ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/c-service/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
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

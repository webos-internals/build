NAME     = modeswitcher
MAINTAINER = Janne Julkunen <janne.julkunen@e-lnx.org>
TITLE    = Mode Switcher
APP_ID   = org.webosinternals.${NAME}
SRV_ID   = org.webosinternals.${NAME}.srv
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 2.4.6
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2935803&posted=1#post2919102
ICON     = http://www.webos-internals.org/images/7/73/Icon_Mode-Switcher.png
DESCRIPTION = Mode Switcher.
MINWEBOSVERSION = 2.0.0
MAXWEBOSVERSION = 2.9.9
CHANGELOG = \
2.5.0: Fixed modes exporting on Pre3 and small fix for wireless trigger.<br>\
2.4.6: Triggers should now work better and be much more reliable than before.<br>\
2.4.2: Fixed typo and wallpaper config for Pre3, re-config wallpapers!<br>\
2.4.1: Fixed wireless trigger and added fix for the UI on Pre3.<br>\
2.4.0: Fixed a small problem that caused fetching of settings fail on Pre3.<br>\
2.3.9: Fixed a normal modes changing bug when triggered at the same time.<br>\
2.3.8: Fixed a bug that made settings fetching fail on Veer.<br>\
2.3.7: Fixed a bug that caused an error in certain situation.<br>\
2.3.6: Fixed calendar event trigger and few other bugs, see wiki for details.<br>\
2.3.5: New bluetooth trigger implementation, should now work much better.<br>\
2.3.4: Public release of 2.3.x with few bug fixes, see wiki for details.<br>\
2.3.3: Fixed bug in applying settings and fine tuned bluetooth trigger.<br>\
2.3.2: Fixed couple bugs regarding the service, see wiki for details.<br>\
2.3.1: Fixed the security unsecure settings not taking effect.<br>\
2.3.0: Many changes and additions to the core functionality, see wiki for details.<br>\
2.2.5: Fixed email and messaging settings not working bug.<br>\
2.2.4: Fixed two bugs related to mode actions, see wiki for details.<br>\
2.2.3: Fixed bug that caused initial configuration to fail on new installs.<br>\
2.2.2: Fixed few bugs introduced in 2.2.0 release, see wiki for details.<br>\
2.2.1: Fixed extensions name collision bug.<br>\
2.2.0: New extensions and features, see wiki for details.<br>\
2.1.3: Couple small bug fixes, see wiki for details.<br>\
2.1.2: Bug fixes for the application side, see wiki for details.<br>\
2.1.1: Removed buggy and unneeded options from mode trigger.<br>\
2.1.0: First public release of Mode Switcher 2.x, see wiki for more information.<br>\
2.0.9: Small UI change and removed the unneeded trigger blocking setting.<br>\
2.0.8: Cleanups for the app and few functional changes, see wiki for details.<br>\
2.0.7: Fixed modifier modes getting closed when closing mode bug.<br>\
2.0.6: Couple small bug fixes, see wiki for details.<br>\
2.0.5: Several bug fixes and few logic fixes, see wiki for details.<br>\
2.0.4: Small bug fixes, see wiki for details.<br>\
2.0.3: Small bug fix for bluetooth trigger and added new help system.<br>\
2.0.2: Bug fix release, fixed service not starting bug.<br>\
2.0.1: Bug fix release, see wiki for details.<br>\
2.0.0: Initial release.
SCREENSHOTS = []
LICENSE  = BSD Open Source License
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS = RestartDevice

SRC_GIT = git://git.webos-internals.org/applications/modeswitcher.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk 
#ipkgs/${APP_ID}_${VERSION}_i686.ipk
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
	( cd build/src/c-service ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} \
	  clobber impersonate \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/services/${SRV_ID}
	cp -r build/src/node-service/* build/$*/usr/palm/services/${SRV_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/node-service
	rm -rf build/$*/usr/palm/applications/${APP_ID}/c-service
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/cfg
	cp build/src/c-service/*.json build/$*/usr/palm/applications/${APP_ID}/cfg/
	cp build/src/c-service/*.service build/$*/usr/palm/applications/${APP_ID}/cfg/
	cp build/src/node-service/*.json build/$*/usr/palm/applications/${APP_ID}/cfg/
	cp build/src/node-service/*.service build/$*/usr/palm/applications/${APP_ID}/cfg/
	install -m 755 build/src/c-service/impersonate build/$*/usr/palm/applications/${APP_ID}/bin/
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	cp -r build/src/package/* build/$*/usr/palm/packages/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/package
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

.PHONY: clobber
clobber::
	rm -rf build

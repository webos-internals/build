NAME     = modeswitcher
MAINTAINER = Janne Julkunen <janne.julkunen@e-lnx.org>
TITLE    = Mode Switcher
APP_ID   = org.webosinternals.${NAME}
SRV_ID   = org.webosinternals.${NAME}.srv
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 2.0.0
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2935803&posted=1#post2919102
ICON     = http://www.webos-internals.org/images/7/73/Icon_Mode-Switcher.png
DESCRIPTION = Mode Switcher.
CHANGELOG = 2.0.0: Initial release.
SCREENSHOTS = []
LICENSE  = BSD Open Source License
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS = RestartLuna

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

NAME     = pulsecontrol
MAINTAINER = Janne Julkunen <janne.julkunen@e-lnx.org>
TITLE    = PulseAudio Settings
APP_ID   = org.webosinternals.${NAME}
SRV_ID   = org.webosinternals.${NAME}.srv
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.5.0
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://forums.precentral.net/webos-internals/301721-pulseaudio-settings.html
ICON     = http://www.webos-internals.org/images/b/b4/PulseAudioSettings.png
DESCRIPTION = PulseAudio Settings.
MINWEBOSVERSION = 3.0.2
MAXWEBOSVERSION = 3.0.2
CHANGELOG = \
0.5.0: Added support for USB audio for TouchPads with custom kernels.<br>\
0.4.0: Updated to work with the latest required pulseaudio patch.<br>\
0.3.0: Made the app work in Pre3 and polished the user interface.<br>\
0.2.0: Enabled wireless connection monitoring.<br>\
0.1.0: Initial release.
SCREENSHOTS = []
LICENSE  = BSD Open Source License
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS = RestartDevice

DEPENDS = org.webosinternals.patches.system-enable-pulseaudio-control

SRC_GIT = git://git.webos-internals.org/applications/pulsecontrol.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk 
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
#	( cd build/src/c-binary ; \
#	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} \
#	  clobber papctl \
#	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/enyo-app/* build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/services/${SRV_ID}
	cp -r build/src/node-service/* build/$*/usr/palm/services/${SRV_ID}/
	mkdir -p build/$*/usr/palm/services/${SRV_ID}/bin
	install -m 755 build/src/c-binary/papctl build/$*/usr/palm/services/${SRV_ID}/bin/
	install -m 755 build/src/c-binary/papctl.sh build/$*/usr/palm/services/${SRV_ID}/bin/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/node-service
	rm -rf build/$*/usr/palm/applications/${APP_ID}/c-service
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

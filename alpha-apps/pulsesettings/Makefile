NAME     = pulseaudio-settings
MAINTAINER = Janne Julkunen <janne.julkunen@e-lnx.org>
TITLE    = PulseAudio Settings
APP_ID   = org.webosinternals.${NAME}
SRV_ID   = org.webosinternals.${NAME}.srv
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.8.0
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://forums.precentral.net/webos-internals/301721-pulseaudio-settings.html
ICON     = http://www.webos-internals.org/images/b/b4/PulseAudioSettings.png
DESCRIPTION = PulseAudio settings application enables configuration of PulseAudio.
MINWEBOSVERSION = 2.2.0
MAXWEBOSVERSION = 3.0.5
CHANGELOG = \
0.8.0: Updated dependency information due to the packaging change.<br>\
0.6.0: Fixed metadata so that package shows for Pre3 and TouchPad.<br>\
0.5.0: Added support for USB audio for TouchPads with custom kernels.<br>\
0.4.0: Updated to work with the latest required pulseaudio patch.<br>\
0.3.0: Made the app work in Pre3 and polished the user interface.<br>\
0.2.0: Enabled wireless connection monitoring.<br>\
0.1.0: Initial release.
SCREENSHOTS = []
LICENSE  = BSD Open Source License

DEPENDS = org.webosinternals.pulseaudio-modules

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

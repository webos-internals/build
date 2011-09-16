NAME     = pulseaudiorestarter
TITLE	 = PulseAudio Restarter
APP_ID   = com.foxtailsoftware.${NAME}
BLDFLAGS = -p
VERSION  = 1.0.0
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:PulseAudioRestarter
ICON	 = http://www.webos-internals.org/images/9/9e/Icon_PulseAudioRestarter.png
DESCRIPTION = Restarts the pulseaudio daemon.
CHANGELOG = \
1.0.0: First public release.
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/pulseaudiorestarter.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	sed -i.orig -e 's|src=".*/enyo|src="/usr/palm/frameworks/enyo/1.0/framework/enyo|' \
		build/$*/usr/palm/applications/${APP_ID}/enyo.html
	rm -f build/$*/usr/palm/applications/${APP_ID}/enyo.html.orig
	sed -i.orig -e 's|src=".*/enyo|src="/usr/palm/frameworks/enyo/1.0/framework/enyo|' \
		build/$*/usr/palm/applications/${APP_ID}/restarter.html
	rm -f build/$*/usr/palm/applications/${APP_ID}/restarter.html.orig
	mkdir -p build/$*/usr/palm/services/${APP_ID}.node
	cp -r build/src/node-service/* build/$*/usr/palm/services/${APP_ID}.node/
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	cp -r build/src/package/* build/$*/usr/palm/packages/${APP_ID}/
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

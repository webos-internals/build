NAME     = gsmwav
APP_ID   = org.webosinternals.gstcodecs.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.1
HOMEPAGE = http://www.webos-internals.org/wiki/Application:GstCodecs
MAINTAINER = zsoc
TITLE   = GSM WAV Codec
TYPE	= Plugin
DESCRIPTION = GSM 6.10 WAV Codec for webOS. Installing this package allows those with voicemail systems that send gsm encoded wav files via email to listen to these attachments on their webOS device. 
CHANGELOG = 1.1: Removed superfluous dependency on WIDK package.<br>1.0: Initial Release
CATEGORY = Audio Plugins
ICON	= http://www.webos-internals.org/wiki/Image:Icon_WebOSInternals_Base_Plugin.png
LICENSE  = GPL
SCREENSHOTS =

SRC_GIT = git://git.webos-internals.org/gstcodecs/gsmwav.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/binaries
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	mv build/$*/usr/palm/applications/${APP_ID}/binaries/$* build/$*/usr/palm/applications/${APP_ID}/bin
	rm -rf build/$*/usr/palm/applications/${APP_ID}/binaries
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


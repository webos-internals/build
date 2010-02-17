ME     = gsmwav
APP_ID   = org.webosinternals.gstcodecs.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.0
DEPENDS  = org.webosinternals.widk
HOMEPAGE = http://www.webos-internals.org/wiki/Application:GstCodecs
MAINTAINER = zsoc
TITLE   = GSM WAV Codec
TYPE	= Application
DESCRIPTION = GSM 6.10 WAV Codec for webOS. This package allows those with <br>voicemail systems that send gsm encoded wav files via email, to listen to these attachments on their webOS device. 
CHANGELOG = 1.0.0: Initial Release
CATEGORY = Codecs
ICON	= http://www.webos-internals.org/wiki/Image:Icon_WebOSInternals_Base_Plugin.png
LICENSE  = GPL
SCREENSHOTS =

SRC_GIT = git://git.webos-internals.org/gstcodecs/gsmwav.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpack
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/binaries
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
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


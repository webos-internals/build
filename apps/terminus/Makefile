NAME     = terminus
APP_ID   = us.ryanhope.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.0.1
DEPENDS  = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:ClassicInvaders
MAINTAINER = Ryan Hope
TITLE   = Terminus
TYPE	= Application
DESCRIPTION = Linux Terminal

CATEGORY = Utility
ICON	 = http://www.webos-internals.org/images/b/bc/Terminus_Icon.png
LICENSE  = GPL

SRC_GIT = git://git.webos-internals.org/applications/terminus.git

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
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/data
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/upstart
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/terminus build/$*/usr/palm/applications/${APP_ID}/bin/
	cp -r build/src/src/data/*.png build/$*/usr/palm/applications/${APP_ID}/data/
	cp -r build/src/src/data/*.ttf build/$*/usr/palm/applications/${APP_ID}/data/
	cp -r build/binaries/$*/deps build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/$*/etc/event.d/${APP_ID}
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

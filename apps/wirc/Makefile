NAME     = wirc
TITLE	 = wIRC
APP_ID   = ws.junk.${NAME}
VERSION  = 0.0.3
DEPENDS	 = us.ryanhope.wircd
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:WIRC
ICON	 = http://www.webos-internals.org/images/1/10/Icon_WebOSInternals_wIRC.png
DESCRIPTION = 
CHANGELOG = 
SCREENSHOTS = []
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/wIRC.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION} build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build

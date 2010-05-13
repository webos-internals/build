NAME     = wirc
TITLE	 = wIRC
APP_ID   = ws.junk.${NAME}
VERSION  = 0.1.0
DEPENDS	 = us.ryanhope.wircd
TYPE	 = Application
CATEGORY = System Utilities
MAINTAINER = oil, PuffTheMagic, egaudet
HOMEPAGE = http://www.webos-internals.org/wiki/Application:WIRC
ICON	 = http://www.webos-internals.org/images/1/10/Icon_WebOSInternals_wIRC.png
DESCRIPTION = A native webOS IRC client.
CHANGELOG = 0.1.0: A bunch of changes and updates.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/5/5a/Wirc.png\",\
\"http://www.webos-internals.org/images/d/d2/Wirc_2.png\",\
\"http://www.webos-internals.org/images/b/b6/Wirc_3.png\",\
\"http://www.webos-internals.org/images/7/7c/Wirc_4.png\",\
\"http://www.webos-internals.org/images/9/9d/Wirc_5.png\" ]
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

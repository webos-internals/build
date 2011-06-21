NAME     = ompload
APP_ID   = us.ryanhope.${NAME}
VERSION  = 1.0.1
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Ompload
MAINTAINER = Ryan Hope (PuffTheMagic) <rmh3093@gmail.com>
TITLE   = Ompload
TYPE	= Application
DESCRIPTION = An Omploader GUI
CHANGELOG = 1.0.1 First cut
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/3/32/Ompload.png
LICENSE  = GPL-3
SCREENSHOTS = [\"http://www.webos-internals.org/images/0/09/Ompload-screenshot.png\"]

SRC_GIT = git://git.webos-internals.org/applications/ompload.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION} build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build

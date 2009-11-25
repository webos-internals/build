NAME     = freetether
TITLE	 = freeTether
APP_ID   = us.ryanhope.${NAME}
VERSION  = 0.0.1
DEPENDS	 = us.ryanhope.freetetherd
TYPE	 = Application
CATEGORY = System Utilities
MAINTAINER = Ryan Hope <rmh3093@gmail.com>
HOMEPAGE = http://www.webos-internals.org/wiki/Application:FreeTether
ICON	 = http://www.webos-internals.org/images/9/98/FreeTether_icon.png
DESCRIPTION = A free tethering application.
CHANGELOG = 
SCREENSHOTS = [\"http://www.webos-internals.org/images/3/35/FreeTether_screeshot.png\"]
LICENSE  = GPL v2 Open Source

# SRC_GIT = git://git.webos-internals.org/applications/freeTether.git
SRC_GIT = git@git.webos-internals.org:applications/freeTether.git

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

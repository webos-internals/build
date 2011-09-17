NAME     = sets
APP_ID   = us.ryanhope.${NAME}
VERSION  = 0.1.1-1
HOMEPAGE = http://www.webos-internals.org/wiki/Application:SETS
MAINTAINER = Ryan Hope <rmh3093@gmail.com>
TITLE   = SETS
TYPE	= Application
DESCRIPTION = A visual perception puzzle / card game.
CATEGORY = Games
LICENSE  = GPLv2
ICON    = http://www.webos-internals.org/images/5/57/SETS-ICON.png
SCREENSHOTS = [\"http://www.webos-internals.org/images/7/7c/Sets2.png\",\"http://www.webos-internals.org/images/a/ad/Sets.png\"]

SRC_GIT = git://git.webos-internals.org/games/sets.git
GIT_TAG = v0.1.1

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

NAME     = myflashlight
APP_ID   = net.vertigostudios.${NAME}
VERSION  = 0.2.2
HOMEPAGE = http://forums.precentral.net/vertigo-studios/187407-my-flashlight-7-1-a.html
MAINTAINER = PreGame
DEPENDS = net.vertigostudios.ledmanager
TYPE	= Application
DESCRIPTION = The original camera LED flashlight application.
CHANGELOG = 0.2.2: Fixed palm-dark issue<br>0.2.0: Rewritten for webOS 1.3.5
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/2/28/MyFlashlight.png
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/myflashlight.git

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

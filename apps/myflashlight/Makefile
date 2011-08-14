NAME     = myflashlight
APP_ID   = net.vertigostudios.${NAME}
MAXWEBOSVERSION = 2.9.9
VERSION  = 0.2.7
MAXWEBOSVERSION = 1.9.9
HOMEPAGE = http://forums.precentral.net/vertigo-studios/187407-my-flashlight-7-1-a.html
MAINTAINER = PreGame
DEPENDS = net.vertigostudios.ledmanager
TYPE	= Application
DESCRIPTION = The original camera LED flashlight application.
CHANGELOG = 0.2.7: Previous build did not include updated appinfo.json file<br>0.2.6: Fixed the application id typo to allow removal to operate correctly.<br>0.2.5: Fixed the application id to allow removal to operate correctly.<br>0.2.4:Now turns on flashlight when you open the application and turns it off when you close it.<br>0.2.2: Fixed palm-dark issue<br>0.2.0: Rewritten for webOS 1.3.5
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/2/28/MyFlashlight.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/8/88/Myflashlight_2.png\",\
\"http://www.webos-internals.org/images/d/de/Myflashlight_1.png\"]

LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/myflashlight.git

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

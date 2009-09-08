NAME     = lunamanager
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.0.1
HOMEPAGE = http://www.webos-internals.org/wiki/Application:LunaManager
MAINTAINER = WebOS Internals <support@webos-internals.org>
DEPENDS = org.webosinternals.ipkgservice (>= 0.8.6)
TYPE	= Application
DESCRIPTION = A utility to control various aspects of the Luna system.
DESCRIPTION += <br>Changelog:<br>0.0.1: Requires Package Manager Service 0.8.6 or later.
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/b/bd/Icon_WebOSInternals_StopLight.png
LICENSE  = GPL v2 Open Source
SCREENSHOTS = [\"http://www.webos-internals.org/images/e/e4/LunaManager.png\"]

SRC_GIT = git://git.webos-internals.org/applications/lunamanager.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build

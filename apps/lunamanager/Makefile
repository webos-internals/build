NAME     = lunamanager
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.1.0
DEPENDS  = org.webosinternals.preware
HOMEPAGE = http://www.webos-internals.org/wiki/Application:LunaManager
MAINTAINER = WebOS Internals <support@webos-internals.org>
TYPE	= Application
DESCRIPTION = A utility to control various aspects of the Luna system.
CHANGELOG = 0.1.0: Updated the error messages to refer to Preware instead of the Package Manager Service, and to require api version 12.<br>0.0.5: Removed the dependency on the package manager service.
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/b/bd/Icon_WebOSInternals_StopLight.png
LICENSE  = GPL v2 Open Source
SCREENSHOTS = [\"http://www.webos-internals.org/images/e/e4/LunaManager.png\"]

SRC_GIT = git://github.com/wosigh/lunamanager.git

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

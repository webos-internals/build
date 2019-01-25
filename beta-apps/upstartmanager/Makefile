NAME     = upstartmanager
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.1.2
MAXWEBOSVERSION = 1.9.9
DEPENDS = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:UpstartManager
MAINTAINER = Chris Jowett (cryptk) <cryptk@gmail.com>
TITLE   = Upstart Manager
TYPE	= Application
DESCRIPTION = A WebOS GUI for the webos-internals Upstart Manager service.
CHANGELOG = 0.1.2: changing AppID to org.webosinternals.upstartmanager<br>0.1.1: Fixing the list items disappearing during fast scrolling<br>0.1.0: Initial release to the testing feed.
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/2/28/Icon_WebOSInternals_Base.png
LICENSE  = BSD (NCSA/UofI) Open Source
SCREENSHOTS = [\"http://www.webos-internals.org/images/9/99/Upstartmanager_screencap.png\"]

SRC_GIT = git://github.com/webos-internals/upstartmanager.git

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

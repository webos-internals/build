NAME     = jstop
APP_ID   = com.palm.biz.sketchyplace.${NAME}
VERSION  = 0.2.8
HOMEPAGE = http://www.webos-internals.org/wiki/Application:JsTop
MAINTAINER = Daniel Freedman (azakus) <dfreedm2@uiuc.edu>
TITLE   = JsTop
TYPE	= Application
DESCRIPTION = An on-phone resource monitor for javascript applications.
CHANGELOG = 0.2.8: Fix callbacks, full height on pre3, 0.2.7: Fixed error in cookie checking, 0.2.6: Cleaner logs, binding applied to app-assistant, jslinted
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/c/c5/Icon_WebOSInternals_ProcessMonitor.png
LICENSE  = BSD (NCSA/UofI) Open Source
SCREENSHOTS = [\"http://www.webos-internals.org/images/3/32/Jstop.png\"]

SRC_GIT = git://git.webos-internals.org/applications/jstop.git

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

NAME     = showprops
APP_ID   = com.palm.org.webosinternals.${NAME}
VERSION  = 0.3.0
HOMEPAGE = http://www.webos-internals.org/wiki/Application:ShowProperties
MAINTAINER = WebOS Internals <support@webos-internals.org>
TYPE	= Application
DESCRIPTION = A utility to display System Properties
CHANGELOG = 0.3.0: Added Pre 3 tokens.<br>0.2.5: Added TouchPad tokens.<br>0.2.4: Added PROXCAL token.<br>0.2.3: Fixed quoting of XML output.<br>0.2.2: Added overwrite action to comms board swap output.<br>0.2.0: Added castle.xml generation.<br>0.1.0: Initial version
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/2/2e/Icon_WebOSInternals_SaveRestore.png
LICENSE  = GPL v2 Open Source
SCREENSHOTS = []

SRC_GIT = git://git.webos-internals.org/applications/showprops.git

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

NAME     = preware
TITLE	 = Preware
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.7.7
DEPENDS	 = org.webosinternals.ipkgservice
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
ICON	 = http://www.webos-internals.org/images/e/e4/Icon_Preware.png
DESCRIPTION = The revolutionary webOS on-device installer capable of installing advanced homebrew applications.
SCREENSHOTS = [\"http://www.webos-internals.org/images/d/df/Application_Preware_List.png\"]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/preware.git

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

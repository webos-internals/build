NAME     = preware
TITLE	 = Preware
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.9.2
DEPENDS	 = org.webosinternals.ipkgservice
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
ICON	 = http://www.webos-internals.org/images/e/e4/Icon_Preware.png
DESCRIPTION = The revolutionary webOS on-device installer capable of installing advanced homebrew applications.
CHANGELOG = 0.9.2: Enabled patch screenshots
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/7/7f/Preware_ss1.jpg\",\
\"http://www.webos-internals.org/images/4/41/Preware_ss2.jpg\",\
\"http://www.webos-internals.org/images/3/3b/Preware_ss3.jpg\",\
\"http://www.webos-internals.org/images/4/49/Preware_ss4.jpg\",\
\"http://www.webos-internals.org/images/4/4b/Preware_ss5.jpg\",\
\"http://www.webos-internals.org/images/6/6a/Preware_ss6.jpg\" ]
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

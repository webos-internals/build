NAME     = terminal
TITLE	 = Terminal
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.2.2
DEPENDS  = org.webosinternals.termplugin
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Terminal
ICON	 = http://www.webos-internals.org/images/7/74/Icon_WebOSInternals_Terminal.png
DESCRIPTION = Description for Terminal
SCREENSHOTS = [\"http://www.webos-internals.org/images/b/bd/Application_Terminal.jpg\"]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/terminal.git

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

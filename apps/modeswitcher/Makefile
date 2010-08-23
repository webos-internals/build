NAME     = modeswitcher
MAINTAINER = Janne Julkunen <janne.julkunen@e-lnx.org>
TITLE    = Mode Switcher
APP_ID   = com.palm.org.e-lnx.wee.apps.${NAME}
VERSION  = 1.0.1
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://forums.precentral.net/homebrew-apps/224544-mode-switcher.html
ICON     = http://wee.e-lnx.org/webos/images/icons/modeswitcher.png
DESCRIPTION = Mode Switcher.
SCREENSHOTS = []
LICENSE  = BSD Open Source License
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS = RestartLuna
CHANGELOG = \
1.0.1: Fixed a small bug.<br>\
1.0.0: Initial release.

SRC_GIT = git://git.webos-internals.org/applications/modeswitcher.git

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

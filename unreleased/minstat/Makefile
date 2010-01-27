NAME     = minstat
TITLE    = MinStat
APP_ID   = de.hlavka.${NAME}
VERSION  = 1.2.0
DEPENDS  = de.hlavka.${NAME}service
TYPE     = Application
CATEGORY = System Utilities
HOMEPAGE = http://forums.precentral.net/homebrew-apps/226237-minstat.html
ICON     = http://minstat.hlavka.de/minstat_icon.png
DESCRIPTION = This app counts sent(+received) SMS and the length of outgoing calls in a certain time period. You can enter your included minutes and SMS per month and it will show you how many of your included units are left in your quota. Clockrates and the billing day can be set freely. It also has a little smiley indicator - for an explanation, please visit the homepage. Minstat depends on minstatservice (also on this feed).
CHANGELOG = 1.2.0: First public version, already including support for incoming *and* outgoing SMS.
SCREENSHOTS = [\"http://minstat.hlavka.de/minstat1.png\",\"http://minstat.hlavka.de/minstat2.png\"]
LICENSE  = GPL v3 Open Source

SRC_GIT = git://git.webos-internals.org/applications/minstat.git

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

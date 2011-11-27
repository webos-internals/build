NAME     = ntpsync
APP_ID   = com.webosnerd.${NAME}
MAXWEBOSVERSION = 1.9.9
VERSION  = 0.2.0
HOMEPAGE = http://webosnerd.com/
MAINTAINER = dallashigh <karl@webosnerd.com>
DEPENDS = org.webosinternals.upstartmgr
TYPE	= Application
DESCRIPTION = A utility to sync webOS devices to Internet time.
CHANGELOG = 0.2.0: Migrate to Upstart service, add banner notification, remove vibrate on failure.
CATEGORY = System Utilities
ICON	= http://webosnerd.com/images/ntpsync.png
LICENSE  = GPL v3 Open Source

SRC_GIT = git://git.webos-internals.org/applications/ntpsync.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION} build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	mkdir -p build/src/
	mv build/all/usr/palm/applications/${APP_ID}/control build/src/
	mv build/all/usr/palm/applications/${APP_ID}/upstart build/src/
	mkdir -p build/all/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/all/etc/event.d/${APP_ID}
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build

.PHONY: murder
murder::
	rm -rf build
	rm -rf ipkgs

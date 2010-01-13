NAME     = pdk
TITLE    = WebOS Internals PDK
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.2.0
HOMEPAGE = http://www.webos-internals.org/wiki/WebOS_Internals_PDK
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = The WebOS Internals Plugin Development Kit bootstrap files.
CHANGELOG = 0.2.0: Unmount all in premr<br>0.1.0: Create /var/local, and bind mount it to /usr/local
TYPE	 = Linux Application
CATEGORY = Infrastructure
ICON	 = http://www.webos-internals.org/images/7/7d/Icon_PDK.png
LICENSE  = GPL v2 Open Source
SOURCE	 = git://git.webos-internals.org/preware/build.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked:
	rm -rf build
	mkdir -p build/all
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked
	mkdir -p build/all/etc/event.d
	install -m 644 upstart/${APP_ID} build/all/etc/event.d/${APP_ID}
	touch $@

clobber::
	rm -rf build

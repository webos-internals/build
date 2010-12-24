NAME     = optware
TITLE    = Optware Bootstrap
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 1.5.2
HOMEPAGE = http://www.webos-internals.org/wiki/Optware
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = This package is used to bootstrap the installation of packages from the Optware feed.
CHANGELOG = \
1.5.2: Moved loopback filesystem file to /media/cryptofs to fix USB mode.<br>\
1.5.1: Fixed prerm script.<br>\
1.5.0: Migration to new loopback mounted ext3 filesystem stored on the USB drive.
TYPE	 = Optware
CATEGORY = Infrastructure
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
LICENSE  = GPL v2 Open Source
SOURCE	 = git://git.webos-internals.org/preware/build.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p build/all
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p build/all/usr/palm/applications/${APP_ID}/upstart
	install -m 644 upstart/${APP_ID} build/all/usr/palm/applications/${APP_ID}/upstart/
	mkdir -p build/all/usr/palm/applications/${APP_ID}/profile
	install -m 644 profile/${APP_ID} build/all/usr/palm/applications/${APP_ID}/profile/
	touch $@

clobber::
	rm -rf build

NAME     = optware
TITLE    = Optware Bootstrap
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
# BLDFLAGS = -p // If this is set, you don't see postinst status messages
VERSION  = 1.6.1
HOMEPAGE = http://www.webos-internals.org/wiki/Optware
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = This package is used to bootstrap the installation of packages from the Optware feed.  If you have a dedicated ext3fs partition (you need to meta-doctor your device to get one of these), it will create and use a /media/ext3fs/opt directory.  If you do not have a dedicated ext3fs partition, it will create a 128MB loopback filesystem to store your optware packages.  In either case, the partition is then mounted as /opt on your device, ready to use.
CHANGELOG = \
1.6.1: Handle an empty /var/opt directory correctly.<br>\
1.6.0: Now supports using a dedicated ext3fs partition created using the Meta-Doctor.<br>\
1.5.2: Moved loopback filesystem file to /media/cryptofs to fix USB mode.<br>\
1.5.1: Fixed prerm script.<br>\
1.5.0: Migration to new loopback mounted ext3 filesystem stored on the USB drive.
TYPE	 = Optware
CATEGORY = Infrastructure
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
LICENSE  = GPL v2 Open Source
SOURCE	 = git://github.com/webos-internals/build.git

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

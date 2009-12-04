NAME     = optware
TITLE    = Optware Bootstrap
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.0.8
HOMEPAGE = http://www.webos-internals.org/wiki/Optware
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = This package is used to bootstrap the installation of packages from the Optware feed.
CHANGELOG = 0.0.8: Now overrides any manually installed optware profile.
CHANGELOG += <br>0.0.7: Updated for future webOS compatibility.
CHANGELOG += <br>0.0.6: Added default profile to set up the path.
CHANGELOG += <br>0.0.3: Unmount /opt on removal.
CHANGELOG += <br>0.0.2: Create /var/opt, and bind mount it to /opt - will add more checking for pre-existing mounts later.
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
LICENSE  = GPL v2 Open Source
SOURCE	 = git://git.webos-internals.org/preware/build.git
POSTINSTALLFLAGS = 
POSTREMOVEFLAGS  = 

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
	mkdir -p build/all/etc/profile.d
	install -m 644 profile/${APP_ID} build/all/etc/profile.d/${APP_ID}
	touch $@

clobber::
	rm -rf build

NAME     = optware
TITLE    = Optware Bootstrap
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.0.6
HOMEPAGE = http://www.webos-internals.org/wiki/Optware
MAINTAINER = WebOS Internals <support@webos-internal.org>
DESCRIPTION = This package can be used to bootstrap the installation of packages from the Optware feed.
CHANGELOG = 0.0.6: Added default profile to set up the path.  Do not install or remove this package if you already have optware installed via the bootstrap script.
CHANGELOG += <br>0.0.3: Unmount /opt on removal.
CHANGELOG += <br>0.0.2: Create /var/opt, and bind mount it to /opt - will add more checking for pre-existing mounts later.
CHANGELOG += <br>0.0.1: Initial version, zero functionality.  I wonder who will still install it and post on PreCentral to ask what it does ...
TYPE	 = Linux Application
CATEGORY = System Utilities
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
build: build/.built

build/.built: build/.unpacked
	mkdir -p build/all/etc/event.d
	install -m 644 upstart/${APP_ID} build/all/etc/event.d/${APP_ID}
	mkdir -p build/all/etc/profile.d
	install -m 644 profile/${APP_ID} build/all/etc/profile.d/${APP_ID}
	touch $@

clobber::
	rm -rf build

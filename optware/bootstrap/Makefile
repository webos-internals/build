NAME     = optware
TITLE    = Optware Bootstrap
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.0.0
HOMEPAGE = http://www.webos-internals.org/wiki/Optware
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = This package is used to bootstrap the installation of packages from the Optware feed.
CHANGELOG = 1.0.0: Made compatible with the Emergency Service Enabler to survive doctoring.
CHANGELOG += <br>0.2.0: Protect against multiple mounts.
CHANGELOG += <br>0.1.0: Made the check for webOS 1.3.5 more robust.
CHANGELOG += <br>0.0.9: Updated again for future webOS compatibility.
CHANGELOG += <br>0.0.8: Now overrides any manually installed optware profile.
CHANGELOG += <br>0.0.7: Updated for future webOS compatibility.
CHANGELOG += <br>0.0.6: Added default profile to set up the path.
CHANGELOG += <br>0.0.3: Unmount /opt on removal.
CHANGELOG += <br>0.0.2: Create /var/opt, and bind mount it to /opt - will add more checking for pre-existing mounts later.
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
	mkdir -p build/all/etc/event.d
	install -m 644 upstart/${APP_ID} build/all/etc/event.d/${APP_ID}
	mkdir -p build/all/etc/profile.d
	install -m 644 profile/${APP_ID} build/all/etc/profile.d/${APP_ID}
	touch $@

clobber::
	rm -rf build

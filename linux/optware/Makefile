NAME     = optware
TITLE    = Optware Bootstrap
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.0.1
HOMEPAGE = http://www.webos-internals.org/wiki/Optware
MAINTAINER = WebOS Internals <support@webos-internal.org>
DESCRIPTION = This package can be used to bootstrap the installation of packages from the Optware feed.
DESCRIPTION += <br>Changelog:<br>0.0.1: Initial version, zero functionality.  I wonder who will still install it and post on PreCentral to ask what it does ...
TYPE	 = Linux Application
CATEGORY = System Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
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
build: build/.built

build/.built: build/.unpacked
	touch $@

clobber::
	rm -rf build

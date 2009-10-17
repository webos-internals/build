NAME     = fairdinkum
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.4.0
HOMEPAGE = http://www.rwhitby.net/blog/webos-internals/palm-pre-app-install-limits.html
MAINTAINER = Rod Whitby <rod@whitby.id.au>
TITLE = Fair Dinkum App Limit
TYPE = Linux Application
CATEGORY = Utilities
DEPENDS = org.webosinternals.ipkgservice, org.webosinternals.preware
ICON	= http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
DESCRIPTION = Install this package to remove the arbitrary limit on the number of applications you can install.
CHANGELOG = ${VERSION}: Much improved 'ipkg' wrapper script thanks to Carl Thompson which removes the need to wrap 'du'.<br>0.3.0: Installs wrapper scripts for 'du' and 'ipkg' to remove the arbitrary limits on application installation.
SCREENSHOTS = [\"http://www.webos-internals.org/images/a/a7/FairDinkumAppLimit.png\"]

FILES = files/ipkg

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${FILES}
	rm -rf build
	mkdir -p build
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 755 ${FILES} build/all/usr/palm/applications/${APP_ID}/
	chmod ugo+rx build/all/usr/palm/applications/${APP_ID}/*
	touch $@

build/all/CONTROL/prerm: build/.unpacked
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 files/prerm build/all/CONTROL
	chmod ugo+x $@

build/all/CONTROL/postinst: build/.unpacked
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 files/postinst build/all/CONTROL
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build

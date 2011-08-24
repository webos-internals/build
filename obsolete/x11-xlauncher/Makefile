NAME     = xlauncher
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
MAXWEBOSVERSION = 2.9.9
VERSION  = 0.2.0
DEPENDS  = org.webosinternals.xorg-server
HOMEPAGE = http://www.webos-internals.org/wiki/Application:X
MAINTAINER = Will Dietz (dtzWill), WebOSInternals
TITLE   = X Window System Server
TYPE	= Linux Application
DESCRIPTION = Runs the X Window System server. Requires 1.3.5 or later<br><br>Note that this is <b>just the server</b>, and unless you know what an X server is, probably not something you care about.  Yet.<br><br>Porting effort by Will Dietz and Shivaram Venkataraman.<br>Thanks to everyone on the WebOSInternals team, particularly jacques and rwhitby for making this possible.
CHANGELOG = \
0.2.0: Now compatible with webOS 1.4.5 and later.<br>\
0.0.6: New packaging strategy.<br>\
0.0.4: Updated xkeyboardconfig to 1.7-2 (Fix minus/underscore).\
0.0.3: Removed false dependency on upstartmgr.<br>\
0.0.2: Rebuilt libraries, much smaller filesize and renamed package.<br>\
0.0.1: First public release.
CATEGORY = X Window System
ICON	= http://www.webos-internals.org/images/a/a5/X.png
LICENSE  = MIT/X11 License
SCREENSHOTS = []
#XXX: Get some screenshots?
#XXX: Not sure if it's "fair" to include screenshots that
#depict more than just the server, since they're not
#part of this package.

SRC_GIT = git://git.webos-internals.org/x11/xlauncher.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpack
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build

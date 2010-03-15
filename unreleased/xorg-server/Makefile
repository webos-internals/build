NAME     = x11
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.0.4
DEPENDS  = 
HOMEPAGE = http://www.webos-internals.org/wiki/Application:X
MAINTAINER = Will Dietz (dtzWill), WebOSInternals
TITLE   = X Window System Server
TYPE	= Application
DESCRIPTION = Runs the X Window System server. Requires 1.3.5 or later<br><br>Note that this is <b>just the server</b>, and unless you know what an X server is, probably not something you care about.  Yet.<br><br>Porting effort by Will Dietz and Shivaram Venkataraman.<br>Thanks to everyone on the WebOSInternals team, particularly jacques and rwhitby for making this possible.
CHANGELOG = <br>0.0.4<br>Updated xkeyboardconfig to 1.7-2 (Fix minus/underscore)<br>0.0.3<br>Removed false dependency on upstartmgr<br>0.0.2<br>Rebuilt libraries, much smaller filesize and renamed package<br><br>0.0.1<br>First public release.
CATEGORY = Application
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

build/%/usr/palm/applications/${APP_ID}/CONTROL/control:
	touch $@

.PHONY: clobber
clobber::
	rm -rf build

NAME     = tiddlywiki
APP_ID   = de.daemon.tiddlywiki
SIGNER   = de.daemon
VERSION  = 1.0.6
DEPENDS  = mobi.optware.lighttpd
HOMEPAGE = http://forums.webosnation.com/webos-homebrew-apps/234936-tiddlywiki-ported-webos.html
MAINTAINER = debilater
TITLE   = Tiddlywiki for Palm Pre
TYPE	= Application
DESCRIPTION = TiddlyWiki is a single-file, self-contained wiki for managing micro-content, written in JavaScript. This is the port to the Palm Pre platform based on ITW (http://itw.bidix.info/). It requires lighttpd to be installed which it uses to save itself via a CGI script to the usb drive. No network connectivity is required to use it. You can copy the wikifile (www/itw.html) to your desktop, modify it there and copy it back to the palm.
CHANGELOG = 1.0.6: fixed swipe back in menus<br/>1.0.5: added swipe back support, if you are updating follow these instructions how to add the feature to your existing wiki: http://bit.ly/i3dh76<br/>1.0.4: ignore this version<br/>1.0.3: fixed install bug in postinst<br/>1.0.2: missed updated cgi in 1.0.1<br/>1.0.1: added help, enhanced about, added on-device restore feature<br/>1.0.0: initial public test release
CATEGORY = Utilities
ICON	= http://i.imgur.com/cqslF.png
LICENSE  = GPL
SCREENSHOTS = [\
\"http://i.imgur.com/uoaiQ.png\",\
\"http://i.imgur.com/ENszq.png\",\
\"http://i.imgur.com/AXu1Y.png\",\
\"http://i.imgur.com/Zxs8O.png\",\
\"http://i.imgur.com/ciCev.png\" ]

SRC_GIT = git://github.com/wosigh/tiddlywiki.git


.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv6.built-${VERSION} build/armv7.built-${VERSION} build/i686.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/cgi-bin
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/savetiddlywiki.cgi build/$*/usr/palm/applications/${APP_ID}/cgi-bin/
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@



.PHONY: clobber
clobber::
	rm -rf build



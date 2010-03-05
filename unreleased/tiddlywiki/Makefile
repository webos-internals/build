NAME     = tiddlywiki
APP_ID   = de.daemon.tiddlywiki
SIGNER   = de.daemon
VERSION  = 1.0.0
DEPENDS  = mobi.optware.lighttpd
HOMEPAGE = http://www.daemon.de/PalmPreTiddlyWiki
MAINTAINER = debilater
TITLE   = Tiddlywiki for Palm Pre
TYPE	= Application
DESCRIPTION = TiddlyWiki is a single-file, self-contained wiki for managing micro-content, written in JavaScript. This is the port to the Palm Pre platform based on ITW (http://itw.bidix.info/). It requires lighttpd to be installed which it uses to save itself via a CGI script to the usb drive. No network connectivity is required to use it. You can copy the wikifile (www/itw.html) to your desktop, modify it there and copy it back to the palm.
CHANGELOG = 1.0.0: initial public test release
CATEGORY = Utilities
ICON	= http://www.daemon.de/idisk/palmpre/tiddlywiki/icon.png
LICENSE  = GPL
SCREENSHOTS = [\
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_233233.png\",
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_214556.png\",
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_214623.png\",
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_214636.png\",
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_220301.png\" ]

SRC_GIT = git://git.webos-internals.org/applications/tiddlywiki.git


.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION} build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build

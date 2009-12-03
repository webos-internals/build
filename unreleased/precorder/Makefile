NAME     = precorder
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.3.3
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Precorder
MAINTAINER = Zsoc <precorder.webosinternals@gmail.com>, Roy Sutton, Rod Whitby
TITLE   = Precorder
DEPENDS = org.webosinternals.gstservice
TYPE	= Application
DESCRIPTION = Video Recorder application. This is the very first public alpha release.
CHANGELOG = 0.3.3: Correctly terminate recording on app closure.<br>0.3.0: Added launch functionality.<br>0.2.3: Updated version number in the app.<br>0.2.2: Added the icon.<br>0.2.1: Fixed the app stylesheet.<br>0.2.0: First public alpha test version.
CATEGORY = Multimedia
ICON	= http://www.webos-internals.org/images/a/ac/Icon_WebOSInternals_Camera.png
LICENSE  = GPL v2 Open Source
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/2/2c/Precorder_2009-24-11_164136.png\",\
\"http://www.webos-internals.org/images/0/08/Precorder_2009-24-11_164140.png\",\
\"http://www.webos-internals.org/images/e/e2/Precorder_2009-24-11_164128.png\",\
\"http://www.webos-internals.org/images/8/80/Launcher_2009-24-11_164206.png\" ]

SRC_GIT = git://git.webos-internals.org/applications/precorder.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
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

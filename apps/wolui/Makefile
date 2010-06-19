NAME     = wolui
APP_ID   = com.thebitguru.${NAME}
SIGNER   = com.thebitguru
VERSION  = 0.5.0
HOMEPAGE = http://www.thebitguru.com/projects/wol
MAINTAINER = Farhan Ahmad <farhan@thebitguru.com>
TITLE   = Wake-on-LAN
DEPENDS = com.thebitguru.wolservice
TYPE	= Application
DESCRIPTION = This application sends the Wake-on-LAN (WoL) magic packet to the specified MAC address for remotely waking it up. The network card in your computer or device must support the WoL functionality.
CHANGELOG = 0.5: First public release.
CATEGORY = System Utilities
ICON	= http://www.thebitguru.com/site_media/uploads/wol_icon.png
LICENSE  = MIT Open Source
SCREENSHOTS = [\
\"http://www.thebitguru.com/site_media/uploads/attachments/243_wol_main_screen.jpg\",\
\"http://www.thebitguru.com/site_media/uploads/attachments/244_wol_add_screen.jpg\",\
\"http://www.thebitguru.com/site_media/uploads/attachments/245_wol_about_screen.jpg\" ]

SRC_GIT = git://git.webos-internals.org/applications/wolui.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION} build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build

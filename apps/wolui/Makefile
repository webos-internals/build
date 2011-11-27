NAME     = wolui
APP_ID   = com.thebitguru.${NAME}
SIGNER   = com.thebitguru
VERSION  = 0.6.1
MAXWEBOSVERSION = 1.9.9
HOMEPAGE = http://www.thebitguru.com/projects/wol
MAINTAINER = Farhan Ahmad <farhan@thebitguru.com>
TITLE   = Wake-on-LAN
DEPENDS = com.thebitguru.wolservice
TYPE	= Application
DESCRIPTION = This application sends the Wake-on-LAN (WoL) magic packet to the specified MAC address for remotely waking it up. The network card in your computer or device must support the WoL functionality.
CHANGELOG = 0.6: Updated to support custom ports and waking from outside network. Please see accompanying update to the WOL UI.<br>0.5: First public release.
CATEGORY = System Utilities
ICON	= http://www.thebitguru.com/site_media/uploads/wol_icon.png
LICENSE  = MIT Open Source
SCREENSHOTS = [\
\"http://www.thebitguru.com/site_media/uploads/attachments/243_0.6.0_main_screen.png\",\
\"http://www.thebitguru.com/site_media/uploads/attachments/244_0.6.0_new_target.png\",\
\"http://www.thebitguru.com/site_media/uploads/attachments/245_0.6.0_about.png\" ]

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

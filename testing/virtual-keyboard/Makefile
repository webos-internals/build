NAME = add-onscreen-keyboard
#VERSIONS = 1.4.0-1 1.4.1-1 1.4.2-2 1.4.3-1
VERSIONS = 1.4.1-1
META_SUB_VERSION = 4
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
TITLE = Virtual Keyboard
CATEGORY = Mojo
ICON = http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = TESTING version
SCREENSHOTS = [\"http://www.webos-internals.org/images/b/b9/VirtualKeyboard_1.png\",\"http://www.webos-internals.org/images/b/bd/VirtualKeyboard_2.png\",\"http://www.webos-internals.org/images/3/34/VirtualKeyboard_3.png\",\"http://www.webos-internals.org/images/1/18/VirtualKeyboard_4.png\",\"http://www.webos-internals.org/images/1/10/VirtualKeyboard_5.png\",\"http://www.webos-internals.org/images/2/2a/VirtualKeyboard_6.png\"]
MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
PATCH = add-onscreen-keyboard.patch
APP_ID = org.webosinternals.patches.${NAME}
SIGNER = org.webosinternals
DEPENDS = org.webosinternals.patch, org.webosinternals.lsdiff, org.webosinternals.vkb-default-themes-config
FEED = WebOS Patches
LICENSE = MIT License Open Source
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna

.PHONY: all
all:
	for i in ${VERSIONS}; do \
		${MAKE} VERSION=$$i package; \
	done

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk

include ../../support/package.mk
include ../../support/download.mk
include ../../support/ipkg-info.mk

TESTING_GIT = git://git.webos-internals.org/patches/virtual-keyboard.git
WEBOS_VERSION = $(shell echo ${VERSION} | cut -d- -f1)
SRC_DIR = build/$(shell basename ${TESTING_GIT} .git)-${WEBOS_VERSION}

.PHONY: unpack
unpack: build/.unpacked-${WEBOS_VERSION}

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: update-src build/ipkg-info-${WEBOS_VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 644 ${SRC_DIR}/${PATCH} build/all/usr/palm/applications/${APP_ID}/
	rm -f build/all/usr/palm/applications/${APP_ID}/package_list
	touch build/all/usr/palm/applications/${APP_ID}/package_list
	for f in `lsdiff --strip=1 ${SRC_DIR}/${PATCH}` ; do \
		myvar=`grep -l $$f build/ipkg-info-${WEBOS_VERSION}/*`; \
		if [ "$$myvar" != "" ]; then \
			myvar=`basename $$myvar .list`; \
			grep $$myvar build/all/usr/palm/applications/${APP_ID}/package_list; \
			if [ $$? -ne 0 ]; then \
				echo $$myvar >> build/all/usr/palm/applications/${APP_ID}/package_list; \
			fi; \
		fi; \
	done
	if [ -e ${SRC_DIR}/additional_files ]; then \
		rm -rf build/all/usr/palm/applications/${APP_ID}/additional_files; \
		cp -r ${SRC_DIR}/additional_files build/all/usr/palm/applications/${APP_ID}/; \
	fi
	touch $@

.PHONY: update-src
update-src: ${SRC_DIR}
	cd $< && git pull

${SRC_DIR}:
	echo "HI ${SRC_DIR}"
	mkdir -p build
	( git clone -n ${TESTING_GIT} $@; cd $@ ; git checkout -b webos-${WEBOS_VERSION} origin/webos-${WEBOS_VERSION} )

build/all/CONTROL/postinst: update-src
	mkdir -p build/all/CONTROL
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' \
			../../autopatch/postinst > build/all/CONTROL/postinst
	chmod ugo+x $@

build/all/CONTROL/prerm: update-src
	mkdir -p build/all/CONTROL
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' ../../autopatch/prerm.testing > build/all/CONTROL/prerm
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build

NAME = vkb-default-themes-config
VERSION = 1.0.0
TITLE = VKB Default Themes and Configuration
CATEGORY = Mojo
ICON = http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = This package contains the default themes and configuration file for the Virtual Keyboard patch.

include ../../autopatch/common.mk
SRC_GIT=
DEPENDS=

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	mkdir -p build
	touch $@

build/.built-${VERSION}:
	if [ -e additional_files.tar.gz ]; then \
		mkdir -p build/all/usr/palm/applications/${APP_ID}/additional_files; \
		tar -C build/all/usr/palm/applications/${APP_ID}/additional_files -xzf additional_files.tar.gz; \
	fi
	touch $@

build/ipkg-info-${WEBOS_VERSION}:
	mkdir -p build
	touch $@

build/all/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' \
			../../autopatch/postinst.testing > build/all/CONTROL/postinst
	chmod ugo+x $@

build/all/CONTROL/prerm: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' ../../autopatch/prerm.testing > build/all/CONTROL/prerm
	chmod ugo+x $@

MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
HOMEPAGE = http://www.webos-internals.org/wiki/Virtual_Keyboard_Configuration

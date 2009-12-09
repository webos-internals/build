TYPE = Patch
APP_ID = org.webosinternals.patches.${NAME}
HOMEPAGE = http://www.webos-internals.org/wiki/Portal:Patches_to_webOS
MAINTAINER = WebOS Internals <support@webos-internals.org>
DEPENDS = org.webosinternals.patch, org.webosinternals.diffstat
FEED = WebOS Patches
LICENSE = MIT License Open Source
META_GLOBAL_VERSION = 1
WEBOS_VERSIONS = 1.1.3 1.2.1 1.3.1 1.3.5
#POSTINSTALLFLAGS = RestartLuna
#POSTREMOVEFLAGS = RestartLuna
ifneq ("${META_SUB_VERSION}","")
META_VERSION = ${META_GLOBAL_VERSION}-${META_SUB_VERSION}
else
META_VERSION = ${META_GLOBAL_VERSION}
endif

.PHONY: package
ifneq ("${VERSIONS}", "")
package:
	for v in ${WEBOS_VERSIONS} ; do \
		${MAKE} VERSIONS= DUMMY_VERSION=0 DESCRIPTION='Currently not available for WebOS version '$${v} DEPENDS= CATEGORY=Unavailable VERSION=$${v}-0 package ; \
	done; \
	for v in ${VERSIONS} ; do \
	  ${MAKE} VERSIONS= VERSION=$${v} package ; \
	done
else
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
endif

ifneq ("${DUMMY_VERSION}", "")
build/all/CONTROL/postinst:
	mkdir -p build/all/CONTROL
	echo "#!/bin/sh" > build/all/CONTROL/postinst
	echo "echo \"This patch is NOT available\" 1>&2" >> build/all/CONTROL/postinst
	echo "return 1" >> build/all/CONTROL/postinst
	chmod ugo+x build/all/CONTROL/postinst

build/.built-${VERSION}:
	rm -rf build/all
	mkdir -p build/all
	touch $@
else
.PHONY: unpack
unpack: build/.unpacked-${VERSION}

.PHONY: build
build: build/.built-${VERSION}

build/.meta-${META_VERSION}:
	touch $@

build/.built-${VERSION}: build/.unpacked-${VERSION} build/.meta-${META_VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 644 build/src-${VERSION}/${PATCH} build/all/usr/palm/applications/${APP_ID}/
	touch $@

build/all/CONTROL/prerm: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	cp ../prerm build/all/CONTROL/prerm
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' build/all/CONTROL/prerm -i
	sed -e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' build/all/CONTROL/prerm -i
	chmod ugo+x $@

build/all/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	cp ../postinst build/all/CONTROL/postinst
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' build/all/CONTROL/postinst -i
	sed -e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' build/all/CONTROL/postinst -i
	chmod ugo+x $@
endif

.PHONY: clobber
clobber::
	rm -rf build

include ../../support/package.mk

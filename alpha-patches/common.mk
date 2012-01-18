TYPE = Patch
APP_ID = org.webosinternals.patches.${NAME}
SIGNER = org.webosinternals
HOMEPAGE = http://www.webos-internals.org/wiki/Portal:Patches_to_webOS
MAINTAINER = WebOS Internals <support@webos-internals.org>
DEPENDS = org.webosinternals.ausmt, org.webosinternals.patch, org.webosinternals.lsdiff
FEED = WebOS Patches
LICENSE = MIT License Open Source
META_GLOBAL_VERSION = 4
WEBOS_VERSIONS = 1.4.5 2.0.0 2.0.1 2.1.0
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
ifneq ("${META_SUB_VERSION}","")
META_VERSION = ${META_GLOBAL_VERSION}-${META_SUB_VERSION}
else
META_VERSION = ${META_GLOBAL_VERSION}
endif

ifndef ARCHITECTURE
ARCHITECTURE = all
endif

.PHONY: package
ifneq ("${VERSIONS}", "")
package:
	for v in ${WEBOS_VERSIONS} ; do \
	  VERSION=$${v}-0 ${MAKE} VERSIONS= DUMMY_VERSION=0 package ; \
	done; \
	for v in ${VERSIONS} ; do \
	  VERSION=$${v} ${MAKE} VERSIONS= package ; \
	done
else
ifneq ("${PACKAGES}", "")
package: ${PACKAGES}
else
package: ipkgs/${APP_ID}_${VERSION}_${ARCHITECTURE}.ipk
endif
endif

WEBOS_VERSION:=$(shell echo ${VERSION} | cut -d- -f1)

ifneq ("${DUMMY_VERSION}", "")
DESCRIPTION=This package is not currently available for WebOS ${WEBOS_VERSION}.  This package may be installed as a placeholder to notify you when an update is available.  NOTE: This is simply an empty package placeholder, it will not affect your device in any way.
CATEGORY=Unavailable
VISIBILITY=Installed
SRC_GIT=
DEPENDS=
POSTINSTALLFLAGS=
POSTUPDATEFLAGS=
POSTREMOVEFLAGS=
endif

ifneq ("${WEBOS_VERSION}", "3.0.5")
DEPENDS = org.webosinternals.patch, org.webosinternals.lsdiff
endif

include ../../support/package.mk

ifneq ("${DUMMY_VERSION}", "")
build/.built-%:
	rm -rf build/${ARCHITECTURE}
	mkdir -p build/${ARCHITECTURE}
	touch $@
else
include ../../support/download.mk
include ../../support/ipkg-info.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

.PHONY: build
build: build/.built-${VERSION}

build/.meta-${META_VERSION}:
	touch $@

build/.built-extra-${VERSION}:
	touch $@

build/.built-${VERSION}: build/.unpacked-${VERSION} build/.meta-${META_VERSION} build/ipkg-info-${WEBOS_VERSION}
	rm -rf build/${ARCHITECTURE}
	mkdir -p build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}
ifneq ("${WEBOS_VERSION}", "3.0.5")
	install -m 644 build/src-${VERSION}/${PATCH} build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/
else
	install -m 644 build/src-${VERSION}/${PATCH} build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/unified_diff.patch
endif
ifneq ("${TWEAKS}", "")
ifneq ("${WEBOS_VERSION}", "3.0.5")
	cp build/src-${VERSION}/${TWEAKS} build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/
else
	cp build/src-${VERSION}/${TWEAKS} build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/tweaks_prefs.json
endif
endif
ifneq ("${WEBOS_VERSION}", "3.0.5")
	rm -f build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/package_list
	touch build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/package_list
	for f in `lsdiff --strip=1 build/src-${VERSION}/${PATCH}` ; do \
		myvar=`grep -l $$f build/ipkg-info-${WEBOS_VERSION}/*`; \
		if [ "$$myvar" != "" ]; then \
			myvar=`basename $$myvar .list`; \
			grep $$myvar build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/package_list; \
			if [ $$? -ne 0 ]; then \
				echo $$myvar >> build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/package_list; \
			fi; \
		fi; \
	done
else
	rm -f build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/package_cache.list
	touch build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/package_cache.list
	for f in `lsdiff --strip=1 build/src-${VERSION}/${PATCH}` ; do \
		myvar=`grep -l $$f build/ipkg-info-${WEBOS_VERSION}/*`; \
		if [ "$$myvar" != "" ]; then \
			myvar=`basename $$myvar .list`; \
			grep $$myvar build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/package_cache.list; \
			if [ $$? -ne 0 ]; then \
				echo $$myvar >> build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/package_cache.list; \
			fi; \
		fi; \
	done
endif
ifdef BSPATCH
ifdef BSFILE
	if [ -e build/src-${VERSION}/${BSPATCH} ]; then \
		mkdir -p build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/binary_patches/$(shell dirname ${BSFILE}); \
		cp build/src-${VERSION}/${BSPATCH} build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/binary_patches/$(shell dirname ${BSFILE})/$(shell basename ${BSFILE}).bspatch; \
	fi
endif
endif
ifdef FILES
ifneq ("${WEBOS_VERSION}", "3.0.5")
	if [ -e build/src-${VERSION}/${FILES} ]; then \
		mkdir -p build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/additional_files; \
		tar -C build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/additional_files -xzf build/src-${VERSION}/${FILES}; \
	fi
else
	if [ -e build/src-${VERSION}/${FILES} ]; then \
		mkdir -p build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional; \
		tar -C build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional -xzf build/src-${VERSION}/${FILES}; \
	fi
endif
else
ifneq ("${WEBOS_VERSION}", "3.0.5")
	if [ -e additional_files.tar.gz ]; then \
		mkdir -p build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/additional_files; \
		tar -C build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/additional_files -xzf additional_files.tar.gz; \
	fi
else
	if [ -e additional_files.tar.gz ]; then \
		mkdir -p build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional; \
		tar -C build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional -xzf additional_files.tar.gz; \
	fi
endif
endif
ifneq ("${WEBOS_VERSION}", "3.0.5")
	if [ -d build/src-${VERSION}/additional_files ]; then \
		cp -r build/src-${VERSION}/additional_files build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/; \
	fi
else
	if [ -d build/src-${VERSION}/additional_files ]; then \
		cp -r build/src-${VERSION}/additional_files build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional; \
	fi
endif
	${MAKE} build/.built-extra-${VERSION}
	touch $@

build/${ARCHITECTURE}/CONTROL/prerm: build/.unpacked-${VERSION}
	mkdir -p build/${ARCHITECTURE}/CONTROL
ifneq ("${WEBOS_VERSION}", "3.0.5")
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=/media/cryptofs/apps/usr/palm/applications/${APP_ID}|' ../prerm > build/${ARCHITECTURE}/CONTROL/prerm
else
	sed -e 's:^APP_ID=$$:APP_ID=${APP_ID}:' ../prerm.ausmt > build/${ARCHITECTURE}/CONTROL/prerm
endif
	chmod ugo+x $@

build/${ARCHITECTURE}/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/${ARCHITECTURE}/CONTROL
ifneq ("${WEBOS_VERSION}", "3.0.5")
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=/media/cryptofs/apps/usr/palm/applications/${APP_ID}|' ../postinst > build/${ARCHITECTURE}/CONTROL/postinst
else
	sed -e 's:^APP_ID=$$:APP_ID=${APP_ID}:' ../postinst.ausmt > build/${ARCHITECTURE}/CONTROL/postinst
endif
	chmod ugo+x $@
endif

.PHONY: clobber
clobber::
	rm -rf build

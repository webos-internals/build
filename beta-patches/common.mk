TYPE = Patch
APP_ID = org.webosinternals.patches.${NAME}
SIGNER = org.webosinternals
HOMEPAGE = http://www.webos-internals.org/wiki/Portal:Patches_to_webOS
MAINTAINER = WebOS Internals <support@webos-internals.org>
DEPENDS = org.webosinternals.ausmt, org.webosinternals.patch, org.webosinternals.lsdiff
FEED = WebOS Patches
LICENSE = MIT License Open Source
META_GLOBAL_VERSION = 4
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

include ../../support/package.mk

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
	install -m 644 build/src-${VERSION}/${PATCH} build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/unified_diff.patch
ifneq ("${TWEAKS}", "")
	cp build/src-${VERSION}/${TWEAKS} build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/tweaks_prefs.json
endif
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
ifdef BSPATCH
ifdef BSFILE
	if [ -e build/src-${VERSION}/${BSPATCH} ]; then \
		mkdir -p build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/binary_patches/$(shell dirname ${BSFILE}); \
		cp build/src-${VERSION}/${BSPATCH} build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/binary_patches/$(shell dirname ${BSFILE})/$(shell basename ${BSFILE}).bspatch; \
	fi
endif
endif
ifdef FILES
	if [ -e build/src-${VERSION}/${FILES} ]; then \
		mkdir -p build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional; \
		tar -C build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional -xzf build/src-${VERSION}/${FILES}; \
	fi
else
	if [ -e additional_files.tar.gz ]; then \
		mkdir -p build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional; \
		tar -C build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional -xzf additional_files.tar.gz; \
	fi
endif
	if [ -d build/src-${VERSION}/additional_files ]; then \
		cp -r build/src-${VERSION}/additional_files build/${ARCHITECTURE}/usr/palm/applications/${APP_ID}/files_additional; \
	fi
	${MAKE} build/.built-extra-${VERSION}
	touch $@

build/${ARCHITECTURE}/CONTROL/prerm: build/.unpacked-${VERSION}
	mkdir -p build/${ARCHITECTURE}/CONTROL
	sed -e 's:^APP_ID=$$:APP_ID=${APP_ID}:' ../prerm.ausmt > build/${ARCHITECTURE}/CONTROL/prerm
	chmod ugo+x $@

build/${ARCHITECTURE}/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/${ARCHITECTURE}/CONTROL
	sed -e 's:^APP_ID=$$:APP_ID=${APP_ID}:' ../postinst.ausmt > build/${ARCHITECTURE}/CONTROL/postinst
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build

NAME     = hello
TITLE	 = Hello!
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 1.5.1
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Hello
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
MINWEBOSVERSION = 2.2.0
DESCRIPTION = An example demonstration app for services, plugins, touch-to-share information exchange and homebrew multi-platform packaging of both mojo and enyo.  Run Hello! concurrently on each of a TouchPad and a Pre 3, and then touch to share to see the demonstration.
CHANGELOG = \
1.5.1: Fixed remove script.<br>\
1.5.0: First public release.
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/hello.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src/bin build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/c-service ; \
	  ${MAKE} DEVICE=1 VERSION=${VERSION} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} \
	  clobber hello \
	)
	( cd build/src/c-plugin ; \
	  ${MAKE} DEVICE=1 VERSION=${VERSION} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} \
	  clobber hello \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/services/${APP_ID}.node
	cp -r build/src/node-service/* build/$*/usr/palm/services/${APP_ID}.node/
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	cp -r build/src/package/* build/$*/usr/palm/packages/${APP_ID}/
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

clobber::
	rm -rf build

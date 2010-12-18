NAME     = secureshell
TITLE    = Secure Shell
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.0.3
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:SecureShell
ICON	 = http://www.webos-internals.org/images/7/74/Icon_WebOSInternals_Terminal.png
DESCRIPTION = A Secure Shell for your webOS device. Secure Shell is very raw and barely functional. We know the bugs already, and they are major and fatal, so you do not need to report them. Thanks.
CHANGELOG = \
0.0.3: Hacked away most of vt100.js key handling.<br>\
0.0.2: First semi-functional version.<br>\
0.0.1: Initial skeleton.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/1/11/Secureshell_ss1.png\",\
\"http://www.webos-internals.org/images/1/13/Secureshell_ss2.png\",\
\"http://www.webos-internals.org/images/a/a3/Secureshell_ss3.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/secureshell.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	tar -C build/src -xf build/src/shellinabox-2.10.tar.gz
	mv build/src/shellinabox-2.10 build/src/src
	patch -d build/src/src -p0 < patches/vt100.js.patch
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/src ; \
	  CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} ./configure --host=${CONFIGURE_HOST_$*} ; \
	  sed -i -e 's|objcopy |${TOOLCHAIN_DIR_$*}/${CONFIGURE_HOST_$*}-objcopy |g' Makefile ; \
	  ${MAKE} CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} clean all \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/shellinaboxd build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
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

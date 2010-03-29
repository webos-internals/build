NAME     = saverestore
TITLE    = Save/Restore
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.4.5
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:SaveRestore
ICON	 = http://www.webos-internals.org/images/2/2e/Icon_WebOSInternals_SaveRestore.png
DESCRIPTION = Save/Restore enables saving and restoring application data to and from the /media/internal/saverestore/ directory on a webOS device.<br>It is in a general beta testing phase, buy you should not trust it as your sole backup of data.
CHANGELOG = 0.4.5: Public Release Candidate.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b5/Saverestore_ss1.png\", \
\"http://www.webos-internals.org/images/7/76/Saverestore_ss2.png\", \
\"http://www.webos-internals.org/images/4/47/Saverestore_ss3.png\", \
\"http://www.webos-internals.org/images/3/36/Saverestore_ss4.png\" \
 ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/saverestore.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	tar -C build/src/scripts -zcf build/src/scripts.tgz .
	rm -rf build/src/scripts
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built build/armv6.built build/i686.built
	touch $@

build/i686.built: build/.unpacked
	rm -rf build/i686
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/i686 \
	  CC=$(shell cd ../.. ; pwd)/toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/i686/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/i686/usr/palm/applications/${APP_ID}/
	rm -rf build/i686/usr/palm/applications/${APP_ID}/src
	mkdir -p build/i686/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${NAME} build/i686/usr/palm/applications/${APP_ID}/bin/${APP_ID}
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/armv7 \
	  CC=$(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/armv7/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/armv7/usr/palm/applications/${APP_ID}/
	rm -rf build/armv7/usr/palm/applications/${APP_ID}/src
	mkdir -p build/armv7/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${NAME} build/armv7/usr/palm/applications/${APP_ID}/bin/${APP_ID}
	touch $@

build/armv6.built: build/.unpacked
	rm -rf build/armv6
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/armv7 \
	  CC=$(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/armv6/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/armv6/usr/palm/applications/${APP_ID}/
	rm -rf build/armv6/usr/palm/applications/${APP_ID}/src
	mkdir -p build/armv6/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${NAME} build/armv6/usr/palm/applications/${APP_ID}/bin/${APP_ID}
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

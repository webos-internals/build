NAME     = apptuckerbox
TITLE	 = App Tuckerbox
APP_ID   = com.apptuckerbox.register
SIGNER   = com.apptuckerbox
BLDFLAGS = -p
VERSION  = 1.0.0
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.apptuckerbox.com
ICON	 = http://www.webos-internals.org/images/6/65/Icon_Swagman.png
MINWEBOSVERSION = 1.4.0
DESCRIPTION = Your Apps On Your Devices. App Tuckerbox feed access is currently only available to qualified beta testers. If you have purchased at least 50 apps you receive automatic qualification. Please ensure your system clock is correct before attempting to register.
CHANGELOG = \
1.0.0: First Public Release.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/2/28/Apptuckerbox_ss1.png\",\
\"http://www.webos-internals.org/images/f/f9/Apptuckerbox_ss2.png\",\
\"http://www.webos-internals.org/images/c/c6/Apptuckerbox_ss3.png\",\
\"http://www.webos-internals.org/images/3/37/Apptuckerbox_ss4.png\",\
\"http://www.webos-internals.org/images/e/ee/Apptuckerbox_ss5.png\",\
\"http://www.webos-internals.org/images/e/ed/Apptuckerbox_ss6.png\",\
\"http://www.webos-internals.org/images/9/93/Apptuckerbox_ss7.png\",\
\"http://www.webos-internals.org/images/7/7a/Apptuckerbox_ss8.png\",\
\"http://www.webos-internals.org/images/1/1e/Apptuckerbox_ss9.png\",\
\"http://www.webos-internals.org/images/c/cb/Apptuckerbox_ss10.png\" ]

SRC_GIT = git@git.webos-internals.org:applications/apptuckerbox.git

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
	rm -rf build/src/bin build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/src ; \
	  ${MAKE} VERSION=${VERSION} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} \
	  clobber apptuckerbox \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/apptuckerbox build/$*/usr/palm/applications/${APP_ID}/bin/com.apptuckerbox.service
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

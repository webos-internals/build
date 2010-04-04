NAME     = preware-alpha
TITLE	 = Preware Alpha
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.9.56
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
ICON	 = http://www.webos-internals.org/images/e/e4/Icon_Preware.png
DESCRIPTION = <b>This is the experimental alpha testing version of Preware.<br>You probably do not want to install this version.</b><br>The revolutionary webOS on-device installer capable of installing advanced homebrew applications, themes, patches, services and plugins.  Preware is also able to access official Palm App Catalog feeds.<br><b>Requires webOS 1.3.5 or later.</b>
CHANGELOG = 0.9.56: Based on Preware 0.9.34<br>0.9.55: New C-language based ipkgservice as part of the single stand-alone Preware package.  Has some nice things like download progress meters, but may be broken in some areas.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/3/36/Preware_ss1.png\",\
\"http://www.webos-internals.org/images/9/97/Preware_ss2.png\",\
\"http://www.webos-internals.org/images/6/6f/Preware_ss2a.png\",\
\"http://www.webos-internals.org/images/e/e6/Preware_ss2b.png\",\
\"http://www.webos-internals.org/images/8/8a/Preware_ss3.png\",\
\"http://www.webos-internals.org/images/a/a1/Preware_ss4.png\",\
\"http://www.webos-internals.org/images/2/28/Preware_ss5.png\",\
\"http://www.webos-internals.org/images/e/e1/Preware_ss6.png\",\
\"http://www.webos-internals.org/images/5/55/Preware_ss7.png\",\
\"http://www.webos-internals.org/images/9/94/Preware_ss8.png\",\
\"http://www.webos-internals.org/images/e/ea/Preware_ss9.png\",\
\"http://www.webos-internals.org/images/b/bc/Preware_ss10.png\",\
\"http://www.webos-internals.org/images/7/75/Preware_ss11.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/preware.git

IPKGSERVICE = org.webosinternals.ipkgservice

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	sed -i.orig \
		-e 's/"title": ".*"/"title": "${TITLE}"/g' \
		-e 's/"id": ".*"/"id": "${APP_ID}"/g' \
		-e 's/"version": ".*"/"version": "${VERSION}"/g' \
		build/src/appinfo.json
	rm -f build/src/appinfo.json.orig
	sed -i.orig \
		-e 's/PID="org.webosinternals.preware"/PID="${APP_ID}"/g' \
		build/src/control/postinst
	rm -f build/src/control/postinst.orig
	sed -i.orig \
		-e 's/PID="org.webosinternals.preware"/PID="${APP_ID}"/g' \
		build/src/control/prerm
	rm -f build/src/control/prerm.orig
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built build/i686.built
	touch $@

build/i686.built: build/.unpacked
	rm -rf build/i686
	( cd build/src/src ; \
	  ${MAKE} VERSION=${VERSION} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/i686 \
	  CC=$(shell cd ../.. ; pwd)/toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-gcc \
	  clobber ipkgservice \
	)
	mkdir -p build/i686/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/i686/usr/palm/applications/${APP_ID}/
	rm -rf build/i686/usr/palm/applications/${APP_ID}/src
	mkdir -p build/i686/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/ipkgservice build/i686/usr/palm/applications/${APP_ID}/bin/${IPKGSERVICE}
	mkdir -p build/i686/etc/ipkg
	install -m 644 feeds/*.conf build/i686/etc/ipkg/
	touch $@

build/arm.built: build/.unpacked
	rm -rf build/arm
	( cd build/src/src ; \
	  ${MAKE} VERSION=${VERSION} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/armv7 \
	  CC=$(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-gcc \
	  clobber ipkgservice \
	)
	mkdir -p build/arm/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/arm/usr/palm/applications/${APP_ID}/
	rm -rf build/arm/usr/palm/applications/${APP_ID}/src
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/ipkgservice build/arm/usr/palm/applications/${APP_ID}/bin/${IPKGSERVICE}
	mkdir -p build/arm/etc/ipkg
	install -m 644 feeds/*.conf build/arm/etc/ipkg/
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

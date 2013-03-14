NAME     = preware-alpha
TITLE	 = Preware Alpha
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 2.0.1
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
ICON	 = http://www.webos-internals.org/images/e/e4/Icon_Preware.png
DESCRIPTION = <b>This is the experimental alpha testing version of Preware.<br>You probably do not want to install this version.</b><br>The revolutionary webOS on-device installer capable of installing advanced homebrew applications, themes, patches, services and plugins.  Preware is also able to access official Palm App Catalog feeds.<br><b>Requires webOS 1.3.5 or later.</b>
CHANGELOG = \
2.0.1: Fix issue with ipkgservice being overwritten with an OpenEmbedded based opkg based service in some cases. \
2.0.0: Preware Enyo2 re-write.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/a/aa/Preware_Alpha_ss4.png\",\
\"http://www.webos-internals.org/images/d/da/Preware_Alpha_ss3.png\",\
\"http://www.webos-internals.org/images/c/c3/Preware_Alpha_ss2.png\",\
\"http://www.webos-internals.org/images/c/c3/Preware_Alpha_ss1.png\",\
\"http://www.webos-internals.org/images/c/c3/Preware_Alpha_ss5.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://github.com/webOS-ports/preware.git

IPKGSERVICE = org.webosinternals.ipkgservice

CORDOVA_COMMIT = d2b10d925c858c270a4dbfab6d23f6311fe8d77f
.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}
build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	${MAKE}	SRC_FILE=https://raw.github.com/phonegap/phonegap/${CORDOVA_COMMIT}/lib/webos/lib/cordova.webos.js \
	LOCAL_FILE=cordova-${NAME}-${VERSION}.js download
	rm -rf build
	mkdir -p build/src
	mkdir -p build/src-predeploy
	tar -C build/src-predeploy -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	cd build/src-predeploy && node enyo/tools/deploy.js
	cp -r build/src-predeploy/deploy/src-predeploy/. build/src
	rm -rf build/src/bin build/src/*.script
#	rm -rf build
#	mkdir -p build/src
#	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	cp -rf build/src-predeploy/control build/src/
	cp -rf build/src-predeploy/dbus build/src/
	cp -rf build/src-predeploy/src build/src/
	cp build/src-predeploy/appinfo.json build/src/
	cp ${DL_DIR}/cordova-${NAME}-${VERSION}.js build/src/cordova.js
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

#.PHONY: build
#build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/src ; \
	${MAKE} VERSION=${VERSION} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} \
	clobber ipkgservice \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/ipkgservice build/$*/usr/palm/applications/${APP_ID}/bin/${IPKGSERVICE}
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

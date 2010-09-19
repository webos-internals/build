NAME     = drbattery
TITLE	 = Dr.Battery
APP_ID   = de.somline.${NAME}
SIGNER   = de.somline
BLDFLAGS = -p
VERSION  = 0.1.2
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.forums.precentral.net/homebrew-apps/260947-dr-battery.html
ICON	 = http://www.somline.de/drbattery/icon_drbattery.png
MINWEBOSVERSION = 1.4.0
DESCRIPTION = Dr. Battery is an analyzing and recalibrating app for your battery.<br>Get the true capacity your battery can hold.<br>Recalibrate your battery.<br>Get reliable info about remaining runtime<br>Repair your 20% drop 0% problem<br>Try to squeeze out more of your battery
CHANGELOG = \
<h2>Change Log</h2><h3>Version 0.1.2</h3><b>Health Scene</b><ul><li>Tap and hold to change the health value</li><li>Tap and hold to change the Manufacturer Rating (needs secret code to enable)</li></ul><b>Calibrate Scene</b><ul><li>Changing the calibration start voltage possible in appmenu</li><li>Fixed bug alert connect charger now doesn&#39;t disappear</ul><b>Service</b><ul><li>Rewritten in C and bundled with the app</li><li>All battery values read from the registers instead of driver files</li><li>Bug in SetManufacturer Rating fixed</li></ul><h3>Version 0.1.1</h3>Initial public release
SCREENSHOTS = [\
\"http://www.somline.de/drbattery/images/drbattery_health.png\",\
\"http://www.somline.de/drbattery/images/drbattery_calibrate.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/drbattery.git

DRBATTERYSERVICE = de.somline.drbattery

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
	sed -i.orig \
		-e 's/"title": ".*"/"title": "${TITLE}"/g' \
		-e 's/"id": ".*"/"id": "${APP_ID}"/g' \
		-e 's/"version": ".*"/"version": "${VERSION}"/g' \
		build/src/appinfo.json
	rm -f build/src/appinfo.json.orig
	sed -i.orig \
		-e 's/PID="de.somline.drbattery"/PID="${APP_ID}"/g' \
		build/src/control/postinst
	rm -f build/src/control/postinst.orig
	sed -i.orig \
		-e 's/PID="de.somline.drbattery"/PID="${APP_ID}"/g' \
		build/src/control/prerm
	rm -f build/src/control/prerm.orig
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
	  clobber drbattery \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/drbattery build/$*/usr/palm/applications/${APP_ID}/bin/${DRBATTERYSERVICE}
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

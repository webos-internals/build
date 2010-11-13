NAME     = preware
TITLE	 = Preware
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 1.4.4
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
ICON	 = http://www.webos-internals.org/images/e/e4/Icon_Preware.png
MINWEBOSVERSION = 1.4.0
DESCRIPTION = The revolutionary webOS on-device installer capable of installing advanced homebrew applications, themes, patches, kernels, services and plugins. Preware is also able to access official Palm App Catalog, Web Distribution and Beta Distribution feeds.<br><b>Requires webOS 1.4.0 or later</b>.
CHANGELOG = \
1.4.4: Updated the version check to support future webOS versions.<br>\
1.4.2: Added Category as a blacklist option.<br>\
1.4.1: Added a Changelog button to the Help scene.<br>\
1.4.0: Added help to preferences scene. Fixed swipe-to-delete bug in blacklist. Updated Italian translations (courtesy of Darkmagister). Added Get Info button to package install scene. Added Send button to ipkg log scene. Fixed bug when loading large package descriptions.<br>\
1.3.8: Updated French translations (courtesy of Yannick LE NY).<br>\
1.3.6: Preware now supports installation of application package files (.ipk files) directly from URLs, email attachments, and local files. Also supported are Send to Preware links on homebrew application gallery and news websites (this requires the Neato! application to also be installed). If Preware continually asks you about file associations on every single launch, even after you have answered Yes to the questions it asks, then you may have a damaged file association table and will need to run the Emergency MimeTable Reset tool and then reboot to repair it.<br>\
1.3.5: Updated German translations.<br>\
1.3.3: Always ask the user before modifying the file association list.<br>\
1.3.1: Check whether Preware is the default application for handling packages, and advise the user if it is not.<br>\
1.3.0: Added Preware to the Default Applications list to allow for installing packages from email messages and the browser.<br>\
1.2.9: Fixed the Saved Package List swipe to delete bug.<br>\
1.2.8: Open the My Applications app catalog screen when multiple app catalog applications need updating.<br>\
1.2.7: Fixed the Install Package problem when running on the emulator.<br>\
1.2.6: Remove most of the curl download progress messages from the ipkg log (this fixes a buffer overrun crash).<br>\
1.2.5: Added Ask At Launch option to update preference. Added Blacklist. German Translation updates. Fixed update banner problem. Fixed package with too many dependent packages problem.<br>\
1.2.4: Added support for MinWebOSVersion, DeviceCompatibility and PreActionMessage package attributes.<br>\
1.2.3: Enable the Install Package feature to also work for incorrectly formatted filenames.<br>\
1.2.1: Robustified the Install Package feature - will now run post-install scripts for all correctly formatted filenames (packageid_version_arch.ipk).<br>\
1.2.0: Added Install Package functionality, allowing installation of packages from URLs and local files. Moved Saved Package List from the main screen to the app menu.<br>\
1.1.7: Added support for Kernel Modules.<br>\
1.1.5: Use a gentler reboot procedure to allow open files to be flushed to disk.<br>\
1.1.4: Fixed a subtle bug in the packaging scripts. No functional changes.<br>\
1.1.3: Fixed hang on package download failures.<br>\
1.1.2: Added support for the ENABLE_TESTING_FEEDS Meta-Doctor feature. Removed the tag line about eventually reaching 1.0. Minor French translation updates, courtesy of Yannick LE NY.<br>\
1.1.1: Added languages field in package descriptions. Added preference to only show packages with English descriptions.<br>\
1.1.0: Now defaults (selectable by a preference option) to using an alternative installation method to avoid the webOS 1.4 rescan bug which closes and stops notifications from your phone, email and messaging applications. Updated German and French translations, courtesy of Markus Leutwyler and Yannick LE NY. Fixed deletion of disabled feeds. Added service version number to the ipkgservice API. Robustified the service upgrade process.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/3/36/Preware_ss1.png\",\
\"http://www.webos-internals.org/images/d/d5/Preware_ss1a.png\",\
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

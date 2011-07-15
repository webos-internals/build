NAME     = preware
TITLE	 = Preware
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 1.7.2
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Preware
ICON	 = http://www.webos-internals.org/images/e/e4/Icon_Preware.png
MINWEBOSVERSION = 1.4.0
DESCRIPTION = The revolutionary webOS on-device installer capable of installing advanced homebrew applications, themes, patches, kernels, services and plugins.<br><b>Requires webOS 1.4.0 or later</b>.
CHANGELOG = \
1.7.2: Replaced the word phone with the word device in all messages.<br>\
1.7.1: Fixed fullscreen screenshot resizing on touchpad rotate (courtesy of Appsotutely). Fixed dependent packages spinner location (courtesy of chpwn).<br>\
1.7.0: Rolled up all the beta release features for a TouchPad-compatible public release.<br>\
1.6.8: Enabled back tap on header for all devices.<br>\
1.6.7: Fixed full-screen formatting of ipkg log screen.<br>\
1.6.6: Preware is now fully compatible with the TouchPad, using the full screen area.<br>\
1.6.5: Now useable on devices without a back gesture. Set the wget user-agent to Preware when retrieving indexes and packages.<br>\
1.6.4: Fixed a problem when loading the saved packages list.<br>\
1.6.3: WebOS Internals has been formally notified by Richard Kerris (HP Vice President of Worldwide Developer Relations) that open access to the webOS app catalog feed (including the beta and web feeds) is no longer available to third party developers or applications. Please direct any questions about this decision (which is final and permanent) to HP, not to WebOS Internals. Removed all HP webOS app catalog feeds from new installations of Preware.<br>\
1.6.2: Added the clock themes feed (disabled by default).<br>\
1.6.0: webOS 2.x Just Type integration. Fixed package list ordering bug. Layout fixes for Pixi/Veer.<br>\
1.5.9: Fixed parse errors resulting from packages with very large descriptions. Fixed problems with updates to app catalog apps.<br>\
1.5.8: Moved blacklisting to feed load to speed up listing. Suggests a reload after changing the blacklist. Fixed homebrew feed/catalog feed same appid bug.<br>\
1.5.7: Added check to make sure package has a title before trying to search it.<br>\
1.5.6: Removed support for Visibility feed value - use a category filter to exclude Unavailable packages if desired.<br>\
1.5.5: Added support for Visibility feed value. Fix display of screenshots from devices with a different resolution. Test fix for custom feed on network with no internet connection. Style updates for pre3 screen size.<br>\
1.5.4: Updated French translations (courtesy of Clément).<br>\
1.5.3: Reinstated banner notification of manual saved package list update.<br>\
1.5.2: Check if package dates are actually dates. Removed banner notification of saved package list being saved.<br>\
1.5.1: Added support for optware testing feeds.<br>\
1.5.0: You must upgrade to this version for full webOS 2.0 compatibility.<br>\
1.4.9: Better compatibility with unknown future webOS versions.<br>\
1.4.8: Now calls the correct software manager updates screen on webOS 2.0.<br>\
1.4.7: Fixed update, install and remove status messages on webOS 2.0.<br>\
1.4.6: New App Catalog theme preferences thanks to Garrett92C. Added support for MaxWebOSVersion in the feeds.<br>\
1.4.5: Added support for identifying when running on a Pre 2 device.<br>\
1.4.4: Updated the version check to support future webOS versions.<br>\
1.4.2: Added Category as a blacklist option.<br>\
1.4.1: Added a Changelog button to the Help scene.<br>\
1.4.0: Added help to preferences scene. Fixed swipe-to-delete bug in blacklist. Updated Italian translations (courtesy of Darkmagister). Added Get Info button to package install scene. Added Send button to ipkg log scene. Fixed bug when loading large package descriptions.<br>\
1.3.8: Updated French translations (courtesy of Yannick LE NY).<br>\
1.3.6: Preware now supports installation of application package files (.ipk files) directly from URLs, email attachments, and local files. Also supported are Send to Preware links on homebrew application gallery and news websites (this requires the Neato! application to also be installed). If Preware continually asks you about file associations on every single launch, even after you have answered Yes to the questions it asks, then you may have a damaged file association table and will need to run the Emergency MimeTable Reset tool and then reboot to repair it.
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
	rm -rf build/src/bin build/src/*.script
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

NAME     = impostah
TITLE    = Impostah
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.9.20
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Impostah
ICON	 = http://www.webos-internals.org/images/a/aa/Tux_Imposter.png
DESCRIPTION = Impostah is an app for those who know what do to with it. It does many things, most of which are too complex to explain in this short description.
MINWEBOSVERSION = 1.4.0
CHANGELOG = \
0.9.20: Added chameleonic capabilities.<br>\
0.9.19: Fixed TouchPad 3.0.4 activation issues.<br>\
0.9.18: Enabled activation scene for 1.4.5 devices.<br>\
0.9.17: Enabled device profile, palm profile and app catalog information for 1.4.5 devices.<br>\
0.9.16: Added the ability to display app catalog device and session information.<br>\
0.9.15: Added the ability to show all your purchased apps.<br>\
0.9.14: Added the ability to delete all items in a database.<br>\
0.9.13: Added support for Australian app catalog activation.<br>\
0.9.12: Modify the device information passed during activation for the Pre 3.<br>\
0.9.11: Purge cleared overrides.<br>\
0.9.10: Purge deleted overrides.<br>\
0.9.9: Handle missing locationHost information correctly.<br>\
0.9.8: Restart the UpdateDaemon on locationHost change.<br>\
0.9.7: Fixed an account server URL caching bug.<br>\
0.9.6: Fixed a profile merging bug.<br>\
0.9.5: Added the ability to set the locationHost system preference.<br>\
0.9.4: Added the ability to list all devices registered with your HP webOS account.<br>\
0.9.3: Added the ability to list all installed app catalog apps.<br>\
0.9.2: Now useable on devices without a back gesture.<br>\
0.9.1: Improved the activation scene user interface.<br>\
0.9.0: Improved the accounts scene user interface.<br>\
0.8.9: Added the ability to delete accounts.<br>\
0.8.8: Added the ability to delete database records.<br>\
0.8.7: Fixed icon tap handlers for json load and save scenes.<br>\
0.8.6: Fixed the app catalog button enablement.<br>\
0.8.5: Now useable on devices without a back gesture (tap the top-left icon instead).<br>\
0.8.4: Added the ability to check promo code status.<br>\
0.8.3: Improved the activation scene button labels.<br>\
0.8.2: Simplified the activation scene user interface.<br>\
0.8.1: Added automatic MCC and MNC override for activation.<br>\
0.8.0: Added the language and country selectors for profile creation. Added the activation scene (split from the palm profile scene). Added the ability to check email availability. Added the ability to override the MCC and MNC, without a SIM inserted.<br>\
0.7.0: Added the ability to install free (not paid) geo-restricted apps.<br>\
0.6.2: Added load and save for JSON overrides files.<br>\
0.6.1: Refresh the device profile when exiting the overrides scene. Improved the overrides user interface.<br>\
0.6.0: Added device profile and palm profile overrides. Worked around the fatal webOS 2.x db permissions bug. Remove and reinstall Impostah *twice* to fix it.<br>\
0.5.6: Fixed the palm profile token expiry.<br>\
0.5.5: Added the ability to restore from backups.<br>\
0.5.4: Added the ability to display backup manifests.<br>\
0.5.3: Added debugging of the web service requests and responses.<br>\
0.5.2: Added the ability to create a new Palm Profile.<br>\
0.5.1: Added the ability to display your registered credit card info.<br>\
0.5.0: Added the ability to change your Palm Profile without erasing the device.<br>\
0.4.4: Added Palm Profile to Device Info scene, including the ability to reset it.<br>\
0.4.3: Removed allowed character restrictions on impersonate method parameters.<br>\
0.4.2: Added support for better display of app cookies.<br>\
0.4.1: Implemented access authorisation checking.<br>\
0.4.0: Enable a subset of features for webOS 1.4.5.<br>\
0.3.8: Added support for app databases.<br>\
0.3.7: Added support for app cookies.<br>\
0.3.6: Added support for web cookies.<br>\
0.3.5: Do not capitalise JSON field names.<br>\
0.3.4: Added structured display of JSON data.<br>\
0.3.3: Added support for app catalog exploration.<br>\
0.3.2: Added support for reporting the telephony platform.<br>\
0.3.1: Added support for reporting the device profile.<br>\
0.3.0: Added support for connection exploration.<br>\
0.2.9: Dual column main scene.<br>\
0.2.8: Added support for permission exploration.<br>\
0.2.7: Added support for application exploration.<br>\
0.2.6: Added support for account exploration.<br>\
0.2.5: Fixed a bug in the query list.<br>\
0.2.4: Added a query and item display scenes.<br>\
0.2.3: Added a better list selector.<br>\
0.2.2: Added support for keystore exploration.<br>\
0.2.1: Revamped the activity exploration backend.<br>\
0.2.0: Revamped the database exploration backend.<br>\
0.1.1: Strip comments from JSON files before parsing.<br>\
0.1.0: Revamped the database exploration scene.<br>\
0.0.8: Added support for multiple database locations.<br>\
0.0.7: Set appropriate defaults for all selections.<br>\
0.0.6: Added support for activity exploration.<br>\
0.0.5: Added support for backup exploration.<br>\
0.0.4: Added support for temporary databases.<br>\
0.0.3: Added upstart script.<br>\
0.0.2: Lists DB kinds.<br>\
0.0.1: Initial skeleton.

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b6/Impostah_ss1.png\", \
\"http://www.webos-internals.org/images/a/a3/Impostah_ss2.png\", \
\"http://www.webos-internals.org/images/6/6d/Impostah_ss3.png\", \
\"http://www.webos-internals.org/images/9/99/Impostah_ss4.png\", \
\"http://www.webos-internals.org/images/d/d8/Impostah_ss5.png\", \
\"http://www.webos-internals.org/images/f/f4/Impostah_ss6.png\", \
\"http://www.webos-internals.org/images/5/5e/Impostah_ss7.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://github.com/wosigh/impostah.git

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
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
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

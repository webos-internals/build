NAME     = openssl-updater
TITLE	 = OpenSSL Updater
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.9.8-6
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = https://github.com/tgaillar/OpenSSL-Updater/wiki
ICON	 = https://github.com/tgaillar/OpenSSL-Updater/raw/master/icon_splash.png
MINWEBOSVERSION = 2.0.0
DESCRIPTION = Update system-installed OpenSSL, directly patching the binaries (not to be confused with the optware version that gets installed in /opt).<br><br>Simply uninstall this application to return your device to its original, unpatched state.<br><br><b>A system reboot is required after installation/removal, as running programs will see their OpenSSL dynamic libraries change (and most certainly crash). This is automagically performed by the end of the installation process.</b><br>
CHANGELOG = \
0.9.8-6: Reset error indicator in post-install script when MD5 sum checks have failed and FORCE_INSTALL=1, or the backup operation will just stupidly fail...<br>\
0.9.8-5: Forcing update installation for now (it looks like some devices -- 3.0.[45] TP -- have discrepancies between installed OpenSSL files and their reference checksum in /md5sums.gz, an OTA issue???)<br>\
0.9.8-4: Latest OpenSSL release (OpenSSL 0.9.8zg 11 Jun 2015) with sha256WithRSAEncryption digest capability (needed for GMAIL and a few others so Root CA can be digested -- again!), libssl updated with reverse-engineered patch to match (one of never published) HP/Palm patch (at least for mojomail-eas so it can validate certificates)<br>\
0.9.8-3: Original OpenSSL release for webOS 2.x/3.x devices (OpenSSL 0.9.8k 25 Mar 2009) with libssl reverse-engineered patch to match (one of never published) HP/Palm delivered version, a proof-of-concept to demonstrate mojomail-eas can validate certificates (Exchange Active Sync)<br>\
0.9.8-2: Original OpenSSL release for webOS 2.x/3.x devices (OpenSSL 0.9.8k 25 Mar 2009), only to demonstrate absence of (never published) HP/Palm patch, needed at least so mojomail-eas can validate certificates (Exchange Active Sync)<br>\
0.9.8-1: Original OpenSSL release for webOS 1.4.x devices (OpenSSL 0.9.8j 07 Jan 2009), for future investigation work in case of missing/unpublished Palm patch
SCREENSHOTS = [\
\"https://github.com/tgaillar/OpenSSL-Updater/raw/master/icon_splash.png\",\
\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/OpenSSL_logo.png/320px-OpenSSL_logo.png\"\
]
LICENSE  = GPL v2 Open Source

MAINTAINER = Webos Internals <webos-internals.org>, Thibaud Gaillard <thibaud.gaillard@gmail.com>

SRC_GIT = git://github.com/tgaillar/OpenSSL-Updater.git

ARCH_LIST = i686 armv7 armv6

.PHONY: package
package: $(foreach arch,${ARCH_LIST},ipkgs/${APP_ID}_${VERSION}_${arch}.ipk)
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
		-e 's/PID="org.webosinternals.openssl-updater"/PID="${APP_ID}"/g' \
		build/src/control/postinst
	rm -f build/src/control/postinst.orig
	sed -i.orig \
		-e 's/PID="org.webosinternals.openssl-updater"/PID="${APP_ID}"/g' \
		build/src/control/prerm
	rm -f build/src/control/prerm.orig
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: $(foreach arch,${ARCH_LIST},build/${arch}.built-${VERSION})
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/src ; \
	  ${MAKE} realclean stage ARCH="$*" STAGING_DIR=${STAGING_DIR_$*} CROSS_COMPILE=${CROSS_COMPILE_$*} CC="${CROSS_COMPILE_$*}gcc" ; \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/install/usr/bin
	install -m 755 build/src/src/build/src/apps/openssl build/$*/usr/palm/applications/${APP_ID}/install/usr/bin
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/install/usr/lib
	install -m 755 build/src/src/build/src/libcrypto.so.* build/$*/usr/palm/applications/${APP_ID}/install/usr/lib
	install -m 755 build/src/src/build/src/libssl.so.* build/$*/usr/palm/applications/${APP_ID}/install/usr/lib
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/src
	install -m 644 build/src/src/Makefile build/$*/usr/palm/applications/${APP_ID}/src
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

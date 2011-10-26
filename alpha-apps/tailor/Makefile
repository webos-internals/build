NAME     = tailor
TITLE    = Tailor
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.0.9
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Tailor
ICON	 = http://www.webos-internals.org/images/3/36/Icons_Tailor.png
DESCRIPTION = Tailor allows you to tailor the storage on your device.  This alpha release only supports unmount partition, check fileystem, mount parition and resizing of the media paritition (which is a potentially destructive operation).  All other operations are simulated.
MINWEBOSVERSION = 2.1.0
CHANGELOG = \
0.0.9: Added the ability to resize ext3fs partitions. This is a potentially destructive operation. You have been warned.<br>\
0.0.8: New improved icon.<br>\
0.0.7: Added the ability to resize the media partition. This is a potentially destructive operation. You have been warned.<br>\
0.0.6: Support different block sizes (Android uses 1KiB instead of 4KiB).<br>\
0.0.5: Fixed the post-install and pre-remove scripts.<br>\
0.0.4: Added the ability to unmount items from inside jails.<br>\
0.0.3: Highlight selected partition, and update filesystem sizes during simulations.<br>\
0.0.2: Alpha release to check UI workflows and installation pipecleaning.<br>\
0.0.1: Initial skeleton.

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/f/fa/Tailor_ss1.png\", \
\"http://www.webos-internals.org/images/d/d9/Tailor_ss2.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/tailor.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src/sbin build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/all/usr/palm/applications/${APP_ID}/
	rm -rf build/all/usr/palm/applications/${APP_ID}/src
	mkdir -p build/all/usr/palm/services/${APP_ID}.node
	cp -r build/src/node/* build/all/usr/palm/services/${APP_ID}.node/
	mkdir -p build/all/usr/palm/packages/${APP_ID}
	cp -r build/src/package/* build/all/usr/palm/packages/${APP_ID}/
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

NAME     = ubuntu-natty-chroot
TITLE    = Ubuntu 11.04 Chroot
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 11.04-1
TYPE	 = Linux Application
CATEGORY = Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/UbuntuChroot
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
DESCRIPTION = A minimal Ubuntu 11.04 chroot
CHANGELOG = \
11.04-1: Initial version.

SCREENSHOTS = [\
 ]
LICENSE  = GPL v2 Open Source

# Also requires upstart changes from:
# http://gyp.blogs.balabit.com/2011/01/using-upstart-in-a-chroot/
# http://git.balabit.hu/?p=gyp/upstart-dummy.git;a=summary

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk # ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p build
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} # build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	( cd build/$*/usr/palm/applications/${APP_ID} ; \
	  rootstock --no-root \
		--fqdn ${NAME} \
		--login webos \
		--password webos \
		--dist natty )
	mv build/$*/usr/palm/applications/${APP_ID}/armel-rootfs*.tgz \
		build/$*/usr/palm/applications/${APP_ID}/${NAME}.tgz 
	cp files/* build/$*/usr/palm/applications/${APP_ID}/
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 postinst build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build

TYPE = Linux Application
NAME = emergency-fstab-fixer
VERSION = 1.0.2
TITLE = Emergency Fstab Fixer
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = Install this package on your webOS device immediately after updating to webOS 1.4.5 to fix a Palm OTA bug in the /etc/fstab file. See <a href=http://developer.palm.com/distribution/viewtopic.php?f=70&t=7942>http://developer.palm.com/distribution/viewtopic.php?f=70&t=7942</a> and <a href=http://developer.palm.com/distribution/viewtopic.php?f=70&t=8109>http://developer.palm.com/distribution/viewtopic.php?f=70&t=8109</a> for more details about the bug.  This fix is only required when you OTA update to webOS 1.4.5 - if you use the webOS Doctor to install webOS 1.4.5 you are not affected.
APP_ID = org.webosinternals.${NAME}
SIGNER = org.webosinternals
MAINTAINER = WebOS Internals
CATEGORY = Utilities
ICON = http://www.webos-internals.org/images/4/4f/Epr.png
POSTINSTALLFLAGS = RestartDevice
MAXWEBOSVERSION = 1.9.9

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk
include ../../support/download.mk


.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p build
	touch $@

build/all/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	cp postinst build/all/CONTROL/postinst
	chmod ugo+x $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/all
	touch $@

.PHONY: clobber
clobber::
	rm -rf build

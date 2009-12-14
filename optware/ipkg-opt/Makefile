NAME     = ipkg-opt
TITLE	 = Optware Advanced Linux Command Line Installer
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
VERSION  = 0.99.163-12
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Optware
TYPE	 = Optware
CHANGELOG = 0.99.163-12: Fixed native feed.<br>0.99.163-11: Initial release
DESCRIPTION = This package installs the ipkg-opt command line program which allows installation of advanced Linux command line utilities from the Optware repositories.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/2/27/Icon_PrewareAlt.png

SRC_OPTWARE = ${NAME}_0.99.163-10

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/opt/etc
	touch $@

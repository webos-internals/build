NAME     = tar
TITLE	 = GNU Tar
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
VERSION  = 1.22-3
HOMEPAGE = http://www.gnu.org/software/tar/
DESCRIPTION = This package is simply the GNU Tar utility, cross-compiled and packaged up in a form such that it can be used by other packages.
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/5/5f/Icon_WebOSInternals_Base_Optware.png

SRC_OPTWARE = ${NAME}_1.22-2

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	[ -e build/$*/opt/bin/${NAME} ] || mv build/$*/opt/bin/gnutar build/$*/opt/bin/${NAME}
	rm -rf build/$*/opt/libexec build/$*/opt/share build/$*/opt/sbin
	touch $@

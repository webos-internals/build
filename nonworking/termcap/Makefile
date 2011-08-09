NAME     = termcap
TITLE    = termcap
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 1.3.1-2
VERSION  = 1.3.1-3
HOMEPAGE = http://www.gnu.org/software/termutils/termutils.html
DESCRIPTION = Termcap (terminal capability) is a software library and database used on Unix-like computers. It enables programs to use display computer terminals in a device-independent manner
CHANGELOG = 1.3.1-3: Fixed postinstall locations for preware installation.  1.3.1-2: initial Preware Version to support screen.
TYPE     = Optware
CATEGORY = Libraries
ICON     = http://www.webos-internals.org/images/c/c6/Icon_Screen.png


SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/lib
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/include
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/etc
	touch $@

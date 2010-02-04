NAME     = ipkg-opt
TITLE	 = Optware Advanced Linux Command Line Installer
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 0.99.163-10
VERSION  = 0.99.163-15
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Optware
TYPE	 = Optware
CHANGELOG = 0.99.163-15: Fixed update-alternatives handling for cryptofs compatibility.
CHANGELOG += <br>0.99.163-14: Made compatible with the Emergency Service Enabler to survive doctoring.
CHANGELOG += <br>0.99.163-12: Fixed native feed.
CHANGELOG += <br>0.99.163-11: Initial release
DESCRIPTION = This package installs the ipkg-opt command line program which allows installation of advanced Linux command line utilities from the Optware repositories.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/2/27/Icon_PrewareAlt.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/etc
	sed -i.orig -e 's|link=$$IPKG_OFFLINE_ROOT/|link=|' \
	  build/armv7/usr/palm/applications/mobi.optware.ipkg-opt/opt/bin/update-alternatives
	rm -rf build/armv7/usr/palm/applications/mobi.optware.ipkg-opt/opt/bin/update-alternatives.orig
	( cd build/$*/usr/palm/applications/${APP_ID}/opt/bin ; rm -f ipkg-opt )
	( cd build/$*/usr/palm/applications/${APP_ID}/opt/lib ; rm -f libipkg.so libipkg.so.0 )
	touch $@

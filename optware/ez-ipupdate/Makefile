NAME     = ez-ipupdate
TITLE	 = ez-ipupdate
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 3.0.11b7-2
VERSION  = 3.0.11.7-5
HOMEPAGE = http://www.webos-internals.org/wiki/Tutorials_Linux_DDNS_Update_Client_ez-ipupdate
TYPE	 = Optware
DESCRIPTION = ez-ipupdate is a small utility for updating your host name for any of the dynamic DNS services offered at:<ul><li>http://www.ez-ip.net</li><li>http://www.justlinux.com</li><li>http://www.dhs.org</li><li>http://www.dyndns.org</li><li>http://www.ods.org</li><li>http://gnudip.cheapnet.net</li><li>http://www.dyn.ca</li><li>http://www.tzo.com</li><li>http://www.easydns.com</li><li>http://www.dyns.cx</li><li>http://www.hn.org</li><li>http://www.zoneedit.com</li></ul>
CHANGELOG = 3.0.11.7-5: Made compatible with the Emergency Service Enabler to survive doctoring.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/5/5f/Icon_WebOSInternals_Base_Optware.png
DEPENDS  = 

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

build/armv7.built-${VERSION} : build/armv7.unpacked-${VERSION}
	rm -rf build/armv7/usr/palm/applications/${APP_ID}/opt/share
	mkdir -p build/armv7/etc/ppp/ip-up.d
	sed -e 's/%WAN%/ppp0/' files/ip-up > build/armv7/etc/ppp/ip-up.d/50mobi-optware-ez-ipupdate
	chmod 755 build/armv7/etc/ppp/ip-up.d/50mobi-optware-ez-ipupdate
	touch $@

build/armv6.built-${VERSION} : build/armv6.unpacked-${VERSION}
	rm -rf build/armv6/usr/palm/applications/${APP_ID}/opt/share
	mkdir -p build/armv6/etc/ppp/ip-up.d
	sed -e 's/%WAN%/rmnet0/' files/ip-up > build/armv6/etc/ppp/ip-up.d/50mobi-optware-ez-ipupdate
	chmod 755 build/armv6/etc/ppp/ip-up.d/50mobi-optware-ez-ipupdate
	touch $@

build/i686.built-${VERSION} : build/i686.unpacked-${VERSION}
	rm -rf build/i686/usr/palm/applications/${APP_ID}/opt/share
	mkdir -p build/i686/etc/ppp/ip-up.d
	sed -e 's/%WAN%/eth0/' files/ip-up > build/i686/etc/ppp/ip-up.d/50mobi-optware-ez-ipupdate
	chmod 755 build/i686/etc/ppp/ip-up.d/50mobi-optware-ez-ipupdate
	touch $@

include ../../support/optware.mk

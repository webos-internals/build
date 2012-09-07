NAME = $(shell basename $(shell pwd))
TITLE = Palm LunaSysMgr
DEVICE = touchpad
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
ICON = http://www.webos-internals.org/images/5/57/PalmLunaSysMgr.png
CATEGORY = Recovery
FORCE_INSTALL = 1
BLDFLAGS = -p
VERSION = 3.0.5-4
APPINFO_DESCRIPTION = Use this package to reinstall the official webOS ${WEBOS_VERSION} LunaSysMgr from Palm.<br>\
This package will refuse to operate on a device with an incompatible webOS version.<br>\
Note that only LunaSysMgr files are restored, and they will be forcibly overwritten regardless of current state.  No other files are modified in any way.<br>\
In particular, any other files modified by patches or other modifications will not be restored. You should contact the maintainer of such patches for recovery procedures.<br>\
On removal, this package does not modify any files, not does it restore any previous state of LunaSysMgr.  The sole purpose of this package is to install the official webOS ${WEBOS_VERSION} LunaSysMgr from Palm and to do nothing else.
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-4", "log" : [ "New icon" ] }, \
{ "version" : "${WEBOS_VERSION}-3", "log" : [ "Added LunaSysMgr upstart script" ] }, \
{ "version" : "${WEBOS_VERSION}-2", "log" : [ "Added lunaAnimations.conf" ] }, \
{ "version" : "${WEBOS_VERSION}-1", "log" : [ "Initial public release" ] } \
]

HOMEPAGE = http://opensource.palm.com
TYPE = OS Application

include ../../support/woce.mk
CATEGORY = Recovery

build/arm.built-${VERSION}: ${WEBOS_DOCTOR}
	rm -rf build/arm
	mkdir -p build/arm/usr/palm/applications/${APP_ID}/additional_files
	unzip -p $< resources/webOS.tar | \
	${TAR} -O -x -f - ./nova-cust-image-${CODENAME}.rootfs.tar.gz | \
	${TAR} -C build/arm/usr/palm/applications/${APP_ID}/additional_files/ -m -z -x -f - ./md5sums.gz ./usr/bin/LunaSysMgr ./etc/palm/lunaAnimations.conf ./etc/event.d/LunaSysMgr
	gunzip -f build/arm/usr/palm/applications/${APP_ID}/additional_files/md5sums.gz
	cp icon.png build/arm/usr/palm/applications/${APP_ID}/icon.png
	touch $@

build/.unpacked-${VERSION}:
	touch $@

build/arm/CONTROL/prerm:
	rm -f $@


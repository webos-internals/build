NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TITLE = gDial Pro Universal Integration
DESCRIPTION = This will make gDial Pro the default dialer and SMS app for contacts selected utilizing Universal Search within webOS. Warning: Not compatible with App Catalog version of gDial Pro.
CATEGORY = Phone
VERSIONS = 1.3.5-3 1.4.0-3 v1.4.1-1
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, com.palm.natebiz.gdial-pro

include ../modifications.mk

MAINTAINER = flpalmdev <nathan@gdialpro.com>
HOMEPAGE = http://gdialpro.com/

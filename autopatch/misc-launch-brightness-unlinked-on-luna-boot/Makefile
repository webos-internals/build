NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TITLE = Launch Brightness Unlinked on Luna Boot
DESCRIPTION = This patch makes zinge's app, Brightness Unlinked, start automatically in the background when the phone reboots, luna is restarted, or the phone is powered on.<br/><br/>Thanks zinge for the great app!<br/><br/>Brightness Unlinked, available through preware, must be installed for this patch work.
CATEGORY = Misc
VERSIONS = 1.3.5-21 1.4.0-10
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1 

include ../common.mk
DEPENDS := ${DEPENDS}, com.palm.app.brightnessunlinked
include ../modifications.mk

MAINTAINER = xenoph0be
HOMEPAGE = http://forums.precentral.net/webos-patches/226332-patch-persistent-brightness-unlinked.html
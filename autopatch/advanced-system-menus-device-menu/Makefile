NAME = $(shell basename $(shell pwd))
PATCH = advanced/${NAME}.patch
TITLE = Advanced System Menus - Device Menu
DESCRIPTION = * Requires Advanced System Menus Framework patch to function properly!<br/><br/>Removes date from the device menu and adds Device, Security, Network, Phone, Data and GPS control. Also slightly modifies the battery information shown in the device menu. Menu can be edited to remove items that are not wanted to be shown.
CATEGORY = Advanced
VERSIONS = 2.1.0-155 2.2.0-13
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/3/33/AdvancedSystemMenusDeviceMenu.png\",\"http://www.webos-internals.org/images/d/de/AdvancedSystemMenusDeviceMenuEdit.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = sconix
HOMEPAGE = http://forums.precentral.net/enlightened-linux-solutions/269207-patch-advanced-system-menus-2-x.html

POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS  = RestartDevice
POSTREMOVEFLAGS  = RestartDevice


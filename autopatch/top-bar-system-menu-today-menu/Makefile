NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = System Menu Today Menu
DESCRIPTION = Adds today menu in the center off top bar. Today menu offers a quick view of your calendar events for the current day and for the next day. Menu can be edited to show events only from certain calendars.<br/><br/>Depends: org.webosinternals.patches.top-bar-system-menu-initial-framework
CATEGORY = Top Bar
VERSIONS = 1.4.0-54 1.4.1-31 1.4.5-33
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [\
\"http://www.webos-internals.org\",\
\"http://www.webos-internals.org\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.patches.top-bar-system-menu-initial-framework
include ../modifications.mk

MAINTAINER = sconix
HOMEPAGE = http://forums.precentral.net/webos-patches/245440-patch-top-bar-system-menus-status-today-device-menus.html

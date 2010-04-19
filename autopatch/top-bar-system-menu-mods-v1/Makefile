NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = System Menu Mods v1
DESCRIPTION = Removes date and airplane mode that exist in mode and today system menus from the device menu and adds GPS and Data control. Also slightly modifies the battery information shown in the device menu.<br/><br/>Depends: org.webosinternals.patches.top-bar-system-menu-initial-framework
CATEGORY = Top Bar
VERSIONS = 1.4.0-39
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.patches.top-bar-system-menu-initial-framework
include ../modifications.mk

MAINTAINER = sconix
HOMEPAGE = http://forums.precentral.net/homebrew-apps/224544-mode-switcher.html
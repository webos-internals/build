NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = System Menu Mode Menu
DESCRIPTION = Adds mode menu to the left corner of the top bar. This is only useful if you have Mode Switcher installed. This menu enables changing of modes manually through the menu.<br/><br/>Depends: org.webosinternals.patches.top-bar-system-menu-initial-framework
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
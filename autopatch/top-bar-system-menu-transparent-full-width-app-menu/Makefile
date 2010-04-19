NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = System Menu Transparent Full Width App Menu
DESCRIPTION = Modifies app menu to be full width. This way it covers whole top bar preventing top bar menus pressed while app is in foreground. The background of the app menu is transparent so you can still see the top bar but can access the app menu by pressing anywhere on the top bar.<br/><br/>Depends: org.webosinternals.patches.top-bar-system-menu-initial-framework
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
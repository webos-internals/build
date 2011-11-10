NAME = $(shell basename $(shell pwd))
PATCH = advanced/${NAME}.patch
TITLE = Advanced System Menus - Power Menu
DESCRIPTION = * Requires Advanced System Menus Framework patch to function properly!<br/><br/>Makes power off menu to be configurable. The shown actions can be selected from airplane mode toggle, device sleep toggle, shutdown device action, restart device action and restart luna action.
CATEGORY = Advanced
VERSIONS = 2.1.0-204 2.2.0-77
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/e/ef/AdvancedSystemMenusPowerMenu.png\",\"http://www.webos-internals.org/images/9/98/AdvancedSystemMenusPowerMenuEdit.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = sconix
HOMEPAGE = http://forums.precentral.net/enlightened-linux-solutions/269207-patch-advanced-system-menus-2-x.html

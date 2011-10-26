NAME = $(shell basename $(shell pwd))
PATCH = browser/${NAME}.patch
TWEAKS =
TITLE = Private Browsing
DESCRIPTION = Adds an option to the webOS browser that will prevent adding new items to the browser history.  It can be toggled with a menu item.  When enabled the browser toolbar will be turned red to make it obvious that it is on.The default behavior for a new card can be set using Tweaks.  A card opened from an open card will inherit the setting from the original card instead of applying the default.This patch also adds google secure as a browser option.
CATEGORY = Browser
VERSIONS = 1.4.5-136 2.1.0-192 2.2.0-61 2.2.3-55 3.0.2-59 3.0.4-18
ICON = http://www.webos-internals.org/images/4/4a/Icon_WebOSInternals_Patches_Browser.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = minego (Micah N Gorrell)
HOMEPAGE = http://www.minego.net/patches/
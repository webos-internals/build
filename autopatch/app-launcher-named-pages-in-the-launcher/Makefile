NAME = $(shell basename $(shell pwd))
PATCH = app-launcher/${NAME}.patch
TITLE = Named Pages in the Launcher
DESCRIPTION = This patch adds a name to each page in the launcher. Hold the Orange key or gesture area and tap the header to rename a page. Tapping on the name header brings up a submenu for navigating directly to any named page. You can also move an app to another page by using a selector in the app's info dialog, summoned via Orange-tap on an app in the launcher. This patch works better with the 'app-launcher-enable-add-delete-pages' and 'app-launcher-gesture-tap-for-info-and-delete' patches, and may conflict with the 'app-launcher-wrap-pages' patch.
CATEGORY = App Launcher
VERSIONS = 1.3.5-18
ICON = http://www.webos-internals.org/images/b/b1/Icon_WebOSInternals_Patches_Applauncher.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/3/3d/App-launcher-named-pages-in-the-launcher-1.png\",\
\"http://www.webos-internals.org/images/8/8f/App-launcher-named-pages-in-the-launcher-2.png\",\
\"http://www.webos-internals.org/images/a/af/App-launcher-named-pages-in-app-launcher-3.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = lmorchard <l.m.orchard@pobox.com>
HOMEPAGE = http://forums.precentral.net/webos-patches/223826-patch-named-pages-app-launcher.html

NAME = $(shell basename $(shell pwd))
PATCH = browser/${NAME}.patch
TWEAKS =
TITLE = Add Search Suggestions to Web URL Bar
DESCRIPTION = This patch adds search suggestions to the list that pops up when you start entering terms into the URL bar in the Web browser app. Suggestions are appended to the end of bookmarks and histories that are found for the terms you entered, and is limited to 32 items total for the list. This patch does not contain the URLs for search suggestion, but merely the mechanisms to enable search suggestion in the browser. Please see the patch homepage for more details.
CATEGORY = Browser
VERSIONS = 3.0.5-43
ICON = http://www.webos-internals.org/images/4/4a/Icon_WebOSInternals_Patches_Browser.png
SCREENSHOTS = [ \"http://www.webos-internals.org\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = GMMan <yukaili.geek@gmail.com>
HOMEPAGE = http://forums.webosnation.com/hp-touchpad-homebrew/317887-patch-web-browser-search-suggestion-touchpad.html
NAME = $(shell basename $(shell pwd))
PATCH = browser/${NAME}.patch
TITLE = Multi Mod
DESCRIPTION = This will give the option to download or stream streamable files. It will also enable the display of the URL bar in landscape mode. Finally, it adds hotkey for page up/down and page bottom/top.
CATEGORY = Browser
VERSIONS = 1.3.5-3 1.4.0-16
ICON = http://www.webos-internals.org/images/4/4a/Icon_WebOSInternals_Patches_Browser.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/0/0d/Enable-browser-downloads-1.png\",\
\"http://www.webos-internals.org/images/0/02/Enable-browser-downloads-2.png\" ]
META_SUB_VERSION = 3

ifeq ("${VERSION}", "1.4.0-16")
DUMMY_VERSION=16
endif

include ../common.mk

include ../modifications.mk

MAINTAINER = fritos1406 <fritos1406@aim.com>, daventx, Mark Klein, drnull, Jason Robitaille
HOMEPAGE = http://forums.precentral.net/web-os-development/206908-autopatch-browser-multi-patch.html

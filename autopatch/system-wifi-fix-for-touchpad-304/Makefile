NAME = $(shell basename $(shell pwd))
PATCH = system/${NAME}.patch
TWEAKS =
TITLE = WiFi Fix for TouchPad 304
DESCRIPTION = TouchPad 3.0.4/5 Only. This patch fixes intermittent WiFi problems for SOME users, not all. All this patch does, is roll back the PmWiFiDhclient.conf file to version 3.0.2, which for some reason was changed for TouchPad 3.0.4/5 and Pre 3 2.2.4. YMMV.
CATEGORY = System
VERSIONS = 3.0.4-66 3.0.5-13
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = GuyFromNam <GuyFromNam@hotmail.com>
HOMEPAGE =
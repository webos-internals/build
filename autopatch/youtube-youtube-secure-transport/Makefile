NAME = $(shell basename $(shell pwd))
PATCH = youtube/${NAME}.patch
TWEAKS =
TITLE = YouTube Secure Transport
DESCRIPTION = This patches the Youtube app so that it requests data from gdata.youtube.com over HTTPS instead of HTTP. It also sets safeSearch to none as well as requesting the correct video format.
CATEGORY = YouTube
VERSIONS = 2.1.0-234 2.1.1-40 2.1.2-49 2.2.0-113 2.2.3-107 2.2.4-23
ICON = http://www.webos-internals.org/images/8/8b/Icon_WebOSInternals_Patches_Youtube.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = codecrumb
HOMEPAGE = twitter.com/warthogkernel
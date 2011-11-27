NAME = $(shell basename $(shell pwd))
PATCH = browser/${NAME}.patch
TWEAKS =
TITLE = Silence Missing Resource Handlers
DESCRIPTION = When accessing the Google Maps website on a Pre 3, the server returns objects which trigger an Unable To Handle Resource error. This patch silences those errors to give an uninterrupted Google Maps website experience.
CATEGORY = Browser
VERSIONS = 2.2.0-41 2.2.3-36
ICON = http://www.webos-internals.org/images/4/4a/Icon_WebOSInternals_Patches_Browser.png
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = WebOS Internals
HOMEPAGE =
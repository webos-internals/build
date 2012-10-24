NAME = $(shell basename $(shell pwd))
PATCH = google-maps/${NAME}.patch
TWEAKS =
TITLE = Maps Rebooting Patch
DESCRIPTION = When rebooting on some webos smartphones, the maps app reverts to the non-working Google Maps app. This patch fixes that. Requires Maps to be installed at time of this patch being installed. Will change Maps' id to 'com.palm.apps'.
CATEGORY = Google Maps
VERSIONS = 2.1.0-257 2.1.1-62 2.1.2-73 2.2.4-65
ICON = http://www.webos-internals.org/images/c/c3/Icon_WebOSInternals_Patches_SprintNav.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = jsking <justinscottking@gmail.com>
HOMEPAGE =
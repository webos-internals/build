NAME = $(shell basename $(shell pwd))
PATCH = camera/${NAME}.patch
TITLE = Launch Camera when Unlocked in Landscape
DESCRIPTION = Hold your phone the way you would hold a pocket camera. If you unlock your phone holding it this way, it will launch the camera app automatically.
CATEGORY = Camera
VERSIONS = 1.3.1-26 1.3.5-7
ICON = http://www.webos-internals.org/images/c/c5/Icon_WebOSInternals_Patches_Camera.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.patches.camera-capture-with-volume-keys
include ../modifications.mk

MAINTAINER = Mijoro
HOMEPAGE =

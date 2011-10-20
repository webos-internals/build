NAME = $(shell basename $(shell pwd))
PATCH = system/${NAME}.patch
FILES = system/${NAME}.tar.gz
BSPATCH = system/${NAME}.bspatch
BSFILE = /usr/lib/pulse-0.9.22/modules/module-palm-policy.so
TITLE = Enable PulseAudio Control
DESCRIPTION = <br/><br/>This patch enables controlling of pulseaudio over IPC connection. You need the PulseAudio Settings app to utilize this.
CATEGORY = System
VERSIONS = 2.2.0-45 3.0.2-45 3.0.4-4
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = 
ARCHITECTURE = armv7
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = sconix
HOMEPAGE = http://forums.precentral.net/webos-internals/301721-pulseaudio-settings.html

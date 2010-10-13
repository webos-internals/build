NAME = $(shell basename $(shell pwd))
PATCH = music-player/${NAME}.patch
TITLE = Music Player Remix No Shuffle On Resume Play
DESCRIPTION = When you click Resume Play on the main menu, it will resume playback with shuffle set to off.
CATEGORY = Music Player
VERSIONS = 1.4.5-79
ICON = http://www.webos-internals.org/images/d/df/Icon_WebOSInternals_Patches_Musicplayer.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, com.palm.app.musicplayerremix
include ../modifications.mk

MAINTAINER = Chris Mann <csmann19@gmail.com>
HOMEPAGE =

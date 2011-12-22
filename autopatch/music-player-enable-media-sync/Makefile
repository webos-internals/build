NAME = $(shell basename $(shell pwd))
PATCH = music-player/${NAME}.patch
TITLE = Enable Media Sync
DESCRIPTION = Enables Media Sync Option on WebOS 2.0.1 or Above<br/><br/>This patch does NOT work for Photos or Playlists, due to the way 2.x builds the Media Database.<br/><br/>This patch should be used for Music Transfer Only!<br/><br/>Phone restart is required.
CATEGORY = Music Player
VERSIONS = 2.0.0-37 2.0.1-64 2.1.0-18 2.1.1-22 2.1.2-31
ICON = http://www.webos-internals.org/images/d/df/Icon_WebOSInternals_Patches_Musicplayer.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/e/eb/Music-player-enable-media-sync-1.png\",\
\"http://www.webos-internals.org/images/4/47/Music-player-enable-media-sync-2.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = fxspec06 <bshado@charter.net>
HOMEPAGE = http://forums.precentral.net/web-os-development/276722-media-sync-webos-2-1-0-a-2.html

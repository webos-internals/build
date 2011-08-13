NAME = $(shell basename $(shell pwd))
PATCH = youtube/${NAME}.patch
TITLE = Video Downloads
DESCRIPTION = When going to the video information screen, when you tap the 'More' button, there will be an added option to download the video. The download progress will be displayed as notification popups. Once you leave that video info screen, the notifications will stop, though the video will continue downloading in the background. Videos get saved in mp4 format, playable in the video player and are saved to /media/internal/downloads/ with the name it was called on YouTube (truncated at 40 characters).
CATEGORY = YouTube
VERSIONS = 1.4.5-1 2.0.0-25 2.0.1-38 2.1.0-3
ICON = http://www.webos-internals.org/images/8/8b/Icon_WebOSInternals_Patches_Youtube.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/211623-patch-youtube-download-patch.html
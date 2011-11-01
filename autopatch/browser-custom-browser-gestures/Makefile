NAME = $(shell basename $(shell pwd))
PATCH = browser/${NAME}.patch
TWEAKS = browser/${NAME}.json
TITLE = Custom Browser Gestures
DESCRIPTION = **This update improves the handling of the back gesture. It's no longer possible to activate the back gesture when there is nothing to go back too.** This patch enables 12 configurable gesture areas. You can reconfigure the action for each gesture in Tweaks. The gestures activate by swiping in from the screen edges. Current supported actions: Back, Forward, New Card, Toggle Fullscreen, Toggle Action Bar, Bookmarks, History, Refresh, Disable. Gestures assigned to the top of the screen will only activate in fullscreen mode. A visual overlay option highlights each gesture quadrant.
CATEGORY = Browser
VERSIONS = 3.0.2-34 3.0.4-29
ICON = http://www.webos-internals.org/images/3/37/Icon_WebOSInternals_Patches_Plus_Browser.png
SCREENSHOTS = [ \"http://www.webos-internals.org\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = nightburn, Garrett92C
HOMEPAGE = http://forums.precentral.net/webos-patches/300661-patch-custom-browser-gestures-touchpad.html
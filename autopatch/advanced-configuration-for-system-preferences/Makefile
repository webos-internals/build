NAME = $(shell basename $(shell pwd))
PATCH = advanced/${NAME}.patch
TITLE = Advanced Configuration for System Preferences
DESCRIPTION = * Please note that this patch only works with default en_us locale.<br><br>* This patch conflicts with many other patches that provide the same functionality.<br><br>This patch adds the following configuration options:<br/><br/>- Configurable blink notification for phone, messaging and email apps.<br/><br/>- Configurable notification repeat for phone, messaging and email apps.<br/><br/>- Configurable notification vibration length for phone, messaging and email apps.<br/><br/>- Configurable speakerphone behavior for phone app.<br/><br/>- Configurable default and on call view for phone app.<br/><br/>- Configurable touchstone removal action for phone app.<br/><br/>- Configurable slider opening and closing actions for phone app.<br/><br/>- Configuration for handling messaging drafts.<br/><br/>- Per account messaging notifications settings.<br/><br/>- Per contact SMS ringtone configuration.<br/><br/>- Per contact call blocking / voicemail direction.<br/><br/>- Roam only option for voice roaming in phone services.<br><br>- Global state toggle for phone and location services.<br><br>- Showing of configured wifi networks even if they are out of range.<br/><br/>- Configurable haptic feedback in screen settings.<br><br>- Media volume changing in sound settings.<br><br>- Configurable alert and notification sound.<br><br>- Configurable low battery and charger notificaitons.<br><br>This patch also sets lowest brightness to 0 and adds more screen turn of times. Also the slider widgets in preferences are changed to show the value of the slider.
CATEGORY = Advanced
VERSIONS = 1.4.5-108
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/6/64/Advanced-configuration-for-system-preferences-1.png\",\
\"http://www.webos-internals.org/images/7/79/Advanced-configuration-for-system-preferences-2.png\",\
\"http://www.webos-internals.org/images/1/14/Advanced-configuration-for-system-preferences-3.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = sconix
HOMEPAGE = http://www.webos-internals.org/wiki/Patch:AdvancedConfigurations

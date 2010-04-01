NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TITLE = Call Duration in Call Log non-US Devices
DESCRIPTION = This will add an option in the Phone Preferences to enable or disable the displaying of Call Durations in the Call Log.<br/><br/>This is the non-US release. It DEPENDS on the 'Call Duration in Call Log' to be installed as well. If using Preware, this will be automatic. If installing from WOSQI, you MUST install it separately.<br/><br/>Yes = HIDE Call Durations.<br/>No = SHOW Call Durations.<br/><br/>NOTE: You MUST restart Luna (or your phone) after changing this setting for it to take place. If you have Package Manager Service installed (you should) you will be prompted to restart Luna when you toggle the switch.
CATEGORY = Phone
VERSIONS = 1.3.5-30 1.4.0-22 1.4.1-1
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/0/00/Phone-call-duration-in-call-log-non-us-devices-1.png\",\
\"http://www.webos-internals.org/images/c/c8/Phone-call-duration-in-call-log-non-us-devices-2.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.ipkgservice,org.webosinternals.patches.phone-call-duration-in-call-log
include ../modifications.mk

MAINTAINER = dBsooner
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2271061#post2271061

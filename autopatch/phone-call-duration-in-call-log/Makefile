NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TITLE = Call Duration in Call Log
DESCRIPTION = This will add an option in the Phone Preferences to enable or disable the displaying of Call Durations in the Call Log.<br/><br/>This is the US release.<br/><br/>Yes = HIDE Call Durations.<br/>No = SHOW Call Durations.<br/><br/>NOTE: You MUST restart Luna (or your phone) after changing this setting for it to take place. If you have Package Manager Service installed (you should) you will be prompted to restart Luna when you toggle the switch.
CATEGORY = Phone
VERSIONS = 1.3.5-29 1.4.0-18 1.4.1-1
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/f/fe/Phone-call-duration-in-call-log-1.png\",\
\"http://www.webos-internals.org/images/4/42/Phone-call-duration-in-call-log-2.png\",\
\"http://www.webos-internals.org/images/2/20/Phone-call-duration-in-call-log-3.png\" ]
META_SUB_VERSION = 2

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.ipkgservice
include ../modifications.mk

MAINTAINER = dBsooner
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2271061#post2271061

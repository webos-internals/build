NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TITLE = Call Duration in Call Log
DESCRIPTION = This will add an option in the Phone Preferences to enable or disable the displaying of Call Durations in the Call Log.<br/><br/>Off = Durations will show.<br/>On = Durations will be hidden.<br/><br/>NOTE: You MUST restart Luna (or your phone) after changing this setting for it to take place. So, you will need to install the patch, then change the setting to 'off' then restart the phone to commit the setting.
CATEGORY = Phone
VERSIONS = 1.3.5-4 1.4.0-17
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/f/fe/Phone-call-duration-in-call-log-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = dBsooner
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Phone_Show_Call_Duration_in_the_Call_Log
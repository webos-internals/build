NAME = $(shell basename $(shell pwd))
PATCH = sounds-and-alerts/${NAME}.patch
TITLE = TS Charge Alert Fix
DESCRIPTION = This is a workaround for the widely reported problem with some Touchstone docks where the device continuously pops up a 'Charging Battery' alert when the battery reaches 100%.<br /><br />NOTE: This is a workaround, not a complete fix! The root of the problem is faulty Touchstone hardware. You should go to the shop for a replacement. In the meantime, you can apply this patch which will suppress the 'Charging Battery' alert when charging on the Touchstone and battery reaches 100%. The alert will still pop-up normally (i.e. if not charging using Touchstone, or battery not yet at 100%)
CATEGORY = Sounds and Alerts
VERSIONS = 1.1.3-2 1.2.1-19 1.3.1-0 1.3.5-0
ICON = http://www.webos-internals.org/images/f/ff/Icon_WebOSInternals_Patches_Soundsandalerts.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
include ../modifications.mk

MAINTAINER = Tim Cheung <ahhh.tim@googlemail.com>
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_webOS_Workaround_for_Touchstone_Charging_Event_Problem

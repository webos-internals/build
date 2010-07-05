NAME = $(shell basename $(shell pwd))
PATCH = google-maps/${NAME}.patch
TITLE = Enable Verizon aGPS Server for Improved GPS
DESCRIPTION = ***This patch is for Verizon users only.***<br/><br/>I do not recommend installing it on a non-Verizon device.<br/><br/><br/>In typical Verizon shortsightedness, they have eliminated the ability of any applications other than Verizon Navigator to access aGPS. For most devices, this would be an annoyance, but the Pre is setup to be an aGPS device only out of the box (unless you do the QPST tweak that can be found on the PreCentral forums).<br/><br/>Thanks to Darthpooh, I believe I've tracked down the root cause of that, and created a work around for Verizon users. This patch--once installed--should allow Verizon users to acquire GPS coordinates in any app in the same time it'd take for Verizon Navigator to get it. And no jumping through hoops or workarounds required. Such as having to open Verizon Navigator to get Google Maps to work...or standing on your head while spinning counter clockwise on Monday (you don't want to see what you have to do on Tuesdays).<br/><br/><br/>So far I've updated the major programs that are accessing GPS. I'm fairly confidant in the following:<br/>Third party apps.<br/>GPS based off the global search.<br/>Notifcation based GPS lookups.<br/>GPS Diagnostic Screen<br/><br/>Programs/applications that I haven't touched:<br/>Photo GeoTagging
CATEGORY = Google Maps
VERSIONS = 1.4.0-44 1.4.1-15 1.4.2-1 1.4.3-1 1.4.5-1
ICON = http://www.webos-internals.org/images/c/c3/Icon_WebOSInternals_Patches_SprintNav.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Ebag333 <ebagola@gmail.com>
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2442211#post2442211

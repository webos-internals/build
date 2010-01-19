NAME = $(shell basename $(shell pwd))
PATCH = dangerous/${NAME}.patch
TITLE = Powersave Smartreflex 500MHz
DESCRIPTION = <font color="red"><b>!!!WARNING!!!</b></font> This patch is EXPERIMENTAL and should only be installed if you know what you are doing! <font color="red"><b>!!!WARNING!!!</b></font><br /><br />This patch enables SmartReflex powersaving. It sets the max CPU speed to 500Mhz. If you want to change this, edit /etc/event.d/powersave-smartreflex. Make sure you reboot after applying this patch for it to take effect. WARNING: Do not apply the CPU Scaling patch if you use this patch. It will cause your webOS device to crash.
CATEGORY = Dangerous
VERSIONS = 1.3.1-19 1.3.5-1 1.4.0-1
ICON = http://www.webos-internals.org/images/c/c6/Icon_Patch_Dangerous.png
SCREENSHOTS = 
META_SUB_VERSION = 1

include ../common.mk
include ../modifications.mk

MAINTAINER = jauderho
HOMEPAGE = http://forums.precentral.net/web-os-development/192181-stable-cpu-frequency-scaling-app-here.html

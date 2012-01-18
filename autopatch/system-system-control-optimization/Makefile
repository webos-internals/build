NAME = $(shell basename $(shell pwd))
PATCH = system/${NAME}.patch
TWEAKS =
TITLE = System Control Optimization
DESCRIPTION = This patch will modify the way that the linux kernel in webOS will handle memory optimisation for your device. This patch will modify the kernel to handle memory in a way that is better suited for a device that is constantly on and uses a solid state device for storage. This version is optimised for devices with 512mb or more of RAM (preplus/pre2/veer/pre3/touchpad)For legacy devices with 256mb of ram (Pre/Pixi/PixiPlus) please use the 'Legacy' version of the patch
CATEGORY = System
VERSIONS = 1.4.5-195 2.1.0-242 2.1.1-48 2.1.2-57 2.2.0-123 2.2.3-116 2.2.4- 3.0.2-93 3.0.4-62
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = mau <robmausser@gmail.com>
HOMEPAGE =
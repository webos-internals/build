NAME = $(shell basename $(shell pwd))
PATCH = system/${NAME}.patch
TWEAKS =
TITLE = System Control Optimisation -  Legacy Devices
DESCRIPTION = This patch will modify the way that the linux kernel in webOS will handle memory optimisation for your device. This patch will modify the kernel to handle memory in a way that is better suited for a device that is constantly on and uses a solid state device for storage. This version is optimised for legacy devices with 256mb of RAM (Pre/Pixi/PixiPlus)
CATEGORY = System
VERSIONS = 1.4.5-195 2.1.0-242 2.1.1-48 2.1.2-57 2.2.4-36
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = mau
HOMEPAGE =
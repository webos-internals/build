NAME = $(shell basename $(shell pwd))
PATCH = photos/${NAME}.patch
TITLE = Better Quicker Flicker
DESCRIPTION = Improved Photo-App: This Patch sets the Timeout till loading the HighRes-Image to 0.1 (instead of 1.2s). It loads MediumRes- instead of LowRes-Images (better Preview!). And it sets Timings to do the Zoom and Flicker quicker.<br/>Remark: During flickering along more images there come up black images (use Custom-Kernel to speed up your Pre!).<br/>Hint: Use PNG-Images instead of JPG! Because Jpeg may include Preview-Images, and with PNG the Order is by Filename (Jpeg? Nobody knows!).
CATEGORY = Photos
VERSIONS = 1.4.5-59
ICON = http://www.webos-internals.org/images/7/7d/Icon_WebOSInternals_Patches_Photos.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/8/83/Photos-better-quicker-flicker-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Fritz Amtmann <Fritz@Do-Ri.com>
HOMEPAGE = http://www.nexave.de/forum/p408100-fotos-ladezeit-nervt-nicht-mehr-so/.html

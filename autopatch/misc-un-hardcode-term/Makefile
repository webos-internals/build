NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TITLE = Un-Hardcode TERM
DESCRIPTION = Make TERM=vt100 a default instead of a hard coded absolute in /etc/profile. This way when you ssh in with PuTTY, or from a linux console, or from an xterm-alike, your terminal will 'just work' without you having to manually type TERM=something-appropriate every time you log in.
CATEGORY = Misc
VERSIONS = 1.3.1-22 1.3.5-1 1.4.0-1
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
include ../modifications.mk

MAINTAINER = bkw <brian@aljex.com>
HOMEPAGE =

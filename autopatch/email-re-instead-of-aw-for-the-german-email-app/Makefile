NAME = $(shell basename $(shell pwd))
PATCH = email/${NAME}.patch
TWEAKS =
TITLE = Re instead of AW For The German Email App
DESCRIPTION = This patch changes the German 'AW' (reply) and 'WG' (forward) in the subject-line to the standard 'Re' and 'Fwd'.It is especially helpful if your recipients have problems with threading in certain mail apps. It will also fix 'AW: Re:' chains in the subject line.
CATEGORY = Email
VERSIONS = 1.4.5-149 2.1.0-76 2.1.1-22 2.1.2-31 2.2.4-17 3.0.5-22
ICON = http://www.webos-internals.org/images/2/29/Icon_WebOSInternals_Patches_Email.png
SCREENSHOTS = [ \"http://www.webos-internals.org\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = SuVuK <suvuk@gmx.net>
HOMEPAGE = blog.suvuk.de
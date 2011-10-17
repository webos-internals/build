NAME = $(shell basename $(shell pwd))
PATCH = email/${NAME}.patch
TWEAKS =
TITLE = Change Email Font to Calibri
DESCRIPTION = Changes outgoing email font to Calibri 11pt, and changes email signature to Calibri 9pt.  This is an attempt to make TouchPad emails look more professional.  After applying this patch, you will need to delete and recreate your email signature for any existing email accounts, in order to pick up the new formatting.  When you delete your signature, make sure you delete everything until that field says 'Tap Here To Type', then you can re-enter your signature.  NOTE: A side effect of this patch is that the on-screen font is a little smaller when you compose an email.  ANOTHER NOTE: This patch is not compatible with the 'Mimic Outlook Formatting on Email Reply/Forward' patch.  You need to pick one or the other patch to load, not both at the same time.
CATEGORY = Email
VERSIONS = 3.0.2-51
ICON = http://www.webos-internals.org/images/2/29/Icon_WebOSInternals_Patches_Email.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = menomonee <menomonee@hotmail.com>
HOMEPAGE =
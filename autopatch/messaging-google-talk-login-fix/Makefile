NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS =
TITLE = Google Talk login fix
DESCRIPTION = Google talk uses the Jabber protocol, witch normally uses SRV DNS requests. But some DNS servers can't answer or proxy such request. So if you are on such a network, you can't login to your Google Talk account in the Messaging app. This patch will fix this, by change the DNS server for the domains googlemail.com and gmail.com to the public Google DNS servers. Any other domain will still be resolved by your local DNS server.Please restart your device after installing (not just Luna)!
CATEGORY = Messaging
VERSIONS = 1.4.5-198 2.1.0-247 2.1.1-52 2.1.2-62 2.2.4-46 3.0.2-97 3.0.4-67 3.0.5-17
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = moses
HOMEPAGE = http://forums.webosnation.com/webos-patches/311725-patch-google-talk-login-fix.html
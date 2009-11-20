NAME = $(shell basename $(shell pwd))
PATCH = universal-search/${NAME}.patch
TITLE = Command Line
DESCRIPTION = This will add commands to Universal Search.<br /><br />Type '.calc 2 + 5' to calculate something.<br />Type '.dict affluent' or '.thes wealthy' to look up a word.<br />Type '.memo I like pie.' to create a new memo.<br /> And more! Type '.help' for a list of commands.<br />NOTE: To make certain commands such as '.memo' work, you must install separate packages such as the 'USCL Memos Patch' which patches the Memos application.  If you get an error message such as 'The application %s is not configured for the Universal Search Command Line' or a command such as '.memo' is missing when you type '.help', that's your cue to do so.<br /><br />Changelog:<br />2009-11-19: Fixed compatibility issue with KeyToss.<br />2009-11-18: webOS 1.3.1 compatible.<br />2009-11-13: Fixed issue with error messages not showing up.<br />2009-11-11: '.help' opens its own window now.<br />2009-11-11: Added .show/.hide to turn on/off display of additional searches in Universal Search.<br />2009-11-11: Added .yahoo, .restart luna, .gis (Google Image Search), .shop (Google Products), .news (Google News), .amazon, and for completeness, .google and .wikipedia.<br />2009-11-05: Fix issue: installing USCL first then KeyToss would still not work<br />2009-10-30: Attempt to fix compatibility issue with KeyToss patch.<br />2009-10-30: Fix a bug with tapping on the '.cmd' item.<br />2009-10-29: Fix a bug with '.help'.
CATEGORY = Universal Search
VERSIONS = 1.2.1-21 1.3.1-15
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b6/Universal-search-command-line-%28USCL%29-1.png\",\
\"http://www.webos-internals.org/images/f/fe/Universal-search-command-line-%28USCL%29-2.png\",\
\"http://www.webos-internals.org/images/1/13/Universal-search-command-line-%28USCL%29-3.png\"]
META_SUB_VERSION = 2

include ../common.mk
include ../modifications.mk

MAINTAINER = dsevil <dse@webonastick.com>
HOMEPAGE = http://webonastick.com/webos/patches/

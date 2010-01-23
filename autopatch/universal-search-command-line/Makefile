NAME = $(shell basename $(shell pwd))
PATCH = universal-search/${NAME}.patch
TITLE = Command Line
DESCRIPTION = This will add commands to Universal Search.<br /><br />- Type '.calc 2 + 5' to calculate something.<br />- Type '.dict affluent' or '.thes wealthy' to look up a word.<br />- Type '.memo I like pie.' to create a new memo.<br />- Type '.qmemo I like pie.' to create a new memo without launching Notes.<br />- There's much more! Type '.help' for a list of commands.<br />NOTE: To make certain commands such as '.memo' work, you must install separate packages such as the 'USCL Memos Patch' which patches the Memos application. If you get an error message such as 'The application %s is not configured for the Universal Search Command Line' or a command such as '.memo' is missing when you type '.help', that's your cue to do so.<br /><br />BEFORE REPORTING PROBLEMS, please read: http://tinyurl.com/ye6hfk3<br/><br/>Changelog:<br />2009-12-06:<br/>- - User-defined commands if you have a file called uscl.json on the USB drive's root directory. Example uscl.json file. Use the '.update' command after copying/modifying/deleting uscl.json. SYNTAX IS STRICT JSON.<br />2009-12-03:<br/>- Tests using underlying utilities confirm that this is compatible with KeyToss 1.3.1-17.<br/>Commands related to location services:<br/>- .gps on/off<br/>- .usegoogle on/off (rough location using cell towers)<br/>- .autolocate on/off<br/>- .geotag on/off<br/>- .bgdata on/off (Background Data Collection)<br/>Command related to the system:<br/>- .rescan<br/>- .restart java<br/>Additional searches:<br/>- .wolfram<br/>- .snopes<br/>- .keytoss<br/>- .maps  - for completeness<br/>- ..cmd  - shortcut for .keytoss<br/>Hiding individual commands:<br/>- .hide  ...<br/>- .show  ...<br/>- .show all<br/>Other stuff:<br/>- In .calc you can say things like sin(x) instead of Math.sin(x).<br/>- You can type the command after the keywords now, e.g., 'i am america .amazon'<br/>2009-11-19: Fixed compatibility issue with KeyToss.<br />2009-11-18: webOS 1.3.1 compatible.<br />2009-11-13: Fixed issue with error messages not showing up.<br />2009-11-11: '.help' opens its own window now.<br />2009-11-11: Added .show/.hide to turn on/off display of additional searches in Universal Search.<br />2009-11-11: Added .yahoo, .restart luna, .gis (Google Image Search), .shop (Google Products), .news (Google News), .amazon, and for completeness, .google and .wikipedia.<br />2009-11-05: Fix issue: installing USCL first then KeyToss would still not work<br />2009-10-30: Attempt to fix compatibility issue with KeyToss patch.<br />2009-10-30: Fix a bug with tapping on the '.cmd' item.<br />2009-10-29: Fix a bug with '.help'.
CATEGORY = Universal Search
VERSIONS = 1.2.1-22 1.3.1-23 1.3.5-2
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

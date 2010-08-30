NAME = $(shell basename $(shell pwd))
PATCH = universal-search/${NAME}.patch
TITLE = Command Line
DESCRIPTION = Adds additional sites to Universal Search, as well as providing additional capabilities.<br/><br/>- Type '.calc 2 + 5' to calculate something.<br/>- Type '.dict affluent' or '.thes wealthy' to look up a word.<br/>- Type '.memo I like pie.' to create a new memo.<br/>- Type '.qmemo I like pie.' to create a new memo without launching Notes.<br/>- There's much more! Type '.help' for a list of commands.<br/><br/>NOTE: To make certain commands such as '.memo' work, you must install separate packages such as the 'USCL Memos Patch' which patches the Memos application. If you get an error message such as 'The application %s is not configured for the Universal Search Command Line' or a command such as '.memo' is missing when you type '.help', that's your cue to do so.<br/><br/>BEFORE REPORTING PROBLEMS, please read: http://tinyurl.com/ye6hfk3
CATEGORY = Universal Search
VERSIONS = 1.3.5-3 1.4.0-45 1.4.1-16 1.4.2-2 1.4.5-44
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b6/Universal-search-command-line-%28USCL%29-1.png\",\
\"http://www.webos-internals.org/images/f/fe/Universal-search-command-line-%28USCL%29-2.png\",\
\"http://www.webos-internals.org/images/1/13/Universal-search-command-line-%28USCL%29-3.png\" ]
META_SUB_VERSION = 2

include ../common.mk

include ../modifications.mk

MAINTAINER = dsevil <dse@webonastick.com>
HOMEPAGE = http://webonastick.com/uscl/
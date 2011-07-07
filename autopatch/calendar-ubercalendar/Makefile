NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TWEAKS =
TITLE = UberCalendar
DESCRIPTION = UberCalendar patch tries to bring you as much enhancements as possible to your webOS calendar app:<br/>* timezone converter<br/>* icon picker<br/>* templates<br/>* optional number of week in all views (together with optional offset and modulo)<br/>* optional subjects in week view<br/>* alarm symbol in day and week view<br/>* colors for all-day events in month view<br/>* much more reminder times<br/>* much more default reminder times<br/>* reopen in last, day, week or month view<br/>* back gesture to go to month from day or week<br/>* buttons and shortcuts for new event and new all-day event<br/>* command menu button for Agenda homebrew app<br/>* optional icons in day, week and month view<br/>* options to switch off enhancements in week and month view<br/>* option to compress also free time at start and end of day in day view (example: http://yfrog.com/hq1o0p)<br/>* different snooze times<br/>* different notification repeat settings<br/>* meta-tap to delete an existing event<br/>* orange-tap to copy an existing event<br/>* open event directly from week view<br/>* calendar view to select event date<br/>* more default durations<br/>* location field is multiline<br/><br/>The alarm-icon, Agenda icon and event icons have to be in the internal USB drive in path /.scrims/ubercalendar/<br/>You can download the image files from http://www.metaviewsoft.de/Calendar/ubercalendar-icon.zip<br/>Event icons need to be specified in the event note following this scheme: ICON=name;<br/>Example: ICON=birthday;<br/>Possible names at the moment are<br/>birthday, car, kids, doctor, plane, holiday, vacation, party<br/><br/>If you like this patch, please show me your appreciation and buy a copy of 'UberRadio' from the AppCatalog.
CATEGORY = Calendar
VERSIONS = 1.4.5-163 2.0.1-76 2.1.0-112
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/1/18/Calendar-ubercalendar-1.png\",\
\"http://www.webos-internals.org/images/2/29/Calendar-ubercalendar-2.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = MetaView
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2424572#post2424572
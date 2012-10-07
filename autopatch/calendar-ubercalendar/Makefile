NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TWEAKS =
TITLE = UberCalendar
DESCRIPTION = UberCalendar patch tries to bring you as much enhancements as possible to your webOS calendar app:* timezone converter* icon picker* templates* optional number of week in all views (together with optional offset and modulo)* optional subjects in week view* alarm symbol in day and week view* colors for all-day events in month view* much more reminder times* much more default reminder times* reopen in last, day, week or month view* back gesture to go to month from day or week* buttons and shortcuts for new event and new all-day event* command menu button for Agenda homebrew app* optional icons in day, week and month view* options to switch off enhancements in week and month view* option to compress also free time at start and end of day in day view (example: http://yfrog.com/hq1o0p)* different snooze times* different notification repeat settings* meta-tap to delete an existing event* orange-tap to copy an existing event* open event directly from week view* calendar view to select event date* more default durations* location field is multilineThe alarm-icon, Agenda icon and event icons have to be in the internal USB drive in path /.scrims/ubercalendar/You can download the image files from http://www.metaviewsoft.de/Calendar/ubercalendar-icon.zipEvent icons need to be specified in the event note following this scheme: ICON=name;Example: ICON=birthday;Possible names at the moment arebirthday, car, kids, doctor, plane, holiday, vacation, partyIf you like this patch, please show me your appreciation and buy a copy of 'UberRadio' from the AppCatalog.
CATEGORY = Calendar
VERSIONS = 1.4.5-205 2.1.0-264 2.1.1-69 2.1.2-79 2.2.4-76
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/1/18/Calendar-ubercalendar-1.png\",\
\"http://www.webos-internals.org/images/2/29/Calendar-ubercalendar-2.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = MetaView
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2424572#post2424572
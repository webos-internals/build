NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TITLE = UberCalendar
DESCRIPTION = UberCalendar patch tries to bring you as much enhancements as possible to your webOS calendar app:<br/>* number of week in all views<br/>* subjects in week view<br/>* alarm symbol in day and week view<br/>* colors for all-day events in month view<br/>* much more reminder times<br/>* much more default reminder times<br/>* reopen in last view<br/>* back gesture to go to month from day or week<br/>* buttons and shortcuts for new event and new all-day event<br/>* command menu button for Agenda homebrew app<br/>* icons in day, week and month view<br/><br/>The alarm-icon, Agenda icon and event icons have to be in the internal USB drive in path /scrims/ubercalendar/<br/>You can download the image files from http://www.metaviewsoft.de/Calendar/ubercalendar-icon.zip<br/>Event icons need to be specified in the event note following this scheme: ICON=name;<br/>Example: ICON=birthday;<br/>Possible names at the moment are<br/>birthday, car, kids, doctor, plane, holiday, vacation, party<br/><br/>If you like this patch, please show me your appreciation and buy a copy of ÜberRadio from the AppCatalog.
CATEGORY = Calendar
VERSIONS = 1.4.0-52 1.4.1-24 1.4.2-9 1.4.3-3 1.4.5-8
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/1/18/Calendar-ubercalendar-1.png\",\
\"http://www.webos-internals.org/images/2/29/Calendar-ubercalendar-2.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = MetaView <metaview@web.de>
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2424572#post2424572
NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TITLE = Snooze Alternate Behavior
DESCRIPTION = Alters the behavior of calendar reminders.  There are 3 changes made:   <br/>1. Changes the default snooze time to 10 minutes instead of 5 minutes.   <br/>2. Eliminates the pop-up notification after you hit the snooze button that states 'Snoozed for 5 minutes'.  Allowing you to move on with your work and not wait for it to clear.   <br/>3. Reverts the snooze behavior back to the previous way it worked and the way it worked in Palm OS, so that you can continually hit the snooze button over and over again (even after the event end time has past) for up to 36 hours.  This is useful for people who like to add reminders that are only 30 minutes long but don't have a chance to complete them.  It is annoying when the reminder clears itself after the event end time.  For example, you enter a 30 minute long calendar event to remind yourself to go Grocery shopping at 5pm when you think you will be on your way home from work.  At 5pm your calendar notification alerts you to go grocery shopping.  You are stuck at work, so you keep hitting snooze.  Sometime after 6 when you finally leave work, you forget to go Grocery shopping because your reminder was cleared out after the event time ended at 5:30pm.  This patch fixes all that!
CATEGORY = Calendar
VERSIONS = 1.4.0-65 1.4.1-37 1.4.2-22 1.4.3-16 1.4.5-21
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = CRaia Software
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2490494#post2490494
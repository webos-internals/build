NAME = $(shell basename $(shell pwd))
PATCH = tasks/${NAME}.patch
TITLE = New Task Auto Details
DESCRIPTION = This is a small modification that changes how new tasks are handled. Ordinarily, new tasks appear at the bottom of the task list. In this view you need to tap again to enter details like a due date.  With this patch, when you add a task a details card appears in which you can immediately set the task name, due date, task list, and priority. These fields are not required to be filled in.
CATEGORY = Tasks
VERSIONS = 1.2.1-0 1.3.1-0 1.3.5-1
ICON = http://www.webos-internals.org/images/8/83/Icon_WebOSInternals_Patches_Tasks.png
SCREENSHOTS =
META_SUB_VERSION = 1


include ../common.mk
include ../modifications.mk

MAINTAINER = Tuckmobile
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Tasks_Always_Show_Details_of_New_Tasks

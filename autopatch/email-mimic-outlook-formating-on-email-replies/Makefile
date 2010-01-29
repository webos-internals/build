NAME = $(shell basename $(shell pwd))
PATCH = email/${NAME}.patch
TITLE = Mimic Outlook Formating on Email Replies
DESCRIPTION = ***This patch is ONLY compatible with Exchange 2007.  For a globally compatible patch, please see 'Replies Forwards Multi-Mod.'***<br/><br/>This patch modifies the formatting of email replies and forwards sent from your Pre so that they mimic the formatting used in Outlook 2007.  Changes include: <br/>1) change font size to 11 pt. Calibri, navy<br/>2) replaces the 'John Smith wrote:' text with the 'From', 'Sent', 'To', and 'Subject' language used in Outlook 2007<br/>3) formats email headers to 11 pt. Calibri font<br/>4) uses long form for dates in 'Sent' field (e.g., Wednesday, January 06, 2010 9:26 pm)<br/>5) enables SmartReply, which refrains from reformatting the original text in replies/forwards.
CATEGORY = Email
VERSIONS = 1.3.5-18
ICON = http://www.webos-internals.org/images/2/29/Icon_WebOSInternals_Patches_Email.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/1/17/Email-mimic-outlook-formating-on-email-replies-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = jonolee
HOMEPAGE =
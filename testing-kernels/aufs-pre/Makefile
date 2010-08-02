NAME           = $(shell basename $(shell pwd))
TITLE          = AUFS module
CATEGORY       = FS
DEVICECOMPATIBILITY = [\"Pre\"]
VERSIONS       = 1.4.1-66 1.4.2-66 1.4.5-66
BLDFLAGS       = -p
DESCRIPTION    = This is the AUFS (Another Union FileSystem) kernel module for the Pre/Pre+.  AUFS is useful for mounting rw overlays on ro filesystems.  
CHANGELOG      = 
DEVICE         = pre
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
EXTERNAL_MODULES  = aufs
TYPE = Kernel Module

include ../../support/kernel.mk

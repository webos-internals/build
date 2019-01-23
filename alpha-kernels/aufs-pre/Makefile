NAME           = $(shell basename $(shell pwd))
TITLE          = AUFS module
CATEGORY       = Filesystem
VERSIONS       = 1.4.5-97
BLDFLAGS       = -p
DESCRIPTION    = This is the AUFS (Another Union FileSystem) kernel module for the Pre/Pre+.  AUFS is useful for mounting rw overlays on ro filesystems.  
CHANGELOG      = 
DEVICE         = pre
SRC_GIT = git://github.com/webos-internals/kernel-patches.git
KERNEL_UPSTART = aufs/upstart.${DEVICE}
EXTERNAL_MODULES  = aufs
SUFFIX='-${DEVICE}'
TYPE = Kernel Module

include ../../support/kernel.mk

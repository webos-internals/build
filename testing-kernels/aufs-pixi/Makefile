NAME           = $(shell basename $(shell pwd))
APP_ID         = org.webosinternals.modules.${NAME}
TITLE          = AUFS module
CATEGORY       = FS
DEVICECOMPATIBILITY = [\"Pixi\"]
VERSIONS       = 1.4.1-66 1.4.3-66 1.4.5-66
BLDFLAGS       = -p
DESCRIPTION    = This is the AUFS (Another Union FileSystem) kernel module for the Pixi/Pixi+.  AUFS is useful for mounting rw overlays on ro filesystems.  
CHANGELOG      = 
DEVICE         = pixi
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
EXTERNAL_MODULES  = aufs
TYPE = Kernel Module

include ../../support/kernel.mk

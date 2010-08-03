NAME           = $(shell basename $(shell pwd))
TITLE          = Userspace Input Module
CATEGORY       = Input
DEVICECOMPATIBILITY = [\"Pre\"]
VERSIONS       = 1.4.1-77 1.4.2-77 1.4.5-77
BLDFLAGS       = -p
DESCRIPTION    = This is the uinput kernel module for the Pre/Pre+, which allows userpace creation of input devices.  Used by many linux projects for emulating keyboard/mouse input.
CHANGELOG      = 
DEVICE         = pre
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = uinput/defconfig-${DEVICE}.patch
KERNEL_UPSTART = uinput/upstart.script
KERNEL_MODULES = drivers/input/misc/uinput.ko
TYPE = Kernel Module

include ../../support/kernel.mk

NAME           = uinput
APP_ID         = org.webosinternals.modules.${NAME}
TITLE          = Userspace Input Module
CATEGORY       = Input
DEVICECOMPATIBILITY = [\"Pixi\"]
VERSIONS       = 1.4.1-77 1.4.3-77
BLDFLAGS       = -p
DESCRIPTION    = This is the uinput kernel module, which allows userpace creation of input devices.  Used by many linux projects for emulating keyboard/mouse input.
CHANGELOG      = 
DEVICE         = pixi
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = uinput/defconfig-${DEVICE}.patch
KERNEL_UPSTART = uinput/upstart.script
KERNEL_MODULES = drivers/input/misc/uinput.ko
TYPE = Kernel Module

include ../../support/kernel.mk

NAME           = uinput
APP_ID         = org.webosinternals.modules.${NAME}
TITLE          = Userspace Input Module
CATEGORY       = Input
VERSIONS       = 1.4.1-66 1.4.2-66 1.4.5-66
BLDFLAGS       = -p
DESCRIPTION    = This is the uinput kernel module, which allows userpace creation of input devices.  Used by many linux projects for emulating keyboard/mouse input.
CHANGELOG      = 
DEVICE         = pre
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = uinput/defconfig-standard.patch
KERNEL_UPSTART = uinput/upstart.script
KERNEL_MODULES = drivers/input/misc/uinput.ko

include ../../support/modules.mk

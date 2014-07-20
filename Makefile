THEOS_MAKE_PATH = /var/theos/makefiles
THEOS_DEVICE_IP = 192.168.1.130

ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/common.mk

TWEAK_NAME = ColorBar
ColorBar_FILES = Tweak.xm
ColorBar_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += colorbar
include $(THEOS_MAKE_PATH)/aggregate.mk

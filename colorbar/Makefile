THEOS_MAKE_PATH = /var/theos/makefiles
ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/common.mk

BUNDLE_NAME = ColorBar
ColorBar_FILES = ColorBar.mm HeaderCell.mm
ColorBar_INSTALL_PATH = /Library/PreferenceBundles
ColorBar_FRAMEWORKS = UIKit
ColorBar_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ColorBar.plist$(ECHO_END)

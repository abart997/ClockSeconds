include theos/makefiles/common.mk
export GO_EASY_ON_ME=1
TWEAK_NAME = ClockSeconds
ClockSeconds_FILES = Tweak.xm
ClockSeconds_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

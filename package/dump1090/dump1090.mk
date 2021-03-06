################################################################################
#
# dump1090
#
################################################################################

DUMP1090_VERSION = 5974241e2f3e208409c2be8ba21a01eeea8ea104
DUMP1090_SITE = $(call github,howard0su,dump1090,$(DUMP1090_VERSION))
DUMP1090_LICENSE = BSD-3-Clause
# no real license file
DUMP1090_LICENSE_FILES = anet.h
DUMP1090_DEPENDENCIES = host-pkgconf librtlsdr

define DUMP1090_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr -C $(@D)
endef

define DUMP1090_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/dump1090 $(TARGET_DIR)/usr/bin/dump1090
	$(INSTALL) -m 0755 -D $(@D)/view1090 $(TARGET_DIR)/usr/bin/view1090
	$(INSTALL) -d $(TARGET_DIR)/usr/share/dump1090
	cp -r $(@D)/public_html/* $(TARGET_DIR)/usr/share/dump1090
endef

$(eval $(generic-package))

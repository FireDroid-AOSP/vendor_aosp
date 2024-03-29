# Build fingerprint
ifeq ($(BUILD_FINGERPRINT),)
BUILD_NUMBER_CUSTOM := $(shell date -u +%H%M)
CUSTOM_DEVICE ?= $(TARGET_DEVICE)
BUILD_SIGNATURE_KEYS := release-keys
BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(CUSTOM_DEVICE)/$(CUSTOM_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CUSTOM):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
endif
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    persist.sys.recovery_update=true
endif

# Compress AOSP recovery, for our infra
ifeq ($(TARGET_USES_TAR_COMPRESSED_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.pixelexperience.tar_compressed_recovery=true
endif

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.firedroid.version=$(FireDroid_BASE_VERSION) \
    org.firedroid.version.display=$(CUSTOM_VERSION) \
    org.firedroid.build_date=$(CUSTOM_BUILD_DATE) \
    org.firedroid.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    org.firedroid.build_type=$(CUSTOM_BUILD_TYPE) \
    org.firedroid.codename=$(FireDroid_BASE_VERSION) \
    org.firedroid.build_version=$(FireDroid_BUILD_VERSION) \
    ro.firedroid.maintainer=$(FIREDROID_MAINTAINER)


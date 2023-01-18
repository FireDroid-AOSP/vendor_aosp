# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# FireDroid Platform Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.firedroid.version=$(FireDroid_BASE_VERSION) \
    ro.firedroid.version.display=$(CUSTOM_VERSION) \
    ro.custom.build.date=$(BUILD_DATE) \
    ro.firedroid.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    ro.firedroid.build_type=$(CUSTOM_BUILD_TYPE) \
    ro.firedroid.build_version=$(FireDroid_BUILD_VERSION) \
    ro.custom.fingerprint=$(ROM_FINGERPRINT) \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.modversion=$(CUSTOM_VERSION) \
    ro.firedroid.maintainer=$(FIREDROID_MAINTAINER) \
    ro.firedroid.codename=$(FIREDROID_CODENAME)

# Updater
ifeq ($(IS_OFFICIAL),true)
    ADDITIONAL_SYSTEM_PROPERTIES  += \
        ro.is_official=true
endif

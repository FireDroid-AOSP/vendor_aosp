# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Versioning Props
ADDITIONAL_SYSTEM_PROPERTIES += \
    org.firedroid.version=$(FireDroid_BASE_VERSION) \
    org.firedroid.version.display=$(CUSTOM_VERSION) \
    org.firedroid.build_date=$(CUSTOM_BUILD_DATE) \
    org.firedroid.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    org.firedroid.build_type=$(CUSTOM_BUILD_TYPE) \
    org.firedroid.codename=$(FireDroid_BASE_VERSION) \
    org.firedroid.build_version=$(FireDroid_BUILD_VERSION) \
    org.firedroid.device=$(FireDroid_Device_Codename) \
    ro.firedroid.maintainer=$(FIREDROID_MAINTAINER)


# Updater
ifeq ($(IS_OFFICIAL),true)
    ADDITIONAL_SYSTEM_PROPERTIES  += \
        net.firedroid.build_type=ci \
        net.firedroid.version=$(CUSTOM_VERSION_PROP)
endif

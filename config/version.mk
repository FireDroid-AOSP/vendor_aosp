#
# Copyright (C) 2020-2021 Haruka LLC.
# Copyright (C) 2020-2021 Haruka Aita
# Copyright (C) 2019-2023 Evolution X
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# FireDroid Props
FireDroid_BASE_VERSION = v2.0


# Set all versions
CUSTOM_BUILD_TYPE ?= COMMUNITY

CUSTOM_DATE_YEAR := $(shell date -u +%Y)
CUSTOM_DATE_MONTH := $(shell date -u +%m)
CUSTOM_DATE_DAY := $(shell date -u +%d)
CUSTOM_DATE_HOUR := $(shell date -u +%H)
CUSTOM_DATE_MINUTE := $(shell date -u +%M)
CUSTOM_BUILD_DATE_UTC := $(shell date -d '$(CUSTOM_DATE_YEAR)-$(CUSTOM_DATE_MONTH)-$(CUSTOM_DATE_DAY) $(CUSTOM_DATE_HOUR):$(CUSTOM_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(CUSTOM_DATE_YEAR)$(CUSTOM_DATE_MONTH)$(CUSTOM_DATE_DAY)-$(CUSTOM_DATE_HOUR)$(CUSTOM_DATE_MINUTE)

BUILD_ID_LC ?= $(shell echo $(BUILD_ID) | tr '[:upper:]' '[:lower:]')

CUSTOM_PLATFORM_VERSION := $(PLATFORM_VERSION)
FireDroid_BUILD_VERSION = 14.0

TARGET_PRODUCT_SHORT := $(subst firedroid_,,$(FIREDROID_BUILD))

CUSTOM_VERSION_DISPLAY := $(CUSTOM_CODENAME)-$(CUSTOM_BASE_VERSION)-$(TARGET_PRODUCT_SHORT)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
ifeq ($(CUSTOM_BUILD_TYPE), OFFICIAL)
    CUSTOM_VERSION := $(TARGET_PRODUCT)-ota-$(BUILD_ID_LC)-$(shell date +%m%d%H%M)
    CUSTOM_DELTA_VERSION := $(TARGET_PRODUCT)-delta-$(BUILD_ID_LC)-$(shell date +%m%d%H%M)
else
    CUSTOM_VERSION := $(TARGET_PRODUCT)-ota-$(BUILD_ID_LC)-$(shell date +%m%d%H%M)-$(shell echo "$(CUSTOM_BUILD_TYPE)" | tr '[:upper:]' '[:lower:]')
    CUSTOM_DELTA_VERSION := $(TARGET_PRODUCT)-delta-$(BUILD_ID_LC)-$(shell date +%m%d%H%M)-$(shell echo "$(CUSTOM_BUILD_TYPE)" | tr '[:upper:]' '[:lower:]')
endif

CUSTOM_VERSION_PROP := $(PLATFORM_VERSION)

PRODUCT_PRODUCT_PROPERTIES += \
    org.firedroid.version=$(EVO_VERSION) \
    org.firedroid.version.prop=$(EVO_VERSION_PROP) \
    org.firedroid.version.display=$(EVO_VERSION_DISPLAY) \
    org.firedroid.build_version=$(EVO_BASE_VERSION) \
    org.firedroid.build_date=$(EVO_BUILD_DATE) \
    org.firedroid.build_date_utc=$(EVO_BUILD_DATE_UTC) \
    org.firedroid.build_type=$(EVO_BUILD_TYPE) \
    org.firedroid.build_codename=$(EVO_CODENAME)

$(call inherit-product-if-exists, vendor/aosp/build/target/product/security/evolution_security.mk)

# Check signed
EVO_SIGNED ?= false

ifeq ($(EVO_SIGNED), true)
    PRODUCT_PRODUCT_PROPERTIES += org.firedroid.key_type=signed
else
    PRODUCT_PRODUCT_PROPERTIES += org.firedroid.key_type=unsigned
endif

PRODUCT_HOST_PACKAGES += \
    sign_target_files_apks \
    ota_from_target_files

$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit full common Evolution X stuff
$(call inherit-product, vendor/aosp/config/common_full.mk)

# Inherit from GMS product config
ifeq ($(TARGET_USES_MINI_GAPPS),true)
$(call inherit-product, vendor/gms/gms_mini.mk)
else ifeq ($(TARGET_USES_PICO_GAPPS),true)
$(call inherit-product, vendor/gms/gms_pico.mk)
else
$(call inherit-product, vendor/gms/gms_full.mk)
endif

$(call inherit-product, vendor/aosp/config/telephony.mk)

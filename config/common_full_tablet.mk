$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit common FireDroid stuff
$(call inherit-product, vendor/aosp/config/common_full.mk)

$(call inherit-product, vendor/aosp/config/telephony.mk)

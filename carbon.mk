$(call inherit-product, device/samsung/celoxhd/full_celoxhd.mk)

# Inherit some common Carbon stuff.
$(call inherit-product, vendor/carbon/config/common_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I757M TARGET_DEVICE=SGH-I757M BUILD_FINGERPRINT="samsung/SGH-I757M/SGH-I757M:4.4.2/KVT49L/UGMC5:user/release-keys" PRIVATE_BUILD_DESC="SGH-I757M-user 4.4.2 KVT49L UGMC5 release-keys"

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

PRODUCT_NAME := carbon_celoxhd
PRODUCT_DEVICE := celoxhd


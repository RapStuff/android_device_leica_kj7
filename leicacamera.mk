#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LEICA_CAMERA_PATH := vendor/tecno/leicacamera

PRODUCT_SOONG_NAMESPACES += $(LEICA_CAMERA_PATH)

PRODUCT_PACKAGES += \
    MiuiCamera \
    MiuiExtraPhoto \
    privapp-permissions-miuicamera.xml \
    default-permissions-miuicamera.xml \
    miuicamera-hiddenapi-package-whitelist.xml \
    sceneDetection.xml \
    android.hardware.camera.raw.xml

# Prebuilt native libraries for MiuiCamera and MiuiExtraPhoto
# (kept separated per app because libc++_shared.so and libyuv.so differ between apps)
PRODUCT_COPY_FILES += \
    $(foreach lib,$(wildcard $(LEICA_CAMERA_PATH)/proprietary/system_ext/priv-app/MiuiCamera/lib/arm64/*.so),$(lib):$(TARGET_COPY_OUT_SYSTEM_EXT)/priv-app/MiuiCamera/lib/arm64/$(notdir $(lib))) \
    $(foreach lib,$(wildcard $(LEICA_CAMERA_PATH)/proprietary/system_ext/priv-app/MiuiExtraPhoto/lib/arm64/*.so),$(lib):$(TARGET_COPY_OUT_SYSTEM_EXT)/priv-app/MiuiExtraPhoto/lib/arm64/$(notdir $(lib)))

# SystemExt properties
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.sys.miui.sdk.dbg=1 \
    ro.com.google.lens.oem_camera_package=com.android.camera \
    ro.product.marketname=Tecno Spark 20 Pro+

# Vendor properties
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.enableAdvanceFeatures=0x3E7 \
    persist.vendor.camera.multicam=TRUE \
    persist.vendor.camera.multicam.fpsmatch=TRUE \
    persist.vendor.camera.multicam.framesync=1 \
    persist.vendor.camera.multicam.hwsync=TRUE \
    persist.vendor.camera.picturesize.limit.enable=false \
    persist.vendor.camera.privapp.list=com.android.camera \
    vendor.camera.aux.packagelist=com.transsion.camera,com.antutu.ABenchMark,com.android.camera

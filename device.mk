LOCAL_PATH := device/amazon/ford

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_FOLDER := device/amazon/ford

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/amazon/ford/ford-vendor.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay


$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/permissions/media_profiles.xml \
    $(LOCAL_PATH)/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml 

$(call inherit-product-if-exists, vendor/amazon/ford/ford-vendor.mk)


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \

#init.d
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.d/00permissions:system/etc/init.d/00permissions 

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default

PRODUCT_PACKAGES += \
    audio.usb.default 

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth.default

# Power
PRODUCT_PACKAGES += \
    power.default

PRODUCT_PACKAGES += \
    netd
    
# wifi
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes
     
PRODUCT_PACKAGES += \
    libemoji

DEVICE_PACKAGE_OVERLAYS += device/amazon/ford/overlay
    
# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf \
     $(LOCAL_PATH)/configs/thermal.policy.conf:system/etc/.tp/thermal.policy.conf \
     $(LOCAL_PATH)/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc \
     $(LOCAL_PATH)/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf

# Theme overlays from setiawanjimmy
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_AOSPCalculator.apk:system/vendor/overlay/SlimMod_AOSPCalculator.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_AOSPContacts.apk:system/vendor/overlay/SlimMod_AOSPContacts.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_AOSPDeskClock.apk:system/vendor/overlay/SlimMod_AOSPDeskClock.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_AOSPDialer.apk:system/vendor/overlay/SlimMod_AOSPDialer.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_AOSPKeyboard.apk:system/vendor/overlay/SlimMod_AOSPKeyboard.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_AOSPLauncher3.apk:system/vendor/overlay/SlimMod_AOSPLauncher3.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_AOSPMms.apk:vendor/overlay/SlimMod_AOSPMms.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Apple_Music_Notification.apk:system/vendor/overlay/SlimMod_Apple_Music_Notification.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_CellBroadcastReceiver.apk:system/vendor/overlay/SlimMod_CellBroadcastReceiver.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_DocumentsUI.apk:system/vendor/overlay/SlimMod_DocumentsUI.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Framework.apk:system/vendor/overlay/SlimMod_Framework.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Google_Hangouts_Notification.apk:system/vendor/overlay/SlimMod_Google_Hangouts_Notification.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Google_Inbox_Notification.apk:system/vendor/overlay/SlimMod_Google_Inbox_Notification.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Google_Mail_Notification.apk:system/vendor/overlay/SlimMod_Google_Mail_Notification.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Google_Mms_Notification.apk:system/vendor/overlay/SlimMod_Google_Mms_Notification.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_LayersManager.apk:system/vendor/overlay/SlimMod_LayersManager.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_LockcLock.apk:system/vendor/overlay/SlimMod_LockcLock.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_MediaProvider.apk:system/vendor/overlay/SlimMod_MediaProvider.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Phone.apk:system/vendor/overlay/SlimMod_Phone.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Settings.apk:system/vendor/overlay/SlimMod_Settings.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_SlimOTA.apk:system/vendor/overlay/SlimMod_SlimOTA.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_SuperSU.apk:system/vendor/overlay/SlimMod_SuperSU.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_SystemUI.apk:system/vendor/overlay/SlimMod_SystemUI.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Telecom.apk:system/vendor/overlay/SlimMod_Telecom.apk \
     $(LOCAL_PATH)/rootdir/vendor/overlay/SlimMod_Navbar.apk:system/vendor/overlay/SlimMod_Navbar.apk

#Hack to set selinux permissive on boot.
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/sepolicy/vcodec_kernel_driver.ko:system/lib/modules/vcodec_kernel_driver.ko

PRODUCT_COPY_FILES += \
     $(LOCAL_KERNEL):kernel

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_ford
PRODUCT_DEVICE := ford


# call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

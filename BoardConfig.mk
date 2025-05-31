#
# Copyright (C) 2017 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := device/${_VENDORNAME_}/${_CODENAME_}

# Set FSTAB
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm660
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := sdm660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno512

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 earlycon=msm_serial_dm,0xc170000 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=1 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3 buildvariant=user
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00008000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/Image.gz-dtb

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x1000000
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x40000000
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x1000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x280000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x184EFAF000
BOARD_FLASH_BLOCK_SIZE := 262144
TARGET_USERIMAGES_USE_EXT4 := true
 
# Recovery
TW_THEME := portrait_hdpi                     # Set the exact theme you wanna use. If resulation doesn't match, define the height/width
# RECOVERY_SDCARD_ON_DATA := true               # Optional: If /sdcard partition is emulated on /data partition 
TARGET_RECOVERY_QCOM_RTC_FIX := true
# Set the Brightness Control File Path below (as per your chip/device)
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 80                   # Set custom brightness, low is better
DEVICE_RESOLUTION := 1200x1920                 # The Resolution of your Device
TARGET_SCREEN_HEIGHT := 1920                    # The height
TARGET_SCREEN_WIDTH := 1200                      # The width
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TW_INCLUDE_NTFS_3G := true                    # Include NTFS Filesystem Support
TW_IGNORE_MISC_WIPE_DATA := true           # Delete if your partition table has /misc
TW_INPUT_BLACKLIST := "hbtp_vm"               # Optional: Disables virtual mouse
TW_SCREEN_BLANK_ON_BOOT := true
TWRP_INCLUDE_LOGCAT := true                   # Include LogCat Binary
BOARD_FLASH_BLOCK_SIZE := 0                   # Might be different for your chip
BOARD_CHARGER_SHOW_PERCENTAGE := true
TW_USE_EXTERNAL_STORAGE := true

# TWRP stuff
TW_INCLUDE_CRYPTO := true                     # true/false: Add Data Encryption Support or not
TW_INCLUDE_FUSE_EXFAT := true                 # Include Fuse-ExFAT Filesystem Support
TW_INCLUDE_FB2PNG := true                     # Include Screenshot Support
TW_DEFAULT_LANGUAGE := en                     # Set Default Language 
TW_EXTRA_LANGUAGES := false
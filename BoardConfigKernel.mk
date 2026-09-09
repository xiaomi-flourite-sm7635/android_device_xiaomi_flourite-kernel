#
# SPDX-FileCopyrightText: 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

FLOURITE_KERNEL_PREBUILT := device/xiaomi/flourite-kernel

# Exact boot artifacts from OS3.0.304.0.WPRMIXM.  Keep this as the default
# until every Xiaomi/Qualcomm external module needed by the OSS kernel is
# available and can be built against the same KMI.
TARGET_PREBUILT_KERNEL := $(FLOURITE_KERNEL_PREBUILT)/Image

BOARD_PREBUILT_DTBIMAGE_DIR := $(FLOURITE_KERNEL_PREBUILT)/dtb
BOARD_PREBUILT_DTBOIMAGE := $(FLOURITE_KERNEL_PREBUILT)/dtbo.img

# The modules are signed stock modules, so stripping them would invalidate
# their signatures.  depmod still generates modules.dep and modules.alias in
# the destination images.
BOARD_DO_NOT_STRIP_VENDOR_MODULES := true
BOARD_DO_NOT_STRIP_VENDOR_RAMDISK_MODULES := true

BOARD_SYSTEM_KERNEL_MODULES := \
    $(wildcard $(FLOURITE_KERNEL_PREBUILT)/system_dlkm/*.ko)
BOARD_SYSTEM_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(FLOURITE_KERNEL_PREBUILT)/modules.load.system_dlkm))

BOARD_VENDOR_KERNEL_MODULES := \
    $(wildcard $(FLOURITE_KERNEL_PREBUILT)/vendor_dlkm/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(FLOURITE_KERNEL_PREBUILT)/modules.load.vendor_dlkm))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := \
    $(FLOURITE_KERNEL_PREBUILT)/modules.blocklist

BOARD_VENDOR_RAMDISK_KERNEL_MODULES := \
    $(wildcard $(FLOURITE_KERNEL_PREBUILT)/vendor_ramdisk/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(FLOURITE_KERNEL_PREBUILT)/modules.load.vendor_ramdisk))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(FLOURITE_KERNEL_PREBUILT)/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := \
    $(FLOURITE_KERNEL_PREBUILT)/modules.blocklist


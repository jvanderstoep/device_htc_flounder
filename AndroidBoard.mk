LOCAL_PATH := $(call my-dir)

$(call add-radio-file,radio/bootloader.img)

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
KERNEL_DEFCONFIG := flounder-debug_defconfig
else
KERNEL_DEFCONFIG := flounder_defconfig
endif
KERNEL_DIR := kernel/htc/flounder

include $(TOP)/$(KERNEL_DIR)/AndroidKernel.mk

# device.mk doesn't know about us, and we can't PRODUCT_COPY_FILES here.
# So cp will do.
.PHONY: $(PRODUCT_OUT)/kernel
$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel

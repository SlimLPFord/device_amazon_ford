OVERLAY_BIN := device/amazon/tank/overlay-binaries

# Install init.d scripts
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/99exfat-support:system/etc/init.d/99exfat-support \
	$(OVERLAY_BIN)/99sudaemon:system/etc/init.d/99sudaemon


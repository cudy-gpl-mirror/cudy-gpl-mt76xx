#
# MT7621 Profiles
#

define Build/ubnt-erx-factory-image
	if [ -e $(KDIR)/tmp/$(KERNEL_INITRAMFS_IMAGE) -a "$$(stat -c%s $@)" -lt "$(KERNEL_SIZE)" ]; then \
		echo '21001:6' > $(1).compat; \
		$(TAR) -cf $(1) --transform='s/^.*/compat/' $(1).compat; \
		\
		$(TAR) -rf $(1) --transform='s/^.*/vmlinux.tmp/' $(KDIR)/tmp/$(KERNEL_INITRAMFS_IMAGE); \
		mkhash md5 $(KDIR)/tmp/$(KERNEL_INITRAMFS_IMAGE) > $(1).md5; \
		$(TAR) -rf $(1) --transform='s/^.*/vmlinux.tmp.md5/' $(1).md5; \
		\
		echo "dummy" > $(1).rootfs; \
		$(TAR) -rf $(1) --transform='s/^.*/squashfs.tmp/' $(1).rootfs; \
		\
		mkhash md5 $(1).rootfs > $(1).md5; \
		$(TAR) -rf $(1) --transform='s/^.*/squashfs.tmp.md5/' $(1).md5; \
		\
		echo '$(BOARD) $(VERSION_CODE) $(VERSION_NUMBER)' > $(1).version; \
		$(TAR) -rf $(1) --transform='s/^.*/version.tmp/' $(1).version; \
		\
		$(CP) $(1) $(BIN_DIR)/; \
	else \
		echo "WARNING: initramfs kernel image too big, cannot generate factory image" >&2; \
	fi
endef

define Device/11acnas
  DTS := 11ACNAS
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := WeVO 11AC NAS Router
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport kmod-mt76
endef
TARGET_DEVICES += 11acnas

define Device/ac1200pro
  DTS := AC1200pro
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  DEVICE_TITLE := Digineo AC1200 Pro
  DEVICE_PACKAGES := kmod-usb3 kmod-ata-core kmod-ata-ahci
endef
TARGET_DEVICES += ac1200pro

define Device/dir-860l-b1
  DTS := DIR-860L-B1
  BLOCKSIZE := 64k
  IMAGES += factory.bin
  KERNEL := kernel-bin | patch-dtb | relocate-kernel | lzma | uImage lzma
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  IMAGE/sysupgrade.bin := \
	append-kernel | pad-offset $$$$(BLOCKSIZE) 64 | append-rootfs | \
	seama -m "dev=/dev/mtdblock/2" -m "type=firmware" | \
	pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/factory.bin := \
	append-kernel | pad-offset $$$$(BLOCKSIZE) 64 | \
	append-rootfs | pad-rootfs -x 64 | \
	seama -m "dev=/dev/mtdblock/2" -m "type=firmware" | \
	seama-seal -m "signature=wrgac13_dlink.2013gui_dir860lb" | \
	check-size $$$$(IMAGE_SIZE)
  DEVICE_TITLE := D-Link DIR-860L B1
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += dir-860l-b1

define Device/firewrt
  DTS := FIREWRT
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Firefly FireWRT
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += firewrt

define Device/mt7621
  DTS := MT7621
  BLOCKSIZE := 64k
  IMAGE_SIZE := $(ralink_default_fw_size_4M)
  DEVICE_TITLE := MediaTek MT7621 EVB
endef
TARGET_DEVICES += mt7621

define Device/newifi-d1
  DTS := Newifi-D1
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  DEVICE_TITLE := Newifi D1
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += newifi-d1

define Device/pbr-m1
  DTS := PBR-M1
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := PBR-M1
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport kmod-ata-core kmod-ata-ahci
endef
TARGET_DEVICES += pbr-m1

define Device/rb750gr3
  DTS := RB750Gr3
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := MikroTik RB750Gr3
  DEVICE_PACKAGES := kmod-usb3 uboot-envtools -kmod-mt76 -kmod-rt2x00-lib -kmod-mac80211 -kmod-cfg80211 -wpad-mini -iwinfo
endef
TARGET_DEVICES += rb750gr3

define Device/re6500
  DTS := RE6500
  DEVICE_TITLE := Linksys RE6500
endef
TARGET_DEVICES += re6500

define Device/sap-g3200u3
  DTS := SAP-G3200U3
  DEVICE_TITLE := STORYLiNK SAP-G3200U3
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += sap-g3200u3

define Device/sk-wb8
  DTS := SK-WB8
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := SamKnows Whitebox 8
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport uboot-envtools
endef
TARGET_DEVICES += sk-wb8

define Device/timecloud
  DTS := Timecloud
  DEVICE_TITLE := Thunder Timecloud
  DEVICE_PACKAGES := kmod-usb3
endef
TARGET_DEVICES += timecloud

define Device/ubnt-erx
  DTS := UBNT-ERX
  FILESYSTEMS := squashfs
  KERNEL_SIZE := 3145728
  KERNEL := $(KERNEL_DTB) | uImage lzma
  IMAGES := sysupgrade.tar
  KERNEL_INITRAMFS := $$(KERNEL) | ubnt-erx-factory-image $(KDIR)/tmp/$$(KERNEL_INITRAMFS_PREFIX)-factory.tar
  IMAGE/sysupgrade.tar := sysupgrade-tar | append-metadata
  DEVICE_TITLE := Ubiquiti EdgeRouter X
  DEVICE_PACKAGES := -kmod-mt76 -kmod-mt7603 -kmod-mt76x2 -kmod-mt76-core -kmod-mac80211 -kmod-cfg80211 -wpad-mini -iwinfo
endef
TARGET_DEVICES += ubnt-erx

define Device/vr500
  DTS := VR500
  IMAGE_SIZE := 66453504
  DEVICE_TITLE := Planex VR500
  DEVICE_PACKAGES := kmod-usb3
endef
TARGET_DEVICES += vr500

define Device/w2914nsv2
  DTS := W2914NSV2
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := WeVO W2914NS v2
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport kmod-mt76
endef
TARGET_DEVICES += w2914nsv2

define Device/wf-2881
  DTS := WF-2881
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  FILESYSTEMS := squashfs
  IMAGE_SIZE := 129280k
  KERNEL := $(KERNEL_DTB) | pad-offset $$(BLOCKSIZE) 64 | uImage lzma
  UBINIZE_OPTS := -E 5
  IMAGE/sysupgrade.bin := append-kernel | append-ubi | append-metadata | check-size $$$$(IMAGE_SIZE)
  DEVICE_TITLE := NETIS WF-2881
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += wf-2881

define Device/witi
  DTS := WITI
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := MQmaker WiTi
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport kmod-ata-core kmod-ata-ahci
endef
TARGET_DEVICES += witi

define Device/wndr3700v5
  DTS := WNDR3700V5
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Netgear WNDR3700v5
  DEVICE_PACKAGES := kmod-usb3
endef
TARGET_DEVICES += wndr3700v5

define Device/wsr-1166
  DTS := WSR-1166
  IMAGE/sysupgrade.bin := trx | pad-rootfs | append-metadata
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Buffalo WSR-1166
endef
TARGET_DEVICES += wsr-1166

define Device/wsr-600
  DTS := WSR-600
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Buffalo WSR-600
endef
TARGET_DEVICES += wsr-600

define Device/zbt-wg2626
  DTS := ZBT-WG2626
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := ZBT WG2626
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport kmod-ata-core kmod-ata-ahci
endef
TARGET_DEVICES += zbt-wg2626

define Device/zbt-wg3526
  DTS := ZBT-WG3526
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := ZBT WG3526
  DEVICE_PACKAGES := kmod-usb3 kmod-usb-ledtrig-usbport kmod-ata-core kmod-ata-ahci
endef
TARGET_DEVICES += zbt-wg3526

define Device/R10
  DTS := R10
  UIMAGE_NAME := R10
  DEVICE_TITLE := R10 (MT7621/128MB WR1300V1)
endef
TARGET_DEVICES += R10

define Device/R11
  DTS := R11
  UIMAGE_NAME := R11
  DEVICE_TITLE := R11 (MT7621/128MB WR2100)
endef
TARGET_DEVICES += R11

define Device/R13
  DTS := R13
  UIMAGE_NAME := R13
  DEVICE_TITLE := R13 (MT7621/256MB X6V1)
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
endef
TARGET_DEVICES += R13

define Device/R15
  DTS := R15
  UIMAGE_NAME := R15
  DEVICE_TITLE := R15 (MT7621/128MB M1300)
endef
TARGET_DEVICES += R15

define Device/R16
  DTS := R16
  UIMAGE_NAME := R16
  DEVICE_TITLE := R16 (MT7621/128MB M2100)
endef
TARGET_DEVICES += R16

define Device/R17
  DTS := R17
  UIMAGE_NAME := R17
  DEVICE_TITLE := R17 (MT7621/256MB M1800V1)
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
endef
TARGET_DEVICES += R17

define Device/R18
  DTS := R18
  UIMAGE_NAME := R18
  DEVICE_TITLE := R18 (MT7621/128MB RE1800V1)
endef
TARGET_DEVICES += R18

define Device/R20
  DTS := R20
  UIMAGE_NAME := R20
  DEVICE_TITLE := R20 (MT7621/256MB LT18)
endef
TARGET_DEVICES += R20

define Device/R23
  DTS := R23
  UIMAGE_NAME := R23
  DEVICE_TITLE := R23 (MT7621/128MB WR1300 v2)
endef
TARGET_DEVICES += R23

define Device/R24
  DTS := R24
  UIMAGE_NAME := R24
  DEVICE_TITLE := R24 (MT7621/256MB LX18)
endef
TARGET_DEVICES += R24

define Device/R27
  DTS := R27
  UIMAGE_NAME := R27
  DEVICE_TITLE := R27 (MT7621/128MB RE1800 v2)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R27

define Device/R28
  DTS := R28
  UIMAGE_NAME := R28
  DEVICE_TITLE := R28 (MT7621/256MB M1800 v2)
endef
TARGET_DEVICES += R28

define Device/R29
  DTS := R29
  UIMAGE_NAME := R29
  DEVICE_TITLE := R29 (MT7621/128MB R700)
endef
TARGET_DEVICES += R29

define Device/R30
  DTS := R30
  UIMAGE_NAME := R30
  DEVICE_TITLE := R30 (MT7621/256MB X6 v2)
endef
TARGET_DEVICES += R30

define Device/R32
  DTS := R32
  UIMAGE_NAME := R32
  DEVICE_TITLE := R32 (MT7621/128MB LT700)
endef
TARGET_DEVICES += R32

define Device/R33
  DTS := R33
  UIMAGE_NAME := R33
  DEVICE_TITLE := R33 (MT7621/128MB X6 v3)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R33

define Device/R38
  DTS := R38
  UIMAGE_NAME := R38
  DEVICE_TITLE := R38 (MT7621/128MB AP1300)
endef
TARGET_DEVICES += R38

define Device/R39
  DTS := R39
  UIMAGE_NAME := R39
  DEVICE_TITLE := R39 (MT7621/128MB AP1300 Outdoor)
endef
TARGET_DEVICES += R39

define Device/R41
  DTS := R41
  UIMAGE_NAME := R41
  DEVICE_TITLE := R41 (MT7621/128MB LT700V)
endef
TARGET_DEVICES += R41

define Device/R43
  DTS := R43
  UIMAGE_NAME := R43
  DEVICE_TITLE := R43 (MT7621/128MB LT700 Outdoor)
endef
TARGET_DEVICES += R43

define Device/R45
  DTS := R45
  UIMAGE_NAME := R45
  DEVICE_TITLE := R45 (MT7621/128MB WR1300E)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R45

define Device/R48
  DTS := R48
  UIMAGE_NAME := R48
  DEVICE_TITLE := R48 (MT7621/128MB TR1300)
endef
TARGET_DEVICES += R48

define Device/R55
  DTS := R55
  UIMAGE_NAME := R55
  DEVICE_TITLE := R55 (MT7621/128MB LT700E)
endef
TARGET_DEVICES += R55

define Device/R60
  DTS := R60
  UIMAGE_NAME := R60
  DEVICE_TITLE := R60 (MT7621/128MB WR1300EV2)
endef
TARGET_DEVICES += R60

define Device/R64
  DTS := R64
  UIMAGE_NAME := R64
  DEVICE_TITLE := R64 (MT7621/128MB WR1300K)
endef
TARGET_DEVICES += R64

# FIXME: is this still needed?
define Image/Prepare
#define Build/Compile
	rm -rf $(KDIR)/relocate
	$(CP) ../../generic/image/relocate $(KDIR)
	$(MAKE) -C $(KDIR)/relocate KERNEL_ADDR=$(KERNEL_LOADADDR) CROSS_COMPILE=$(TARGET_CROSS)
	$(CP) $(KDIR)/relocate/loader.bin $(KDIR)/loader.bin
endef

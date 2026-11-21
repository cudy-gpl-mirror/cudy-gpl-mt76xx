#
# MT7628 Profiles
#

define Device/mt7628
  DTS := MT7628
  BLOCKSIZE := 64k
  IMAGE_SIZE := $(ralink_default_fw_size_4M)
  DEVICE_TITLE := MediaTek MT7628 EVB
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += mt7628

define Device/miwifi-nano
  DTS := MIWIFI-NANO
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Xiaomi MiWiFi Nano
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += miwifi-nano

define Device/vocore2
  DTS := VOCORE2
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := VoCore VoCore2
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport \
    kmod-sdhci kmod-sdhci-mt7620
endef
TARGET_DEVICES += vocore2

define Device/wl-wn575a3
  DTS := WL-WN575A3
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
  DEVICE_TITLE := Wavlink WL-WN575A3
endef
TARGET_DEVICES += wl-wn575a3

define Device/wrtnode2p
  DTS := WRTNODE2P
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := WRTnode 2P
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += wrtnode2p

define Device/duzun-dm06
  DTS := DUZUN-DM06
  DEVICE_TITLE := DuZun DM06
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += duzun-dm06

define Device/mac1200r-v2
  DTS := MAC1200RV2
  DEVICE_TITLE := Mercury MAC1200R v2.0
  SUPPORTED_DEVICES := mac1200rv2
endef
TARGET_DEVICES += mac1200r-v2

define Device/R4
  DTS := R4
  UIMAGE_NAME := R4
  DEVICE_TITLE := R4 (LT300 MT7628/64MB DDR2)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R4

define Device/R6
  DTS := R6
  UIMAGE_NAME := R6
  DEVICE_TITLE := R6 (LT400V2 MT7628/64MB DDR2)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R6

define Device/R7
  DTS := R7
  UIMAGE_NAME := R7
  DEVICE_TITLE := R7 (WR1200V1 MT7628/64MB DDR2)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R7

define Device/R8
  DTS := R8
  UIMAGE_NAME := R8
  DEVICE_TITLE := R8 (LT400V1 MT7628/64MB DDR2)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R8

define Device/R9
  DTS := R9
  UIMAGE_NAME := R9
  DEVICE_TITLE := R9 (LT500V1 MT7628/128MB DDR2)
endef
TARGET_DEVICES += R9

define Device/R14
  DTS := R14
  UIMAGE_NAME := R14
  DEVICE_TITLE := R14 (RE1200 MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R14

define Device/R19
  DTS := R19
  UIMAGE_NAME := R19
  DEVICE_TITLE := R19 (LT350 MT7628/64MB DDR2)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R19

define Device/R22
  DTS := R22
  UIMAGE_NAME := R22
  DEVICE_TITLE := R22 (M1200 MT7628/128MB)
endef
TARGET_DEVICES += R22

define Device/R25
  DTS := R25
  UIMAGE_NAME := R25
  DEVICE_TITLE := R25 (LT500V2 MT7628/128MB)
endef
TARGET_DEVICES += R25

define Device/R26
  DTS := R26
  UIMAGE_NAME := R26
  DEVICE_TITLE := R26 (WR1200V2 MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R26

define Device/R35
  DTS := R35
  UIMAGE_NAME := R35
  DEVICE_TITLE := R35 (LT500 outdoor MT7628/128MB)
endef
TARGET_DEVICES += R35

define Device/R40
  DTS := R40
  UIMAGE_NAME := R40
  DEVICE_TITLE := R40 (LT400 outdoor MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R40

define Device/R42
  DTS := R42
  UIMAGE_NAME := R42
  DEVICE_TITLE := R42 (LT500V SP1 MT7628/128MB)
endef
TARGET_DEVICES += R42

define Device/R44
  DTS := R44
  UIMAGE_NAME := R44
  DEVICE_TITLE := R44 (AP1200 Outdoor MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R44

define Device/R46
  DTS := R46
  UIMAGE_NAME := R46
  DEVICE_TITLE := R46 (TR1200 MT7628/128MB)
endef
TARGET_DEVICES += R46

define Device/R54
  DTS := R54
  UIMAGE_NAME := R54
  DEVICE_TITLE := R54 (WR300 MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R54

define Device/R56
  DTS := R56
  UIMAGE_NAME := R56
  DEVICE_TITLE := R56 (RE1200 Outdoor MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R56

define Device/R61
  DTS := R61
  UIMAGE_NAME := R61
  DEVICE_TITLE := R61 (LT400E/LT400V MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R61

define Device/R62
  DTS := R62
  UIMAGE_NAME := R62
  DEVICE_TITLE := R62 (WR1200E MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R62

define Device/R66
  DTS := R66
  UIMAGE_NAME := R66
  DEVICE_TITLE := R66 (LT300 MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R66

define Device/R67
  DTS := R67
  UIMAGE_NAME := R67
  DEVICE_TITLE := R67 (LT400VD MT7628/64MB)
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
endef
TARGET_DEVICES += R67
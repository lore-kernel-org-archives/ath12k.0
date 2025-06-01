Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D367C54FB3
	for <ath12k@archiver.kernel.org>; Sun,  1 Jun 2025 19:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:To:
	References:Date:Subject:Mime-Version:Content-Transfer-Encoding:Content-Type:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBeIHaDULsbEMOZHOTVRhAiulkv2aETfSRrssxGFRk4=; b=lMTXJA74NcHb6KycX8yNxs7Bvc
	dPpZaxnLx+GICfG85na7WtaFdVbSglgo/1kCkI0QpuaXKbZsTRHy5Q7Y8EbK4zFqVKkur9DbY3LLD
	CUe/Irt3pKSTiA/xytqbW9/u1ZkQFQsINn4/KgJWZq3UlRFroIzxrDqVrdHv/u/1600DqfeXpl6US
	e/LQdAruAbgyi6YCihxCksTBohPTPnw/FNGewogpg/vQ0TiM6OC7nhHthfQQTXq5jWjbFd9VtTw9K
	owJ1Uqa7S27QF9a+TAoOyWMqDjHbGJO76ovV1wXsCZN8p+iYhNuFDsbSFGQPuT0xqoU0CmmxxXl7/
	nUVh7Qnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLojK-00000005uUV-2ozz;
	Sun, 01 Jun 2025 19:52:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLojH-00000005uUA-43ti
	for ath12k@lists.infradead.org;
	Sun, 01 Jun 2025 19:52:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-604b9c53f6fso7417955a12.2
        for <ath12k@lists.infradead.org>; Sun, 01 Jun 2025 12:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748807542; x=1749412342; darn=lists.infradead.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBeIHaDULsbEMOZHOTVRhAiulkv2aETfSRrssxGFRk4=;
        b=NH3H9rqFG/MM2MpXMntkyaf8mh4q+FDgDcTHtACo1lpySO1ssWNWdeJnhcU6OTTNNu
         SJqDY69SLjzYftWR99fAhLf0PDtRg517132tFsX3+0VEh/BQt6IXx7odHas9aDwa1kTt
         YTuD76x5hPWkBLl36Ap33as/XNhNoJmpky5tQ8zehD6t6JxIRJjNXTFofUP1lJ1kzPF1
         LolIMm8YdGuFRxd0MLbNK+6Ya2ScZvsLLxZDQSWJxf7AoCy8FRed0ZGiR0Z0SDzruqgT
         B8XgdC6wXhr6EaazjJy3rxH8zNfRCWCQDFXHtuA+NOjzjMJkdwy+943obt28oPfVB6/k
         G/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748807542; x=1749412342;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBeIHaDULsbEMOZHOTVRhAiulkv2aETfSRrssxGFRk4=;
        b=JInsOFEf0M5+HXkrJYDixYDHwJB5Bjz/FMntMoQsIhq+tk6UT7rvUXaBDTHKIgExWV
         BIGNf2ukQFOvVXAE6PwDqkxNd8qnKbM0OGpGCU4Ld3C91q4hTrNJkj5IG/i3zeuAB8pR
         jbGeweah5uu7IOnJ3Odih4OiHqgd26VIbS6yqIaMsQ9jAWuGbF/kDHUsgA2LZUdu5Gyf
         /Q8ZevwjgoZ/CMWaRNLTmBHl01uFUsqg44vIeyIjptoMPA4S/Cjhccq5WLf7BfZfWw5h
         wblXtXJnOAjHSEINvpqvIELdZ6gcrCCIus5cWiSrxQ05bXUmfGSkHTM2M+cdTniH3fp3
         6BRg==
X-Gm-Message-State: AOJu0Yzb3lEXLkVjrbeA/anSw+k84zTgd2ivCR39ZJ6cpPsTUsc11X5O
	pX0lZffl6cNw0FPqNCD9TKkqNrc7OsmsYJi1022RKX3H1vyHql7IobReu+8rdw==
X-Gm-Gg: ASbGncu/ysdQdNDgCNf/btjWZOKDlaqipwTmRP6MDhAHDFhao0Y4zUYEi6XLknsn6fT
	cJkgMXraIP+okuv8tKyGdmLk4iLnbeOOvzjud6fC0HI2a0lhhTZ77tZFEZCn9NUG+Wv5VntVcT8
	C/w/WP+WJmUq1mCJeOh0DwXktnhvpmzyKGBC6R5yJkIxAn9ZZhlVRWe6mOwtGjDb3ZGXHZiH42g
	bEBRpNarKryYE4Dt8/y7Y+rA+7wCNwTtmo7ovnTF5swQuL08g8ntXbWYsM2bbZDM9azltRx4hsr
	tQxWYPnqF/2JIcDlqO7YuV5W5FhkCpvoIwzybpjrhJbTlw1PkDHIgWZzdfiG2iZZLJnUwqRsZ0G
	tRoIiAAmthSM+lq335Fw4xFNoLYH0IvBn5EK0bpDrPFHHqNtctec=
X-Google-Smtp-Source: AGHT+IFTIvElD5xcdISgc8x4S25MN4+Svp4S5TEVKDxF6ah4QAjJUiv+7oCUc/nZ7oaT3czA4gekEg==
X-Received: by 2002:a17:907:3cc9:b0:ad8:a115:d53f with SMTP id a640c23a62f3a-adb323054edmr1053671466b.40.1748807541582;
        Sun, 01 Jun 2025 12:52:21 -0700 (PDT)
Received: from smtpclient.apple (142-252-142-46.pool.kielnet.net. [46.142.252.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7febffsm685329966b.2.2025.06.01.12.52.20
        for <ath12k@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jun 2025 12:52:20 -0700 (PDT)
From: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: wifi: ath12k: Attempting MLO with main (6.15.rc7) for NCM865 /
 WCN7850 in station mode leads to crash/backtrace
Date: Sun, 1 Jun 2025 21:52:09 +0200
References: <BF352E86-5EC1-4FB0-8901-B62B6E400489@gmail.com>
To: ath12k@lists.infradead.org
In-Reply-To: <BF352E86-5EC1-4FB0-8901-B62B6E400489@gmail.com>
Message-Id: <78C6533F-E0F0-4961-9FC6-089F76BB59F1@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_125224_019791_9946607D 
X-CRM114-Status: GOOD (  14.12  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi,

I have the following update for you:

a)
- The vanilla v6.15 kernel works with the patch provided by Doug Brewer =
here: https://0x0.st/s/yfQHTDVDbzo7M5b6dHswjg/83Xm.15 via =
https://lore.kernel.org/ath12k/CAG0V13QTtGLvqELd90WzV1FF0jgSmA92nkrYR6KL=3D=
L1w3mAEYQ@mail.gmail.com/T/#mcc446a505a73a095197bfe8984cde9b875f016ec=20
- The vanilla v6.15 kernel gets a MLO connection but lost the ability to =
see 6 GHz, so MLO is limited to band 2.4 + 5 GHz
- The vanilla v6.15 kernel suffers the same PCI errors as the ath-kernel =
(but it doesn=E2=80=99t lock-up/freeze, when connecting to the wireless)

Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: BAR 0 [mem =
0xf7000000-0xf71fffff 64bit]: assigned
Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: enabling device =
(0000 -> 0002)
Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: MSI vectors: 16
Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: Hardware name: =
wcn7850 hw2.0
Jun 01 20:48:14 debian kernel: NET: Registered PF_QIPCRTR protocol =
family
Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: AER: Multiple =
Uncorrectable (Non-Fatal) error message received from 0000:00:1b.4
Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: PCIe Bus Error: =
severity=3DUncorrectable (Non-Fatal), type=3DTransaction Layer, =
(Completer ID)
Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4:   device =
[8086:a2eb] error status/mask=3D00008000/00010000
Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4:    [15] CmpltAbrt  =
            (First)
Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: AER:   TLP Header: =
0x00000000 0x00000000 0x00000000 0x00000000
Jun 01 20:48:14 debian kernel: mhi mhi0: Requested to power ON
Jun 01 20:48:14 debian kernel: mhi mhi0: Power on setup success
Jun 01 20:48:14 debian kernel: mhi mhi0: Wait for device to enter SBL or =
Mission mode
...
Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: AER: can't =
recover (no error_detected callback)
Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: AER: device =
recovery failed
Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: qmi dma =
allocation failed (7012352 B type 1), will try later with small size
Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: chip_id 0x2 =
chip_family 0x4 board_id 0xff soc_id 0x40170200
Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: fw_version =
0x1108811c fw_build_timestamp 2025-05-17 00:21 fw_build_id =
QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QCAHMTS>
Jun 01 20:48:14 debian kernel: r8169 0000:06:00.0: Unable to load =
firmware rtl_nic/rtl8168h-2.fw (-2)
Jun 01 20:48:15 debian kernel: Generic FE-GE Realtek PHY r8169-0-600:00: =
attached PHY driver (mii_bus:phy_addr=3Dr8169-0-600:00, irq=3DMAC)
Jun 01 20:48:15 debian kernel: r8169 0000:06:00.0 enp6s0: Link is Down
Jun 01 20:48:15 debian kernel: ath12k_pci 0000:03:00.0 wlp3s0: renamed =
from wlan0
...
Jun 01 20:52:18 debian kernel: wlp3s0: authenticate with =
88:3c:93:01:ce:40 (local address=3Df6:05:44:0b:76:f7)
Jun 01 20:52:18 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 =
(try 1/3)
Jun 01 20:52:18 debian kernel: wlp3s0: authenticate with =
88:3c:93:01:ce:40 (local address=3Df6:05:44:0b:76:f7)
Jun 01 20:52:18 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 =
(try 1/3)
Jun 01 20:52:18 debian kernel: wlp3s0: authenticated
Jun 01 20:52:18 debian kernel: wlp3s0: associate with 88:3c:93:01:ce:40 =
(try 1/3)
Jun 01 20:52:18 debian kernel: wlp3s0: RX AssocResp from =
88:3c:93:01:ce:40 (capab=3D0x511 status=3D0 aid=3D4)
Jun 01 20:52:18 debian kernel: wlp3s0: [link 0] local address =
ea:30:57:8e:3e:0e, AP link address 88:3c:93:01:ce:40
Jun 01 20:52:18 debian kernel: wlp3s0: [link 1] local address =
f6:05:44:0b:76:f7, AP link address 88:3c:93:01:ce:50 (assoc)
Jun 01 20:52:18 debian kernel: wlp3s0: associated
Jun 01 20:52:18 debian kernel: wlp3s0: Limiting TX power to 30 (30 - 0) =
dBm as advertised by 88:3c:93:01:ce:50
Jun 01 20:53:41 debian kernel: wlp3s0: deauthenticating from =
88:3c:93:01:ce:40 by local choice (Reason: 3=3DDEAUTH_LEAVING)
Jun 01 20:56:06 debian kernel: wlp3s0: authenticate with =
88:3c:93:01:ce:40 (local address=3D4e:48:ef:30:ed:17)
Jun 01 20:56:06 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 =
(try 1/3)
Jun 01 20:56:06 debian kernel: wlp3s0: authenticate with =
88:3c:93:01:ce:40 (local address=3D4e:48:ef:30:ed:17)
Jun 01 20:56:06 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 =
(try 1/3)
Jun 01 20:56:06 debian kernel: wlp3s0: authenticated
Jun 01 20:56:06 debian kernel: wlp3s0: associate with 88:3c:93:01:ce:40 =
(try 1/3)
Jun 01 20:56:06 debian kernel: wlp3s0: RX AssocResp from =
88:3c:93:01:ce:40 (capab=3D0x511 status=3D0 aid=3D4)
Jun 01 20:56:06 debian kernel: wlp3s0: [link 0] local address =
ca:a7:b2:c3:ce:ee, AP link address 88:3c:93:01:ce:40
Jun 01 20:56:06 debian kernel: wlp3s0: [link 1] local address =
4e:48:ef:30:ed:17, AP link address 88:3c:93:01:ce:50 (assoc)
Jun 01 20:56:06 debian kernel: wlp3s0: associated
Jun 01 20:56:06 debian kernel: wlp3s0: Limiting TX power to 30 (30 - 0) =
dBm as advertised by 88:3c:93:01:ce:50
Jun 01 21:23:43 debian kernel: wlp3s0: deauthenticating from =
88:3c:93:01:ce:40 by local choice (Reason: 3=3DDEAUTH_LEAVING)
Jun 01 21:23:43 debian kernel: ath12k_pci 0000:03:00.0: failed to send =
HAL_REO_CMD_FLUSH_CACHE, tid 14 (-105)
Jun 01 21:23:43 debian kernel: ath12k_pci 0000:03:00.0: failed to send =
HAL_REO_CMD_FLUSH_CACHE cmd, tid 16 (-105)

$ lspci -tv
-[0000:00]-+-00.0  Intel Corporation 8th Gen Core 4-core Desktop =
Processor Host Bridge/DRAM Registers [Coffee Lake S]
           +-02.0  Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630]
           +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / =
6th/7th/8th Gen Core Processor Gaussian Mixture Model
           +-14.0  Intel Corporation 200 Series/Z370 Chipset Family USB =
3.0 xHCI Controller
           +-16.0  Intel Corporation 200 Series PCH CSME HECI #1
           +-17.0  Intel Corporation 200 Series PCH SATA controller =
[AHCI mode]
           +-1b.0-[01]--
           +-1b.3-[02]--
           +-1b.4-[03]----00.0  Qualcomm Technologies, Inc WCN785x Wi-Fi =
7(802.11be) 320MHz 2x2 [FastConnect 7800]
           +-1c.0-[04]--
           +-1c.3-[05]--
           +-1c.4-[06]----00.0  Realtek Semiconductor Co., Ltd. =
RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller
           +-1c.5-[07]--
           +-1c.6-[08]--
           +-1c.7-[09]--
           +-1d.0-[0a]----00.0  Lite-On IT Corp. / Plextor M6e PCI =
Express SSD [Marvell 88SS9183]
           +-1f.0  Intel Corporation Device a2cc
           +-1f.2  Intel Corporation 200 Series/Z370 Chipset Family =
Power Management Controller
           +-1f.3  Intel Corporation 200 Series PCH HD Audio
           \-1f.4  Intel Corporation 200 Series/Z370 Chipset Family =
SMBus Controller

$ lspci -vvv

03:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi =
7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
	Subsystem: Quectel Wireless Solutions Co., Ltd. Device 8000
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- =
ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort+ =
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin ? routed to IRQ 139
	Region 0: Memory at f7000000 (64-bit, non-prefetchable) =
[size=3D2M]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA =
PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 =
PME-
	Capabilities: [50] MSI: Enable+ Count=3D16/32 Maskable+ 64bit-
		Address: fee00618  Data: 0000
		Masking: ffff8000  Pending: 00000000
	Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s =
unlimited, L1 unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- =
SlotPowerLimit 25W TEE-IO-
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- =
AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x2, ASPM L0s L1, =
Exit Latency L0s <1us, L1 <64us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- =
CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x1 (downgraded)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- =
ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ =
NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, =
ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, =
EmergencyPowerReductionInit-
			 FRS- TPHComp+ ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
			 AtomicOpsCtl: ReqEn-
			 IDOReq- IDOCompl- LTR+ =
EmergencyPowerReductionReq-
			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- =
Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- =
SpeedDis-
			 Transmit Margin: Normal Operating Range, =
EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB =
de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -6dB, =
EqualizationComplete+ EqualizationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ =
LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- =
UnxCmplt- RxOF- MalfTLP-
			ECRC- UnsupReq- ACSViol- UncorrIntErr- =
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- =
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- =
UnxCmplt- RxOF- MalfTLP-
			ECRC- UnsupReq- ACSViol- UncorrIntErr+ =
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- =
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- =
UnxCmplt- RxOF+ MalfTLP+
			ECRC- UnsupReq- ACSViol- UncorrIntErr+ =
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- =
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- =
AdvNonFatalErr- CorrIntErr- HeaderOF-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- =
AdvNonFatalErr+ CorrIntErr+ HeaderOF+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- =
ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- =
HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [148 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [158 v1] Transaction Processing Hints
		No steering table available
	Capabilities: [1e4 v1] Latency Tolerance Reporting
		Max snoop latency: 3145728ns
		Max no snoop latency: 3145728ns
	Capabilities: [1ec v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ =
ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=3D70us =
PortTPowerOnTime=3D0us
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- =
ASPM_L1.1-
			   T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
		L1SubCtl2: T_PwrOn=3D44us
	Kernel driver in use: ath12k_pci
	Kernel modules: ath12k

b)
- The crash/backtrace is limited to the kernels that originate from =
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git=20
- I remember that I suffered the same crash (the system simply entirely =
freezes) when attempting to use an Intel BE200
- The issue remained the same with wpa_supplicant =
v2.12-devel-hostap_2_11-873-gb01c4843b
- I=E2=80=99m happy to provide any logs or try things from the =
ath-branches, if you tell me what you need or want me to test

Thanks,
Regards,
Benny




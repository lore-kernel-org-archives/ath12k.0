Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9668EC5B552
	for <ath12k@archiver.kernel.org>; Mon,  9 Jun 2025 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+N0Qebv8qOhLC3gGWuzgnqf9Ce8ZSQKap86qoduVLk=; b=qXLmsjpB02E0ovC8nEuGghkKFn
	iNeM72gO897xacVg+AlHEV0Qlnd1yR2pviZQ/YhWsouRATO3JnHdsMWMPvqpyvog5c8FQZql93KXf
	pXSoeWuTVWf1HjzYnxAeb3RJo3Bh6U/AzR3m3tCwIyojLYsOS/xL6yYjZNHEL6mjhMBcs0BEeNbyb
	kOg8PnDftWSZirdXKuIPQw6ytD8XR9dGtVHRNO4tJnhmaGb9VTGg5qIKkmUW0/Y9q0dLyWMhRvoze
	zbzVOxND4+5/Hfa8vNAjqADxUk7rw3kcIy1+Pq7r2k1OVUgeM8J3OeW7ekVDJ2Ywufh7AjtyLPcqb
	TuiZqDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfRG-00000004gP2-1W2V;
	Mon, 09 Jun 2025 16:33:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOerA-00000004aTy-1hEi
	for ath12k@lists.infradead.org;
	Mon, 09 Jun 2025 15:56:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso8499812a12.2
        for <ath12k@lists.infradead.org>; Mon, 09 Jun 2025 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749484574; x=1750089374; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+N0Qebv8qOhLC3gGWuzgnqf9Ce8ZSQKap86qoduVLk=;
        b=DJymS3GiKKwRLwPVKkDH4IiJIk0U2Hx/7AY9bMkASus3GIc4r5rnQeqZ+wmdR3eSeH
         9TgMsK5kw9dDpwsvkVsGBa/CVSU8U04SDiLvzxfrwKJ78sjTvUpgEEYZFFgkJG2QlSC/
         T3GKFab7KOrKnekRtatCOVnod0Ao3LGrSWhPp5dw2RlXp5zv2EC4Oc+pHdeei9IAoTQq
         IEzJt6NLVU9orQL3bz9BglGmdeQOKWCqcohAtnwnGD3mta9dz9S+uKSJJesG+NhUdc+L
         qH51U5s4rF2JfFx50sK0UgjBLKJqegWG5ZJGyLm1Zi2jOkK5eQuY7Igta8S/+NzspHc/
         6OUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484574; x=1750089374;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+N0Qebv8qOhLC3gGWuzgnqf9Ce8ZSQKap86qoduVLk=;
        b=j6wMHa9f/Kf+HgUwgbMN6QylF1DlE93BGuDfKyDX/zVv8nmWSY20byvrHba9mYoLAN
         vYqoX5nYhcuzi+ZEVpde76nGZ9SlWN6OhM+AtZEew/U3UV6Xr0rx26Qk0C0arvC62zCg
         TIVXYyRc6Yy19TMSV82EiwMIF1R3oGqDiyp+s/dUAalI1WyxHCrzP4zFV2x288B3X1oT
         lWuZW1EwfCxuObxELIlt7TB9JOwggBJSvFbx9JK+lnBRmSxBo1ZjIDu5SMmYSgIBaXNO
         tVBQ0Xqk0Jjr/eco8+6pLl30CiRoHBj4xxn5mS2DhQFuDRsylGEr1NNrcBfqGQhIvY5A
         ifuw==
X-Gm-Message-State: AOJu0YwVqkz5nU0pfMudT+oRyxmDaEK/OvABfuz/mV4DxXRHDaeRKvfz
	pHhLoZYA2+vzP6fltOUX/bJu+SrUSYcvrDob/cZ7cTk+GTkb7N5u97lKPlzcCA==
X-Gm-Gg: ASbGncufs4i7NjX32UQIgBdqmHHFh1PpecP8vzJgw0EDKZ6jzbwP1hX8PyQ0U6p9V04
	P0P20Ym6mFGwn9aEhQHpQPdvGpBBHe9F903N2SXev6oFnT7dRKMGRKhID2Cdszg+hWR48uhQ355
	mHLJJnxiKGtc/cvy1oWJFwRTu4poi34lzbKiCc/ywBd+cha/RwnrAGHgsr25Rnpi8gZnGsFl9GX
	Yks+nqSL1K9Hkd1KZEb0MwamjQ3HH2QhKhLLDq7ZP6tmIzr28f+fyEMca3D4jyZWOxhS2liH/TP
	hfRK9YOCIjF2Vv5B4kuoGKJuLymgZYzQvr4d1Cbw8AdjlkcH0d/fGiAXYD7QkAREyI5nK/Wm04t
	yz9L7ODyO6EaHJD3n36kEiRyoZBUAZiFFQQRMr5L4QzCAOPqBpeY=
X-Google-Smtp-Source: AGHT+IGe31LqcPI23+zYTgWofeGrNw4f6WqD6ALpLWdvbk3+3ziHQHcueWtu7EkMB0kbJv6n0M0dvA==
X-Received: by 2002:a05:6402:50cf:b0:602:241c:345 with SMTP id 4fb4d7f45d1cf-607746a5724mr11331690a12.23.1749484574035;
        Mon, 09 Jun 2025 08:56:14 -0700 (PDT)
Received: from smtpclient.apple (235-252-142-46.pool.kielnet.net. [46.142.252.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783de2bcsm4743091a12.68.2025.06.09.08.56.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:56:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: wifi: ath12k: Attempting MLO with main (6.15.rc7) for NCM865 /
 WCN7850 in station mode leads to crash/backtrace
From: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>
In-Reply-To: <c6b01333-8437-4200-a66b-d678991c426e@quicinc.com>
Date: Mon, 9 Jun 2025 17:56:02 +0200
Cc: ath12k@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <55172546-D4E3-4314-ADFE-685F78B7F782@gmail.com>
References: <BF352E86-5EC1-4FB0-8901-B62B6E400489@gmail.com>
 <78C6533F-E0F0-4961-9FC6-089F76BB59F1@gmail.com>
 <c6b01333-8437-4200-a66b-d678991c426e@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_085616_473743_E280E2F9 
X-CRM114-Status: GOOD (  17.67  )
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

Dear Baochen Qiang, All,

Thanks for your responses! I travelled the past couple of days, thus =
could only test today.
Your input is much appreciated, as I could make it work as you =
suggested.

Should I see EMLSR support?
I noticed that =E2=80=9Ciw=E2=80=9D output no longer has a TX nor RX =
Rate:

debadm@debian:~$ sudo iw dev wlp3s0 station dump
Station 88:3c:93:01:ce:40 (on wlp3s0)
	inactive time:	5516 ms
	rx bytes:	22028457
	rx packets:	252577
	tx bytes:	5495523630
	tx packets:	3582735
	tx retries:	0
	tx failed:	0
	beacon loss:	0
	beacon rx:	0
	rx drop misc:	14586
	signal:  	-128 dBm
	signal avg:	0 dBm
	beacon signal avg:	0 dBm
	tx duration:	0 us
	rx duration:	0 us
	authorized:	yes
	authenticated:	yes
	associated:	yes
	preamble:	long
	WMM/WME:	yes
	MFP:		yes
	TDLS peer:	no
	DTIM period:	0
	beacon interval:0
	connected time:	375 seconds
	associated at [boottime]:	251.514s
	associated at:	1749480430699 ms
	current time:	1749480805845 ms

How should I determine MCS when this output is missing?

> On 3. Jun 2025, at 05:01, Baochen Qiang <quic_bqiang@quicinc.com> =
wrote:
>=20
>=20
>=20
> On 6/2/2025 3:52 AM, Benjamin Eggerstedt wrote:
>> Hi,
>>=20
>> I have the following update for you:
>>=20
>> a)
>> - The vanilla v6.15 kernel works with the patch provided by Doug =
Brewer here: https://0x0.st/s/yfQHTDVDbzo7M5b6dHswjg/83Xm.15 via =
https://lore.kernel.org/ath12k/CAG0V13QTtGLvqELd90WzV1FF0jgSmA92nkrYR6KL=3D=
L1w3mAEYQ@mail.gmail.com/T/#mcc446a505a73a095197bfe8984cde9b875f016ec
>=20
> Yeah, the WCN7850 MLO patches does not reach v6.15. Doug rebased them =
agaist v6.15 so MLO
> should work with them applied.

OK

>=20
>> - The vanilla v6.15 kernel gets a MLO connection but lost the ability =
to see 6 GHz, so MLO is limited to band 2.4 + 5 GHz
>=20
> This is a known iusse and the fix has landed in latest mianline =
kernel, could you have a try?
>=20
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3Dd662c14a51910ba0ad66afd248b601ba30b9f7f1
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D37e775a0a9d79a031d28d9e21480f99f448e9215
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D886bb3624e4c9914a943b63fcfdf30b8d2f2b66e
>=20
>=20
>> - The vanilla v6.15 kernel suffers the same PCI errors as the =
ath-kernel (but it doesn=E2=80=99t lock-up/freeze, when connecting to =
the wireless)
>>=20
>> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: BAR 0 [mem =
0xf7000000-0xf71fffff 64bit]: assigned
>> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: enabling =
device (0000 -> 0002)
>> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: MSI vectors: =
16
>> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: Hardware =
name: wcn7850 hw2.0
>> Jun 01 20:48:14 debian kernel: NET: Registered PF_QIPCRTR protocol =
family
>> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: AER: Multiple =
Uncorrectable (Non-Fatal) error message received from 0000:00:1b.4
>> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: PCIe Bus Error: =
severity=3DUncorrectable (Non-Fatal), type=3DTransaction Layer, =
(Completer ID)
>> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4:   device =
[8086:a2eb] error status/mask=3D00008000/00010000
>> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4:    [15] =
CmpltAbrt              (First)
>> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: AER:   TLP =
Header: 0x00000000 0x00000000 0x00000000 0x00000000
>> Jun 01 20:48:14 debian kernel: mhi mhi0: Requested to power ON
>> Jun 01 20:48:14 debian kernel: mhi mhi0: Power on setup success
>> Jun 01 20:48:14 debian kernel: mhi mhi0: Wait for device to enter SBL =
or Mission mode
>> ...

The above mentioned pcieport error is not seen in ath-current-20250608

>> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: AER: can't =
recover (no error_detected callback)
>> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: AER: device =
recovery failed
>> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: qmi dma =
allocation failed (7012352 B type 1), will try later with small size
>> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: chip_id 0x2 =
chip_family 0x4 board_id 0xff soc_id 0x40170200
>> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: fw_version =
0x1108811c fw_build_timestamp 2025-05-17 00:21 fw_build_id =
QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QCAHMTS>
>> Jun 01 20:48:14 debian kernel: r8169 0000:06:00.0: Unable to load =
firmware rtl_nic/rtl8168h-2.fw (-2)
>> Jun 01 20:48:15 debian kernel: Generic FE-GE Realtek PHY =
r8169-0-600:00: attached PHY driver (mii_bus:phy_addr=3Dr8169-0-600:00, =
irq=3DMAC)
>> Jun 01 20:48:15 debian kernel: r8169 0000:06:00.0 enp6s0: Link is =
Down
>> Jun 01 20:48:15 debian kernel: ath12k_pci 0000:03:00.0 wlp3s0: =
renamed from wlan0
>> ...
>> Jun 01 20:52:18 debian kernel: wlp3s0: authenticate with =
88:3c:93:01:ce:40 (local address=3Df6:05:44:0b:76:f7)
>> Jun 01 20:52:18 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 =
(try 1/3)
>> Jun 01 20:52:18 debian kernel: wlp3s0: authenticate with =
88:3c:93:01:ce:40 (local address=3Df6:05:44:0b:76:f7)
>> Jun 01 20:52:18 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 =
(try 1/3)
>> Jun 01 20:52:18 debian kernel: wlp3s0: authenticated
>> Jun 01 20:52:18 debian kernel: wlp3s0: associate with =
88:3c:93:01:ce:40 (try 1/3)
>> Jun 01 20:52:18 debian kernel: wlp3s0: RX AssocResp from =
88:3c:93:01:ce:40 (capab=3D0x511 status=3D0 aid=3D4)
>> Jun 01 20:52:18 debian kernel: wlp3s0: [link 0] local address =
ea:30:57:8e:3e:0e, AP link address 88:3c:93:01:ce:40
>> Jun 01 20:52:18 debian kernel: wlp3s0: [link 1] local address =
f6:05:44:0b:76:f7, AP link address 88:3c:93:01:ce:50 (assoc)
>> Jun 01 20:52:18 debian kernel: wlp3s0: associated
>> Jun 01 20:52:18 debian kernel: wlp3s0: Limiting TX power to 30 (30 - =
0) dBm as advertised by 88:3c:93:01:ce:50
>> Jun 01 20:53:41 debian kernel: wlp3s0: deauthenticating from =
88:3c:93:01:ce:40 by local choice (Reason: 3=3DDEAUTH_LEAVING)
>> Jun 01 20:56:06 debian kernel: wlp3s0: authenticate with =
88:3c:93:01:ce:40 (local address=3D4e:48:ef:30:ed:17)
>> Jun 01 20:56:06 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 =
(try 1/3)
>> Jun 01 20:56:06 debian kernel: wlp3s0: authenticate with =
88:3c:93:01:ce:40 (local address=3D4e:48:ef:30:ed:17)
>> Jun 01 20:56:06 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 =
(try 1/3)
>> Jun 01 20:56:06 debian kernel: wlp3s0: authenticated
>> Jun 01 20:56:06 debian kernel: wlp3s0: associate with =
88:3c:93:01:ce:40 (try 1/3)
>> Jun 01 20:56:06 debian kernel: wlp3s0: RX AssocResp from =
88:3c:93:01:ce:40 (capab=3D0x511 status=3D0 aid=3D4)
>> Jun 01 20:56:06 debian kernel: wlp3s0: [link 0] local address =
ca:a7:b2:c3:ce:ee, AP link address 88:3c:93:01:ce:40
>> Jun 01 20:56:06 debian kernel: wlp3s0: [link 1] local address =
4e:48:ef:30:ed:17, AP link address 88:3c:93:01:ce:50 (assoc)
>> Jun 01 20:56:06 debian kernel: wlp3s0: associated
>> Jun 01 20:56:06 debian kernel: wlp3s0: Limiting TX power to 30 (30 - =
0) dBm as advertised by 88:3c:93:01:ce:50
>> Jun 01 21:23:43 debian kernel: wlp3s0: deauthenticating from =
88:3c:93:01:ce:40 by local choice (Reason: 3=3DDEAUTH_LEAVING)
>> Jun 01 21:23:43 debian kernel: ath12k_pci 0000:03:00.0: failed to =
send HAL_REO_CMD_FLUSH_CACHE, tid 14 (-105)
>> Jun 01 21:23:43 debian kernel: ath12k_pci 0000:03:00.0: failed to =
send HAL_REO_CMD_FLUSH_CACHE cmd, tid 16 (-105)
>>=20
>> $ lspci -tv
>> -[0000:00]-+-00.0  Intel Corporation 8th Gen Core 4-core Desktop =
Processor Host Bridge/DRAM Registers [Coffee Lake S]
>>           +-02.0  Intel Corporation CoffeeLake-S GT2 [UHD Graphics =
630]
>>           +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / =
6th/7th/8th Gen Core Processor Gaussian Mixture Model
>>           +-14.0  Intel Corporation 200 Series/Z370 Chipset Family =
USB 3.0 xHCI Controller
>>           +-16.0  Intel Corporation 200 Series PCH CSME HECI #1
>>           +-17.0  Intel Corporation 200 Series PCH SATA controller =
[AHCI mode]
>>           +-1b.0-[01]--
>>           +-1b.3-[02]--
>>           +-1b.4-[03]----00.0  Qualcomm Technologies, Inc WCN785x =
Wi-Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800]
>>           +-1c.0-[04]--
>>           +-1c.3-[05]--
>>           +-1c.4-[06]----00.0  Realtek Semiconductor Co., Ltd. =
RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller
>>           +-1c.5-[07]--
>>           +-1c.6-[08]--
>>           +-1c.7-[09]--
>>           +-1d.0-[0a]----00.0  Lite-On IT Corp. / Plextor M6e PCI =
Express SSD [Marvell 88SS9183]
>>           +-1f.0  Intel Corporation Device a2cc
>>           +-1f.2  Intel Corporation 200 Series/Z370 Chipset Family =
Power Management Controller
>>           +-1f.3  Intel Corporation 200 Series PCH HD Audio
>>           \-1f.4  Intel Corporation 200 Series/Z370 Chipset Family =
SMBus Controller
>>=20
>> $ lspci -vvv
>>=20
>> 03:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi =
7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
>> Subsystem: Quectel Wireless Solutions Co., Ltd. Device 8000
>> Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- =
Stepping- SERR- FastB2B- DisINTx+
>> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort+ =
<TAbort- <MAbort- >SERR- <PERR- INTx-
>> Latency: 0, Cache Line Size: 64 bytes
>> Interrupt: pin ? routed to IRQ 139
>> Region 0: Memory at f7000000 (64-bit, non-prefetchable) [size=3D2M]
>> Capabilities: [40] Power Management version 3
>> Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA =
PME(D0+,D1-,D2-,D3hot+,D3cold+)
>> Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
>> Capabilities: [50] MSI: Enable+ Count=3D16/32 Maskable+ 64bit-
>> Address: fee00618  Data: 0000
>> Masking: ffff8000  Pending: 00000000
>> Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
>> DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 =
unlimited
>> ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25W =
TEE-IO-
>> DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>> RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>> MaxPayload 128 bytes, MaxReadReq 512 bytes
>> DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
>> LnkCap: Port #0, Speed 8GT/s, Width x2, ASPM L0s L1, Exit Latency L0s =
<1us, L1 <64us
>> ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>> LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>> ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>> LnkSta: Speed 8GT/s, Width x1 (downgraded)
>> TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>> DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
>>  10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>>  EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>>  FRS- TPHComp+ ExtTPHComp-
>>  AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>> DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>>  AtomicOpsCtl: ReqEn-
>>  IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>>  10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>> LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- =
2Retimers- DRS-
>> LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>>  Transmit Margin: Normal Operating Range, EnterModifiedCompliance- =
ComplianceSOS-
>>  Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>> LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ =
EqualizationPhase1+
>>  EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
>>  Retimer- 2Retimers- CrosslinkRes: unsupported
>> Capabilities: [100 v2] Advanced Error Reporting
>> UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- =
MalfTLP-
>> ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- =
TLPBlockedErr-
>> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- =
TLPXlatBlocked-
>> UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- =
MalfTLP-
>> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- =
TLPBlockedErr-
>> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- =
TLPXlatBlocked-
>> UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ =
MalfTLP+
>> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- =
TLPBlockedErr-
>> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- =
TLPXlatBlocked-
>> CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- =
CorrIntErr- HeaderOF-
>> CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ =
CorrIntErr+ HeaderOF+
>> AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ =
ECRCChkEn-
>> MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>> HeaderLog: 00000000 00000000 00000000 00000000
>> Capabilities: [148 v1] Secondary PCI Express
>> LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>> LaneErrStat: 0
>> Capabilities: [158 v1] Transaction Processing Hints
>> No steering table available
>> Capabilities: [1e4 v1] Latency Tolerance Reporting
>> Max snoop latency: 3145728ns
>> Max no snoop latency: 3145728ns
>> Capabilities: [1ec v1] L1 PM Substates
>> L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ =
L1_PM_Substates+
>>   PortCommonModeRestoreTime=3D70us PortTPowerOnTime=3D0us
>> L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>>    T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
>> L1SubCtl2: T_PwrOn=3D44us
>> Kernel driver in use: ath12k_pci
>> Kernel modules: ath12k
>>=20
>=20
> Strange ...
>=20
> To what kind a PCIe slot is WCN7850 attached? is it a =
standard/dedicated M.2 interface? It
> is common there is a dedicated WLAN M.2 interface on mother board=EF=BC=8C=
 can you check and try
> if there indeed is?

I have no WLAN M.2 Slot on this board, thus I=E2=80=99m using a PCIe X4 =
to M-Key card and then an adapter to convert M-Key to A/E-Key (which =
unfortunately only appears to support x1 instead of x2).
USB is broken out and attached to USB-Pins on the mainboard. I know this =
may not be optimal, but it works.

>=20
>> b)
>> - The crash/backtrace is limited to the kernels that originate from =
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
>=20
> Could you provide the ath kernel tag (like ath-202505221654) with =
which you see the crash?

I can confirm that the issue is NOT seen in ath-current-20250608
$ git clone --depth 1 --branch ath-current-20250608 =
git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git

I applied https://0x0.st/8g7F.diff against ath-current-20250608 and MLO =
works fine, including 6 GHz.

support@AP-CE:40:~$ ssudo sta_list
SSID:Stellar-Wi-Fi-7-Pi
STA_MAC                  IPv4                       IPv6                 =
      OnlineTime             RX            TX         FREQ      AUTH     =
       Final_role            VLANID     TUNNELID      FARENDIP
fa:77:78:41:f7:a6  192.168.2.122                                         =
      661                 35842175      45738         2.4GHz  PSK_WPA3   =
   __Stellar-Wi-Fi-7-Pi      0           0            =20
SSID:Stellar-Wi-Fi-7-Pi
STA_MAC                  IPv4                       IPv6                 =
      OnlineTime             RX            TX         FREQ      AUTH     =
       Final_role            VLANID     TUNNELID      FARENDIP
fa:bc:8e:24:9d:c2  192.168.2.122                                         =
      661                 5384980129    15013137      6GHz    PSK_WPA3   =
   __Stellar-Wi-Fi-7-Pi      0           0            =20
SSID:Stellar-Wi-Fi-7-Pi
STA_MAC                  IPv4                       IPv6                 =
      OnlineTime             RX            TX         FREQ      AUTH     =
       Final_role            VLANID     TUNNELID      FARENDIP
06:e6:a8:4e:33:76  192.168.2.122                                         =
      661                 0             0             5GHz    PSK_WPA3   =
   __Stellar-Wi-Fi-7-Pi      0           0            =20
support@AP-CE:40:~$ ssudo wlanconfig mld1 list
=3D=3D=3D=3D STA Info =46rom Link: ath001 =3D=3D=3D=3D=3D=3D=3D
ADDR               AID CHAN TXRATE RXRATE RSSI MINRSSI MAXRSSI IDLE  =
TXSEQ  RXSEQ  CAPS XCAPS ACAPS     ERP    STATE MAXRATE(DOT11) HTCAPS   =
VHTCAPS ASSOCTIME    IEs   MODE RXNSS TXNSS                   PSMODE
fa:77:78:41:f7:a6    4    1   6M    137M  -10     -95     -10   68      =
0   65535   PSs  EWBQ NULL    0          f         344200           =
AWRSM          1gGTRs 00:11:17     RSN WME IEEE80211_MODE_11BEG_EHT20  2 =
2   1 =20
     =20
 RSSI is combined over chains in dBm
 Minimum Tx Power		: 0
 Maximum Tx Power		: 0
 HT Capability			: Yes
 VHT Capability			: No
 MU capable			: Yes
 SNR				: 85
 Operating band			: 2.4GHz
 Current Operating class	: 131
 Supported Operating classes	: 81  83  84  115  116  117  118  119  =
120  121  122  123  124  125  126  127  128  131  132  133  134  137  =
130  128  135  133=20
 Supported Rates(Mbps)		: 1  2  5  6  9  11  12  18  24  36  48  =
54=20
 Max STA phymode		: IEEE80211_MODE_11BEG_EHT20=20
 MLO				: Yes=20
 MLD Addr			: 50:cf:14:8e:e3:d1=20
 Num Partner links		: 2=20
       Partner link 0: ADDR :fa:bc:8e:24:9d:c2, Link ID: 2 Bridge link: =
0=20
       Partner link 1: ADDR :06:e6:a8:4e:33:76, Link ID: 1 Bridge link: =
0=20
 EMLSR capable			: No=20
 EMLMR capable			: No=20
 STR capable			: Yes=20

=3D=3D=3D=3D STA Info =46rom Link: ath101 =3D=3D=3D=3D=3D=3D=3D
ADDR               AID CHAN TXRATE RXRATE RSSI MINRSSI MAXRSSI IDLE  =
TXSEQ  RXSEQ  CAPS XCAPS ACAPS     ERP    STATE MAXRATE(DOT11) HTCAPS   =
VHTCAPS ASSOCTIME    IEs   MODE RXNSS TXNSS                   PSMODE
06:e6:a8:4e:33:76    4  100   6M      0M  -95     -95     -95   68      =
0   65535   PSs  EWBQ NULL    0          b        1441200           =
AWRSM          1gGTRs 00:11:17     RSN WME IEEE80211_MODE_11BEA_EHT80  2 =
2   1 =20
     =20
 RSSI is combined over chains in dBm
 Minimum Tx Power		: 0
 Maximum Tx Power		: 30
 HT Capability			: Yes
 VHT Capability			: Yes
 MU capable			: Yes
 SNR				: 0
 Operating band			: 5GHz
 Current Operating class	: 131
 Supported Operating classes	: 81  83  84  115  116  117  118  119  =
120  121  122  123  124  125  126  127  128  131  132  133  134  137  =
130  128  135  133=20
 Supported Rates(Mbps)		: 6  9  12  18  24  36  48  54=20
 Max STA phymode		: IEEE80211_MODE_11BEA_EHT80=20
 MLO				: Yes=20
 MLD Addr			: 50:cf:14:8e:e3:d1=20
 Num Partner links		: 2=20
       Partner link 0: ADDR :fa:bc:8e:24:9d:c2, Link ID: 2 Bridge link: =
0=20
       Partner link 1: ADDR :fa:77:78:41:f7:a6, Link ID: 0 Bridge link: =
0=20
 EMLSR capable			: No=20
 EMLMR capable			: No=20
 STR capable			: Yes=20

=3D=3D=3D=3D STA Info =46rom Link: ath201 =3D=3D=3D=3D=3D=3D=3D
ADDR               AID CHAN TXRATE RXRATE RSSI MINRSSI MAXRSSI IDLE  =
TXSEQ  RXSEQ  CAPS XCAPS ACAPS     ERP    STATE MAXRATE(DOT11) HTCAPS   =
VHTCAPS ASSOCTIME    IEs   MODE RXNSS TXNSS                   PSMODE
fa:bc:8e:24:9d:c2    4    5 3843M     17M  -36     -45     -23   68      =
0   65535     P  EWBQ NULL    0          3        5764800               =
Q              00 00:11:17     RSN WME IEEE80211_MODE_11BEA_EHT320  2 2  =
 0 =20
     =20
 RSSI is combined over chains in dBm
 Minimum Tx Power		: 0
 Maximum Tx Power		: 23
 HT Capability			: No
 VHT Capability			: No
 MU capable			: Yes
 SNR				: 57
 Operating band			: 6GHz
 Current Operating class	: 131
 Supported Operating classes	: 81  83  84  115  116  117  118  119  =
120  121  122  123  124  125  126  127  128  131  132  133  134  137  =
130  128  135  133=20
 Supported Rates(Mbps)		: 6  9  12  18  24  36  48  54=20
 Max STA phymode		: IEEE80211_MODE_11BEA_EHT320=20
 MLO				: Yes=20
 MLD Addr			: 50:cf:14:8e:e3:d1=20
 Num Partner links		: 2=20
       Partner link 0: ADDR :fa:77:78:41:f7:a6, Link ID: 0 Bridge link: =
0=20
       Partner link 1: ADDR :06:e6:a8:4e:33:76, Link ID: 1 Bridge link: =
0=20
 EMLSR capable			: No=20
 EMLMR capable			: No=20
 STR capable			: Yes=20

###

debadm@debian:~$ sudo iw dev wlp3s0 info
Interface wlp3s0
	ifindex 3
	wdev 0x1
	addr 50:cf:14:8e:e3:d1
	ssid Stellar-Wi-Fi-7-Pi
	type managed
	wiphy 0
	multicast TXQ:
		qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	=
tx-bytes	tx-packets
		0	0	0	0	0	0	0	=
0		0
	MLD with links:
	 - link ID  0 link addr fa:77:78:41:f7:a6
	   channel 1 (2412 MHz), width: 20 MHz, center1: 2412 MHz
	 - link ID  1 link addr 06:e6:a8:4e:33:76
	 - link ID  2 link addr fa:bc:8e:24:9d:c2
	   channel 5 (5975 MHz), width: 320 MHz, center1: 6105 MHz




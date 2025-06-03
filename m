Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6681C5AD49
	for <ath12k@archiver.kernel.org>; Tue,  3 Jun 2025 03:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZHOTb0X98Gum6A7oCjhMlgTQImtQXu0aI01XrM8nhQ=; b=p5ZIWcDeGkB2O1G4N3aK0i554N
	Sk2P2iGjsmL2N1yhRcVnC8MS8jyu3qfkKe9aV9GzdwPOvjoaLM8vnbFs/G/0IGJ0lm1QHS6ohjYVg
	OnfWjCqGt2I1+p1VMZPzWUXr05kTnl8cIqrCu0OOdibe7gVt3XQ7rBeB+LkLSwYboKhTXxQSl6SR9
	bcrI8UikMDGzJIt9T9ZsXsrl98y8cru3p9a6OuqEAwxno9ZkKvRARdsAhkRKdsRT2KeVONcz0AVKZ
	HZDil6Q8n1yyAKZQToUemoCHxPNlZImJNTrlftqcW4THvewUH7D5s31fcuuOweXIYQo1+vvxlJ3sK
	PPdoyMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMHu4-00000009Yfi-1JD7;
	Tue, 03 Jun 2025 03:01:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMHu1-00000009YfM-3CIm
	for ath12k@lists.infradead.org;
	Tue, 03 Jun 2025 03:01:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJb00011454;
	Tue, 3 Jun 2025 03:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZHOTb0X98Gum6A7oCjhMlgTQImtQXu0aI01XrM8nhQ=; b=SJcG5i2Wx3STwUB/
	I4auUWwLnTKTecu8CMslL9vwiLg3q665cxQRKmHxC3wtucmCts97l0aSyb1aQhk8
	bWsreqwTAjlxFqkLkW5pDQlpE1OudGOWXEBIK2EGKwQwW+Vv4hS1/jFNJhLGyhc+
	KlGjMpd370jQ/IlPyxDYYaIR+9Jfh5fto446KqaJBSv2VBL8lcZzOxw269gOrE0/
	NrGwL4J71DLZ2qZ6kioJqO+CSVUQFWuS9PdoYZqNFY1zmsDAbR3jr0fXubUaupPr
	p0SkePDxuW77GzzXhWe0FDBx6bCr//gsYZtR3t1ibYU0I2pGAucc4H9fPhorHIwK
	WtAJiA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ss3j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 03:01:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55331NIY025806
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 03:01:23 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Jun 2025
 20:01:22 -0700
Message-ID: <c6b01333-8437-4200-a66b-d678991c426e@quicinc.com>
Date: Tue, 3 Jun 2025 11:01:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath12k: Attempting MLO with main (6.15.rc7) for NCM865 /
 WCN7850 in station mode leads to crash/backtrace
To: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>,
        <ath12k@lists.infradead.org>
References: <BF352E86-5EC1-4FB0-8901-B62B6E400489@gmail.com>
 <78C6533F-E0F0-4961-9FC6-089F76BB59F1@gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <78C6533F-E0F0-4961-9FC6-089F76BB59F1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=683e6584 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=OeuxIFDhAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=wKnAi9oslYsjlycC488A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ly20zD7VuqUA:10 a=USl8sPKdY6I_7jokSFGp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAyNSBTYWx0ZWRfX5L0ZxUMaQksp
 FWWJlbjLZC+W2KxZm5dR2iwt0cGQBoZqvE24bswl9hih5zZQf7g8Fms8vhq8OlN6SnREjaznogM
 aSitTwlyZgLWoF4VvZ3Z57Xfk5e6X6wduhTkmKLh1764KDUy3gQ0ADzyviqveGrjSNE7XttSR8r
 DCgir7VCaj6DhQw8USnePw8nq+bQjEZ+Gc6Pwr8kc6qIkyvZbTyvMN30o7aAfSBMPXWTXwJbHBK
 vDs5qZLrohO67+GTxahVaac20XBDUYudQNx96URmcMhWN00Rvz7CklQ9gaisvVf5eHhicnGztdC
 Lo2K1AXZQLMmII7kFLe9zSe1wENrTFHC6LeoI5LAJsb8lPg5xShsvQozzColjghzXtZvLfJ0rKx
 ktrObtjcSbHD+VGxubqn3Trjh3BuZkCp0isbUyApf1GLZ2U8QGGYhtsR+7Uid3esFCHzksPU
X-Proofpoint-GUID: ODRi0V2WMkzXbIuPjvU0ExrFmfr4lTyC
X-Proofpoint-ORIG-GUID: ODRi0V2WMkzXbIuPjvU0ExrFmfr4lTyC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1011 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_200125_861140_E4DE8C1B 
X-CRM114-Status: GOOD (  17.10  )
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



On 6/2/2025 3:52 AM, Benjamin Eggerstedt wrote:
> Hi,
> 
> I have the following update for you:
> 
> a)
> - The vanilla v6.15 kernel works with the patch provided by Doug Brewer here: https://0x0.st/s/yfQHTDVDbzo7M5b6dHswjg/83Xm.15 via https://lore.kernel.org/ath12k/CAG0V13QTtGLvqELd90WzV1FF0jgSmA92nkrYR6KL=L1w3mAEYQ@mail.gmail.com/T/#mcc446a505a73a095197bfe8984cde9b875f016ec 

Yeah, the WCN7850 MLO patches does not reach v6.15. Doug rebased them agaist v6.15 so MLO
should work with them applied.

> - The vanilla v6.15 kernel gets a MLO connection but lost the ability to see 6 GHz, so MLO is limited to band 2.4 + 5 GHz

This is a known iusse and the fix has landed in latest mianline kernel, could you have a try?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d662c14a51910ba0ad66afd248b601ba30b9f7f1
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37e775a0a9d79a031d28d9e21480f99f448e9215
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=886bb3624e4c9914a943b63fcfdf30b8d2f2b66e


> - The vanilla v6.15 kernel suffers the same PCI errors as the ath-kernel (but it doesn’t lock-up/freeze, when connecting to the wireless)
> 
> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: BAR 0 [mem 0xf7000000-0xf71fffff 64bit]: assigned
> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: MSI vectors: 16
> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> Jun 01 20:48:14 debian kernel: NET: Registered PF_QIPCRTR protocol family
> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: AER: Multiple Uncorrectable (Non-Fatal) error message received from 0000:00:1b.4
> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Completer ID)
> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4:   device [8086:a2eb] error status/mask=00008000/00010000
> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4:    [15] CmpltAbrt              (First)
> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: AER:   TLP Header: 0x00000000 0x00000000 0x00000000 0x00000000
> Jun 01 20:48:14 debian kernel: mhi mhi0: Requested to power ON
> Jun 01 20:48:14 debian kernel: mhi mhi0: Power on setup success
> Jun 01 20:48:14 debian kernel: mhi mhi0: Wait for device to enter SBL or Mission mode
> ...
> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
> Jun 01 20:48:14 debian kernel: pcieport 0000:00:1b.4: AER: device recovery failed
> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1), will try later with small size
> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
> Jun 01 20:48:14 debian kernel: ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTS>
> Jun 01 20:48:14 debian kernel: r8169 0000:06:00.0: Unable to load firmware rtl_nic/rtl8168h-2.fw (-2)
> Jun 01 20:48:15 debian kernel: Generic FE-GE Realtek PHY r8169-0-600:00: attached PHY driver (mii_bus:phy_addr=r8169-0-600:00, irq=MAC)
> Jun 01 20:48:15 debian kernel: r8169 0000:06:00.0 enp6s0: Link is Down
> Jun 01 20:48:15 debian kernel: ath12k_pci 0000:03:00.0 wlp3s0: renamed from wlan0
> ...
> Jun 01 20:52:18 debian kernel: wlp3s0: authenticate with 88:3c:93:01:ce:40 (local address=f6:05:44:0b:76:f7)
> Jun 01 20:52:18 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 (try 1/3)
> Jun 01 20:52:18 debian kernel: wlp3s0: authenticate with 88:3c:93:01:ce:40 (local address=f6:05:44:0b:76:f7)
> Jun 01 20:52:18 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 (try 1/3)
> Jun 01 20:52:18 debian kernel: wlp3s0: authenticated
> Jun 01 20:52:18 debian kernel: wlp3s0: associate with 88:3c:93:01:ce:40 (try 1/3)
> Jun 01 20:52:18 debian kernel: wlp3s0: RX AssocResp from 88:3c:93:01:ce:40 (capab=0x511 status=0 aid=4)
> Jun 01 20:52:18 debian kernel: wlp3s0: [link 0] local address ea:30:57:8e:3e:0e, AP link address 88:3c:93:01:ce:40
> Jun 01 20:52:18 debian kernel: wlp3s0: [link 1] local address f6:05:44:0b:76:f7, AP link address 88:3c:93:01:ce:50 (assoc)
> Jun 01 20:52:18 debian kernel: wlp3s0: associated
> Jun 01 20:52:18 debian kernel: wlp3s0: Limiting TX power to 30 (30 - 0) dBm as advertised by 88:3c:93:01:ce:50
> Jun 01 20:53:41 debian kernel: wlp3s0: deauthenticating from 88:3c:93:01:ce:40 by local choice (Reason: 3=DEAUTH_LEAVING)
> Jun 01 20:56:06 debian kernel: wlp3s0: authenticate with 88:3c:93:01:ce:40 (local address=4e:48:ef:30:ed:17)
> Jun 01 20:56:06 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 (try 1/3)
> Jun 01 20:56:06 debian kernel: wlp3s0: authenticate with 88:3c:93:01:ce:40 (local address=4e:48:ef:30:ed:17)
> Jun 01 20:56:06 debian kernel: wlp3s0: send auth to 88:3c:93:01:ce:40 (try 1/3)
> Jun 01 20:56:06 debian kernel: wlp3s0: authenticated
> Jun 01 20:56:06 debian kernel: wlp3s0: associate with 88:3c:93:01:ce:40 (try 1/3)
> Jun 01 20:56:06 debian kernel: wlp3s0: RX AssocResp from 88:3c:93:01:ce:40 (capab=0x511 status=0 aid=4)
> Jun 01 20:56:06 debian kernel: wlp3s0: [link 0] local address ca:a7:b2:c3:ce:ee, AP link address 88:3c:93:01:ce:40
> Jun 01 20:56:06 debian kernel: wlp3s0: [link 1] local address 4e:48:ef:30:ed:17, AP link address 88:3c:93:01:ce:50 (assoc)
> Jun 01 20:56:06 debian kernel: wlp3s0: associated
> Jun 01 20:56:06 debian kernel: wlp3s0: Limiting TX power to 30 (30 - 0) dBm as advertised by 88:3c:93:01:ce:50
> Jun 01 21:23:43 debian kernel: wlp3s0: deauthenticating from 88:3c:93:01:ce:40 by local choice (Reason: 3=DEAUTH_LEAVING)
> Jun 01 21:23:43 debian kernel: ath12k_pci 0000:03:00.0: failed to send HAL_REO_CMD_FLUSH_CACHE, tid 14 (-105)
> Jun 01 21:23:43 debian kernel: ath12k_pci 0000:03:00.0: failed to send HAL_REO_CMD_FLUSH_CACHE cmd, tid 16 (-105)
> 
> $ lspci -tv
> -[0000:00]-+-00.0  Intel Corporation 8th Gen Core 4-core Desktop Processor Host Bridge/DRAM Registers [Coffee Lake S]
>            +-02.0  Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630]
>            +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model
>            +-14.0  Intel Corporation 200 Series/Z370 Chipset Family USB 3.0 xHCI Controller
>            +-16.0  Intel Corporation 200 Series PCH CSME HECI #1
>            +-17.0  Intel Corporation 200 Series PCH SATA controller [AHCI mode]
>            +-1b.0-[01]--
>            +-1b.3-[02]--
>            +-1b.4-[03]----00.0  Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800]
>            +-1c.0-[04]--
>            +-1c.3-[05]--
>            +-1c.4-[06]----00.0  Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller
>            +-1c.5-[07]--
>            +-1c.6-[08]--
>            +-1c.7-[09]--
>            +-1d.0-[0a]----00.0  Lite-On IT Corp. / Plextor M6e PCI Express SSD [Marvell 88SS9183]
>            +-1f.0  Intel Corporation Device a2cc
>            +-1f.2  Intel Corporation 200 Series/Z370 Chipset Family Power Management Controller
>            +-1f.3  Intel Corporation 200 Series PCH HD Audio
>            \-1f.4  Intel Corporation 200 Series/Z370 Chipset Family SMBus Controller
> 
> $ lspci -vvv
> 
> 03:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
> 	Subsystem: Quectel Wireless Solutions Co., Ltd. Device 8000
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort+ <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin ? routed to IRQ 139
> 	Region 0: Memory at f7000000 (64-bit, non-prefetchable) [size=2M]
> 	Capabilities: [40] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [50] MSI: Enable+ Count=16/32 Maskable+ 64bit-
> 		Address: fee00618  Data: 0000
> 		Masking: ffff8000  Pending: 00000000
> 	Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
> 			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 8GT/s, Width x2, ASPM L0s L1, Exit Latency L0s <1us, L1 <64us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> 		LnkSta:	Speed 8GT/s, Width x1 (downgraded)
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp+ ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported
> 	Capabilities: [100 v2] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> 		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [148 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [158 v1] Transaction Processing Hints
> 		No steering table available
> 	Capabilities: [1e4 v1] Latency Tolerance Reporting
> 		Max snoop latency: 3145728ns
> 		Max no snoop latency: 3145728ns
> 	Capabilities: [1ec v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=0us LTR1.2_Threshold=0ns
> 		L1SubCtl2: T_PwrOn=44us
> 	Kernel driver in use: ath12k_pci
> 	Kernel modules: ath12k
> 

Strange ...

To what kind a PCIe slot is WCN7850 attached? is it a standard/dedicated M.2 interface? It
is common there is a dedicated WLAN M.2 interface on mother board， can you check and try
if there indeed is?

> b)
> - The crash/backtrace is limited to the kernels that originate from https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git 

Could you provide the ath kernel tag (like ath-202505221654) with which you see the crash?

> - I remember that I suffered the same crash (the system simply entirely freezes) when attempting to use an Intel BE200
> - The issue remained the same with wpa_supplicant v2.12-devel-hostap_2_11-873-gb01c4843b

OK, then it seems like some other issue there

> - I’m happy to provide any logs or try things from the ath-branches, if you tell me what you need or want me to test
> 

Thanks,  appritiate.

> Thanks,
> Regards,
> Benny
> 
> 
> 



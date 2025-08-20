Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EF3CA0EED
	for <ath12k@archiver.kernel.org>; Wed, 20 Aug 2025 07:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXzEOnV+cDeHlGbV6CuI7MA2Sg53isAp+SimUKmE4U4=; b=kn0Fwl2085+TDPdQm5tidw/gJt
	rFxxa8nWfO3iu1NRxEFo3q+G9eXjO1Q2FMdpmto2v6nAXM7r//X3jCp5peCYDtu9QvRMHi9M6lE+F
	la6bFHgagztw9RfVnyrNC8VpT2+MZT4x9/QgaWnpgL3/EQcgJtqPZq+2LDlnktqfjglrMext/aOHU
	b0slj00DP3VylseSLd3CPUj4AnuaZ2g6qLA1UepifAVWz2WQFuxPdQb6dxctY+9FCUcLmKitZj032
	IUe1nPe32z8Ca9MqkZ7vLmG/J7ZZBz49SoS3VlBITn71EPue5QfqcFZLePqcQX3KEO4pC3W7sEkDj
	pFVF9fyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uod3W-0000000CaPD-2AuM;
	Wed, 20 Aug 2025 07:16:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocyw-0000000CZaB-014N
	for ath12k@lists.infradead.org;
	Wed, 20 Aug 2025 07:11:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1omgn006919
	for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 07:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zXzEOnV+cDeHlGbV6CuI7MA2Sg53isAp+SimUKmE4U4=; b=iGf7/PdBddYaULYM
	2jl+tlsatPcTmWdUCob5SOP4/fbnoEiYH6ztf2zE3Gbiu95CkLK+C2YyFLez/ASu
	232mh9Ni2xuUdl89Zk5VgYSJKpKNO5RcOoyM3Wr0Ro0lgZ/34EhqOVSN8QCmLU44
	LGWpYZ9GVJzJAcEGuckhm8U8N6kz6dttv95j3RJ3mWOksADQ1N8CBMzmkA+rYfrx
	Qj4eQBZv0xprz+X/DNNnEX9+R2fQ58lMsqxu4PX7SMmVH+vaRw+KDzvFahmqvaNI
	q+tTeQKRWNwhnqoOpYF8A4qGezOThLUzfoOTzQf5fvqq8eiN+hWkSNwjmxT2kjkJ
	158WWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290rvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 07:11:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-324e4c3af5fso340558a91.3
        for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 00:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755673894; x=1756278694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXzEOnV+cDeHlGbV6CuI7MA2Sg53isAp+SimUKmE4U4=;
        b=JntaHQDH6Y3HVyIfNde+JdzXa8H/1EPYRd0j+HnNzCB5rolkUpzuUfiVlm83qmciru
         tUeBnY5C9FEr/tLhh7XmHKNcxo7K/55uEuFVuLNIegD8Pvbk4DNkm5oIMOig0TrpxNei
         txN6NbYgjHxp21eXZl0Od1ZMgEjD/Gpyl9BER/iuVTGdMknud89dYifwnaXfVNjk2xpa
         dt0jATzy77Keaf1FirLQkaBS7HLrcIBjDOIIq0VA+/2FTqtqzC/p2NxxYPoMaRZrNUDK
         b99vvZ6W3CrNBQo/gPeENxtKevGkkVpvOhzdi10kG7wTIqZlfw/74uis/Mb6950hgRNW
         v9VA==
X-Forwarded-Encrypted: i=1; AJvYcCW9UDhjoeQs+MbFNATSrgy8+zRIPh3KHJRVsQtzspxkAXcLJgYwLYJnz1LzmiajPBnP/vRPo1M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzTvtnwPLONkMJdJAA02iCUanlVmX89wYpH9i1ScDciViHBzy/
	EYc4qz2oUN8PqNfvq5MYIFtolGX6oUDI7yls0lvwO+C9rJGN9AgldyP7AyOg9VRCIyMB3PTou8w
	5qzXffXZzXWW4Z5Pf1pag9giWzmri94cjHgbKghQkUpAdhkxruo39hYb0cMiWIbdIl4E2c660
X-Gm-Gg: ASbGncttpxSuW5tjTwYvK2mB3vEsgjfS3SXrTUvq1zmp8uxgpexK/GxielnFy/5Tutb
	T3oWn1q+hHny1VHOMawlM2IHro62Aao+G3dMUrbrszalYmOaTXGZYKGzV2iCTDdlRE2GxuH0+L/
	WEfb60oHno2s7UPNfa7GDbiV/a5inwWmkztPbBAu1mZTJuk9/LKPZYgRC9+BOPO6KxQkrkPHRfI
	6sv3as1ymQCtaPgOS/i9jHisDTa0G+Ziv2af9qNouAeLXnOtaX7FW5KXOZcg4Br9om6csUnZg3g
	+0eotYWrpdTGALpz+onoPnX5AXsxMi/H6e4MazZpqDr+zqUFGBRPsOkxcJmrqNSGDv8Qf5epoDi
	VdvDyjjnAXO0VdYQMwsyXXkhFREDkAVADWvmS
X-Received: by 2002:a17:90b:57c5:b0:31e:cee1:c5e1 with SMTP id 98e67ed59e1d1-324e1408994mr2595863a91.30.1755673894376;
        Wed, 20 Aug 2025 00:11:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU+wrtOzR0AAC0rbw6K+R2q4waLhIbFFCTghUtyPLxEoNyigaKo7hvTjikhXZt8YxCZ7hy9Q==
X-Received: by 2002:a17:90b:57c5:b0:31e:cee1:c5e1 with SMTP id 98e67ed59e1d1-324e1408994mr2595824a91.30.1755673893873;
        Wed, 20 Aug 2025 00:11:33 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e26259b6sm1324377a91.17.2025.08.20.00.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 00:11:33 -0700 (PDT)
Message-ID: <110b6e64-7a9c-4a8f-9b1c-830251d6c733@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 15:11:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 00/13] wifi: ath12k: Ath12k modularization
 changes
To: Kiran Venkatappa <quic_kiranv@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a57528 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FANxXbjX70Gmbhvze2IA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: W3kXA0pGM66eX9Vm7JTYnlzfgrui_dEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6WFdv8QUCLtN
 e9avCq3ChqxmYZRT6fa0g5m83cO3yGBgh+9EoXBGSScRro8GX+foz61LnHR0iAl2i8beJuzIINW
 ukS75hxSm9yCIwjhwx/bHtdidbMkdjRbjX+DfxC/njMw5m4xAiYvxj8DswwwLisNCiJLF0e5oXV
 3FyVJH2BExI0Ihm6g5Iqxx7rvfaLeIH4ZgMf3oKI6mIbl0qg4oyBznib0Klh6dWFOVK5nEqgMFi
 vIMyrzKVkZBN/5eooCC25kfXxD27iy5XGNylhlDgR4MMVfP/1/m0148XVGeIOa7dqB4hEOC4dBu
 3Oh0v+sUHF/1BKjJZ6aoIch/RGzH9aXKhw/06BCP3O5HgdFTezJMrCEMuanbLvonUtLnBfzhW26
 vsueAXkFgwUgQD2aKrtOQ554qs6hiA==
X-Proofpoint-GUID: W3kXA0pGM66eX9Vm7JTYnlzfgrui_dEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_001138_165949_B24CF653 
X-CRM114-Status: GOOD (  22.66  )
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



On 8/13/2025 1:09 AM, Kiran Venkatappa wrote:
> Current ath drivers have separate implementations for different
> classes of devices. For example, ath11k supports WiFi-6 devices,
> while ath12k supports Wi-Fi 7 devices. However, there is significant
> common functionality across these generations due to shared firmware
> and hardware architecture. In the existing driver code, this leverage
> is achieved through code duplication. As a result, when a new driver
> is introduced, many features are missed, and new additions require
> porting across different generation drivers.
> 
> To improve reuse and maintainability, ath12k should be split into common
> and device-specific modules. Common code can be shared across multiple
> architectures, enabling better leverage for future hardware generations.
> generation drivers.
> 
> Firmware interfaces and core initialization sequences are typically common
> across different device families. In contrast, hardware register offsets, copy
> engine mappings, and HAL configurations are usually hardware-specific.
> 
> Common components include:
>       - mac80211 interface: Control path operations are mostly common across
>         different ATH hardware and will be shared as much as possible.
>       - Firmware interface (WMI, HTT, HTC, QMI): Firmware messaging and
>         sequences are common and maintained with backward/forward compatibility
>         using TLVs.
>       - Datapath: Data path files are also separated similarly. More information
>         will be provided in later patches.
>       - Core initialization, reset, and recovery sequences: These will be part
>         of the shared code.
> 
> Device-specific code includes:
>       - Hardware capabilities, configurations, HAL, and other
>         architecture-specific logic.
> 
> The original ath12k.ko is split into these two modules as depicted below.
> 
>                                       +-----------------+
>                                       |                 |
>                                       |   ath12k.ko     |
>                                       |    (common)     |
>     +---------------+                 |                 |
>     |               |                 +-----------------+
>     |   ath12k.ko   | ===========>
>     |               |                 +------------------+
>     +---------------+                 |                  |
>                                       | ath12k_wifi7.ko  |
>                                       | (wifi7 family)   |
>                                       |                  |
>                                       +------------------+
> 
> The ath12k.ko module will serve as the common component, while ath12k_wifi7.ko
> will be the architecture-specific module for WiFi-7 devices.
> 
> After this modular separation, adding support for a new device will
> primarily involve implementing device-specific code, while reusing the
> majority of the shared common components.
> 
> ---
> Kiran Venkatappa (13):
>       wifi: ath12k: Restructure PCI code to common and Wi-Fi 7 specific logic
>       wifi: ath12k: Move Copy Engine configuration to Wi-Fi 7 specific file
>       wifi: ath12k: Move Wi-Fi 7 WMI configuration to dedicated file
>       wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file
>       wifi: ath12k: Rename hw.c to Wi-Fi 7 specific implementation file
>       wifi: ath12k: Rename ahb_hif_ops to reflect generic usage
>       wifi: ath12k: Restructure ahb.c into common and Wi-Fi 7 specific modules
>       wifi: ath12k: Move Wi-Fi 7 specific init routines to dedicated file
>       wifi: ath12k: Move hw_init invocation to target-specific probe
>       wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components
>       wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity
>       wifi: ath12k: Remove HAL defines from shared PCI code
>       wifi: ath12k: Remove HAL define dependencies from shared AHB code
>  
>  drivers/net/wireless/ath/ath12k/Makefile         |   4 +-
>  drivers/net/wireless/ath/ath12k/ahb.c            | 139 ++--
>  drivers/net/wireless/ath/ath12k/ahb.h            |  27 +-
>  drivers/net/wireless/ath/ath12k/ce.c             | 301 -------
>  drivers/net/wireless/ath/ath12k/ce.h             |   5 +-
>  drivers/net/wireless/ath/ath12k/core.c           |  38 +-
>  drivers/net/wireless/ath/ath12k/core.h           |   7 +
>  drivers/net/wireless/ath/ath12k/debug.c          |   4 +
>  drivers/net/wireless/ath/ath12k/dp_rx.c          |   3 +
>  drivers/net/wireless/ath/ath12k/hal.c            |   4 +
>  drivers/net/wireless/ath/ath12k/htc.c            |   2 +
>  drivers/net/wireless/ath/ath12k/hw.h             |   2 -
>  drivers/net/wireless/ath/ath12k/mhi.c            | 130 ---
>  drivers/net/wireless/ath/ath12k/mhi.h            |   4 +-
>  drivers/net/wireless/ath/ath12k/pci.c            | 215 ++---
>  drivers/net/wireless/ath/ath12k/pci.h            |  28 +-
>  drivers/net/wireless/ath/ath12k/peer.c           |   2 +
>  drivers/net/wireless/ath/ath12k/wifi7/Makefile   |  10 +
>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c      |  71 ++
>  drivers/net/wireless/ath/ath12k/wifi7/ahb.h      |  20 +
>  drivers/net/wireless/ath/ath12k/wifi7/ce.c       | 973 +++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wifi7/ce.h       |  22 +
>  drivers/net/wireless/ath/ath12k/wifi7/core.c     |  44 +
>  drivers/net/wireless/ath/ath12k/{ => wifi7}/hw.c | 798 +++----------------
>  drivers/net/wireless/ath/ath12k/wifi7/hw.h       |  13 +
>  drivers/net/wireless/ath/ath12k/wifi7/mhi.c      | 138 ++++
>  drivers/net/wireless/ath/ath12k/wifi7/mhi.h      |  11 +
>  drivers/net/wireless/ath/ath12k/wifi7/pci.c      | 188 +++++
>  drivers/net/wireless/ath/ath12k/wifi7/pci.h      |  12 +
>  drivers/net/wireless/ath/ath12k/wifi7/wmi.c      | 105 +++
>  drivers/net/wireless/ath/ath12k/wifi7/wmi.h      |  15 +
>  drivers/net/wireless/ath/ath12k/wmi.c            |  97 ---
>  drivers/net/wireless/ath/ath12k/wmi.h            |   4 -
>  33 files changed, 1956 insertions(+), 1480 deletions(-)
> ---
> base-commit: d9104cec3e8fe4b458b74709853231385779001f
> change-id: 20250812-ath12k-mod-bd00156df202
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D79CA0EDC
	for <ath12k@archiver.kernel.org>; Thu, 21 Aug 2025 01:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fDC6r2SIInT6VaiKM7NcqOe2r1gA2B4tJ4sn4+Dqg8=; b=sxztow1fCzDwHuu2LD4cx/nYNz
	xc4Jp8rU/svS9WS04B4RYIgdX5X+w1aDl5pnAXXsYu7OiMR5dOps8/JH9zRvUsfLfKNU6TlZJDrea
	LDgnltzDNlAOHkKE2ZhTI/1ZuUTVrJ1jatmUPyvUYD0OuY2TxacvCUOMOVZosM34sYDjYCPF1FJot
	OBjqGLlmdQoWMi4mRE41jVjeKIEeFgnI3gAyQPyWJd2sUUGzZUOa5bGv9Q9JgZzAi5K4WeZeMaLmf
	R3WBJdkA9H56ZyAZPH331uCbELC6B/vxOBAKqUEFpF4TH4hWYuGasVmziBGyvsFhVRBScBdp9QflU
	Eg1CYMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotmG-0000000FNsn-2r5F;
	Thu, 21 Aug 2025 01:07:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uops1-0000000EvuG-1IdT
	for ath12k@lists.infradead.org;
	Wed, 20 Aug 2025 20:57:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJheHL013030
	for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 20:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fDC6r2SIInT6VaiKM7NcqOe2r1gA2B4tJ4sn4+Dqg8=; b=RAkiQxjeECYseapk
	QKu+nkFzrtDgubC6kB7S5zhQ3jQk96SVFNy0j5G9m7zS6E9aWtZwCz3W+GRzZ5hC
	HqierVDqiwOiVwxR8EblvKr5tPD+7egu5AuFxUvMO3BAc2yFvydDAdPLkL8b/Cms
	hXx/1oWYcTD9iWqwgYU1T14s6uWEuuCAswpJRRyzCgSe0HnNaANy/MvCFKVw5FiP
	UtHZWTa8pvWGx7wdoiYgcrWREAKv2/4CtYA3jkB+ToZK4TGMwdYDwE4GwHhmjIvc
	Os5Lw5jF0fuSEJlNcd65ON8BuiIWMteMbccWXZ0EpscWT8oda0KHECu4c90aMcrT
	CyOgWQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52930me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 20:57:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e92b3dde9so320715b3a.3
        for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 13:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755723439; x=1756328239;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fDC6r2SIInT6VaiKM7NcqOe2r1gA2B4tJ4sn4+Dqg8=;
        b=w4lXquKTGlK57uVVwslKqT8ZwufNZvHRCN3g8aQ/kB3InkYb7dV2UwwugfD0q+w4hs
         B7zfeqxn0ZgkF0nprVyjDO3HNkruFEZ6ihlcY+9VAghnVOp/I14RDgAuF66qukexkRiD
         GEY4G61Zfx32RcCnB4c+LgWb5hQ3R2lz1G7neiU5GPC8t6kv1iR0h/ymqJErooxGRQtL
         K6YHkAW9LGRZt8wY0LJHURNhWRqfFGTOpu26TnaI2M3nbBQb/nTABeJ3KoHSwY/DsTqL
         D4wNaDEdNc65snsErJ4nOuWeBgzQ40jtcqOALpCG2V6srkm+AN94G/fJjC7WBrKi/7P6
         UYTg==
X-Forwarded-Encrypted: i=1; AJvYcCVirPCjvSAbB4T31DHRHv6ZCU330qX8vyeSp04tSIgv+8Gh14APY6Etj/Rov1nbRnLghRr6JIc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxG0EXOIZSDzD7uZECcjLpf725kpvOQ0QZJvPR4tZaZT2xuamYm
	vL47n2PTzoKdcFT9fdlzxFwGYML9zx5EMEcMslanmrK8hx4nAtbzhL37Z5tEXHYFrfw3/uoJlJZ
	mPV87fL8ixmW18nUgwaWj8aY3GZZx1aeUsXF2MeKz1XmIgmc0LujDwumVPGs31Jk9yguIl29i
X-Gm-Gg: ASbGncsIn+TBYzMFyz1A/5drvm0yuYYMX/fa6+NNI496SeHoj81h2Q4j6OsNgKFxlg9
	cAlZh6uPuBHGwUUU3Wdc4KiY9PcDVSo531EAGq5ECC5L/fFF7ZIHfsEuU6AUDr4N0YroKgD9eFN
	JnNjQzVuqPjCdcHSOQlH7NzeoIbTsTT80xAwufksps9lB3ukS79cTavi4zWhVaFHOanE4kD08xU
	jp4aQgJyABVYAXHbRf1RbZT2ADOeaW9xPjcalbwgt7gAw/hkSJNFYDfpJGuxvHubK7NrM6/JD0E
	o21yrx6r4vicuZVYcaxtdviKGVnrFPCCrpxM/cj78ka9Zv/1UZwQ9X31W9wmkCarMaqG5XMCVHR
	TLLYSqm4HiJaEPnLagVRozB8Nh9k9lCW6
X-Received: by 2002:a05:6a00:464f:b0:748:e9e4:d970 with SMTP id d2e1a72fcca58-76e8db9d13cmr5495755b3a.1.1755723438702;
        Wed, 20 Aug 2025 13:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtN6JIMaLshcAWm/1Oml6qOXlbk10d0Pi6SBn9RnM2kXQfE6UL8bQFfRjqNG90FjwuNlOo0Q==
X-Received: by 2002:a05:6a00:464f:b0:748:e9e4:d970 with SMTP id d2e1a72fcca58-76e8db9d13cmr5495735b3a.1.1755723438159;
        Wed, 20 Aug 2025 13:57:18 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f7818sm6270394b3a.73.2025.08.20.13.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 13:57:17 -0700 (PDT)
Message-ID: <02584bb9-364e-4391-957f-7833d6bc0f79@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 13:57:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 00/13] wifi: ath12k: Ath12k modularization
 changes
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Kiran Venkatappa <quic_kiranv@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
 <110b6e64-7a9c-4a8f-9b1c-830251d6c733@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <110b6e64-7a9c-4a8f-9b1c-830251d6c733@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a636b0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PvsNls7aUaJVk6CwgFkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: FoCGmlOavJPDdi3P6aXH3g6n4bSCMIJN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6xfnzOAVtQVc
 PfvFXtKP40ix6v/BJJvo9A0XRvJiGIbVzSh30gKlN4IqgVPkyurMFg+RODm1A/Qra+ZWVLIrFQZ
 lX1YulW2j7oRR8Zq3x19AHMNHQCAJAMhtMzRuCca3knmUVhF61Vgqm9wvLd+IXQDnhryYijx6X+
 W7QcgIxmo/Np4kPSCFAUvS2fItNeQYr4VEdZNqR6KAxWPm7w21FrDCfRt51mBkuNJGKEMNS/2FB
 5ZQjM9PNS41RC31wc0hX5yYjAjqxcfjNBnYqrLfy0LA+ZXkwYLxQSznUoEv1XQm8zQunOHIoCMt
 pwOxP/Lihc4hYk54E7QIDodKyy0QGaaGUaq8uMZ+I+UlMKDBwKlwmJDxuB4lZWCUgIiX33FaHUa
 cNkEtMidiAqozq9bcHYT3FQTTPk0aQ==
X-Proofpoint-GUID: FoCGmlOavJPDdi3P6aXH3g6n4bSCMIJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_135721_483158_0EEAFFD3 
X-CRM114-Status: GOOD (  19.31  )
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

On 8/20/2025 12:11 AM, Baochen Qiang wrote:
> 
> 
> On 8/13/2025 1:09 AM, Kiran Venkatappa wrote:
>> Current ath drivers have separate implementations for different
>> classes of devices. For example, ath11k supports WiFi-6 devices,
>> while ath12k supports Wi-Fi 7 devices. However, there is significant
>> common functionality across these generations due to shared firmware
>> and hardware architecture. In the existing driver code, this leverage
>> is achieved through code duplication. As a result, when a new driver
>> is introduced, many features are missed, and new additions require
>> porting across different generation drivers.
>>
>> To improve reuse and maintainability, ath12k should be split into common
>> and device-specific modules. Common code can be shared across multiple
>> architectures, enabling better leverage for future hardware generations.
>> generation drivers.
>>
>> Firmware interfaces and core initialization sequences are typically common
>> across different device families. In contrast, hardware register offsets, copy
>> engine mappings, and HAL configurations are usually hardware-specific.
>>
>> Common components include:
>>       - mac80211 interface: Control path operations are mostly common across
>>         different ATH hardware and will be shared as much as possible.
>>       - Firmware interface (WMI, HTT, HTC, QMI): Firmware messaging and
>>         sequences are common and maintained with backward/forward compatibility
>>         using TLVs.
>>       - Datapath: Data path files are also separated similarly. More information
>>         will be provided in later patches.
>>       - Core initialization, reset, and recovery sequences: These will be part
>>         of the shared code.
>>
>> Device-specific code includes:
>>       - Hardware capabilities, configurations, HAL, and other
>>         architecture-specific logic.
>>
>> The original ath12k.ko is split into these two modules as depicted below.
>>
>>                                       +-----------------+
>>                                       |                 |
>>                                       |   ath12k.ko     |
>>                                       |    (common)     |
>>     +---------------+                 |                 |
>>     |               |                 +-----------------+
>>     |   ath12k.ko   | ===========>
>>     |               |                 +------------------+
>>     +---------------+                 |                  |
>>                                       | ath12k_wifi7.ko  |
>>                                       | (wifi7 family)   |
>>                                       |                  |
>>                                       +------------------+
>>
>> The ath12k.ko module will serve as the common component, while ath12k_wifi7.ko
>> will be the architecture-specific module for WiFi-7 devices.
>>
>> After this modular separation, adding support for a new device will
>> primarily involve implementing device-specific code, while reusing the
>> majority of the shared common components.
>>
>> ---
>> Kiran Venkatappa (13):
>>       wifi: ath12k: Restructure PCI code to common and Wi-Fi 7 specific logic
>>       wifi: ath12k: Move Copy Engine configuration to Wi-Fi 7 specific file
>>       wifi: ath12k: Move Wi-Fi 7 WMI configuration to dedicated file
>>       wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file
>>       wifi: ath12k: Rename hw.c to Wi-Fi 7 specific implementation file
>>       wifi: ath12k: Rename ahb_hif_ops to reflect generic usage
>>       wifi: ath12k: Restructure ahb.c into common and Wi-Fi 7 specific modules
>>       wifi: ath12k: Move Wi-Fi 7 specific init routines to dedicated file
>>       wifi: ath12k: Move hw_init invocation to target-specific probe
>>       wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components
>>       wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity
>>       wifi: ath12k: Remove HAL defines from shared PCI code
>>       wifi: ath12k: Remove HAL define dependencies from shared AHB code
>>  
>>  drivers/net/wireless/ath/ath12k/Makefile         |   4 +-
>>  drivers/net/wireless/ath/ath12k/ahb.c            | 139 ++--
>>  drivers/net/wireless/ath/ath12k/ahb.h            |  27 +-
>>  drivers/net/wireless/ath/ath12k/ce.c             | 301 -------
>>  drivers/net/wireless/ath/ath12k/ce.h             |   5 +-
>>  drivers/net/wireless/ath/ath12k/core.c           |  38 +-
>>  drivers/net/wireless/ath/ath12k/core.h           |   7 +
>>  drivers/net/wireless/ath/ath12k/debug.c          |   4 +
>>  drivers/net/wireless/ath/ath12k/dp_rx.c          |   3 +
>>  drivers/net/wireless/ath/ath12k/hal.c            |   4 +
>>  drivers/net/wireless/ath/ath12k/htc.c            |   2 +
>>  drivers/net/wireless/ath/ath12k/hw.h             |   2 -
>>  drivers/net/wireless/ath/ath12k/mhi.c            | 130 ---
>>  drivers/net/wireless/ath/ath12k/mhi.h            |   4 +-
>>  drivers/net/wireless/ath/ath12k/pci.c            | 215 ++---
>>  drivers/net/wireless/ath/ath12k/pci.h            |  28 +-
>>  drivers/net/wireless/ath/ath12k/peer.c           |   2 +
>>  drivers/net/wireless/ath/ath12k/wifi7/Makefile   |  10 +
>>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c      |  71 ++
>>  drivers/net/wireless/ath/ath12k/wifi7/ahb.h      |  20 +
>>  drivers/net/wireless/ath/ath12k/wifi7/ce.c       | 973 +++++++++++++++++++++++
>>  drivers/net/wireless/ath/ath12k/wifi7/ce.h       |  22 +
>>  drivers/net/wireless/ath/ath12k/wifi7/core.c     |  44 +
>>  drivers/net/wireless/ath/ath12k/{ => wifi7}/hw.c | 798 +++----------------
>>  drivers/net/wireless/ath/ath12k/wifi7/hw.h       |  13 +
>>  drivers/net/wireless/ath/ath12k/wifi7/mhi.c      | 138 ++++
>>  drivers/net/wireless/ath/ath12k/wifi7/mhi.h      |  11 +
>>  drivers/net/wireless/ath/ath12k/wifi7/pci.c      | 188 +++++
>>  drivers/net/wireless/ath/ath12k/wifi7/pci.h      |  12 +
>>  drivers/net/wireless/ath/ath12k/wifi7/wmi.c      | 105 +++
>>  drivers/net/wireless/ath/ath12k/wifi7/wmi.h      |  15 +
>>  drivers/net/wireless/ath/ath12k/wmi.c            |  97 ---
>>  drivers/net/wireless/ath/ath12k/wmi.h            |   4 -
>>  33 files changed, 1956 insertions(+), 1480 deletions(-)
>> ---
>> base-commit: d9104cec3e8fe4b458b74709853231385779001f
>> change-id: 20250812-ath12k-mod-bd00156df202
>>
> 
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>>

I dropped the extra ">" when applying to the patches in 'pending'

/jeff


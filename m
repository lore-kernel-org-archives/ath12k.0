Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD4CA0EDC
	for <ath12k@archiver.kernel.org>; Wed, 20 Aug 2025 04:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Kc49WKRfQ4kJFiTDPrjxF5cfNocY22jjwu3rJcPr9o=; b=MkPV3HicEDcQNbZ4nJjQ6Ucjea
	rFXAcr4abuVA86bbIRWVC/nt1fsNCeICbB3r+pepw2D4G+/noJntNMuC9Q3VVmEpLEdX+PiyhB9Rm
	WnhYGk/sMk14MowMql5I6VEHxXssdsPsoa7UjjrqQbw0iYDFT+EwtY5RpOQ2hV4+Q5hw757w4evU7
	wh4/MctpTy9sK/MfI5Fdbhu8k89fY/f6y6s6usW+051S546Z9V9h/FyIpEmTM4ODipTSHO3mPEKhk
	if/L8Tw/4vnDlA9E+EL9erWlDkA2+GHlF/CMqEDgNKebXEz2VYHfW6aZdaC208Yrow9dToSIVe37n
	OCLJuEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoamK-0000000CMo3-0C2d;
	Wed, 20 Aug 2025 04:50:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoamG-0000000CMnK-2aYM
	for ath12k@lists.infradead.org;
	Wed, 20 Aug 2025 04:50:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ojXh025650
	for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 04:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Kc49WKRfQ4kJFiTDPrjxF5cfNocY22jjwu3rJcPr9o=; b=Dfi4XGWfJgkBaS8L
	1MHQ2yR7KWpV5xia3dkv3XT1KEPFLiH5+DN8ItE+QSzngi1GE2UKxBqTQxQCdN61
	z2XdE7OYhkE8Hqwq6bz2MrqrfEDh1tEgjEk35O7lxZJ21jGggKM36OG3FPdhhw6H
	lGu7ndg9nO6OfmAyjYorKd6SWrHZnXMXnyBOZnKn+B7l6acC+9JF81XHi0D/0PmE
	vYU9Z7glBHBaM0RCUzBt/iqv00nfqyhlXJJIrE6u5kBiB/faFMNrxHSeNauO/T9v
	EP33Ow+4zw45ZXrCk27NiUkjgVGG8uT5iIG4VSZ6h0wfBkPoGYtEMerldnkd9dGw
	se1d+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a8des-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 04:50:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32326e2506aso5735891a91.3
        for <ath12k@lists.infradead.org>; Tue, 19 Aug 2025 21:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755665422; x=1756270222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kc49WKRfQ4kJFiTDPrjxF5cfNocY22jjwu3rJcPr9o=;
        b=B5YT53QFs0rPf1OMGiQU8Zpo4/9louZnyE35JCDP+tM1SUouwwWjuyC4GhqfBMHQsj
         zzkpJPvs/6xC8YZBX+AG1SBheK8PqGMLb7LilWKkPVJrXe+jZN07FXQinws7oFJpKIeZ
         a0CiWqBQvwPJdLh4OYPt04Ixwjo5KxO6eyqL0tkXSzGpTs54uK0qglv8jlXBrC7aSjIf
         D5kNrNOXNDpOJjs9zgtYtasDiL/mn2QeudigSyqr8xTKmRHEEtakOBPWMpEj3AqM5bt6
         A8AGsJLSPpppLS3Jir4gmL9pcEOyI+QQl8tXVMHjGtqIgGsrb6gdpeljvLpkd/JlrUv/
         mvrg==
X-Forwarded-Encrypted: i=1; AJvYcCUsIJT0BPHwN6pTq67hSzljZfoNiSwUJGSWhMRv/KEOYowe7VOcrhh/V57cCHMtYwyO0P9IHDg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKrrkqKo03mUUBPt0DOBv3o81t3wUMoaWYvnPd1fCa7aQF+EIK
	87Oye+xqxkMSWzRLjj/QoVytgEHNtzdGQeajuTjFaY40c1H47g5BpcvFHLaseQYdvFn/6qcR0UG
	vzkC5tsFqZoIlBp/1xgxcStPRBa9J8/ii2Y3+Vh6JBjGkyxPdUa6PuSwFP+YyGWfb
X-Gm-Gg: ASbGnctC7RIvYJrbJXzuE4veZuUccaYH3yKXcmMhCc7MNEPFFh3UzxM0cf1IDmHioJE
	c9HpG5e2BCJ+5jxY6q2MN6ltyuGoBoEHVODHcvg8ic4XQGA9Tez3Q2WPx7yIfJ9bNdniabrRiRl
	vrmv9sbBXuGJD2JpNddJwQuRxFAiE19SsZkTY7EI9puFF9BqKXiFbpEe34yV0IJEgxapgHshXFA
	HORwuSBdtENGyTsrxLvm8UZXn8JmAvMmSP0eIgie2d9B7bKUoVDMCtT2Tk21uiWmi8RCDfONmWf
	4F8W9TkNLvYnVZLsKRJYtXXlOZ8aSG+8XgpcDNpcFF5sqw9MGBTO8emMk3Gckb8F3BpbcAqnEIx
	41ZiKPpEkzew=
X-Received: by 2002:a17:90b:544b:b0:321:c53c:4e70 with SMTP id 98e67ed59e1d1-324e13ad075mr2012969a91.9.1755665421902;
        Tue, 19 Aug 2025 21:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHXwTl3vuHw5N7Y7UmHDVAzbnaYw56yh4QKooZ0Q9HtRnfRB72ym+zdhguStg8z/KgZ+gRMQ==
X-Received: by 2002:a17:90b:544b:b0:321:c53c:4e70 with SMTP id 98e67ed59e1d1-324e13ad075mr2012951a91.9.1755665421347;
        Tue, 19 Aug 2025 21:50:21 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.248.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640afb33sm1135052a12.38.2025.08.19.21.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 21:50:20 -0700 (PDT)
Message-ID: <b9a45766-2034-b444-1348-57d360aa70b5@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 10:20:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath12k-ng 00/13] wifi: ath12k: Ath12k modularization
 changes
Content-Language: en-US
To: Kiran Venkatappa <quic_kiranv@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oOWbdVc8i10D_aWrKXKU64RgyytSiQKy
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a5540f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=pagehsHO18wfKU6DcLw+7w==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=S4ZghseuWT4aJn0Jpu0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: oOWbdVc8i10D_aWrKXKU64RgyytSiQKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+121eC+2sqMn
 Oizyni5i2XMPiEMTarY8iL7n+x27nsMl6N0cMtnzc2P7TQypo6C0iShE4NYYkTNpPypEQ+2rMle
 0pRfXtFibk/6iu6+zHZ/Qgb0829b7ZQ66w07PGVXAPGBlyy1AnxbtyiwghSmyRCl+JeVfFhAGLA
 rKN0LXOyVETEEllrqzipHSdRLZwP8D28wTwabHiNbmlSGOQTLVI5lgBCUmic92XDlcENRTbDZkv
 GIOmds6QG6V4nKHQdfNg4hUfcSkQPSjIS4y1lOFeYeQeDmDlGHWAb8daVS6+VSWx9tLRJpXHwK/
 FAl8fFfQnJy6cbkzPrhXOqoOzW7xC4d1Vu2xDcKqj2limMT0E1iKc08PbU6hdrK4YHNle/g3aL8
 ayhWW8hzUVHag7nqIoVQcPRpMW9Tng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_215024_672555_7835D0A3 
X-CRM114-Status: GOOD (  22.14  )
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



On 8/12/2025 10:39 PM, Kiran Venkatappa wrote:
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
>        - mac80211 interface: Control path operations are mostly common across
>          different ATH hardware and will be shared as much as possible.
>        - Firmware interface (WMI, HTT, HTC, QMI): Firmware messaging and
>          sequences are common and maintained with backward/forward compatibility
>          using TLVs.
>        - Datapath: Data path files are also separated similarly. More information
>          will be provided in later patches.
>        - Core initialization, reset, and recovery sequences: These will be part
>          of the shared code.
> 
> Device-specific code includes:
>        - Hardware capabilities, configurations, HAL, and other
>          architecture-specific logic.
> 
> The original ath12k.ko is split into these two modules as depicted below.
> 
>                                        +-----------------+
>                                        |                 |
>                                        |   ath12k.ko     |
>                                        |    (common)     |
>      +---------------+                 |                 |
>      |               |                 +-----------------+
>      |   ath12k.ko   | ===========>
>      |               |                 +------------------+
>      +---------------+                 |                  |
>                                        | ath12k_wifi7.ko  |
>                                        | (wifi7 family)   |
>                                        |                  |
>                                        +------------------+
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
>        wifi: ath12k: Restructure PCI code to common and Wi-Fi 7 specific logic
>        wifi: ath12k: Move Copy Engine configuration to Wi-Fi 7 specific file
>        wifi: ath12k: Move Wi-Fi 7 WMI configuration to dedicated file
>        wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file
>        wifi: ath12k: Rename hw.c to Wi-Fi 7 specific implementation file
>        wifi: ath12k: Rename ahb_hif_ops to reflect generic usage
>        wifi: ath12k: Restructure ahb.c into common and Wi-Fi 7 specific modules
>        wifi: ath12k: Move Wi-Fi 7 specific init routines to dedicated file
>        wifi: ath12k: Move hw_init invocation to target-specific probe
>        wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components
>        wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity
>        wifi: ath12k: Remove HAL defines from shared PCI code
>        wifi: ath12k: Remove HAL define dependencies from shared AHB code
>   
>   drivers/net/wireless/ath/ath12k/Makefile         |   4 +-
>   drivers/net/wireless/ath/ath12k/ahb.c            | 139 ++--
>   drivers/net/wireless/ath/ath12k/ahb.h            |  27 +-
>   drivers/net/wireless/ath/ath12k/ce.c             | 301 -------
>   drivers/net/wireless/ath/ath12k/ce.h             |   5 +-
>   drivers/net/wireless/ath/ath12k/core.c           |  38 +-
>   drivers/net/wireless/ath/ath12k/core.h           |   7 +
>   drivers/net/wireless/ath/ath12k/debug.c          |   4 +
>   drivers/net/wireless/ath/ath12k/dp_rx.c          |   3 +
>   drivers/net/wireless/ath/ath12k/hal.c            |   4 +
>   drivers/net/wireless/ath/ath12k/htc.c            |   2 +
>   drivers/net/wireless/ath/ath12k/hw.h             |   2 -
>   drivers/net/wireless/ath/ath12k/mhi.c            | 130 ---
>   drivers/net/wireless/ath/ath12k/mhi.h            |   4 +-
>   drivers/net/wireless/ath/ath12k/pci.c            | 215 ++---
>   drivers/net/wireless/ath/ath12k/pci.h            |  28 +-
>   drivers/net/wireless/ath/ath12k/peer.c           |   2 +
>   drivers/net/wireless/ath/ath12k/wifi7/Makefile   |  10 +
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c      |  71 ++
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.h      |  20 +
>   drivers/net/wireless/ath/ath12k/wifi7/ce.c       | 973 +++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi7/ce.h       |  22 +
>   drivers/net/wireless/ath/ath12k/wifi7/core.c     |  44 +
>   drivers/net/wireless/ath/ath12k/{ => wifi7}/hw.c | 798 +++----------------
>   drivers/net/wireless/ath/ath12k/wifi7/hw.h       |  13 +
>   drivers/net/wireless/ath/ath12k/wifi7/mhi.c      | 138 ++++
>   drivers/net/wireless/ath/ath12k/wifi7/mhi.h      |  11 +
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c      | 188 +++++
>   drivers/net/wireless/ath/ath12k/wifi7/pci.h      |  12 +
>   drivers/net/wireless/ath/ath12k/wifi7/wmi.c      | 105 +++
>   drivers/net/wireless/ath/ath12k/wifi7/wmi.h      |  15 +
>   drivers/net/wireless/ath/ath12k/wmi.c            |  97 ---
>   drivers/net/wireless/ath/ath12k/wmi.h            |   4 -
>   33 files changed, 1956 insertions(+), 1480 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


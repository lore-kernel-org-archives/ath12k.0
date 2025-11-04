Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F09CCFA00
	for <ath12k@archiver.kernel.org>; Tue,  4 Nov 2025 04:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL2d5x3uwCB1K4kXp0gbCO+q7Vzhg7R2fgTZtVLAHR4=; b=abjELRxaKdc/xesW8j4/jgrQa/
	DQa1PhVUHJC9OjsoAIeFNzFKl5OGnBXbV6W0FXCUz6Je7WYeuWgEWxTlh/a3cTlewJB9N08F4O1tW
	/5ZxxYwPwnjeIRO74R8BTVQ8v9WZjztNIFNxZ6My0kngxko6PWWG9okbU0i6J1tehlWcprqGvjHhB
	TCoiXGxHx2lXTibGhsONFZTvqzR+NCbs7TSCxUPu+lqEt57/fkkbRDkRmDR6g5vMjb7oQCn1TK38E
	K4/dG5y34Ij2ePv9mvkM6/86PvtRVX8UoWrXAYS7NdXrQXQA0/YDV9l9c+hFxE8BMEG2PPd0df6n/
	VpGAccFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG8Ix-0000000B6U8-2tk0;
	Tue, 04 Nov 2025 04:05:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG8Iv-0000000B6SK-0Ypi
	for ath12k@lists.infradead.org;
	Tue, 04 Nov 2025 04:05:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43Q9Ft907025
	for <ath12k@lists.infradead.org>; Tue, 4 Nov 2025 04:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BL2d5x3uwCB1K4kXp0gbCO+q7Vzhg7R2fgTZtVLAHR4=; b=gx37LChmNjrB3C+2
	8Zq4UV4h+CvKinB+QWS1JYi3x1RebFp+LyhYM5k9lADiK6RZtZ3gwYxho0d/7+QI
	9xUSEacQYUAGHSKMGthKVLOEClpmtGujGnHXit8dn28IArwbOvjKFskkDXmpjg2C
	jEaVaR7twOEfFibxK7CMPqtOk6TBq/nJAeXvkQNbYPTZxuiEfa+enAQtKbo2OSX2
	BSSBmW16UHooezMf8wnnFOJVJT1Qn6FqgygfUI8aE4cZFZ7jL20Rwi2HFtDYtJRX
	KZ7e/SgdjBZaT0jXmLQgD1k8pBb5rUa5qIGKjGYRmq9CJUkkeatZ79Iern3wI3WV
	OjOKzw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjr39u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Nov 2025 04:05:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2698b5fbe5bso81547965ad.0
        for <ath12k@lists.infradead.org>; Mon, 03 Nov 2025 20:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762229154; x=1762833954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BL2d5x3uwCB1K4kXp0gbCO+q7Vzhg7R2fgTZtVLAHR4=;
        b=TVXzEJDD1dEGlVCGIS3UDvSAAgPsS9OYk8CUh1+tEg5MCZvvMz8mUD0ZMy99sXFarP
         bJD0Q4AS3lNBSD88SjT2UntSVT1y2QIrFyvEeP6/42EraX/0cALm45YDyCDRGhbxmFPP
         aKiqlWliXRTgUINS3fPbsTZptCAmLBKr9zrJXw0OVkdcYMAS2E1mNAOrrGm+YOeztU+e
         wH0Uf9+q4s1m7lbO4NH49Weri8mKcntIpdVaQj6IsINjMkuzbnltrn5Devj5E6QzOiSr
         QCi9Jbbc5ZF2KNm5tMIEhCO/PMSindTEsyFHU8iHjanPg6bR7+A+2LGGIFnhT4IykMFH
         siSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762229154; x=1762833954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BL2d5x3uwCB1K4kXp0gbCO+q7Vzhg7R2fgTZtVLAHR4=;
        b=cH8UfWxLiv5yJHlVuOVFf6GX628drHRCyadcHjMJYKc5rIvNWRnXr3avbChg0l84Me
         uTKJhoBO9LkeRcmHEk/el08jFwZy2McfnJiP4LiAHndFf0oIwpbLQDtgFBWincEaWW5f
         HIek4iwTUbcAPndRKCqjL4HVGwG6QFkXzp87haCgIuHtwH7nhDHHBNUGgEs1nwLIg5Oz
         RSgTKiNLjmP0BbAk8tPmBewd0ASUJggOnxpi/2hJqfbNrhGMim+v8mY2YChVtM6tv+SY
         SS7h7/VGlOIdCz7ZmcY7Gl7w2Zqdo3zH3OFlxhZCW9NlidI4jAxi3kBTJt5RxDctcG9A
         QJ4g==
X-Forwarded-Encrypted: i=1; AJvYcCV3X2dU1L+2kdj8FY9sF2FvGhAAViqXjqtl25fqtLpPIgUlSNdMdLTySY1AhniDLpyIg+PVEfA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvmECms2XheHNGWxeXHMQqU0ECpQR7dnvp7mqRJuFAb0tOXBHS
	iXjP6uobm6bOQ7barpy9QzkrdT9+Xdw8w8lk4Hh8ztN94QqLw4AFJflPa+KexcZGWTsiypUaWUn
	9MUCzNoWfewlbOsWDS/ISHBpnEdD8dNnACMmQxSy2WZW61Ozx6H2qvXdtKMVc3abq
X-Gm-Gg: ASbGncv5BVJ4Wvw93QHbAR8ZM38SALia7GDZUijq0F3M5TCADIgpDBmhdMjIjY4/NeO
	wukXJklgQ6Ixy3UY/7wsQowQ4zdewpV2TLydNWNZowsNa85tPtsQs4XRTIxoNdHIryHnhZURZpa
	oIRv+1NHIaeCPjJMANb099x3vqEc1KTbPnSEG8m+1pSELCsSfLDnU96U0JwM7yNlxYgOQL1BHQH
	CmSnXILZpU2BUtIbWIwtNvIyUptXDoqbIz2jSGnHagLIzpfUREElLbplCixz27R/UKkp0AiTD4p
	K78K4Gsmr2rKrSa9UyFOfvFEXCk+h26msQVz1ctJVyQtVbIa6OgzcMveH0aV2Ysu/NrVzImg5Ee
	5l42gX/k+qR6/9SkGaJ+sxeR/dNKkZCFnWQrtPJ6isw==
X-Received: by 2002:a17:902:db08:b0:295:3584:1bb7 with SMTP id d9443c01a7336-295358424d4mr181307015ad.46.1762229154228;
        Mon, 03 Nov 2025 20:05:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4YVEHXOAzj7SeTUZ2folwDlwFxBPLDCcuDidgcQss5nKgWUBBORCEfpMQZixU1p5sK2X/+Q==
X-Received: by 2002:a17:902:db08:b0:295:3584:1bb7 with SMTP id d9443c01a7336-295358424d4mr181306555ad.46.1762229153657;
        Mon, 03 Nov 2025 20:05:53 -0800 (PST)
Received: from [10.151.40.197] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2960199832asm8657085ad.26.2025.11.03.20.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 20:05:53 -0800 (PST)
Message-ID: <b7828ed4-17e2-d811-7ab1-ccf438485d97@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 09:35:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: karthikeyan.periyasamy@oss.qualcomm.com, linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath12k-ng 00/12] wifi: ath12k: Modularize Wi-Fi 7
 components and refactor data path structures
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
References: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x29DNyxBqcPNCUesUA0wSV9FTPO-3qze
X-Proofpoint-ORIG-GUID: x29DNyxBqcPNCUesUA0wSV9FTPO-3qze
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=69097ba3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sRM0s-ADGhWGS2TRvpMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAzMCBTYWx0ZWRfX5ElYGTVRCeYP
 YOjvYU/xFp5kNxuNq3BrMRq6wCdtmkNQZDoIK6b43txjoprRCBNAUxL0znCsskJgWFTd+hRFqsZ
 fEbrkYmXWDioquTM+YeWnNFCQT55yJjD8+sgxJqlO1sjyiTq0iENAz9NP0hUVYG7vbxqItgaozj
 Xvwc47wbF7DL+qA3pFOjBL3HaV2L4/83Cx33J2a5T+lTepsyt1ZqhJFbl4fk9O+JG9qxDwZ6JTL
 tfji+7v3OFGDE2DeZrQEXKTvFUJyGnDVbqOf4wx7yxfCgxQS1NEv8Z54M+wFEz7DbXOzcpWj6aZ
 sZH8VvprcG0n8gkOj7IvZ2kD/Ur+7Hij6xdMmAXH0U8jh3QCAkvgeW9+36HA6tiAmBiEwWCih6l
 HIj+1GAeYC9SVQHPyx6IOtcv80r6EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_200557_294069_7B7ADB46 
X-CRM114-Status: GOOD (  20.76  )
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



On 11/3/2025 4:50 PM, Ripan Deuri wrote:
> This patch series introduces a comprehensive set of changes aimed at enhancing
> the modularity and maintainability of the ath12k driver, in the context of
> Wi-Fi 7 support. The key updates include:
> 
> * Callback Integration for Wi-Fi 7 RX APIs:
> 
>     Introduces callbacks in arch_ops for RX-related APIs defined in the Wi-Fi 7
>     module. Adds wrapper functions to invoke these callbacks from the common
>     code. Enables seamless interaction between ath12k.ko and ath12k_wifi7.ko by
>     leveraging the ops mechanism.
> 
> * Data Path Modularization:
> 
>     Macro Refactoring: Moves shared macro definitions from dp.h to cmn_defs.h to
>     improve code organization.
> 
>     Device Stats Consolidation: Relocates device stats from ath12k_base to
>     ath12k_dp, centralizing all SOC-level stats within the data path module.
> 
>     Peer Stats Modularization: Relocates data path stats from ath12_link_sta to
>     ath12k_dp_link_peer, aligning with the modular peer architecture and
>     improving maintainability.
> 
> * Wi-Fi 7 Specific File Reorganization:
> 
>     Moves the following files to be built as part of ath12k_wifi7.ko:
> 
>     wifi7/hal_tx.c
>     wifi7/hal_rx.c
>     wifi7/dp_rx.c
>     wifi7/dp_tx.c
>     wifi7/dp.c
>     wifi7/hal.c
>     wifi7/hal_qcn9274.c
>     wifi7/hal_wcn7850.c
> 
>     Adds necessary symbol exports to support this modularization.
> 
> * Optimization in Data Path:
> 
>    Refactors TX and RX data paths to utilize DP-specific objects, reducing
>    pointer indirection and enhancing cache efficiency. Removes Wi-Fi 7-specific
>    headers from common code, with exceptions for dp_mon.c which will be addressed
>    in a subsequent patch series.
> 
> These changes collectively improve the modular structure of the driver
> by separating common and architecture specific modules and further optimize
> performance-critical paths.
> ---
> Harsh Kumar Bijlani (1):
>    wifi: ath12k: Move DP specific link stats to DP link peer
> 
> Pavankumar Nandeshwar (9):
>    wifi: ath12k: Add callbacks in arch_ops for rx APIs
>    wifi: ath12k: Move DP device stats to ath12k_dp
>    wifi: ath12k: Add helper to free DP link peer
>    wifi: ath12k: Remove the wifi7 header inclusions in common code
>    wifi: ath12k: Move ath12k_dp_rx_frags_cleanup API to Wi-Fi 7
>    wifi: ath12k: Move ath12k_dp_rx_get_peer_id API to Wi-Fi 7
>    wifi: ath12k: Remove arch-specific HAL dependencies from common DP
>    wifi: ath12k: Build all the files in wifi7 directory into
>      ath12k_wifi7.ko
>    wifi: ath12k: Use dp objects in performance critical paths
> 
> Ripan Deuri (2):
>    wifi: ath12k: Move ieee80211_ops callback to the arch specific module
>    wifi: ath12k: Replace lock/unlock with guard()
> 
>   drivers/net/wireless/ath/ath12k/Makefile      |   9 -
>   drivers/net/wireless/ath/ath12k/ahb.c         |   1 -
>   drivers/net/wireless/ath/ath12k/core.c        |   3 +-
>   drivers/net/wireless/ath/ath12k/core.h        |  86 -----
>   drivers/net/wireless/ath/ath12k/debug.c       |   4 +-
>   drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +-
>   drivers/net/wireless/ath/ath12k/debugfs_sta.c |  59 ++-
>   drivers/net/wireless/ath/ath12k/dp.c          |  35 +-
>   drivers/net/wireless/ath/ath12k/dp.h          | 143 ++++++-
>   drivers/net/wireless/ath/ath12k/dp_cmn.h      |  12 +
>   drivers/net/wireless/ath/ath12k/dp_htt.c      |  64 ++--
>   drivers/net/wireless/ath/ath12k/dp_mon.c      | 102 +++--
>   drivers/net/wireless/ath/ath12k/dp_mon.h      |   2 +-
>   drivers/net/wireless/ath/ath12k/dp_peer.c     |  69 +++-
>   drivers/net/wireless/ath/ath12k/dp_peer.h     |  57 +++
>   drivers/net/wireless/ath/ath12k/dp_rx.c       | 146 +++----
>   drivers/net/wireless/ath/ath12k/dp_rx.h       |  53 +--
>   drivers/net/wireless/ath/ath12k/dp_tx.c       |  33 +-
>   drivers/net/wireless/ath/ath12k/dp_tx.h       |   5 +-
>   drivers/net/wireless/ath/ath12k/hal.c         |  26 ++
>   drivers/net/wireless/ath/ath12k/hal.h         |  75 +++-
>   drivers/net/wireless/ath/ath12k/mac.c         | 357 ++++--------------
>   drivers/net/wireless/ath/ath12k/mac.h         |  15 +-
>   drivers/net/wireless/ath/ath12k/peer.c        |   4 +-
>   .../net/wireless/ath/ath12k/wifi7/Makefile    |  10 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp.c    |  80 ++--
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 266 +++++++------
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  20 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 158 ++++----
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |   2 +-
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c   |   2 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_desc.h  |  50 ---
>   .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |   3 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  35 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |  22 +-
>   .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |   3 +-
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c    | 208 +++++++++-
>   37 files changed, 1234 insertions(+), 988 deletions(-)
> 
> 
> base-commit: 6633dca572d8f599b0a1ead0f145a52049ec7709

Reviewed-by: Karthikeyan Periyasamy 
<karthikeyan.periyasamy@oss.qualcomm.com>


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


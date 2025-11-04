Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C677CCF9F8
	for <ath12k@archiver.kernel.org>; Tue,  4 Nov 2025 01:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss2s0SQUEfRdHrtOvT0d01xdStXCTvP1hYs31LtuIcI=; b=3WaMkHAFrYpT4q5hbm13eYBJGL
	aFT//LgiLH3ZssvVwDP/hswxT9xTvkco2GhLTBPB10XGaoB7D19/BDefCjKxI8MVMggUv7paoVe35
	bQmvsyw/x5nptv95XIddQM+7I05s1hfAge2gF7EfUw57S7GgcTDZD1GnSSGPCyojjYxCe1iAyLNLS
	12mbtbTDYSY9semq6yqYgNh+xXmfXke5Y+3FMVuuvQYIShFQ6LPDqevfyw0c88URpn9OdKgmGL7UU
	AH3HajT0a9GbKzDhdVNYYSY0BvfVsLqQJ29dybcT33tdViMmWlRidonSvebt7o7uJN26DVG4Z/Ukg
	tCcLArAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG69R-0000000Awyt-3oGT;
	Tue, 04 Nov 2025 01:48:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG69P-0000000AwyX-1VHj
	for ath12k@lists.infradead.org;
	Tue, 04 Nov 2025 01:48:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3GfpeU3682791
	for <ath12k@lists.infradead.org>; Tue, 4 Nov 2025 01:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ss2s0SQUEfRdHrtOvT0d01xdStXCTvP1hYs31LtuIcI=; b=dlDIJUMe1DdaECgD
	ncn3cEzCIUBrVyLq8IyXNQRbUqceE3Onm9yQgTOT7se282UgizHI3bxHGuuXkhhP
	jc9kEivrvY1OjNuEa6Ve+Az8aMAGCLit8RoF4T1gc2LMYAI2QP+GXZSufwdc+Qpy
	ofcRj+MkZuVCTyKBf9tcbFsNZqkIuT1+RUocZGSLJbTIT8uStiT3hYnZiAZY0c9u
	arIdwFOv/MP4U5zRtl0J4OywIBLPbJ8t4lK2ieUZ0jBs9QAUsyx9nhztid/rn2D1
	VzHBRjelgGtwkrCJEye5NoCMrwO+oyEix2Q3Cj5FNSHVXdwDUDBZ65YEcnquVgxk
	HxdXLA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6xjqsnua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Nov 2025 01:47:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33dadf7c5c0so6184663a91.0
        for <ath12k@lists.infradead.org>; Mon, 03 Nov 2025 17:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762220877; x=1762825677; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ss2s0SQUEfRdHrtOvT0d01xdStXCTvP1hYs31LtuIcI=;
        b=SXcpPL2FeAo3/ncfSQsXg9ih905Zaksg083H3zC2ZXmkDa+waSNeCywfQ7JDg3q7Q5
         4+nW1vvOYJgv/l8OnsoWOvvQfTUfYFkbQHbJoqQ4zN/tOEBPy3SZ/3Vfe2K7zGK7nXOQ
         +EFKdQxQgYkuWm2OCYbW9aIlEf2V0jWi41NXn9yHKNuF3WCwHyq3LsAkELPpjRdiIkPD
         /jLYhc8fTA/I8Jv3jzg8dETqYsUzQFltAvM+w37zOUDQCPDIvQHxN6bd+RV+TXMKkmyK
         sWU8TbVA1I9pQM/gByJ2nNS4o6iBMrUdox0C5VGK3AhCkX7tBZF1SeBM/qsZr1aTCV4X
         MQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762220877; x=1762825677;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ss2s0SQUEfRdHrtOvT0d01xdStXCTvP1hYs31LtuIcI=;
        b=mBea7YEHOmcizm6TOeCtQccWq2ZoeMFmsTFqodpcj6GJUkRGJ2LzkLNSIL2n01gCSU
         Bp/Y6kosZpKcuz9A/2GFTAajwt4draFV2WDzhj9AYJselB+b4mRXJiMI42Pc5U/qmzaf
         V9o8hSBZcEjYQy4vX8g+qshdP8rgJ0SwN9qReMebjgKbMVF6LSviPDNg7U1UidvSkNvm
         67Nrch4PUO73wjKZGAqs+sxunEwIMTK7W/xI+nj0lwQDJrz7eIsnxqCh3/EyvYpQ6JyG
         IGsFB+noIl/d+YEzA59E4p8FpiqDJfUq2hiHgIBuJ8SBMu1sRroBsjFpMFRMDDhBVeum
         7M1A==
X-Forwarded-Encrypted: i=1; AJvYcCXjkIQ2RiwfwWTM1ALWulYhg5l/LeqFgasxa4ZHxcOfiPQCfAGSQi+y0QtAcpnDQmug0JzgF/M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrvYnYwCzBfQNqS6uwDtqfYztbPzuNiQujUg/LHkSIRTuci+BY
	9IaI3mwJbOFKOyjgr/oXb8V9M44XYqscuM2DOMB7/h+m7js1a9HrErwGpH9l1a21DCVA+3GBQ9u
	9sYw024bxTfODx9zTEH/d26txZY27nS3ZjINIAFL72/y/donAIetRfuRNlLlKdEgB7Fanqxhr
X-Gm-Gg: ASbGncvIZ0qH4BLibOdb/VBpLgkoNjUxJHzLVGjKPnX0JhnYPjbmU4uvX2YGM1ee+Qw
	bDCKncxRdxLIscJmZ9U2hhVwKODbQR2WtzQ8VKYwsWJnNh/9goMq4RGdjGsiiGhMNiqSpx8Sn/h
	I3l0MBDT3aGl3Si2ZJRaWTOZPKFv3WFICiIUfIMFdV3TrzLLf8Eup3v5E8pCD4ymZya79pzct9R
	gHE53CfTUYac0DiOzmiRBT45Gqwy+7m1haLl5NWC3YgHNu/ntVSIa7V0P2Ry0cBfJQz4dgvXbfz
	PRuJUQ0yINflmi3fL2qNFHF00T/emN4fy/t8O2/Pgcaca1CVBLGfwVm4e7Am81r9YPetra5SUJ5
	fBq6TgtRBsv/jZWqstZJuKtT1loYEE7ouZMyEcHeVOsUlgQo9yBCh4ICCDanan0Ipw9WynRI=
X-Received: by 2002:a17:90b:3c12:b0:340:f05a:3ece with SMTP id 98e67ed59e1d1-34171892c55mr1778680a91.9.1762220876816;
        Mon, 03 Nov 2025 17:47:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmWd3zXVI8Ds/jn9S5qUDaqyu7FUq5QO010Bi1KzeyVALDHU0a2yaQ+EY72c8KFAOCAiVcUw==
X-Received: by 2002:a17:90b:3c12:b0:340:f05a:3ece with SMTP id 98e67ed59e1d1-34171892c55mr1778641a91.9.1762220876134;
        Mon, 03 Nov 2025 17:47:56 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a15b6fsm2509419a91.18.2025.11.03.17.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 17:47:55 -0800 (PST)
Message-ID: <998a4cfc-aa03-4012-aeef-d2d939055cf5@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 09:47:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 00/12] wifi: ath12k: Modularize Wi-Fi 7
 components and refactor data path structures
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ndn_GCIOSPAIe-mk0aCyXgSgwP6a6fqa
X-Proofpoint-ORIG-GUID: ndn_GCIOSPAIe-mk0aCyXgSgwP6a6fqa
X-Authority-Analysis: v=2.4 cv=criWUl4i c=1 sm=1 tr=0 ts=69095b4d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TaeUBvNaWf7mcxGDrIQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAxMyBTYWx0ZWRfX8N2bjGCJnV4O
 4M16qOj+4c/UeCmW7/1ds38oOrenYvyCQ+b4vf3Da0aU85vL9GZvUrGACzdTgnO2onJw++7wUh+
 IgmslNEKGznfnYmb9Q1E78pzYOenbrSv7MtAAhBdUim3ZviHKsluLx0bMxkiZUkU3S/hzF/fZL+
 k5gQBwcDhK+s4EU4X35qG94mu4sCy1A4CMoi2Pb5Oz03HNLfJZi6zKxP6RRSBw6gX8cKRN8i0oM
 QbQZFKJM4hnniISgU7ChhpeYAkwGzmvzl/Es9XifbGtvcaSIcsPZ+z79xr7HkbVHwce4gyot8Qd
 upTiLDvZmlhMiLmT5ZiWaoIBfcjuSNiTcPKI9ZWU3tup4jrXYGNZKLZ+HMk54OFoF1G4yrjvCkw
 4Hb7OfR1UzaUUlpW5n2hja/bwJfIHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_174759_607644_DC3E7D00 
X-CRM114-Status: GOOD (  20.18  )
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



On 11/3/2025 7:20 PM, Ripan Deuri wrote:
> This patch series introduces a comprehensive set of changes aimed at enhancing
> the modularity and maintainability of the ath12k driver, in the context of
> Wi-Fi 7 support. The key updates include:
> 
> * Callback Integration for Wi-Fi 7 RX APIs:
> 
>    Introduces callbacks in arch_ops for RX-related APIs defined in the Wi-Fi 7
>    module. Adds wrapper functions to invoke these callbacks from the common
>    code. Enables seamless interaction between ath12k.ko and ath12k_wifi7.ko by
>    leveraging the ops mechanism.
> 
> * Data Path Modularization:
> 
>    Macro Refactoring: Moves shared macro definitions from dp.h to cmn_defs.h to
>    improve code organization.
> 
>    Device Stats Consolidation: Relocates device stats from ath12k_base to
>    ath12k_dp, centralizing all SOC-level stats within the data path module.
> 
>    Peer Stats Modularization: Relocates data path stats from ath12_link_sta to
>    ath12k_dp_link_peer, aligning with the modular peer architecture and
>    improving maintainability.
> 
> * Wi-Fi 7 Specific File Reorganization:
> 
>    Moves the following files to be built as part of ath12k_wifi7.ko:
> 
>    wifi7/hal_tx.c
>    wifi7/hal_rx.c
>    wifi7/dp_rx.c
>    wifi7/dp_tx.c
>    wifi7/dp.c
>    wifi7/hal.c
>    wifi7/hal_qcn9274.c
>    wifi7/hal_wcn7850.c
> 
>    Adds necessary symbol exports to support this modularization.
> 
> * Optimization in Data Path:
> 
>   Refactors TX and RX data paths to utilize DP-specific objects, reducing
>   pointer indirection and enhancing cache efficiency. Removes Wi-Fi 7-specific
>   headers from common code, with exceptions for dp_mon.c which will be addressed
>   in a subsequent patch series.
> 
> These changes collectively improve the modular structure of the driver
> by separating common and architecture specific modules and further optimize
> performance-critical paths.
> ---
> Harsh Kumar Bijlani (1):
>   wifi: ath12k: Move DP specific link stats to DP link peer
> 
> Pavankumar Nandeshwar (9):
>   wifi: ath12k: Add callbacks in arch_ops for rx APIs
>   wifi: ath12k: Move DP device stats to ath12k_dp
>   wifi: ath12k: Add helper to free DP link peer
>   wifi: ath12k: Remove the wifi7 header inclusions in common code
>   wifi: ath12k: Move ath12k_dp_rx_frags_cleanup API to Wi-Fi 7
>   wifi: ath12k: Move ath12k_dp_rx_get_peer_id API to Wi-Fi 7
>   wifi: ath12k: Remove arch-specific HAL dependencies from common DP
>   wifi: ath12k: Build all the files in wifi7 directory into
>     ath12k_wifi7.ko
>   wifi: ath12k: Use dp objects in performance critical paths
> 
> Ripan Deuri (2):
>   wifi: ath12k: Move ieee80211_ops callback to the arch specific module
>   wifi: ath12k: Replace lock/unlock with guard()
> 
>  drivers/net/wireless/ath/ath12k/Makefile      |   9 -
>  drivers/net/wireless/ath/ath12k/ahb.c         |   1 -
>  drivers/net/wireless/ath/ath12k/core.c        |   3 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  86 -----
>  drivers/net/wireless/ath/ath12k/debug.c       |   4 +-
>  drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +-
>  drivers/net/wireless/ath/ath12k/debugfs_sta.c |  59 ++-
>  drivers/net/wireless/ath/ath12k/dp.c          |  35 +-
>  drivers/net/wireless/ath/ath12k/dp.h          | 143 ++++++-
>  drivers/net/wireless/ath/ath12k/dp_cmn.h      |  12 +
>  drivers/net/wireless/ath/ath12k/dp_htt.c      |  64 ++--
>  drivers/net/wireless/ath/ath12k/dp_mon.c      | 102 +++--
>  drivers/net/wireless/ath/ath12k/dp_mon.h      |   2 +-
>  drivers/net/wireless/ath/ath12k/dp_peer.c     |  69 +++-
>  drivers/net/wireless/ath/ath12k/dp_peer.h     |  57 +++
>  drivers/net/wireless/ath/ath12k/dp_rx.c       | 146 +++----
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |  53 +--
>  drivers/net/wireless/ath/ath12k/dp_tx.c       |  33 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.h       |   5 +-
>  drivers/net/wireless/ath/ath12k/hal.c         |  26 ++
>  drivers/net/wireless/ath/ath12k/hal.h         |  75 +++-
>  drivers/net/wireless/ath/ath12k/mac.c         | 357 ++++--------------
>  drivers/net/wireless/ath/ath12k/mac.h         |  15 +-
>  drivers/net/wireless/ath/ath12k/peer.c        |   4 +-
>  .../net/wireless/ath/ath12k/wifi7/Makefile    |  10 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp.c    |  80 ++--
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 266 +++++++------
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  20 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 158 ++++----
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |   2 +-
>  drivers/net/wireless/ath/ath12k/wifi7/hal.c   |   2 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_desc.h  |  50 ---
>  .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |   3 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  35 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |  22 +-
>  .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |   3 +-
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c    | 208 +++++++++-
>  37 files changed, 1234 insertions(+), 988 deletions(-)
> 
> 
> base-commit: 6633dca572d8f599b0a1ead0f145a52049ec7709

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



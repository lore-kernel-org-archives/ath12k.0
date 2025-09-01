Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA4CA1002
	for <ath12k@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZ714zZjCgPT+LTO+5+/1Eh/mCjZ8QjebkWwadXAfoA=; b=DRTGUJaPGCxPQGZUiOW2M4Pv7K
	iixXiJfmUKuzzK22ZMJuhNLG4WCPJTClkUuuvFCvgihqkNnHG+9rZPZ9kUs+JvSq+W8dDQUTw2B0d
	ZYZJKxyv04jTmyWQPReQJjrRiIOrGCv9MhLSVeZfym1ywlbcfh2y4ixrdRGLbtWpd1I7PpWO12vH4
	DLxSoAY1cUS/vxAanNiJIlpFHXd1AZNd6fyRx37tWpMjh8zr+FvzxCEaV3U4VYu1pM4uy9uhODuUM
	GJivrleVlITsOZimxI+i0MHpW7ijNcxqjLamGLY2aFeXDf17K50bV0R469/BSNc4/uIRkD0w2OQnI
	XoEbX9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDmy-0000000EHoY-2rSY;
	Mon, 01 Sep 2025 23:18:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8f7-0000000DUul-1qwP
	for ath12k@lists.infradead.org;
	Mon, 01 Sep 2025 17:49:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4CMq002511
	for <ath12k@lists.infradead.org>; Mon, 1 Sep 2025 17:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZ714zZjCgPT+LTO+5+/1Eh/mCjZ8QjebkWwadXAfoA=; b=HJedWBVK4EJz3Nnv
	zQt0xb2LXVFbDWcMGSDMQHepkOLIQKZU/BfL1DMmmh8JLtiNwEcsnuyiUEnUYYrR
	8E5FkEtz0w3v3xpyf6CYC0k/wCbnN5A8WtPulYAJoB/U4Z0G2VnW+PEmKw5N7CqV
	yEzw46bsRyJaJTBuyzi4ie4IhQbjpk+BrabAjhHv6O6UVa3A9rapyzfUWjkwUovc
	2mWwmGpyeGzQFzjJu+85rL5GfWy0fvoXuU7DvpuGqBwLX2afXOgKMxUdhjsm4Hrk
	KZ45DGq09iQn5olSBvRs+yrtEu/ieaZYSDLx13Kt8Nr+S+xeuhxS9JOCuzPK83H+
	XGkq/Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8rwk8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Sep 2025 17:49:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581ce13aso90764975ad.2
        for <ath12k@lists.infradead.org>; Mon, 01 Sep 2025 10:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756748988; x=1757353788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZ714zZjCgPT+LTO+5+/1Eh/mCjZ8QjebkWwadXAfoA=;
        b=MXGU8oqCtPcgH/0D6VtWAdjm0soAGxUNSmS9c+EXZko/nnfBY7s3Zvz8kcrnZ4T+tZ
         WNWFxs7NEGsBH075ozyml6P5PbYkFjlhFHKm/LNwgNy+YWjYJaMHZuSPdy65sfiSVCMC
         ewAXh1JYsKzqdPAsn3cUNOer4J3cwBbBpJlcrg9sWW9zBJ2jmaKIsLzwPKOCdoTo1edV
         J/hssQEI23vYaLwLTYMHaDHTyaTsd/OKWmkEhafK0gs05h4Cqf2WS57p4saKp/SP3Kc+
         v4P7CeddNH4zC+/2Oivug6jdnMSAQw4buk8ELu1yeOSyOhePHSyWTvQQ+Yb8Th/93Yj1
         7/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWGXRQszl0RIty7/ygX+Fx9/iuu1sedD7DB9KzRO4qJCgMjF0noLsk9bO+8XsoqJW1+5A7w7jU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHLlhfZ2J78eUNDxtyTFHGNVWauQp3f2tD8fDyQj0X0buhUybO
	tncZRYLvNR4nCrSWWvPZVYD61c65BkRUtf8k3vQFFnYU569I+Wh2nHUrl5V/X16tSb25LTpOWch
	WWBwEISlQZdt0s99pY2qyhRrKX0tCbbE31/NVHaifIAtOrKwSDujfhd6kUpGgJgvv
X-Gm-Gg: ASbGncuoCAU2RnsslatlB/6wBYLhWIgbUhAgpLK/OdMvdex5B+XVR9NhSf0kiVgGad6
	F900zKNoXbx0o2lRdcx1m9fkBDaN0rGh8y2jy/weSYIHvr+OPTWvfWWPltyJU4lvaeIRzhKdwGc
	AqjU6/yyzYlxoLDk9W49qWYt4MexHkcETkqILEU8Iw3y0Uf7TeygmgYN2nb9bjhUehOEjTY0Zw9
	8tIUPlLMU44DPMNzQerwGbhBRUTKaTowXp2ol/doSSa7ChVOmTX/9VRWyS6fKocW8tWMMgeOgFB
	ezjj8w7qtfxyUZwenlMxpVp9WQDC3fme5lCzuQTCr/2daXmU5DWGrQpu9BJ6U3k4IPVc+HAicFp
	mVnzPqFAytZPe
X-Received: by 2002:a17:902:d50a:b0:249:3eec:15be with SMTP id d9443c01a7336-249448dfbe1mr100345395ad.21.1756748987541;
        Mon, 01 Sep 2025 10:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK2aeQcLukriSxTesG3QL3M5PBi/cU1mSHohVrewW0Ht0HVaoSAxlfmjZ5oIA5eSH/KL3Mbw==
X-Received: by 2002:a17:902:d50a:b0:249:3eec:15be with SMTP id d9443c01a7336-249448dfbe1mr100345185ad.21.1756748987024;
        Mon, 01 Sep 2025 10:49:47 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.223.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24906598808sm107919325ad.116.2025.09.01.10.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 10:49:46 -0700 (PDT)
Message-ID: <353a4e7b-53c3-5dd7-ad67-79cba1d34dbd@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 23:19:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath12k-ng 00/20] wifi: ath12k: ath12k file re-organization
Content-Language: en-US
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX6QPMnEHgdGzv
 IV4gebTeAYwNDNPJCau1VNM0Z18NjccfcgoUY2t0bYNnqDk/gme6dSFUlS1mjhHCi/jQ2pSQqzG
 aOOrYegbrUPlQi6Wo+s40IK532l8o87fqFil3vp77Nav1oID1JCtYVyafEWfmaSIoY3lnLwoijQ
 2rqb1cMboV5cfCQfGL48JgLH9M+ITzCB4Gajh8HlIINvdRV8g01DCmkLPxc/7ZeOofVWynbq23J
 kbgomanfqcl1Q6N0ZdqG9wmor0NwMjznkDx2T64HPs8WDmHDTWBkDO/bMSHkM9wYS2XQmFcj2ci
 pOJblcI2HnjMRAywp5Bn68ecEpWTAeTDmteTof9PwHQAnvMK44XabJOSeq4ArPppb/P/LYw/GK7
 aof6Ev/f
X-Proofpoint-GUID: GzDhuTJ4HUIZ-iQnWDcUcc68HwqbzNn3
X-Proofpoint-ORIG-GUID: GzDhuTJ4HUIZ-iQnWDcUcc68HwqbzNn3
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b5dcbc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wqpLlJzFoOPNlw0GHb3lZQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=D2z4QRl0f1DbYJdCtzwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_104949_486467_ADC49480 
X-CRM114-Status: GOOD (  18.17  )
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



On 8/28/2025 11:05 PM, Ripan Deuri wrote:
> This patch series continues the modularization work described in the
> https://lore.kernel.org/linux-wireless/20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com
> ("wifi: ath12k: Ath12k modularization changes") series, which established
> the foundation for the Next Generation (NG) ath12k driver framework.
> That series introduced the foundational split of the original ath12k.ko
> into two distinct modules: a common module (ath12k.ko) and an architecture-
> specific module (ath12k_wifi7.ko) for Wi-Fi 7 devices as depicted below.
> 
>                                       +-----------------+
>                                       |                 |
>                                       |   ath12k.ko     |
>                                       |    (common)     |
>     +---------------+                 |                 |
>     |               |                 +-----------------+
>     |   ath12k.ko   |  ===========>
>     |               |                 +------------------+
>     +---------------+                 |                  |
>                                       | ath12k_wifi7.ko  |
>                                       | (wifi7 family)   |
>                                       |                  |
>                                       +------------------+
> 
> Building on that framework, this series focuses on modularizing the Data Path
> (DP) of the ath12k driver, allowing the common DP to be reused across different
> hardware architectures.
> 
> The patches included here support the NG framework objective by reorganizing
> DP-specific files and the directory structure as outlined below.
> 
> Existing file org             New file org
> -----------------             ------------
> ├── dp.c                  ├── dp.c
> ├── dp.h                  ├── dp.h
> ├── dp_rx.c               ├── dp_htt.c
> ├── dp_rx.h               ├── dp_htt.h
> ├── dp_tx.c               ├── dp_rx.c
> ├── dp_tx.h               ├── dp_rx.h
> ├── hal.c                 ├── dp_tx.c
> ├── hal_desc.h            ├── dp_tx.h
> ├── hal.h                 ├── hal.c
> ├── hal_rx.c              ├── hal.h
> ├── hal_rx.h              ├── wifi7
> ├── hal_tx.c              │   ├── dp.c
> ├── hal_tx.h              │   ├── dp_rx.c
>                            │   ├── dp_rx.h
>                            │   ├── dp_tx.c
>                            │   ├── dp_tx.h
>                            │   ├── hal_desc.h
>                            │   ├── hal_qcn9274.c
>                            │   ├── hal_qcn9274.h
>                            │   ├── hal_rx.c
>                            │   ├── hal_rx.h
>                            │   ├── hal_tx.c
>                            │   ├── hal_tx.h
>                            │   ├── hal_wcn7850.c
>                            │   ├── hal_wcn7850.h
>                            │   ├── rx_desc.h
> 
> 
> Note: While common files are not intended to include architecture-specific
> headers, a few Wi-Fi 7 headers are temporarily included in common files
> across patches to simplify patch splitting. This will be resolved in a
> later series.
> 
> ---
> Harsh Kumar Bijlani (4):
>    wifi: ath12k: Move HTT code in dp.h to newly introduced files
>    wifi: ath12k: Move HTT Rx specific code to newly introduced files
>    wifi: ath12k: Move HTT Tx specific code to newly introduced files
>    wifi: ath12k: Move HTT specific code from dp.c to newly introduced
>      files
> 
> Pavankumar Nandeshwar (16):
>    wifi: ath12k: Move hal_tx and hal_rx to wifi7 directory
>    wifi: ath12k: Move hal_tx.h file to wifi7 directory
>    wifi: ath12k: Move hal_rx.h file to wifi7 directory
>    wifi: ath12k: Move HAL Rx wrapper APIs to dp_rx.h
>    wifi: ath12k: Move Rx error related functions to wifi7 directory
>    wifi: ath12k: Move hal_desc.h file to wifi7 directory
>    wifi: ath12k: Move rx_desc.h file to wifi7 directory
>    wifi: ath12k: Move rxdma ring config functions to wifi7 directory
>    wifi: ath12k: Move rx error and defrag functions to wifi7 directory
>    wifi: ath12k: Move regular msdu processing functions to wifi7
>      directory
>    wifi: ath12k: Move srng processing to wifi7 directory
>    wifi: ath12k: Separate arch specific part of RX APIs
>    wifi: ath12k: Move arch specific REO functions to wifi7 directory
>    wifi: ath12k: Move arch specific rx tid and related functions to wifi7
>      directory
>    wifi: ath12k: Move arch specific tx APIs to wifi7 directory
>    wifi: ath12k: Move ath12k_dp_tx and related APIs to wifi7 directory
> 
>   drivers/net/wireless/ath/ath12k/Makefile      |    9 +-
>   drivers/net/wireless/ath/ath12k/ahb.c         |    3 +-
>   drivers/net/wireless/ath/ath12k/core.h        |    4 +-
>   .../wireless/ath/ath12k/debugfs_htt_stats.h   |    4 +-
>   drivers/net/wireless/ath/ath12k/dp.c          |  159 +-
>   drivers/net/wireless/ath/ath12k/dp.h          | 1518 +-------
>   drivers/net/wireless/ath/ath12k/dp_htt.c      | 1354 ++++++++
>   drivers/net/wireless/ath/ath12k/dp_htt.h      | 1546 +++++++++
>   drivers/net/wireless/ath/ath12k/dp_mon.c      |    4 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.c       | 3056 +----------------
>   drivers/net/wireless/ath/ath12k/dp_rx.h       |  297 +-
>   drivers/net/wireless/ath/ath12k/dp_tx.c       | 1609 +--------
>   drivers/net/wireless/ath/ath12k/dp_tx.h       |   41 +-
>   drivers/net/wireless/ath/ath12k/hal.c         |    8 +-
>   drivers/net/wireless/ath/ath12k/hal.h         |  501 ++-
>   drivers/net/wireless/ath/ath12k/mac.c         |    3 +-
>   drivers/net/wireless/ath/ath12k/pci.c         |    3 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp.c    |  137 +
>   drivers/net/wireless/ath/ath12k/wifi7/dp.h    |   15 +
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2043 +++++++++++
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   47 +
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  908 +++++
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |   14 +
>   .../ath/ath12k/{ => wifi7}/hal_desc.h         |  149 +-
>   .../wireless/ath/ath12k/{ => wifi7}/hal_rx.c  |    8 +-
>   .../wireless/ath/ath12k/{ => wifi7}/hal_rx.h  |  299 +-
>   .../ath12k/{rx_desc.h => wifi7/hal_rx_desc.h} |   48 +-
>   .../wireless/ath/ath12k/{ => wifi7}/hal_tx.c  |    6 +-
>   .../wireless/ath/ath12k/{ => wifi7}/hal_tx.h  |   11 +-
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c    |    4 +-
>   30 files changed, 6993 insertions(+), 6815 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/dp_htt.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/dp_htt.h
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp.h
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h
>   rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_desc.h (95%)
>   rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_rx.c (99%)
>   rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_rx.h (83%)
>   rename drivers/net/wireless/ath/ath12k/{rx_desc.h => wifi7/hal_rx_desc.h} (97%)
>   rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_tx.c (97%)
>   rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_tx.h (96%)
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


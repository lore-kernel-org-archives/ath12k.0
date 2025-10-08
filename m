Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4069DCCD183
	for <ath12k@archiver.kernel.org>; Wed,  8 Oct 2025 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFc76BDgD2P9Eg/sErqSY2dRKzFxKP25dp0vt90ggU4=; b=Zh8QJlJfUk1UyuEMvjGLWE2ojZ
	Ync0RdKA/gXorDQKNF4hFYpYlVD370Wnos9zYos6ZuoR+w8AHAHpqjAhHHkyXNtmBZaw3iWvTTZZc
	gdDHWUcW1I9uVVLTdpTwVlBH/zjQGGvVClb7jnyZ2nctZu6vbRoHlF+/u2rWuLLeM+JoEq2nKuGpd
	hAFItfc1g1Pe9eB4XyEpwxS9Iiz+QgMbLsmMR4URxeMXbjVWPKSjpd7+Aioc6DNu1ev/Xhe2ZezU6
	aeC5kl1kgcE0QO1eoDIexF2lB+DVHpHD/WZ2sdf3ttvCB/N70EXDqwXVB78g27tcMx6alr1qn9tX8
	v7IUFbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WSj-00000004Dw1-46ze;
	Wed, 08 Oct 2025 15:52:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WSh-00000004DvR-13Tx
	for ath12k@lists.infradead.org;
	Wed, 08 Oct 2025 15:52:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Pan026675
	for <ath12k@lists.infradead.org>; Wed, 8 Oct 2025 15:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KFc76BDgD2P9Eg/sErqSY2dRKzFxKP25dp0vt90ggU4=; b=Hfp5B4nc5fUWczSt
	Gf/rQyICI705m8baPzccyDITha05ciCVRU66tE2cs4a1hZXbIxgFOGWbknki+oUT
	HvKqMiMt9PY497s07lVpV5rW7Kst+Qel0H2PS7+5nD/UTfPfYgMbfX8TKNT1RWqy
	ngbX45awxmnS0iYeZeMXDB6Kl0iJVCGjUoM7LqMaK2cb6Z+hMQ/hrBe527JVKstt
	hWRfaA963jtUdYlOF9W/UnV/6nSPtk+vzrUr7PKEoc5IFa5+FL5YEQ1NUaOOBwLE
	9IWyWBYFmYCsWJ4Z6RXDRAeLB215hyyS4VS+2u4Sq9OnORPK8MmlNnPiD3CfONzZ
	79S7QA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hjvdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 15:52:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27356178876so52996615ad.1
        for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 08:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938738; x=1760543538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFc76BDgD2P9Eg/sErqSY2dRKzFxKP25dp0vt90ggU4=;
        b=TgMYXYQMHDSV+GdrDk+0eUY09FhF6Cisks3PLQKV0qW7w2dX3wMpBTBNzpEfoMq87x
         THAgt87ZsvIu93exGXCtPnhaDmLTKJ6zaOttMMXKnalSZcdHQkDLxNrprQ/herCeK9yI
         VrMd4R8oZbxdT4jUbhfG+cWZ8Y9dH6pxWIZx9CxHJUAEXfPgKOP1cv3UcQAf2tA0oBol
         0QubjsEgHl6gOtJgPQE4bctayqupOAjZ+op07CgRtQ+CE1BiF7a3G/0VAeGH+6v7EB+W
         IDew/TfrYDOe5ZvOadF+I6f8h3z1GO3eDP7HhvXmSHDCLraCUHEudqlTobA7iL4nb/dQ
         +mzw==
X-Forwarded-Encrypted: i=1; AJvYcCUfiDFT9ZBwfDVlAIaht5PGn3GA6/SI1X7VIOXidJvPgLhktay6/BEamuEAUJV3EteMwZqaYGA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTPGVdanzsL5Blcr5fxXh7k/IKfJINIcNc/xBfODdU4Ao+RIWX
	4kNuGHW5xWwDcv3s/nMZr1a9hS4t/a8PdNqhWIHFcUKk4cS7yvZ0t4a/y8DENrdM569cUW+WzSJ
	s/yBT02YGvgjXn4w8EP3mfOAcQiY/HRpeDSnqTkjK8Z7B1s1b7m+UxFTM4trx6OfB
X-Gm-Gg: ASbGncvY50g9MlEHHZ/XyH4A4+pQP7JV8KNw0B7Zu5jm6JnRGVgv5B2vH6K6H7HV5WZ
	VC+PlLpTF9mCPI6/lmF1+iiv4KGt5dEJMP7BNo7LA3xLJbR5oaUBLpMwSFrjVzny3y+rmzYg2+C
	Fj6AxLw7aPJsO2dnAllU9nhIGS4VUKZ5d2mMiiI4+hvHGCaxybnf9bHn0c9xEnRFWU1Xftd8b+r
	+sttRss3CZpj1mq50E08gvAYr7n5lqs3x5aVSedsPymAy3kv3CjHGj9qXrXnCxsjOrZcL6r2MOl
	EWXKu/qN9m2Y0i9sVWD2enzYqZiqrfwdtz1YNBnPszXhAjLdi9//4ON5gMl46yXUTDrJDTiHVYH
	5gj6kJEMrXeM+ud4hdUPW4g==
X-Received: by 2002:a17:903:8cc:b0:269:936c:88da with SMTP id d9443c01a7336-290273ffeecmr43821535ad.41.1759938737874;
        Wed, 08 Oct 2025 08:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNlgtcPoxczCO031rhbVKzGidTk9wzfvUrXjmBL5eGY3gTdvs/Q86Zo/mTahJRpgOo0JJCIQ==
X-Received: by 2002:a17:903:8cc:b0:269:936c:88da with SMTP id d9443c01a7336-290273ffeecmr43821275ad.41.1759938737356;
        Wed, 08 Oct 2025 08:52:17 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.106.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93b66sm862305ad.124.2025.10.08.08.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 08:52:16 -0700 (PDT)
Message-ID: <a3b8334e-c3bf-015b-540e-d6962ecfaa4f@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 21:22:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath12k-ng v2 0/2] wifi: ath12k: Modularization of PDEV
 object for Next Generation Driver
Content-Language: en-US
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251007110203.1541167-1-quic_rdeuri@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251007110203.1541167-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfX5vZOagZbqVAa
 z5pfEhxOucEcEGtjVJ0zdDOMHnNrIB1FHn8FnaibC1plZSieArpsu4NeZIPi3FTGNjfCQQ9ueFe
 XESRb6ZtjM9a0i+4s0rxh2IvIer8Yd6Il3jJq3ujQL6ixbMgQ5pN8egBL8Vta0sUjxUNMbdVegQ
 jllT058dC5QaVbqAHkQCUDhqrSTJhqcOy8jtQpfuHcwYx727wxQlwZCxb0gs/UT1mgyvrxggdtc
 NScuUAQLKmTaOh323kfsw3qrc74Khf/yn99KQLFsFs+lCVOhR7P/aKqw3Nd/7HBqY+KIg2q5uty
 pO6FURVfKncCbPxnm2F2ULz4E9kt4muQiG7+Zvs+MD2SLqSeVohSGsqa0smLZrr1+pZhEU+kzD2
 37PolDUE2qKbFG1UkAaZVCgbPgQbiQ==
X-Proofpoint-ORIG-GUID: ffv2cPn1KAShr4UOrJI5xsHEdgmQFm15
X-Proofpoint-GUID: ffv2cPn1KAShr4UOrJI5xsHEdgmQFm15
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e688b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=z6xreaRxtU16OQ9bEhv1vw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=vHGgmhArcKzGfspvb2AA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_085219_338874_D53B8FB9 
X-CRM114-Status: GOOD (  14.68  )
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



On 10/7/2025 4:32 PM, Ripan Deuri wrote:
> This patch series continues the effort to modularize data path structures
> in ath12k, focusing on improving the organization of DP pdev handling and
> preparing for future architecture-specific extensions.
> 
> Patch 1 refactors DP pdev handling by consolidating all DP-related fields
> of a radio into struct ath12k_pdev_dp structure. An RCU-protected array of
> these objects is introduced in ath12k_dp to facilitate dp_pdev lookup from
> ath12k_dp.
> 
> Patch 2 encapsulates PPDU statistics within dp_pdev, as these stats are
> associated with out-of-band data path operations. This reorganization
> provides a cleaner structure by grouping both in-band (per-packet) fields
> and out-of-band stats under the same ath12k_pdev_dp object.
> 
> These changes are part of a broader effort to establish a base framework
> for next-generation driver development, allowing the data path to remain
> flexible for future extensions.
> ---
> Changes in v2:
>      - Made ath12k_pdev_dp_to_ar() a static inline in core.h
> ---
> Ripan Deuri (2):
>    wifi: ath12k: Refactor data path pdev struct
>    wifi: ath12k: Rearrange PPDU radio stats
> 
>   drivers/net/wireless/ath/ath12k/core.h        |  24 +-
>   drivers/net/wireless/ath/ath12k/dp.c          |  23 ++
>   drivers/net/wireless/ath/ath12k/dp.h          |  41 ++++
>   drivers/net/wireless/ath/ath12k/dp_cmn.h      |  18 ++
>   drivers/net/wireless/ath/ath12k/dp_htt.c      |  59 +++--
>   drivers/net/wireless/ath/ath12k/dp_mon.c      | 183 ++++++++-------
>   drivers/net/wireless/ath/ath12k/dp_mon.h      |   9 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  99 ++++----
>   drivers/net/wireless/ath/ath12k/dp_rx.h       |  13 +-
>   drivers/net/wireless/ath/ath12k/mac.c         |  34 ++-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 216 ++++++++++--------
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  66 +++---
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |   2 +-
>   13 files changed, 488 insertions(+), 299 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


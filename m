Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C51C54F51
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vSAh5arwVCztMjmOZ4jFlqD2gwpQfFeJ4x21KNMh8w=; b=UTKVc9hLe5vaRpN50nZMBrB2Uz
	bo2PQBTzVob3jOuNgCS1nwLjIbWXGLz/1hbv/Pazs5rvtPeCYgtC0y5PA9+tI5RI3tHdC4W4XV0oK
	cq8vgmzTivDy2KH6JxfSDhgOMUW7H1J34qnnsnUVuu/z1JoKbQhBIlI7kP43EjbG05IzQtTaKoSFh
	MeiHqJLjd9I4K5CJhwm4IGu6JKa0Oz1Qw1GSurrvyPYVfkgKyaN+pJ803BNFonsRhWy1Jt6KZo4ga
	/OGCdfgcDVJZ2Hdo7snAhQAdUXXB3rIdarDvCSPYcZ5OItHsbF94wXSKdxnGgO63E1XIFulgkzRob
	cakwgB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp09h-00000007IcZ-3FFu;
	Wed, 29 Jul 2026 09:00:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp09f-00000007Ibo-05QY
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 09:00:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fImV1182038
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 09:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vSAh5arwVCztMjmOZ4jFlqD2gwpQfFeJ4x21KNMh8w=; b=S8BLB5eHWpCpjSHw
	msH19dFDJkF8Dnh89uTXaEG3KvdH1UuxoXEUUo176VEVa/llXIBenUjCdHR3OikA
	4tNGGt7G/8Ee9oSY2QRdH4kQ0JRrj1niwpC2ovb3Sf1Az3/g7XzGd9M4MrWPL/sA
	0RESOKMPP9fXaxCAUtkoj2358G1xgaS96PiiKVgTYdyURUpm1wR6rx7jtWAnrez4
	VQuOxi10Ibun4Z3GP2ql+oenKuphriVbOAkN3/iVwaI0I02uh0SDijKju3kQYD74
	1uijUmgmRH5QQLHesBeaVPGu77+7of7BaVeIk9Y8BhIbAbNqkuh8rMCG/clTeHdG
	bGButg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmcrs7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 09:00:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cccfa32670so8830625ad.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785315645; x=1785920445; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vSAh5arwVCztMjmOZ4jFlqD2gwpQfFeJ4x21KNMh8w=;
        b=O9pFf1SsZq2BQyUSwFJ8FDhccpJtxpMPD8+thoBDCExMNf5QIPKNtlwMNY5UBRZt6C
         kaM2iPeuZU6NW2CFzNr/H7ij3lFB192P6Hr1hJ3R+PQCFyDIOObnJYltjZJxscyXuyly
         OW1ZcT0Xw+wX5UY2s+IZFTS8tt32GhLucw+QpNBekooBe2oRSUJhOjFCOtNBEmz62ihx
         uuYA37vziyl0HBoPYKTX/Ef0bLJ0WUZzt5q7o6+WL/jjEh8H6us9aPIBRkp9VQM8aA+Y
         aNZoxGWv35SzzomLZTkScflfiikY73Rq81hmeFYxmMdWkcZVdi9ome1/tTeTSYp0ruvZ
         jVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315645; x=1785920445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vSAh5arwVCztMjmOZ4jFlqD2gwpQfFeJ4x21KNMh8w=;
        b=eu51zBmkA1hyTWKxWe9t6KU9NNqdmO1w+xubMQjlcKBISsk09Shp0OS4tjqQ1jBG+Y
         Af6nyOPuUKGwrkTcBIJj/MoW1mw3NXVXr8jljOQVBlptpsvULjbS2xwqiK3maayuUwVz
         MSOKhVYq/23QhT3kLiekysAJL1Kh01F8eXZCFR9hmv0iRgisn+hPjv+ARmHyDme1zDlZ
         pGzX3ScaaCVyJNC8u2nvIpa/QUQsnwY5mxl3OPDzcQKJVZ90BqW/vT2eT0WY/t8N0rFo
         2F8p32YNTthBuXK9XAwzdWDxYO/owxsPQOrPrkxDZubh6XAWEEGSXKVwVZxmdw+Hg3do
         EYLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Sbs+1h21zDi8U7OLtLyG/0x0te1qYM/1dLOZboyJLc9bh8ShoYRHDQnCl+v7edckobzQrIo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFICccAK0/B5N4xFmGFTT5sPWTx8r3W1hmqwOw4G33hO06Zzdw
	mltMmUKFoUVF7oHLpV5WFOAcV6xZJFP04y9qsD/yRWQeTdeb3eO/UCVNXGWIgHFqtIeHivhQstt
	kWxoEBAD0nmGrpcXhhWurEJETHrNrQItWILnZEGOpGuaMJNTN2f34+yq8LoGrlfcbfuu3dbEa
X-Gm-Gg: AR+sD12t1sZczK6f2fIOUARLlN0Cqz92OQmPpq+uRulW8iKUn8mMbsxSfQy9lrrvFIz
	h8P/Vm7Y9BamYh2WATMjH9dlvISh0NL/4MzM5voAd8VUi2fhREaIz5tAScLvCbvXn0B40fQCKP7
	Zfo/eziWYWtKQso5rrx4rzCXvODjioK0B8EjGWjy2RX7wIPOr+GZf2sku9NgDQXlyIO9TFGKuz+
	zv7cAy07fmCGj062mvoI+S3lLPNZ7N2weDPVkzo6WjAkpNj6TxnBbAhS2fFo8Sbmia9vRQxMz2x
	58fACk/L94GPWJZmxMlO/ftYqU/RnNJf2SqKqvfjuhj2YqP4Ia9mAaTlLIVviByYxrstIwHrG2X
	NzgLoA3pUUKEWXLNBtqo6X6zeTe/pXKXE7/gLgpPr7vinoMpBzOho2JnPxIOWTSapf1lAAYn0+Q
	==
X-Received: by 2002:a17:903:37c5:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d015b0021bmr63919715ad.5.1785315644914;
        Wed, 29 Jul 2026 02:00:44 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d015b0021bmr63909705ad.5.1785315629857;
        Wed, 29 Jul 2026 02:00:29 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc8400sm8046265ad.47.2026.07.29.02.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:00:29 -0700 (PDT)
Message-ID: <b9e32b0e-ceea-4089-b7da-b53525cd9ce6@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 17:00:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3MyBTYWx0ZWRfXyv1FfxGqwnXa
 SpkVh1kPlwqMCZHjoN/DjDLC1kFOU9yKlPpt9TIkWh8kIqMt5ezybPYHxPFrKLndyZGU4jvQPda
 PMKMJ8BMSqhUj4CxY1UtlafRIKuaRuSLpGdM+PaLqjgDRMk1WRe8VZp7tGl5pQyU34q5vkOhPXs
 2IscKSSdi72L4vPA5x+pBVGv/YJhlsPUVRd/EHrCRGRMsnq4XPD2yQo7Z/JvEGfoGphTK3VS4tf
 EIn7TM/QSBJyJzyFROZafGP6CsQFK6VEDdbMUYkFyKNYka9asonx8BWW8pRQ6nE+Qh2M5/39pLE
 ocob6kBdb/ABbOryp72TkgbmPnwByjaRX5sPdhtKWGHTuYoaHAnEE5Jr8OsQPGVYDbyjBIACGyn
 YSsFscZVrIqPDdG4PHTS6N/15zVgqPvw8nqAT2wpxStbZEA+H2jAuDcwukX48y2Ptlb5KJJW9wj
 5rtCCP4ZzeN8RpEO7wg==
X-Authority-Analysis: v=2.4 cv=HP3z0Itv c=1 sm=1 tr=0 ts=6a69c13d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iviOFIqGMEcFCaixUmcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: r3XdVUaXyTeWM3979dRhrtTEEsdpDahp
X-Proofpoint-ORIG-GUID: r3XdVUaXyTeWM3979dRhrtTEEsdpDahp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3MyBTYWx0ZWRfX4bdWYWeeriRA
 PSkE45JDgI9dkoCRxnSAbl4Wj4PR/sgNjhjockH7KrKluP3RleJQlhE8eNysddmpucl+GZxx2a7
 r1b0frpz0POnTAhmbye4LLNVG3KdSvc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_020047_179487_E9E347D2 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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



On 7/29/2026 9:05 AM, Jeff Johnson wrote:
> Both ath11k and ath12k have the same issue.
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
>       wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
>  drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>  2 files changed, 10 insertions(+), 6 deletions(-)
> ---
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
> change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

> 



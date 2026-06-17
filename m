Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FE9CD98EE
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMpAUzpU0LmZD1M8HGd6uBHGdfd6f50CVhY6PFwoV0Q=; b=lo5gtPRon+18tyg+E3G78UzmVq
	MxS9ComseJQhfk4bQc+thS7hUwooPj5c1RoPRr3nwL/Xo+kY5hPqhPQw1yI/nXrNqGrz08lPoTtCy
	sLCnK9zukzlH5WRA/1kpC7wDp0nXsW/Jr6WRWGiSiLRq3Tl/sq9zmEOqDcRdVJuJ8gfAU0ZnSLuw5
	OMqcSpVzvxfya1/RWK6nShIQZM50PD6A2/wYyARAGt2uhbYTy7bV2HN5nJr3H9HmIKmov9l4oSp9u
	CgCWo4YECC4HiCK25caaDpTUGiKH+G3d+pgYMSkBLHyyyp/bF2Hk8lMiGL/GT3AwjYyEaB7iVBz3k
	otLm5fSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm5R-0000000Gv9E-2axc;
	Wed, 17 Jun 2026 08:57:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm5P-0000000Gv8t-2Pau
	for ath12k@lists.infradead.org;
	Wed, 17 Jun 2026 08:57:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V6Qt2291339
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 08:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMpAUzpU0LmZD1M8HGd6uBHGdfd6f50CVhY6PFwoV0Q=; b=WW/lgSv1eOypdk8A
	ScGuozPDfBApDPcOzDy5skC2ZhlhS2R/UoOmseCKLga1umOvQN5P602TBVphGHd7
	AnVuQoSSrDktdoKKWlM3+hI4DG1+9LLqmAXn+v5+7+K2fAPcyg42r4U/kqV34Td8
	yWoOGg598XDXDk+ZwdcaXhApqNBMgGqVXDxm3rBAVachBXjmT65Q46kiiy+wdlKS
	+7Slko33pIjdnFUek+Y8+LfkFLxnqBYnEYLtiufky1lsZ1xCgpp5cHqMvW0xoDLt
	rRFeDsGacJ2s42tUehrplK2faMhZ47+Fl+rCPL8GTTv8UGMGNrmF32EKTRhwXeF9
	EYjs5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjbbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 08:57:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf11699875so9195815ad.1
        for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781686645; x=1782291445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hMpAUzpU0LmZD1M8HGd6uBHGdfd6f50CVhY6PFwoV0Q=;
        b=AL+VlVpQv9oPD+pGiEccCcB4B8Ml1XHtzcLYLQAxlIvdtJUacO6e5FxYFoBns8yRzC
         UV9ulfC7k8ySHB2oOd8EmN4ZQ4/515j5QCxGFPXpV08SxRI0ZC413Lzp28iymdX62EWy
         LMTg6FgyJqY0eQMhw7nt7OfAsO/1xmDo0lBj9qGys0y9K6NvcgNXKsAI7IAI6JHbBZfn
         LS920reHXR5tnDO/P8/7NbVtsbIwWnje3oz96Bayzt6jW/ILAWy4cihWhm+SzMCRKcvn
         P7Wf2OhqNWPlRYqhFhJqYqdO0BWAbCu+YeZ1sZsqWPwIxiBb6cBpRFmR2vUFGHSPn9OX
         zxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781686645; x=1782291445;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMpAUzpU0LmZD1M8HGd6uBHGdfd6f50CVhY6PFwoV0Q=;
        b=Gznh8k1DHqKk8tq5kT6X9BEsMnl7JL/t5WDjS0d9lalevZKg7cr2DKtCMjPShMk+W8
         q51lM5nRUqcQhcEnQg9smhBkkgl0Qg3aDfFRAvlGJtwoMBiSKBigmizgexrFQorLqnCS
         QqRZkXHGCcyJ5Ietuzo1XiAn2x0QsCksPFftI9ZIOgJryjBV/eDx5KmJqyulkkVLaulP
         wbj9mx10HNryQcdqTneAWaruJdcOciSx9eB6hx8KXWPbxfmm8DBdYj2RGcbCHhncJRgL
         vOz/lbHBMLBqK11llzyUES0NsZy6e/ghrbTgzVI4l1mU/6AISWV/ChALdZwkIsdfJnwO
         thGA==
X-Gm-Message-State: AOJu0Yxh20p4q3YV96TUOtN3fJIqmwdmSKHAjFUHUZdoRKMBv+x/M7aY
	C35OaGnJM3xFChjd5faOi+SO+fZHOZ6yKZ7J11pmY+HNkWyiBXXBdItg882MN80M2Bi4778kDTv
	S/lE5yQZp4qFAme9kC93zvfP7v4riWMuSNgjdbylEhaU3o6ur8TyYpVvkdTuDGtM3FGZ5pjkL
X-Gm-Gg: AfdE7cnZp+GPat5QZ/0eL/N7xn3Flrs3bP+Uh3lIDnAsw7UwWgkCqHRommOcJs4fbCJ
	pSq7Pa7rsx188Jh4RD1ww194e/w+5ZKOjGBZ0bbgI93qIOl/NeoPgj3gTmrOpQasyjWUf5g6fw8
	88NnBY95F7Z5Qs3luUXkiYlVwCFOmNfYJ7kFR06RLjeHXZXYyJSNGu7MO5YHp+1tMC+eKJciJur
	tWtnZ/s9mkxpLDHgrX78Y6tew8lziqg6MCDmbgCT/9GmflVpe17Gkkfd1w/zzJqSEy0/0FIoD0I
	/YCWqXc6oiOee4FDzMSV4+7nzfpw8WBw5DxRwhtu5ZIYhFOGg/kJGTnFBnvAaUbHlXYayJcOwZi
	K9x+iP1gf5zWIlqFiErJq3Ev8e+dZxsxaJti1PnCQntW6tu2MqBCFnpuBRPskdmaxtTxN3P49bV
	Hljfs7n3g=
X-Received: by 2002:a17:902:f605:b0:2c6:b429:f100 with SMTP id d9443c01a7336-2c6bd11cf8emr22459865ad.15.1781686645279;
        Wed, 17 Jun 2026 01:57:25 -0700 (PDT)
X-Received: by 2002:a17:902:f605:b0:2c6:b429:f100 with SMTP id d9443c01a7336-2c6bd11cf8emr22459575ad.15.1781686644813;
        Wed, 17 Jun 2026 01:57:24 -0700 (PDT)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac7fbsm167392105ad.42.2026.06.17.01.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 01:57:24 -0700 (PDT)
Message-ID: <97becb25-003e-4156-945f-d45988b661df@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:57:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/5] wifi: ath12k: fix dp_mon RX parsing for
 32-bit TLV
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4MyBTYWx0ZWRfX4K6MzG25wMeK
 tpmZfyfxHjUBClCD8JZWu1+15RXDme9g08eipNg0T3dnTRheuS5BWZ2+CvTsDGZnc49SFA61lkt
 UhsFm9+SyiXQt/2/P3B1wVPpOclekxmHvCwtWbHRd9pQF7fjf8COI7qP4VOxztKLzt5lvpwPGl8
 5k1A4jiy414aPApeGRv2w2bPIDsOiC3CM/xFXzcuWTbu2WWtrYZ9Fc2nD7C4LJE4SEVMY09LI0W
 w5teLsuO56SSi2PI435Y1hl2r37Bgl14YJvKMe5u98cNZV2nWBU1H6zvfhLZEizFvwLuxV+SZxy
 4f96IHKo2zhH18SoPOAH151r7czFLgpnXRdkCtowwksPAud6dh6etQek9+KDEMFwlzpCtqBypZQ
 gwodjt7WT1KtV4QB7uVCwK1djfxRMzvAOOasnO//MY0QHEJG6IKwTtnj6NaSPkNES9puYOlYlMW
 JKMiqzJ5a5QGAOOvovA==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a326176 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_euX_cPFqkM1mgMQ_kMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: EvD_odvrMZf40eoec32smjsMGeJ0rQBa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4MyBTYWx0ZWRfX4TMEpHCfgTsq
 1k3IyefdaJgZ4KRKmM1nWZkX75OR+JvHRCf1h27r9ImB2Yf5qkQgcYjTysu38z1kB9y6x1GdwDL
 iQr6ZV17BaPxKCjou69TPaV7e8WGrTo=
X-Proofpoint-ORIG-GUID: EvD_odvrMZf40eoec32smjsMGeJ0rQBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_015727_738035_2A007341 
X-CRM114-Status: UNSURE (   9.48  )
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



On 5/9/2026 10:58 AM, Miaoqing Pan wrote:
> This series fixes RX monitor status parsing issues on platforms using
> 32-bit TLV headers (e.g. QCC2072), and tightens TLV decoding robustness
> in ath12k datapath monitor handling.
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
> 
> Miaoqing Pan (5):
>   wifi: ath12k: fix TLV32 length mask
>   wifi: ath12k: refactor HAL TLV32/64 decode helpers
>   wifi: ath12k: add HAL ops for monitor TLV header decode and alignment
>   wifi: ath12k: add dp_mon support 32-bit TLV headers
>   wifi: ath12k: tighten RX monitor TLV bounds check
> 
>  drivers/net/wireless/ath/ath12k/hal.c         | 42 +++++++++----
>  drivers/net/wireless/ath/ath12k/hal.h         | 13 ++--
>  .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 59 ++++++++++---------
>  .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  4 +-
>  .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   | 13 +++-
>  .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   | 13 +++-
>  6 files changed, 94 insertions(+), 50 deletions(-)
> 
> 
> base-commit: 14d99bd40a8e3a80398dc597375fc7516ca488dd

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


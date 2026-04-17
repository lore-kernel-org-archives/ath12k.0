Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BE1F8E499
	for <ath12k@archiver.kernel.org>; Fri, 17 Apr 2026 02:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASVAs4SyLb39Qmi1wwnet3pJDyNwhLVO4o2D4jse6Mo=; b=R9UMQHS/22qMAliymmdC2IjmfJ
	1rUkdLsJ7zsBVDml+i40Ddduk1ngRGeZ6IGKrbrsdnXa7V0XKFeg4dpa/la2gPzjQpYX8xwlr9QQn
	mzRBp4Gd74yXv8lamxGfWiRkzUbeTSIf40NV49X091VFZnVzYmsmt7807mv1N8Y+lT+o4aNWK8psM
	sGlVUNx9NFPBzwtAvO6ky/wnXcBKln7zdgqg4apEbjKIRW/5i9ESlkWGADHy77MD3nMDgvd4Ex5OH
	yfLJ8J6S+IiWi3JprQUMXxARt/kzl7qbSgAd5QPD3wFIXVUcOk2CdNx92bFxhJZ+pJsfU26Y9yFEi
	Za9oxE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDYbg-00000003JJe-18Al;
	Fri, 17 Apr 2026 02:06:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDYbd-00000003JJD-0GAa
	for ath12k@lists.infradead.org;
	Fri, 17 Apr 2026 02:06:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0feUA1092186
	for <ath12k@lists.infradead.org>; Fri, 17 Apr 2026 02:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASVAs4SyLb39Qmi1wwnet3pJDyNwhLVO4o2D4jse6Mo=; b=DS8YLr5IYQSqlaq3
	mu3N39ApOYwDFd1Cxv2kmlNm6r0j7MncafSFFFTS1ubGDHeYJ9ViAAV8pvX25liX
	WvBG0g7lutS+OoQcDFUwz2Cw6s/dZMB7BzjAIvunCIHSqfqjk0j7GdxUPyZlYjBH
	ShYBisSmgrbnMF9ou1u6iej5SwjErQMNwGytjHx4QbOK2nvpl5rrE2NgBAGHlN2T
	9Oj6EUoCM9Sg9QbrypsnbrAL6IlyIQQ2g2e4+T/fIVJqpgCt50zlRQ8xAe4fuu5T
	BO9iXqCUEidzj7Y870gmANGHUIR2IEA2/AldrDWmS0NYP68nMzv0QjYT2K9BRtJe
	HUmChA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk227t29a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Apr 2026 02:06:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358f058973fso261588a91.1
        for <ath12k@lists.infradead.org>; Thu, 16 Apr 2026 19:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776391610; x=1776996410; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ASVAs4SyLb39Qmi1wwnet3pJDyNwhLVO4o2D4jse6Mo=;
        b=hn1Z41Pn/OI1PDrUROyXtgeJ4QbvPm5s620UMIbRAxltmxcZ/oZqTbsNmQ84HsNJdp
         6Ai4tuaDGyVkP6jo7Z//xmZiiHwExqSwgUMmYoRmwFkK6gwvgpzHCFLVIaFXLtoE3cu9
         VVkBofVRF1U3MFaopcmGDkMaF/h4BjxL0jIRYpgPuhp+3ROJZxnptUI1lgVk3YD7NM01
         AWxq5vOGCW8OA8xCEZKHN9rKVsS2LLBuxDdL7mNpLWCHUP1fPAttapASIni5y1v6f0A0
         XEJ8C5tJl5q+yK54uflH/Y3lz4UwPBtoKQyXQ9xnpU9LyEhUE0X/osL2PY7hj8TvoG8N
         /A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776391610; x=1776996410;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASVAs4SyLb39Qmi1wwnet3pJDyNwhLVO4o2D4jse6Mo=;
        b=URe3ZfGqQ5ct5jJQKqSSKIoG5w9rHl21A+d8hYa0Soj4A2XcE0W6laQ7HVncYQq7x2
         a1KB7o0TayEcfJDDyOlJkYk8XlnO5DIBzWgyEFG5wZwqFoy+qL7ijwdqI5aSv1jxRn2W
         eUhe4m9UAEFUgrHqSBT6sWQe/jgGHqGxv6fdh+h2d86d+I7MVIH967TSHRDVJsPfyykx
         tsyUYPXYdCiRV4th/TpSHLVqi0f6gZrekIw/j4YNcRtx/AvTX/KNvwua6wFvbSz4hsL0
         CW17fEmg7riHIwukr2Xmh9AVFxgbR85nn+jAjw+YK/EIVGdfewoKtBvhq1WF7VQJ4jPO
         cqEA==
X-Forwarded-Encrypted: i=1; AFNElJ9tz5eriHpNY4XrGsVDXvnpsJ/0epDi7VQgvLDt7nSnn6BCaKcp43pjqkKl3ls8K0gsCYoDtTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ4fx4uyxc4A23sJILjNsLZJTyHUu86bo0k7Ac3J+CP8wTppgM
	HNMkVAU6QO9QC/gNCTMqtbmKv8jOizpGtCABYdnj0MTrNeqgwcgi6Mp08H5P701doIcnLhFXKcG
	jpW/befl4TW0ZN0MlESG1Adoxkcv5gl9Z58gavL08hzMzbWAr/ukTcAOu8xvGK3u5
X-Gm-Gg: AeBDieu6SF73d+R5Rgzx6Mr3Yt7iWOHASW1bN+i46eGJQzU42QjYdmDZklBa+K4zAAs
	hsLwnKBHSNrxTj7AcY32WhyKxPhkIcv1lsXMK8wTqlVAQYJfYYgvVr+NGMfBN0vgUqEgTbJ2YrD
	2nZph1PZj0dDu6W0s1lNFOL1Wlp9q/utw8x0KSjxymcBcXwgbswUAVjazadFgce69I0SeEZbQKO
	ORv7uceev8P/+tmYrbhLs4xuQ7Cg5h4qAIR2VQCW67pgokL210lUNs6/jGJng2lUOyMwV5eV2fH
	D9rHFWEPpZQuEQstcEwpR2pNZFmiLuRXSnZtbgMrcAKIlyBHZSqAt4IUPIbKpYKrz3qyTg99bPp
	TG6sbNguGq0F2f1JM/4wu+OuBCtoMSMO/86NkKAObyWbCyb7vtacHuxGXS88zW5xClGYMzk1Bq2
	k45D3fvvf+2WYYkMpImUNb22t66NUj
X-Received: by 2002:a17:90b:53c3:b0:35d:a38a:a117 with SMTP id 98e67ed59e1d1-361404745f7mr844111a91.15.1776391610431;
        Thu, 16 Apr 2026 19:06:50 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:35d:a38a:a117 with SMTP id 98e67ed59e1d1-361404745f7mr844081a91.15.1776391609930;
        Thu, 16 Apr 2026 19:06:49 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fbbb4f9sm217482a91.6.2026.04.16.19.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 19:06:49 -0700 (PDT)
Message-ID: <3caa2840-4218-4880-8ce0-5bb29b2b62e5@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 10:06:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove macro
 HAL_RX_EHT_SIG_OFDMA_EB2_MCS
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260416-hal_rx_eht_sig_ofdma_eb2_mcs-v1-1-c44a3177deab@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260416-hal_rx_eht_sig_ofdma_eb2_mcs-v1-1-c44a3177deab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDAxOSBTYWx0ZWRfX5isWz79YKD48
 UYBYO0opDnwt73EySPlfkfN8wmW8MRy3AYxqnN4pLYY6EJg1QNK7BLBm0LeCRrdzn3mVfce6HwE
 GwCp4PS4ALoB0s2Qa9eFvJ7kE8GQrbZj9DALdz+Ub8P3GAuSZA1ZVM1rX/LGjcWzWAmOyzTNAJ1
 h8G7ZDByEgbYIUiLUmopmFrQBlUY1IWBBi70+P6u1fGeABSTiYmStCnGxlsmhCgkEJGEmLZrclA
 GRUImSTJigPaZBlSQt1efG2KxnTZBGC0OpIV3bJwEWfhgMluY/oys/Rk66rpShb1G9cG/SzowUf
 cW/B87FARfFmx8ttGojMQ9MvYN5Bibcjuspq/oWuBx54lNrQlv1TX9LxZ5ux68DnHlkb2WxY1an
 4+haDLfHpS7S5YQHMStzlpjBOdW/4av1cQIzYAjRVhcoI1GRvRzSi+w5ESWuc5gIVSXjsUbCMfP
 LVepX1jDwFFeaFjq/IA==
X-Proofpoint-ORIG-GUID: 1vOlSwYGqbDnZULKK9tm__Tdl7cfznpJ
X-Proofpoint-GUID: 1vOlSwYGqbDnZULKK9tm__Tdl7cfznpJ
X-Authority-Analysis: v=2.4 cv=Iuoutr/g c=1 sm=1 tr=0 ts=69e195bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TSGZlz6qhe5vOcDPnEcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_190653_268273_1E3272CF 
X-CRM114-Status: GOOD (  14.79  )
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



On 4/17/2026 4:02 AM, Jeff Johnson wrote:
> Macro HAL_RX_EHT_SIG_OFDMA_EB2_MCS unused, so remove it.
> 
> No functional change, compile Tested only.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
> This issue was highlighted by AI review which noted that the
> HAL_RX_EHT_SIG_OFDMA_EB2_MCS macro misspelled GENMASK_ULL().
> However, rather than fix an unused macro, it seems "better" to just
> remove it.
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
> index ac2a8ac03288..dd60626b3240 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
> @@ -559,7 +559,6 @@ struct hal_eht_sig_ofdma_cmn_eb1 {
>  #define HAL_RX_EHT_SIG_OFDMA_EB2_RU_ALLOC_2_4		GENMASK_ULL(35, 27)
>  #define HAL_RX_EHT_SIG_OFDMA_EB2_RU_ALLOC_2_5		GENMASK_ULL(44, 36)
>  #define HAL_RX_EHT_SIG_OFDMA_EB2_RU_ALLOC_2_6		GENMASK_ULL(53, 45)
> -#define HAL_RX_EHT_SIG_OFDMA_EB2_MCS			GNEMASK_ULL(57, 54)
>  
>  struct hal_eht_sig_ofdma_cmn_eb2 {
>  	__le64 info0;
> 
> ---
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
> change-id: 20260405-hal_rx_eht_sig_ofdma_eb2_mcs-a22a27f955bb

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

> 
> 



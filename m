Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD72C88E42
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 05:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vYUzOA09W+SEgh2BVxJbTTr4nm8xihIvRSOrdGLGTE=; b=Cnq7uZo8tjDmYSAfJOOYjrunsr
	eRviYJ8EJVyGvKmbT4tXgS8rNMIpTm9gfUAr1zK0I/QFmcCfzFt5Igifi8pwdX4IiHTPS4xv6pm7b
	GCq0lwOGLBN5+81wimDTnTvIr8noajpB9NzjOg2NMu9Ib1ivFzSZgICo5MGoWBupXXDOzwYiVyOaL
	NH3ZQ4Av+/KUPfc6os8+NPuDZAO2wrtkHeg5ITMYzYIGss5+EvwoBufwSC2FnL9dRm8RTdT2wycfL
	o0ApKAPP19LVLdStyFCmF/93FcrNztqIFE52aTbowD5eJ5pZ6lqCH7Q6TTxmvRBPi0+ucE91LgErN
	5BslT2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkF7n-0000000Bw5Y-3FLx;
	Mon, 26 Jan 2026 05:26:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkF7k-0000000Bw57-2sOh
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 05:26:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLlgjw075553
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 05:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vYUzOA09W+SEgh2BVxJbTTr4nm8xihIvRSOrdGLGTE=; b=Vby3EC9c1Em22Bf6
	ud0VeeUUVfn2rYCOEfputgjgVShXaVf9JTTAHdc3vJwIt+yk5QhO6Fz5yC26IKeg
	ihGodmL3DIT2Av8LERlG8EfrdrPfFWxaiM42d+pnhtst1RW1xV7SNfXPsUi6M9KO
	/3yER6juEpiRmx1oMY4SvMbxQje/Ly9tsnDqtr+gtS459BbSJ3LLM0EwMT+Qlt5q
	4W3GG0nEf6FSRFmosYnUh6UL1bw2cCEPuF3L8urk9Y+Af3bDtTMIVJQYwMy9mDGQ
	gbq10aPsio3EO65cTPN2mS3D8Ed0WXAABbtJ6Y40ocFdYgJkEirV7In4fP2sWkQe
	BmlUyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvw4wu0c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 05:26:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352e195f662so3335920a91.2
        for <ath12k@lists.infradead.org>; Sun, 25 Jan 2026 21:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769405211; x=1770010011; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vYUzOA09W+SEgh2BVxJbTTr4nm8xihIvRSOrdGLGTE=;
        b=hCToOkXqmi8f6bHtqVVIWB61PhnvxHpiUlk3Q1upUmacsDmy72jRKWbRlARaWg/vkY
         K9/0Lm7gL/pFFA6x6QjfqG64CYjUH8fxMPHz8tENJX0iQ7Y2Q9OqDJcR4kXvD8tZZcGw
         j1YrjjgdH7Jmxeo1iWLJXljCrkZZu7YGj3cVMOUVclLxYVLETGil8i7zSIHeLpXvopFl
         /uYYevVVQLpesVohm97AU3vijI+0D/JQ0bwGje1K9tHBISHIv4O9n0gnaBq7QD4d4Mr2
         Go2/uJO8AEWmwlVryoqyCi9rfDLPA5Lt4hnqUb2QMowzi56NTByAdmVs/rJhnelhqT8s
         UKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769405211; x=1770010011;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vYUzOA09W+SEgh2BVxJbTTr4nm8xihIvRSOrdGLGTE=;
        b=NO2lTyMQFqRIXTLg2i/kgG6+NqLEdpKUlQ0CbggthB86NIsGpDtY4C36MM4uJ13R/N
         qjjsNSHTBlntPWFW5hIOjDo2PNL4+4fyWWecEo2Fe7EoGNK6x6GKEcDlcujOi2NBscxw
         +HiTJrVeQKeF4Ac/yKhas9KtoQeth1IalSgwUHO+ZWmvmLw7ieFwLrmTLENgfOLS/6ca
         pj6L6dAxLnFVtOauVKlNJzUAbXtzWhLkz8SGXi6jXtGz+r2AWW3wUuWP3LX2aFTLkkkN
         gknE38nELgLlx5QhxGqlHsBbHZGPfaaznQYUIH0aACraTWr1Afz/O0uxOXRAkoigr3nH
         PDJg==
X-Forwarded-Encrypted: i=1; AJvYcCXvFmg2AKTPdXNHts8okryEQVlieKxhLgfrTlKYhaKREybf5ZU0pwXUlupt9p18PhDv9LSeaSI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7uWUU74hU8E0/rwGU4a7Xvxt2c82bUVcLodcwv1M2doaFkWeU
	dwOBDEu1Irb56aU7svCgLimjGqTIyzzQMQu7zeZTxBYaBBRWC+tffdGzRBCdv4I7M07LsKZzMEM
	Qa5844YMQsUvMlDkoVjhM/0g1KUfeq5kpo1kCOzi3+PKLOOPSaya7Xhri6JbQmGRP
X-Gm-Gg: AZuq6aI1KOr8BzvSj0GK/P6frbF133OEfvDGxqwHbEKbBHIwJCWtECEoMhZhZy4ggxK
	XBar0+DodMUkVTv03Slyqrcqo6c9mpHg+ccQ4IsSgfBe4AQHj0jaG+haClFB0bmYkiwboy1P+TL
	+zb8aMHo+AhOpDeSJdH2itU+CUmo/dhFYLDB9wOafmBRYwLLSa2P6GIZ97d6XAFpHiJTwv04iQ+
	ZkP5/2Y2vCzJbsuqHHz2a8p8NCNU/fT+GIzQTv1QRO4F6XTEjbCP45SeIdZ3VZyfo8eUW3m8x6m
	J82vDAseUbBtv8FieJ/soAB90GmlMcRCQNDGnJnq0cwOjZUyjm5frgiVZiN95lhXL6FVbHBv9Ok
	sjTW/gFZRfIaIzNo27ZZ9WeS6ARLkqvsoVqcYCTzYdCYrGgit0Fpo2WnHJA3HJjOERmN3Rxg=
X-Received: by 2002:a17:90b:3f88:b0:34c:c514:ee1f with SMTP id 98e67ed59e1d1-353c40e95aamr2609652a91.11.1769405211249;
        Sun, 25 Jan 2026 21:26:51 -0800 (PST)
X-Received: by 2002:a17:90b:3f88:b0:34c:c514:ee1f with SMTP id 98e67ed59e1d1-353c40e95aamr2609638a91.11.1769405210716;
        Sun, 25 Jan 2026 21:26:50 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335205a2fsm10672411a91.2.2026.01.25.21.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 21:26:50 -0800 (PST)
Message-ID: <e3892648-947a-48df-a23f-b4648f57b118@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 13:26:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Initialize regulatory frequency ranges to
 avoid filtering all channels
To: Saikiran <bjsaikiran@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, kvalo@kernel.org
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
 <20260123155750.6007-3-bjsaikiran@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123155750.6007-3-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 62FbZA5UliFupX5unEsNrjIuE6WDjNI3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA0NCBTYWx0ZWRfX8sV3kVEuz2YN
 Gw3SJ61/eECh9vV2MoFKpZEw0ZjYsSk4h6nW/TzQ4F4AtJZhhOByAAiZ3K/zzJwKYPEaIyzmX+0
 sJDMiebrFUPmAE8s+tR7j0jwy46ogGyCD+xFXtv8m5SoAZGY39sa6IZddotRToFT5VdkNirrF+p
 R0nn2sJ/WAEPhHXYwO2dgkOunjlVORq7jiYNSxkH8DuZ0p/gvD7cPV6N+BhGka3wIZqoUJrB9Qz
 7k7L4pbVPUxhMdPG4s++WJCpwnIzhxVwBxAlkiCDqxL/v9zHkpi1BDBTLxVmpOyHQv4DQ2KWj+p
 tTGEnyTpJ+BoUW70kQU8oBKY87u3l+XR7/wrLmKsUJnW4JCpWkG1nn7RMOICHmqkPZ+oV2cYyR9
 f43sGdnPyB2gqdWsVRvK7gstjxVrVEfOWFPPYDpMMiIsjM8EWRYjttb6l5hyHwl6TgAl8V51G9h
 1YT5yqozeL41CjppPXw==
X-Proofpoint-ORIG-GUID: 62FbZA5UliFupX5unEsNrjIuE6WDjNI3
X-Authority-Analysis: v=2.4 cv=POgCOPqC c=1 sm=1 tr=0 ts=6976fb1b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=7bdGKr1Mna8dyHvEU74A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_212652_757757_CC81EF2B 
X-CRM114-Status: GOOD (  18.33  )
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



On 1/23/2026 11:57 PM, Saikiran wrote:
> Commit 657b0c72c4ad ("wifi: ath12k: Fix frequency range in driver")
> added reg_freq_2ghz/5ghz/6ghz structures to intersect regulatory
> frequency ranges with hardware capabilities. However, these structures
> are never initialized for devices with self-managed regulatory (like
> WCN7850).
> 
> The WCN7850 firmware manages its own regulatory domain and never calls
> ath12k_reg_build_regd() which updates these structures. This leaves
> them at {0, 0}, causing this logic in mac.c:

No. That function indeed would be called for WCN7850.

> 
>   freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_5ghz.end_freq);
>   // freq_high = min(6000MHz, 0) = 0
> 
> Result: ALL 5GHz channels are filtered out and 5GHz WiFi is broken.
> 
> Fix: Initialize reg_freq_* structures to full frequency ranges in
> ath12k_core_alloc(). For devices with proper regulatory domain
> updates, these will be overwritten by ath12k_reg_build_regd().
> For WCN7850 with self-managed regulatory, these defaults allow
> channels to work.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302
> Fixes: 657b0c72c4ad ("wifi: ath12k: Fix frequency range in driver")
> 
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 4121dd14bbcc..99c26ba01304 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2290,6 +2290,19 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  	ab->qmi.num_radios = U8_MAX;
>  	ab->single_chip_mlo_support = false;
>  
> +	/* Initialize regulatory frequency ranges to full range.
> +	 * These will be updated by ath12k_reg_build_regd() when
> +	 * regulatory domain is set. For WCN7850 with self-managed
> +	 * regulatory, firmware doesn't call reg_build_regd so we
> +	 * need sane defaults to avoid filtering out all channels.
> +	 */
> +	ab->reg_freq_2ghz.start_freq = 2312000; /* 2.312 GHz */
> +	ab->reg_freq_2ghz.end_freq = 2732000;   /* 2.732 GHz */
> +	ab->reg_freq_5ghz.start_freq = 5150000; /* 5.150 GHz */
> +	ab->reg_freq_5ghz.end_freq = 5945000;   /* 5.945 GHz */
> +	ab->reg_freq_6ghz.start_freq = 5945000; /* 5.945 GHz */
> +	ab->reg_freq_6ghz.end_freq = 7125000;   /* 7.125 GHz */
> +
>  	/* Device index used to identify the devices in a group.
>  	 *
>  	 * In Intra-device MLO, only one device present in a group,



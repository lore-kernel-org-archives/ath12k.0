Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05B3CD37BE
	for <ath12k@archiver.kernel.org>; Mon, 11 May 2026 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6AYKxAAyxziRqLJJS3fTnBEpzVHpo8LX+0srwQemhM=; b=NHqKETd0Hq+Ue5fC0siSIXCvsq
	Cc7V8iSipcRnsJCm8bwRr5lIncgE281kI4vQ9dW7vCB5l2i7eYB2zn13UtTmzK/p5R68EP+n9nkRD
	9FZGtxYiDAO3k9/EUF7ygini5WXQd2Wks1g6NYhwL52WTIA02suRn/JrAlais+4fODnwT4PqPxVsD
	4vF/W/6OJmijl8sScrFZQuc45Ldkrnlj8xxpFEkw9oaEH0jMzKdSn0xIoqF2u2cTljMXM57k615ng
	Xl9Ex1xcM1S9dzVcS5a3YqNy8hU0I18Eez0tgdo9PRYEb/XHfZ8Lot1d00gmqp0UfogD1c+eqME7h
	DFajU93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVu2-0000000EZCk-1tIe;
	Mon, 11 May 2026 19:02:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVtz-0000000EZBp-16Z2
	for ath12k@lists.infradead.org;
	Mon, 11 May 2026 19:02:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BDenv51258476
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 19:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6AYKxAAyxziRqLJJS3fTnBEpzVHpo8LX+0srwQemhM=; b=LjUI3YTZ/1aPNY4A
	G4ziUYssJ17TtnFeY9ukYmuI9mcCHSzdB/R7zKZ+fXEl7lnRIMxD3F5tA2Jt0Xdp
	pujjAinCEmcv1dqFi4nxX5nuBoR3R/XW8cuVTLZ7/M+3GArMxp4GFNhvfI4X7pXy
	4cYWyKjQIg1qmEYiZ8OoXEdDxM1bnmsslKotd3e3C4TUDEVeOiYcPYSXz88iWPdD
	eUVErf0Ko1lpyP+fmH+Fbho3nHW1uG5VUdZohCUK7MwGpZcilQmwAyLl5JGeezCg
	Cc6N5ZzkTzN63wynEbV0kyC+yv0boibvTTqWzDNzPZ0ogusPpyV0RH0vtoqJ9mNO
	0dz1Ng==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag22vm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 19:02:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2efc342ef15so6549515eec.1
        for <ath12k@lists.infradead.org>; Mon, 11 May 2026 12:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778526168; x=1779130968; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6AYKxAAyxziRqLJJS3fTnBEpzVHpo8LX+0srwQemhM=;
        b=CeKXKfJ49SvyEUlqexfAKZV8Nr3Uugxqp7xW45jphj7f5/7HyH966p2B5bgiuDzZWr
         KQ1BaFuKqUtOvEpKe0D5x3xDNSD/MpbEeym/d6Rk+unOnDw6p7xgv+SQMYYPz+HOa94e
         eF5Bsjli/7nBrRyOgRJ262/DZuo70QwXH7BqY+YKj+QOYcikxzN6lFC+atnmpO1dEwMj
         8lEXLu1+IGXSC9w0BDfX74XCKbrSCsZjAKY/ZfHKd9OYrt4ENu7018OXKzr+fPm8m+dq
         XJCzqL6LRV2MzCLb/lEWGkUzFYuW99m4Bz9hk1J2n09mf2eiKbgkC+gnGKxqW8rj0hl6
         g7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778526168; x=1779130968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6AYKxAAyxziRqLJJS3fTnBEpzVHpo8LX+0srwQemhM=;
        b=Tss3bzbLCLYiVlk0L2Slfd3Ax002Z0iLv147ZHliiQFT+KOvfywNOACf3mNbQ6u+fY
         6HMrAapNaePtpoxQhw2OLjFjeycwskYrzNPaqQSiqLmy8IDQ9aqYUXIB/tKKAb619MaW
         jY/tmdLr/7p0DhzE+/pRmsEU17i2nK/Wi+2/EpGAwN6F8ACzNK8zrb3nKybJ/MTl3P3F
         EDQUk9/N25uQ9LrPmXn2cH3gDPla9p+pZ48oljDam5rbhWI9MF/Msyb9ljlsUDcrMqKo
         ZB/Igt8PzcbTz/mYeGWx8QsHU6jdXgFxfdD97b6PWLdojlb0cAs8N1WwrGEFk9lVpZpI
         AToQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cMTRnyCBShvYQMTpPNcustN01fJ/XmHRWph2Haw9tTBlqGYlF8pSqgf+4efpZz0EdcZEmc9U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwX7u/6WemIlUZ40mgI2HCIO01FmSrnVzCQZcZn3EBDUUxCgNue
	hP94sdj1vkito6OqPq51VfQGLKeU4F6D5mBX7Spv12BvKoT8360w9nfrAcXarZeb4HqP0xj395d
	SGOt5QQE5+L7OwstLWZ4hmsGkt2E/gERxOfLg5H6uTjuAIOKrVZhYEzB49FVKLh5k+ROSpT0A
X-Gm-Gg: Acq92OFc/o9SsoT3rSAXRvwbIWFIaB0bweged0IVX9xFAzHDIC4DVqTs/cg6Yvs5a/H
	T/eSqMyG96VY0G/81nhUoNQbjB5vPJjOk/L5mcZD66o3uKuCrpXc6D0+YyTt+fOZwAaoYnU2tFV
	bYH9fCfaQ/K6nzRw5ja+gw41/qOku4obOA8EOVWatw3QZd7J1Pp4jiK1Zwbw4aVpaFXjstVoUN+
	XmvoNdZ9hYIHwhe2FiOBniKQxU5e1jTHuvWezKqTuRJnitD8NtGRayG4gmnMOrB/KZt/lK01sry
	22WVRC4KD9vjQlqcM5vkATfvartTXcDen4oFu1WGqdx+17im29IPXQy0A7rV6RJdmQQFOhPjIeF
	KNbhrzzZNeTXBFWCjmIruQs3GTLwO4EMJiZ8e/yXRBqhzQe07a7Vlc2tdcV+rqR7y6Ymixco7zR
	zeoWcRoRJ6rGuuzg==
X-Received: by 2002:a05:7022:1b0e:b0:12f:1f67:e747 with SMTP id a92af1059eb24-131a6af4231mr11030905c88.40.1778526167789;
        Mon, 11 May 2026 12:02:47 -0700 (PDT)
X-Received: by 2002:a05:7022:1b0e:b0:12f:1f67:e747 with SMTP id a92af1059eb24-131a6af4231mr11030867c88.40.1778526167111;
        Mon, 11 May 2026 12:02:47 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132787673ffsm19710428c88.15.2026.05.11.12.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 12:02:46 -0700 (PDT)
Message-ID: <89f30996-3210-403b-8c9a-52cf6d5fcb51@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:02:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: skip unknown direct buffer ring module
 IDs
To: Nazar Mokrynskyi <nazar@mokrynskyi.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260505172415.566328-1-nazar@mokrynskyi.com>
 <20260505172415.566328-3-nazar@mokrynskyi.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260505172415.566328-3-nazar@mokrynskyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BI9xGs0TB87I4VOIZKtCL78ZhRCzKz3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIwMiBTYWx0ZWRfXz3VkSIca/9wr
 upSA/elbdXJUymlDcPTqKyBYT1ECZu+J2xCArcumZN2w/RZ0kz3xyrMOwUvkCl6gf8bM1gaPdIb
 CFpuDnRdO5u2uqVWShWi/H4BCyzfoU0IzUu87J+ALk1WcX5ck1LUgmaiBhRkY9PzPJ5xqlqxrRP
 oM9FhBAQA8Yf2F8FSAqAU28xbd+cDmaAcFjR/WMfIgij5ZcgIBdZURgMifqsCfwj/iYLlUE7jxm
 GPmr0yvtWHL/yGuBjAGjV60HvXuRXkc75kduD7aQOSg+Hslui7JxADHH6BwEPfHjDR2AwD0hv+c
 4EKNPzc8BzmWKoWDKX7b3ga+C6HJ4opBXSktNto8NCgs+Xd73Ifp3Q+lbj2DEclbC1C3W0w1sKJ
 ta7JSYl0UTJPgyiq4W+IYXl2PQ7oShPw5y4xS45kzLDV5iPZqI2I1tvhMwalwok6TIuXFinohJ/
 HHmV1JCRXyrA7oIt7FA==
X-Proofpoint-GUID: BI9xGs0TB87I4VOIZKtCL78ZhRCzKz3F
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a0227da cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TD6mGIVpAAAA:8 a=MjesTKNxIBkL7_LiPggA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=V7iCuLqznmuTtf2Pv1nF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_120251_812002_A516B762 
X-CRM114-Status: GOOD (  24.95  )
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

On 5/5/2026 10:24 AM, Nazar Mokrynskyi wrote:
> The firmware may advertise direct buffer ring capabilities for module
> IDs beyond what the driver currently knows about (WMI_DIRECT_BUF_MAX).
> This happens with newer firmware versions that support additional ring
> types not yet implemented in the driver.

What "newer firmware version" are you using that has this issue?

Can you share the "Skipping unknown direct buf ring module id" logs from your
modified driver?

> 
> The current code treats an unknown module_id as a fatal error, returning
> -EINVAL and tearing down the entire driver initialization. This is
> incorrect: the driver only needs to set up rings for types it uses
> (SPECTRAL=0, CFR=1) and can safely ignore capability advertisements for
> unknown types.
> 
> Change the unknown module_id handling to skip the entry with a debug
> message rather than failing, allowing initialization to proceed.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nazar Mokrynskyi <nazar@mokrynskyi.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 484fdd3b1..0e776a8d8 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -4814,10 +4814,10 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
>  	dir_buff_caps = ab->db_caps;
>  	for (i = 0; i < dma_caps_parse->n_dma_ring_caps; i++) {
>  		if (le32_to_cpu(dma_caps[i].module_id) >= WMI_DIRECT_BUF_MAX) {
> -			ath12k_warn(ab, "Invalid module id %d\n",
> -				    le32_to_cpu(dma_caps[i].module_id));
> -			ret = -EINVAL;
> -			goto free_dir_buff;
> +			ath12k_dbg(ab, ATH12K_DBG_WMI,
> +				   "Skipping unknown direct buf ring module id %d\n",
> +				   le32_to_cpu(dma_caps[i].module_id));
> +			continue;

by continuing you don't populate the dir_buff_caps[i] information below,
leaving that record with zeroed data from the initial allocation. Does other
code correctly handle that?

would it be better to have a separate count of the number of dir_buff_caps
records that are actually filled, and then update
dma_caps_parse->n_dma_ring_caps to match once the parsing has completed?

>  		}
>  
>  		dir_buff_caps[i].id = le32_to_cpu(dma_caps[i].module_id);
> @@ -4829,10 +4829,6 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
>  	}
>  
>  	return 0;
> -
> -free_dir_buff:
> -	ath12k_wmi_free_dbring_caps(ab);
> -	return ret;
>  }
>  
>  static void



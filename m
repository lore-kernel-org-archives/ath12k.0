Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB026C5AD55
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 20:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3pZzwbmIUvK0GnbdPPPfTPLqkbhmh1kIPOQVT4Oh9A=; b=Jp/wYvm9L4unrN3qETw/sD5ZSh
	4fPJFiA+y4WfOyiMlsa55VfqO9JGmuUJpIJN/U2JFJQX5qBWY+FKVg4hTTxXfU09x3JA8sLuJxGlQ
	diBYs8Fhp87FJk3VkCcwNmXSfzAXV33mYVn3wa+OB98gITOQ1rHRO6aslTVVBAvKbYlVi3CLWYH54
	vYNsyyElwMh//Us4HeKa3+g+QhzJiccbWDVERPzpGQNm7pvGeeL54EvmoD25RmIaEPw9qBqQlz/qF
	joYH9gk9ZYqLARbwZ0LR7HFiGPtcOO+msSTRGVPhH/rFWc+bu6b9OTvc2+0Stj5Qqxy1hYTYCDJX1
	Cx6GBLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWQX-0000000Copc-1Ucw;
	Mon, 10 Aug 2026 20:16:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWQU-0000000Cop8-37Jh
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 20:16:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AJlRbN2913167
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 20:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l3pZzwbmIUvK0GnbdPPPfTPLqkbhmh1kIPOQVT4Oh9A=; b=RMknXtKygk23Idck
	xFCmosi1YaXYj0FbvBdn3Pg0lOgMVOmgaqZToUeotxGPvrAQpS+VHmtEUNGCgPV0
	BDvLNNMc5th+NcUFU/yB5Ix3+4v6XxKgI2+xxUqrz/6+G41E5RmvEF9YsL54gk5l
	yh6uk4xP6SrwGaRe9nkA2zAbiO7BubUBo2kCHHc8LcZHvDSsLQXJwsE5S1k1Zgt+
	QPrkRyJYuIeWTefbtf10YP/44dregOMxE5sO9/QhBVPqxbR1oaIv94sxY2LoJ6nr
	hSx/ifldB4BQ4nbbkGcJZBMK3NvtSr/hDvpcBgumq9AxgkB8DwxydJxY+0rfI/jx
	/Dmlug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfrr3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 20:16:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so57487315ad.1
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786393008; x=1786997808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3pZzwbmIUvK0GnbdPPPfTPLqkbhmh1kIPOQVT4Oh9A=;
        b=ORqT6fmLHhqldsLALC80IiRtD76+4t/OeAs/PzIrLmoKdiNuH6L1CEg8AjTpuohYUp
         Mdz09aky84TfBhR2GEWeT3Ww1gANg5rIgyWdBvdCAVTtOkqoR0LIfe9W0kxSygNsTWkP
         sPjX2UKHj+uUIRW8II+zCNzeHld7f8JYnzV0URAhVSPw8cj3ViVEfUnHEz/DuOvSERt7
         8plp6qXkgo5yeXBrUooDckoOGVIxxmYxQ3w8wKPBqC+pX4UvD8o3SDxXvLRfs4lGjwEG
         BnoRFdOmCxVi2ffho2Jlp/vCWg9VQ4GoOpQwX6azdf9iDSC4oxeDIq+jjxy3Tn5A9sE5
         V5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786393008; x=1786997808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3pZzwbmIUvK0GnbdPPPfTPLqkbhmh1kIPOQVT4Oh9A=;
        b=sR3RXXdgUO5S2KtKTjsLcFMjcD6KS+AY+4bMrjM1QnCbiR9IWDTqQCpiU6sjZ7TiyC
         YifDiFpRGDaA0EGs0j2Wx9nEU2rQHFhkRcaKQwwLfOKA7w2AlpMRNSKZ6VQimpy6xkVN
         84hO0WaBrYjxlHaggCiU4wC7g0R5Q7NL0MxjsGbKxNvtK2YM5ClHBTekZG54TuVxgLP8
         nRnFueO5mfHqW5gtNNnWUxmMvSil+R1lo9n7PdGx1fB+PmZKjGaUd9lbWDZOyNg99neC
         FOPRot8lVJGEJGo9AafQBfMBmSEFMrCIRyCa5Ete/v8RVVyC3xcqDsotgBVVNETlS036
         6SIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8mUpctuLZiGkro4oihbK5LwE1ZJw8lB+487i/P8J+DNELISrQnrh0Bd1oCwBMy+UEi0F9GMs=@lists.infradead.org
X-Gm-Message-State: AOJu0YysJxJ2AJ5eDFUavxjbUD+xKP4QfMYAHCGDr/mGRK9uslV1ec6+
	TvasBPHL/Fl2q38I/ftcnh48tNFhJwjEh4yPqbjIoKS2xgM0whPFDYiR6j80YtGGRE3Ws3zdoC2
	ZHLCjnkl87T3twiu8S0ROCachjTa3s0svIybjWaCEe3Lx+Xs/hOjzEfs710GPTYthoy17buBq
X-Gm-Gg: AR+sD11Ba1xOU3SxvXCkDlOG4yjB+szBzjwLywFIReLQK2sOnInpoQGFqAWk9R8ec4g
	Rm5GCXUhHVNhyQ8gbbBqpWY7tmrSpzDp5LkYJ7+b9WozMewUcfxPOqaytgFEP3x3feq4472PJRO
	VY2F+3uYrfGgzE70yBaZltjrI8+pw7jXJHGey7Xn5U0TZWJwV2l1cDnCYjbz9biWmQGFrjU1xWC
	9qTDJobkt8wIBdoIU+VEyLdCAstgNWQ1meE2iCqX03Wx3h9QRIdvYqiyDP9TIcRi4VYbDRI+EAw
	ucwkcXfV+qlPTKqElZ/AtgZo6aTUQrvaTTYdM4weDzPdIOqPnwvoYwy4pMq8z4UgwN3ntYzTTYO
	O6v1F+UbItyv3HDzrlxU45Btr32Auv7mHQdjADF32zUjcw0Z8ie//OspDM8nh
X-Received: by 2002:a17:903:388d:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d2ffda1b1cmr51859705ad.4.1786393008063;
        Mon, 10 Aug 2026 13:16:48 -0700 (PDT)
X-Received: by 2002:a17:903:388d:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d2ffda1b1cmr51858745ad.4.1786393007491;
        Mon, 10 Aug 2026 13:16:47 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86fc7bsm46628323eec.1.2026.08.10.13.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 13:16:46 -0700 (PDT)
Message-ID: <b2e6be36-b95d-4872-830f-03abeb23ff13@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 13:16:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 5/8] wifi: ath12k: add WBM RX error drop
 statistics
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
 <20260810144444.2033607-6-pardeep.kaur@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260810144444.2033607-6-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uL5wmrQn4OG3sXf1h-kpeB4_B0gP94sR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3MiBTYWx0ZWRfXyBqxmhHvanO8
 L4Mg0PLQm2kFn8p6GPDfiwMwhEzX6I5/LvcQMYRGiP6g9uWfGqEvQhvPkv5GtYf0faW4qjJ4nJW
 ygIMVwz3035cES+1+1R5xYW3gN+FeiE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3MiBTYWx0ZWRfXz7F+hhsxVoav
 V3vol7LHSAauuMEV1BcqbDCRaXuhy2yTpkmV/Qw4UReu7vU5A6hJIOrssAQfjWwSOJ4vGOahxvC
 uEVWmFUZLq/yRSN5s5BINVLZM7414IdL+01ZurUOhGhIq51srN/KDa1qLxdFw49uasinYRmC6+S
 3hCaY/0QeE+36VLXQ+zB4ocnphxzAgFmRZOfXgcNzYGNFhamOuMcEAgB3Ur+g2DQqKeLhe2SZX9
 8yRvWBzcMI8SCwzQWuSt6MLDq73rADqcp+wBt47qO95DCOW8BazoS6m+di6gAgW9Xah5VGTTk0V
 uB5rJSin1PCSCKSNIp6viKE99x4rq8Xy5AUwr1X/9P0GeiU1zTmV8uZiUnfr8Q+n+a4sTxUUOi4
 kRz+iUaNZDHNxNdf923K1MlHK9bytrHCTvPjoYInD06WGLaMOxkSYF5bbr5Sjtdp5dXQpP+sTak
 V7q1ZTvil9P2Ij/CQVg==
X-Proofpoint-GUID: uL5wmrQn4OG3sXf1h-kpeB4_B0gP94sR
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7a31b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Dy4GOBJf9M4JPyKkigQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_131650_924006_100166F1 
X-CRM114-Status: GOOD (  14.47  )
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

On 8/10/2026 7:44 AM, Pardeep Kaur wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index cbda754d8656..34c605b609cb 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1071,6 +1071,20 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
>  		[HAL_REO_DEST_RING_ERROR_CODE_PN_ERR_FLAG_SET] = "PN err",
>  		[HAL_REO_DEST_RING_ERROR_CODE_DESC_BLOCKED] = "Desc blocked"};
>  
> +	static const char *wbm_rx_drop[WBM_ERR_DROP_MAX] = {
> +		[WBM_ERR_GET_SW_DESC] = "SW desc error",
> +		[WBM_ERR_DESC_PARSE] = "Desc parse error",
> +		[WBM_ERR_DROP_INV_HW_ID] = "Invalid hw id",
> +		[WBM_ERR_DROP_NULL_PRTNR_DP] = "Null Partner dp",
> +		[WBM_ERR_DROP_NULL_PROC_DP] = "Process Null Partner dp",
> +		[WBM_ERR_DROP_NULL_PDEV] = "Null Pdev",
> +		[WBM_ERR_DROP_NULL_AR] = "Null ar",
> +		[WBM_ERR_DROP_CAC_RUNNING] = "CAC Running",
> +		[WBM_ERR_DROP_SG] = "Scatter Gather",
> +		[WBM_ERR_DROP_INV_NWIFI_HDR] = "Invalid NWifi Hdr len",
> +		[WBM_ERR_DROP_REO_GENERIC]  = "REO Generic",

nit: extra space before =

> +		[WBM_ERR_DROP_RXDMA_GENERIC] = "RXDMA Generic"};
> +
>  	static const char *wbm_rel_src[HAL_WBM_REL_SRC_MODULE_MAX] = {
>  		[HAL_WBM_REL_SRC_MODULE_TQM] = "TQM",
>  		[HAL_WBM_REL_SRC_MODULE_RXDMA] = "Rxdma",...> diff --git a/drivers/net/wireless/ath/ath12k/dp_stats.h
b/drivers/net/wireless/ath/ath12k/dp_stats.h
> new file mode 100644
> index 000000000000..04d3892acff3
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/dp_stats.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef ATH12K_DP_STATS_H
> +#define ATH12K_DP_STATS_H
> +
> +enum ath12k_wbm_err_drop_reason {
> +	WBM_ERR_GET_SW_DESC,
> +	WBM_ERR_DESC_PARSE,

nit: why aren't these two also WBM_ERR_DROP_*
> +	WBM_ERR_DROP_INV_HW_ID,
> +	WBM_ERR_DROP_NULL_PRTNR_DP,
> +	WBM_ERR_DROP_NULL_PROC_DP,
> +	WBM_ERR_DROP_NULL_PDEV,
> +	WBM_ERR_DROP_NULL_AR,
> +	WBM_ERR_DROP_CAC_RUNNING,
> +	WBM_ERR_DROP_SG,
> +	WBM_ERR_DROP_INV_NWIFI_HDR,
> +	WBM_ERR_DROP_REO_GENERIC,
> +	WBM_ERR_DROP_RXDMA_GENERIC,
> +	WBM_ERR_DROP_MAX,
> +};
> +
> +#endif /* ATH12K_DP_STATS_H */


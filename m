Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531EFC02190
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 05:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HJkB5AGnuoeEnlXxBXugyhlxoAoYetvkAD3YxOU7vc=; b=tRFe/MclGXOy92/qXKZX2Pf+GY
	FTDUyMv42OaBvswAGtmqyB9FA+fLnYOOyeC3Sryf79dZ3qGSnqyfqlDisJrI/juImsoVwPtSKNac0
	I53S6VjLL2as4xJChhpc32AN5qUhdRjSqy7z/I11bW1PoYxaUU/8NDEDGpk8+FCTDzBq++gLItfHL
	d4XVN7SAZBoJjhzeyLNiS2QGOgivn2nZt7+qwvOpfynTBYpF6ZjwLGZl1pqJYOEabPtUkPK5uiJCp
	Bz+IEsnRD2TY6WDDoCAOVextsQHIX7sPeo1J4XznTUAhoqSWoQwhQq9LAHnU1DfakrO6V9KBNTMLl
	23vbR8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjCp-0000000A0eI-3Puj
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 05:04:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjCm-0000000A0dw-3Tyh
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 05:04:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1jHU029661
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 05:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/HJkB5AGnuoeEnlXxBXugyhlxoAoYetvkAD3YxOU7vc=; b=KUbvgAa++R5uV7bH
	Zj/qLn+o3CzSMZFpwbVgEiMsh6UGPDI+3qmZGHUEGV9QqHpVabRo04ALH7hNbbDm
	NMrg0S7MRey3KYIDRgvUw7gPWm44W9KUOM0OtpI0pQgXPcG741N99n/KihvraiKW
	79IT0Ml6rq+4RvOpldDB11hCSc5nWbjKdy23plxVvhRHceX90aK/5WLoOW1/rN0x
	T7JWCD1clmoRhUfsQxOCNnAbTt7XQeAVu9NrhPzwaLFu+OFoTT5rMPkOnvXnXkUH
	22x/3fm7NZBluPUvJUZA77yVlIvEDjJxthcJxgAdA288SBulnKD5cR3iLyLlzeHX
	81Rvhw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7jrydj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 05:04:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so3150556a91.1
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 21:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738299874; x=1738904674;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HJkB5AGnuoeEnlXxBXugyhlxoAoYetvkAD3YxOU7vc=;
        b=iTR4Q9pDxvzGIPbeh6MjHSHU0CSXKXn6o/T61VldOBXTj/+ITFtpQEJ6KUsH8E/Xef
         2F/mKv0L8nv5qzLovziCVciySRAEjN4Arw8Z/RKdapdVmiwcmSp7j/BjmFzNzzXXLPF8
         /WQRjPA5EQAvyUiq7GQxRUWoYJruHcjYS5AK4+ct8VVepZ4b/7+jf/FgSPXO5yrGetHa
         mc1fGBjGqhpHVe0IdyQIFTZLL8903B74KrBRP5jXJNTeaNh7gyZFflMKdYwJ4AmqUuGa
         lzZlK8G99okgtnSWJldsJBF4eDr1BXhyJnnsuesXoYMsrutVmYx9jeVxG69lj9jWQw14
         ag1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUooN8aXCBA53D2gM8FLKgXm6oKvWiqakJVqm3o0gADZ4NQuOQdqnJPlIjYq1yF1oQgxh7RM2U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFVlCyVER5DUqvdLb+71KdHLz+GzMa96JfxKP4gRDIpdVlILLf
	JO0eW+PP/s3YtqVviqB8yGbIoUaztlSigTt/Nayl0w3QBWqSQ+1m8Drml3D6UYPDZcumUfxhEHa
	hjxeKDhB/C87mJbYNLzefQovFdbrBt38njyOtNbJX1genGMtPYgjpa42/09Hl
X-Gm-Gg: ASbGncsQndBc9ynrP5vdx0TexhPCfhZJbBm/a4HbNOBU8NNlJnr+PSigllPNNDvgXBh
	hFGiZpe3jT532nrKLFjYb0sHk/7iEwSR6YLBFYyHDzaEZ+3gxnlZRBib+M6Dy44QGiAeu5+iW+a
	ugjdK4tmk1QCA0Xl0lVGk8JW0U62MNEdQDWIT23pQAFA1+hAJMjrFf1+ldZU3al6PoUgepDo1uq
	dU0oWMGdhTLwoNp+qul4aBRIhhVUYJBjRuWNXJBMCTwpV5LhzHtmzuGbQUzg8C6UwnM27tCIwee
	la14WAotLraIufUbe2FuoOpHsAIwIzWWqhAuoMg=
X-Received: by 2002:a05:6a00:391f:b0:72a:ae66:3040 with SMTP id d2e1a72fcca58-72fd0bc27b8mr12468111b3a.4.1738299873873;
        Thu, 30 Jan 2025 21:04:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHD41LTCK1sMaAtnuRuMOdvs44r0TZQmWtOpus1osQnLWHZDANi7Xdi41HfIdv5TS85nMsDqw==
X-Received: by 2002:a05:6a00:391f:b0:72a:ae66:3040 with SMTP id d2e1a72fcca58-72fd0bc27b8mr12468076b3a.4.1738299873356;
        Thu, 30 Jan 2025 21:04:33 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bea6sm2345645b3a.22.2025.01.30.21.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 21:04:33 -0800 (PST)
Message-ID: <8c47e4a6-973b-43ae-96c7-5f92ca06797f@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 10:34:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] wifi: ath12k: Dump PDEV transmit rate HTT stats
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
 <20250113071758.19589-2-quic_lingbok@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250113071758.19589-2-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o9OAdOgUa2GgIQ8lBwoW7WDeBJnsah2j
X-Proofpoint-GUID: o9OAdOgUa2GgIQ8lBwoW7WDeBJnsah2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_01,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=950
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_210436_998454_81EF9BD9 
X-CRM114-Status: GOOD (  11.11  )
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

On 1/13/25 12:47, Lingbo Kong wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> index 4b59976fbc35..4a40b3b7bccb 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> @@ -129,6 +129,7 @@ enum ath12k_dbg_htt_ext_stats_type {
>   	ATH12K_DBG_HTT_EXT_STATS_PDEV_ERROR		= 5,
>   	ATH12K_DBG_HTT_EXT_STATS_PDEV_TQM		= 6,
>   	ATH12K_DBG_HTT_EXT_STATS_TX_DE_INFO		= 8,
> +	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_RATE	= 9,
>   	ATH12K_DBG_HTT_EXT_STATS_TX_SELFGEN_INFO	= 12,
>   	ATH12K_DBG_HTT_EXT_STATS_SRNG_INFO		= 15,
>   	ATH12K_DBG_HTT_EXT_STATS_SFM_INFO		= 16,
> @@ -173,6 +174,7 @@ enum ath12k_dbg_htt_tlv_tag {
>   	HTT_STATS_TX_PDEV_MU_MIMO_STATS_TAG		= 25,
>   	HTT_STATS_SFM_CMN_TAG				= 26,
>   	HTT_STATS_SRING_STATS_TAG			= 27,
> +	HTT_STATS_TX_PDEV_RATE_STATS_TAG	= 34,
>   	HTT_STATS_TX_PDEV_SCHEDULER_TXQ_STATS_TAG	= 36,
>   	HTT_STATS_TX_SCHED_CMN_TAG			= 37,
>   	HTT_STATS_SCHED_TXQ_CMD_POSTED_TAG		= 39,

Your version log says you have aligned to match '='. But in above two 
additions, I see it is still not aligned. Is it just me?

Anyways, those are simple tab alignment, and if Jeff is okay to fix in 
pending then I'm fine.


Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya



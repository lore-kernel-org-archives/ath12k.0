Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F8AC5AC7A
	for <ath12k@archiver.kernel.org>; Fri,  7 Aug 2026 01:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4yQd5VpQTZvFK02L358x4zxAu2+dKl10X0+R1gySgk=; b=C7BqhUwZdaajGd0EFLREVGNXdx
	oKXZe6Rgf3QfCJiP0GahWioqQ5YEYxz6m3VdheO3AnOv4IWc/5YcIDzjun8CKOp+bowCwmQLX3QID
	dT7r1iLOxjFllozYd0l1+Z5fmPt6llA9m2aqCObd+I+UVGbnyoVyP5cutGSL/QkBmSd2hxGhGQMfV
	5HDmKd+MTkc+mVD5dp+kfoRrmAV4lwfC+6G6oB1bG8qNjx2iHCxwuaED1uCmQ2Jdq2NI2NOGraD+c
	4Sw4jMJZIWD7pOGy74j2KJIQZWbM4dtC7XqB3x/7cIwjfotoOrMMAoDwdyh7RHha6+oFxqHYRewdN
	63pNJmiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9gY-00000006wff-3WJm;
	Fri, 07 Aug 2026 01:47:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9gU-00000006wfI-47vf
	for ath12k@lists.infradead.org;
	Fri, 07 Aug 2026 01:47:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GmIR3218086
	for <ath12k@lists.infradead.org>; Fri, 7 Aug 2026 01:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4yQd5VpQTZvFK02L358x4zxAu2+dKl10X0+R1gySgk=; b=DdEyf+vuBXbVuEks
	WrN++mMFH9m43FY2Z9c0V6+32xm0btAXC52gubLs9vjgRg4Ww4mO4k4TDYjQio5o
	pNmLLBlaF0rPnGGzYE9WXuds/rJNplbbvPrSumiUY52QqK1m+HeHCdIxt3Bq26HJ
	ZBS/R5ksobke/eHArFA6doyyDuV4mEgdWTLagqp1vZjGN5ZJXpAYgf58xP7WoR77
	rQWLinK6UJ7QZvIaOffLWHgATROVpGHXs4peIgw1Z1lrWG8DBXBhzWXPlgZ69mal
	x7PSp2PRHCQzEDuZih0e5LX6y+XQZBJJTW60TgbS0rVbo0AWw3RwT/vFmX5kdsMC
	AAqVeA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hsmpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Aug 2026 01:47:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so3226119a91.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 18:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786067261; x=1786672061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4yQd5VpQTZvFK02L358x4zxAu2+dKl10X0+R1gySgk=;
        b=RBdKMt4FpNTAjmckoFxmXDtRiVoHo1cn0LAD8IOWLzhYAlTnQsULbAqj1/mx3DaHwk
         BO9rVrpenn5gUcDxwKzL2MOieCUKL8ej5FVlBNOS90LSRv3dqPZsYEVUZZ6pHSyZEx+9
         +ysANv8kzDtjrIvzw/SFssOQxfCMgIFYtwRHiIzbMV05N6Przoo67YE9dTbYR5ItksYX
         syWwYu3B7metvHYr/bo1LmnAcrvIoorJvQHi8IDO/RXBJgFh7berbzc2sM7nNmhF7T2u
         jdLZhKWtZvB1ozLvbFHzw0NWfyglPpzQi2ffKKmEBCkFujnF1NOu7t3NIlCzPMihRz0s
         bBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786067261; x=1786672061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4yQd5VpQTZvFK02L358x4zxAu2+dKl10X0+R1gySgk=;
        b=cf2mgKrq+aIkVNzub1zZqJtd/rzG0DU1ECuHvpF1jelANckNcD1CGdRd5SnAVlvNy5
         ja8ZcVLAkOpMpETnBZ2+9xqli0Y13PYwAVrdyfFwDlLuO9VO0/OuAIC0mUkkRyyIGP82
         jfk6iti5TqydjdD+Cfn/v9tCBEUbi5XXkQ0Xj5s7sreWgEvCvgkLxAaJZ73VaVA+PAoF
         ylUttuYDXU4DzK9g/nSjEio2WEw6bFLrtYF1erWVVHcHvaHC3ks6JwpdYlf6PIuFYSde
         558lISJs7SEw/y75Y9NlvIJlp6TXWMDmUqPqph8FeQXtuMRi+fIg4gthPoK1BAPMiUbc
         jgNw==
X-Forwarded-Encrypted: i=1; AHgh+RrZZF+XYEVjH4YF11BIQxavb0HswnvW/9q8oN82nghNXN2laHC7u/6FLlcKBZDHw8TK+22ZAJM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9OLaWYDulrBy37+JAt8HxGckr7cosZI0S4d0HNSh+7B/ITTOf
	/WjvOQX+E3Nelu6yY0SPbq43h9RP9Y/gkq5I9BZc6CTXb5ZrSGFx8uRDd2BM30pVJUyaYoQ2ZJS
	nJQvTRAFbw4nAyOECs4g+9RGR1DK9Y9kj2HiF3P3Z8VLEcLLMiP71MBiMFdnfI0Ve
X-Gm-Gg: AR+sD13+lv/JhLvLEz5f/tEscWQGNPM5g77eDOrRTw7t64cZDZ43kjivwI2AZoliUsT
	6nZg7NfE3GU4USt1XlC44ncnuU8jF3HufDH+/kEFpvOXlQZMbM7uFiaOYhqRQh6am67m1UhoshU
	qAmoFrrWXEgMqEiIV8rgAonrYr8b0oW0DKZ2M2ZVA2bZeSHqb6vZQ1hz2+7fKugwkYiyiOixcAf
	hJN02poNAGlM9+AljTO0cUxr/U+7Y3vfHqnnP0d1899ldgeWhYZDLkP+2DdHx5UtRD5cx7exQdE
	WhuhqH7gOroxwxIGf3SwPrP6HYYZBE4s0gyFpMPP79udLMvPGSxmGVGdJZSVt26Z/sBM6t4rciW
	x4ImgjlMULEOI8XsAyctsYg6cRA8wMFqMy5Zk4iX66XSesM2BRgod/1VNE/O4
X-Received: by 2002:a17:90b:134f:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-39261f729d5mr365773a91.2.1786067260886;
        Thu, 06 Aug 2026 18:47:40 -0700 (PDT)
X-Received: by 2002:a17:90b:134f:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-39261f729d5mr365726a91.2.1786067260421;
        Thu, 06 Aug 2026 18:47:40 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec5aac2sm1064869eec.30.2026.08.06.18.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 18:47:39 -0700 (PDT)
Message-ID: <6a9196e8-2e2f-43f8-9665-6ebb82b95951@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 18:47:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix channel list double-free on error paths
To: Linkai Gong <gonglinkai@kylinos.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260731093816.1771338-1-gonglinkai@kylinos.cn>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260731093816.1771338-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxMCBTYWx0ZWRfXwjyNg9o6sVKT
 f1SKFfHGeMkfF5u78axHaQgC+1xRzOJ7QKVFDMwAzjbwPp2SRoeOOvsguzToKP+xF4cknDrQ9FD
 uLhSHp8CcOezW/R6qcynN4oaV385IW8=
X-Authority-Analysis: v=2.4 cv=PK0/P/qC c=1 sm=1 tr=0 ts=6a75393d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=2tX9H4ud-KebakibVqoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxMCBTYWx0ZWRfX1ZwuCsvHaUfB
 yHMD1FwALcXaDpzrqXXth66hJT4Rs5fb+h8SqQErbZI8ZYs21q4csjgSVGlwQzOxDiTHhEomUaQ
 WkZAuKjBrRw+8ePBrNxVqqxwKZTau+tfRClyCrqlEnooFJauYJQPXLJ2x2RK/qOkxgNZ4m6gCvU
 ig5BAylthENSEDstgZq7/ZKFn+w46XlWgGwTjOXh6Y5vQi7ovS7xUa0jsX4vAuff4S07Yyf96q4
 A6Js0gV9iJPlSSLTzKzBkXXmmMPmJRve7rtqq7Q/tGeUGZStZCKvVjUVfPHJyvNqfMS9I9wdZy4
 oZRFGT7cs+80T9ebELEaGQxkngiwa25R6UYCrBpnzcO6WFnFO8zBhKLv9C8QkxONd23cHuUiVGh
 lb9Xe0lNMcK7Qu3xl5dwIiQEtnmD1Gg3/Z+9amhrE3ItG9+lH77bSmW3RdMWM49NnmFl7ET9Z7m
 h/RABPkFMunzKOkq70w==
X-Proofpoint-GUID: Nrb37DCAkJ0hQ2m4tuxaoFxyr8WPHXm-
X-Proofpoint-ORIG-GUID: Nrb37DCAkJ0hQ2m4tuxaoFxyr8WPHXm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_184743_086085_6B4CC947 
X-CRM114-Status: GOOD (  16.76  )
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

On 7/31/2026 2:38 AM, Linkai Gong wrote:
> ath12k_mac_setup_channels_rates() frees band channel arrays on failure
> but either leaves the pointers non-NULL or clears the wrong band. Later
> ath12k_mac_cleanup_unregister() frees the same pointers again.
> 
> Clear the correct sbands[].channels pointers after kfree(), including
> a copy-paste bug that nulled 2 GHz after freeing 6 GHz channels.

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag
Tested-on: tag missing. How was this tested?

> 
> Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in single-wiphy")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index a0928890671a..5468a8d2d5d5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14275,6 +14275,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>  					   sizeof(ath12k_6ghz_channels), GFP_KERNEL);
>  			if (!channels) {
>  				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
> +				ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>  				return -ENOMEM;
>  			}
>  
> @@ -14325,7 +14326,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>  					   GFP_KERNEL);
>  			if (!channels) {
>  				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
> +				ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>  				kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
> +				ar->mac.sbands[NL80211_BAND_6GHZ].channels = NULL;
>  				return -ENOMEM;
>  			}
>  
> @@ -14365,7 +14368,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>  					kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
>  					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>  					kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
> -					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
> +					ar->mac.sbands[NL80211_BAND_6GHZ].channels = NULL;
>  					kfree(channels);
>  					band->channels = NULL;
>  					return ret;



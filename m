Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C8ED2FEFA
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 23:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkKayYeAIHfTi6mn5hK3Ts5esZgpQ3N3uo9X9SbN9I4=; b=YWUI2udwoKUCQeihfotyIf8m/Y
	yuw3BKA99jg4n3XwC7QKBKKA5FJbp2gj/O6YUaswexJ3cF4N6xn2zuqGvSzyLbZxSUldyB5c8HwDv
	rPcB7Z6qaCE6XAtc7eESBKxM/8fThRCWEdxTd1yd2/MWofngtnpql7XMDfcDRsZM5fEVinuyhlLAU
	7sf25ReS3sETDE1JQ9DZ2pthHkVjmW+UqHG0sOgz2x6FeT1b7oMrOgxG9FYZdiT5yODyw45cWo/jy
	Ozd6WJSf4vMA2zhkO76xejyU0SV5vZVBwInhiSHl7EJ3CjNEE58Rz4FPH+phQX5MiQIlV0SnrI+NY
	38tbQk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksef-0000000FAmC-0FBJ;
	Tue, 27 Jan 2026 23:39:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksec-0000000FAlr-3GXB
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 23:39:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RJeF6Z1135805
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 23:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OkKayYeAIHfTi6mn5hK3Ts5esZgpQ3N3uo9X9SbN9I4=; b=iynGJEFQ2+Pl/WJH
	9dSIi7CHzM4/vs/iq2FjiIVpdzdbBtzFRAEGP+DC2g9S+HGIq/lbP1Y27TnYaI7z
	w4OTxLHmcGm9MTMyCSRVIWx7zMvNVcMA2RNo++epUM7HvDxzwUaBXt+La5T3JMXH
	GTBmszYztNWH9TPJ4VnHlnNVEcZHyZTPaug22zWeENlxOulF+U0HK1dEoO5B8EZA
	fMs5ZWYqThejMbcZQYDz4pvGtl0u1a9OUck1ztLGnn0EQRwNHcn0MPLz3LiPFw/6
	KeJ4EVBb4koxLD7Vv7u0tbhQIET2vXFUrlLH+ibDsTeFRCHouIYg1/NspkuKtGOn
	ghKNEg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjejwf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 23:39:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso401755a91.1
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 15:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769557164; x=1770161964; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkKayYeAIHfTi6mn5hK3Ts5esZgpQ3N3uo9X9SbN9I4=;
        b=hGC+gkp9d5OWVckraDVE52TyalQF4hScIdt04iXYH0RiF9u0+dUt9t00j5xqJxQGrh
         yOBqUYNIxV82cu2cZ9xuiiFpGW7qIbIl9VQGUvUMYXJMGh7aEPpkWHIkM8Ta1uvf89YZ
         kThtn/lpoW3Gs1S+JTDYyQpVfwEi9005viJ3Uak0orv5s6q7xfNlQsjaQarHkYdqmB3b
         Rg1vcrMEMKuuJAYcJfBN+DHy6jNaCqJQSX6Jq7WuIfQAzG0v/UDE8i5faoU3s3ZAt0X/
         1T5mU65ycwkjbcpFXMwp64N5UOLWab6WfGy4vhHgmV1J1XrtNQUKIaBMpw3p755JMnSB
         IM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769557164; x=1770161964;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkKayYeAIHfTi6mn5hK3Ts5esZgpQ3N3uo9X9SbN9I4=;
        b=r4+9Z9WQkvhKOhC5kgYsyMKBz1kLT+bQRLemv2rha4uUtq4rDdFjW1OM4yCcZks6q8
         ahttQcUHhJLVRJmZ+PCZZMYl9MY80mj5SnUb+7W4wIWoaS7Mn3yOkt86eGQayiodiWnI
         sUMzI/ZRBtbomiRQPG3Tlt8NLwAqOwlU3JfB6vdU8RiOyH/TYzT1EViIdkSErHZpG36i
         3FOXZJnHb3M3XSgkzIROq7UqAJQYqb/VzK90LMnmF20566soksG8DAeJeR0dyLCgSjVb
         0iKezO8Kx1hFPdV/Ggb4xq9WZHq2ryoli2Fozoc0EouZJHOUJSHnDF4L6X6LoeFjenfw
         XVtw==
X-Forwarded-Encrypted: i=1; AJvYcCW16Z6zd4pNYPiKodtcOYy7B/bqFV0XC7WCKEEXoU/MBHmaKDPyGizgrn6+MUBMxyx7b6wAafE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHvaP5UuzmLriqxDlvCXqO3ia2rOdEaBwDxy2rXL5OyCzurMKu
	ocwqWVthcJrrJ8rOp3E4XID+RSGDq5+X8mwkqOjVTnfjlmN6H9oiIpV41fgOsr4H/Eb3bG/bnEw
	82PWcFagLrhXEaa8n6f3MO+DEw/3hJY7SvTEAB5JzAuyVdOAWox8f0Cb/kTUMkcncUX07cYMK
X-Gm-Gg: AZuq6aKq6Ylp26mL+hm9y3U23ZrKKXvS2sX4xtnBepEw1dxWfdcr1g0+ZNLkYMZheV4
	vextVU/olLJ5TZuieLQbiSPX5Qu0NS5/TMvVb79NeCwB8tGaPIWi8+86bv4knbktvNX+WkLzGWs
	14N73xpK/Q19wmV+82oNxXW8vKSU88CyvpwuQyKRv18lItVYghC8YNHVJA/h1IpvyFJNLsPfy9J
	/w19znCoTuvKU6VL7r6bZlhXJFxEn3DgsFuu5LG5hWhyfWJYAs/7lml3v3gKfbdJ2GSrCxgol0z
	ydEQ+KhguOsaX/4VQQxonsV+zz+joSd0GTT+j0kzL6Z9wvB8w5/n/kvHCXXpQHgbMx8ix3CzdFi
	XC+M41FLxGo5LuUXAGvC1mgN3MyYL1AHQOp6OY6p5fny4yTjNfTGmyDOL+lCyRlUzwNiE9AWwB5
	JA
X-Received: by 2002:a17:90b:2dc8:b0:343:cfa1:c458 with SMTP id 98e67ed59e1d1-353ffb69d64mr2872742a91.18.1769557163988;
        Tue, 27 Jan 2026 15:39:23 -0800 (PST)
X-Received: by 2002:a17:90b:2dc8:b0:343:cfa1:c458 with SMTP id 98e67ed59e1d1-353ffb69d64mr2872728a91.18.1769557163507;
        Tue, 27 Jan 2026 15:39:23 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3ed0dasm461453a91.14.2026.01.27.15.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 15:39:23 -0800 (PST)
Message-ID: <9c418260-b67a-48aa-80c6-6a03c91e4ba3@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 15:39:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath12k: fix wrong TID passed when
 stopping AMPDU session
To: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260126173655.1369715-1-pmartin-gomez@freebox.fr>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260126173655.1369715-1-pmartin-gomez@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE5MyBTYWx0ZWRfX6sOBArrWPD2i
 VyGpzbm7V5aMmJ8GZXRCK0EEldCqxecT7Eo2PMGcVizKEkRTsDSGSXsFBDQG3LPtkkgIOmUCnVe
 5agbeGodcEb4qizfzIZr8UVQzFM1qCqyHL7R3ueudnEanq4FaS7qle98hOS80vL9vqs89tQKHZQ
 K3HQXOAkthucSclViMI8RHCXiHaKkBfoBXcbwJFx0//lwtq/AQdbGExZrvhDTkT+eCPpZcNQ1gC
 J4JeEi4vO3lQu8qqciz9ttSu/JRSd8yQ8dymuHwjfuaxxEx39s2lF2fdxuwr6tAomkOe+LknWDn
 Yv5sG93NsvUrwkw4WhjVR0XDn1I3xf7rTt6L689jPd169n91CT66aSlwYKZwluyfcPw10zWBAm2
 4WuQs9lyDnYDRWB39SgQ5blbgwFm1Ambevb5/aSDAeDXzuU92ugGoiwPVfX1WLMtdOKA40e+A85
 lbCwAQqYZUTdOrS/HYA==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=69794cad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cpEFyqQddUqqWSyafJUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: NvhLcjrdM--zaJpZ15CZV4TDK6YoEdlE
X-Proofpoint-GUID: NvhLcjrdM--zaJpZ15CZV4TDK6YoEdlE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_153927_008921_0D12E23D 
X-CRM114-Status: GOOD (  21.84  )
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

On 1/26/2026 9:36 AM, Pablo Martin-Gomez wrote:
> When handling a DELBA request, ath12k_dp_rx_ampdu_stop() calls
> ath12k_peer_rx_tid_reo_update() to tear down the BA session for the
> specified TID. However, it currently passes peer->rx_tid instead of the
> entry corresponding to params->tid.
> 
> Since peer->rx_tid is an array, this decays to a pointer to the first
> element, effectively operating on TID 0 regardless of the TID in the
> DELBA request. As a result, the BA session for TID 0 is stopped while
> the intended TID remains active.
> 
> This leads to incorrect BA session state and may significantly reduce
> RX throughput, as traffic that should use aggregation falls back to a
> BA window size of 1 on TID 0.
> 
> Fix this by passing the correct TID entry:
>   &peer->rx_tid[params->tid]
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index d28d8ffec0f8..f2327c82953b 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1289,7 +1289,7 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
>  		return 0;
>  	}
>  
> -	ret = ath12k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, false);
> +	ret = ath12k_peer_rx_tid_reo_update(ar, peer, &peer->rx_tid[params->tid], 1, 0, false);

like the ath11k change, this also triggers ath12k-check:
drivers/net/wireless/ath/ath12k/dp_rx.c:1292: line length of 95 exceeds 90 columns

I'll break this line when I process the patch

>  	spin_unlock_bh(&ab->base_lock);
>  	if (ret) {
>  		ath12k_warn(ab, "failed to update reo for rx tid %d: %d\n",



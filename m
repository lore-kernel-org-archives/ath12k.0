Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57684C5AC67
	for <ath12k@archiver.kernel.org>; Fri,  7 Aug 2026 02:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GD8595lgSiHvhXviq07/tLE2YzvzMFQRx/B3wtsHMOw=; b=1DY3gQ4s9cERu7Y6HxJKbjaByn
	wmbb858iGcCIThBWFJPwxFQLewDlMXiZ32mjkmlcM6+88Vjm9fZiycvBVQ29YczRp2ndPro0B/PYA
	ATyqUiUR1+of26rE27zjg+n+eWM6KEPEEJ5wDLHnLcXKLsv0SL7rt2an6rXQSNbZQoLyaanno45pw
	omJA1vVYDvRCpIG8c1Pp05OX7rl6VLCCgV+9L6iAEt7mmYhzWjFOWOvS2veiQekiZEfLKi+KwUodM
	O3g21d14U8eVRRv6xmmLnHP9gMj/akSqnatqHNvGP9tg8QEiYlESOrALtMf0X3nBRDKyLzRH4AdJK
	UNtlWO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9zs-00000006xFb-3Qgg;
	Fri, 07 Aug 2026 02:07:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9zq-00000006xFC-2uds
	for ath12k@lists.infradead.org;
	Fri, 07 Aug 2026 02:07:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gjq73477091
	for <ath12k@lists.infradead.org>; Fri, 7 Aug 2026 02:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GD8595lgSiHvhXviq07/tLE2YzvzMFQRx/B3wtsHMOw=; b=NobmaMTC1+uWdjvI
	Et7Ws7/nS4d1Vkvuk2b2gkadZKwVIcwtfTgRoY/wRYqn9NbWEwtsORVcWLLhxEP4
	Gcluz2GHkkiaHwYbZG0KO5lOFCUnVsj9TU6ktUFb4PTsI0sHL0izU/p0yMoKJS9n
	IJ88+XplTWohqFa/2Z8JfwcNwPUcLy3BhZ8MDIYt5itU8d9XQpxZOGNGqSKhJm10
	q1Kea82NLyK5j0lqwafaIIvXpq9zcBM6zq8VR+HfbrjuXOhZxzr4GHbheCAIXcJk
	biOTfsKU/ZClq0lmpGDkBZNShrGu/0dx9ij3U3W6l0Bjti5288tu4GwzXZEAhr3z
	Eb1lww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h9st3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Aug 2026 02:07:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1564194a12.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786068460; x=1786673260; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GD8595lgSiHvhXviq07/tLE2YzvzMFQRx/B3wtsHMOw=;
        b=eW5LgtkFylt0/23Boy+qVWq+SMn1PiQeb2I6j2oPH0QboMsxpJBrjLpIKGnuJYY4O6
         W0CI7QQI9952V3WB+RItv8QgE0HujY12dUMsfKVo1hfgYLz00UW+wizFvfeF9h0iXO4q
         +unrL5jV3MgykFgMjBKzpt0q9Jpoxq6UfDzoPFgtdZr+9ygZru5vBpm/AROPfbV/QOO7
         z4iItVv+KrIP/vDwWLKopFdEz4Frh7lRd+/5wy+MIEjeKWlUO69ZjaXvCpy/3M9Vuowy
         j9/9AZxnAnDW+fKHIa0aHx9QbHN4IGpCZnb+rYl+mxiDeTFAQJNDa7gakz7/Yiwln8qU
         jUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786068460; x=1786673260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GD8595lgSiHvhXviq07/tLE2YzvzMFQRx/B3wtsHMOw=;
        b=gH2oVey48Ot3IFOfxjC33shpC1o+F6TKkyKKWAtAlsuh4RUMZ713k86WKKgr8et/SE
         8c1R1hdGd2hNHFsy0o4xDgRiPamZgHqiYgxo+tDv4hGaRHZ2F6CyZ1opjdMfd/3SZp6Y
         12ODz5Z4lsADrqjpqeBOm0BLK6H85oMpiZpx6+uEbMlBP3FceJDp9ZD3r8Lsm3srtte1
         B3vZy6HGwS+KzCcySB/TF1wRKyRsRQromN/kS13BNDavnjKP13Je7LehMD+Dz/NXRTjR
         FnxZr7SFWG1EDF9tnhvgcrdDaXY56ltmQGytw31OyrPQr6PSeBOVaa0rZGZzecp9z+ni
         6z2Q==
X-Forwarded-Encrypted: i=1; AHgh+RohLI+PoIPK3xdciBhXh4sDxBZs9m9BkFQ3rsvwxzBJFJrdr5/Q2XC9lFojekoFJSsYeZ/JZ2k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxG92EGoIOk2xKO3c96R/l2JBItWgsgKl3eMWdi9wfvhvviYtG4
	JVLVDL3OFvuFNRv6XklzhAeXUqp8NlBo2s5P8a5QjOqswfsqJXbKv9b7Xk8pK43LJhIgUHtNct4
	oWdlaL5b/+sDR2xbyjthOu0n/vP7ZNQEX+XEv1J+QgMKzATqgextSr2t1BRxxIqup
X-Gm-Gg: AR+sD102da2Jej0Ra8STksmQr7aaSVM7lOo/3fYuqksMe/TRVgLv0MAAmvz/WxyMp/5
	MzZVG2Gey/Vx97iduRYAfhK1envYsQ3DmM38evMqfYU0BT3mIfdEamLcuEV9bdgUsrfQCgt3OKr
	vZohjFY6XP6Aq4YdQVY6MR8QxYGP8tEU+b6bv+uGMa1c4lmZAc8C5TD+t5W3lGpQdpBjuKRPeWI
	Jk7cfLMCXbCDQFDiVXMYlwdqfNeih80ujNngKBi2sx8YC3xZpuPoCpcRbeBqF8JqPV6wI4GigNI
	2kWpV2ciAmxmlfvWNAlil5vb1g48zSP4ZgHiCG0Uf5EjHri/UpEMxmMdWVppLlVY6kpfrYlw6Vc
	0SMgIC6cSoYVdDoe0ms2Vh776mObPU52JdBdIJbcPUpY3ork9SzEKiPL9PRhU
X-Received: by 2002:a05:6a20:9381:b0:3c3:750f:3cf9 with SMTP id adf61e73a8af0-3cb9c1a4e31mr13305960637.11.1786068459956;
        Thu, 06 Aug 2026 19:07:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:9381:b0:3c3:750f:3cf9 with SMTP id adf61e73a8af0-3cb9c1a4e31mr13305901637.11.1786068459393;
        Thu, 06 Aug 2026 19:07:39 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb883d9sm1235955eec.15.2026.08.06.19.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 19:07:38 -0700 (PDT)
Message-ID: <34ab0833-45fc-4e21-bbf3-bc5a167d9bde@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 19:07:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 1/8] wifi: ath12k: fix out-of-bounds access on
 TX stats arrays
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
 <20260806132427.3704828-2-pardeep.kaur@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260806132427.3704828-2-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FN2BQKyeifANKvG7GX95Q1LZ0QD78DzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxMiBTYWx0ZWRfX5ldGZcbHeJ/4
 jNux/FamYLgBivFcR9kFmuFnbT+oPFvGc2/d0qcfrriE06v9nvEr8QEBslPCcrGhTImZmoDUUsJ
 55+RJQ10JULx4f908yENftzBTK0zLTOK9+yNUgFVVlmd3t9p64cZICj92EP/PkG0j//egOymFTQ
 CfkrxF8f2IJsN+e3hCad5q5II+mnteje8A/Kbr2Qoon++gtgk1L4VshkH3P/3X4/MunIpg11THd
 5QYYswtkwRwv1vWD0nFUM/T030NWCLv7QTa/WAPp2JtsXt9aijjyQ2CGqFMvpk6ZQVs18nIR+8w
 v9X0ZaaUfeZpkbjH5sKi0cN6+HiyJFPrTewsy22Twk0lbqbUJQolFvUlYgRDlqjvyEv2ux/TVLd
 XaarRciUYBUZ4CPYNwONKe+B4hp3mTGA8wURJ0uIKrhUTMZc40i/RK/nmG2vZQKLH+UIWmSiVQ2
 H/gQW1gEz0vzZBW9ywg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxMiBTYWx0ZWRfXyka22ymdSn/B
 LVhB39Bap8kdslrca/rCDMdrp/OrZ0gkywzQlV1ClL7bmQD9Gd2JPKp0CzX4tLEDmTl55/VGevQ
 ttFON0y1EYr0PcPlGISaFyaGTXJQC4k=
X-Proofpoint-ORIG-GUID: FN2BQKyeifANKvG7GX95Q1LZ0QD78DzU
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a753ded cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=o7SAn5tmqHmP8Y5xtFAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_190742_856862_AA71F252 
X-CRM114-Status: GOOD (  18.79  )
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

On 8/6/2026 6:24 AM, Pardeep Kaur wrote:
> From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> 
> The fw_tx_status[], tx_wbm_rel_source[], and tqm_rel_reason[] arrays
> are indexed directly by values read from hardware without bounds checks.
> Values at or beyond MAX_FW_TX_STATUS, HAL_WBM_REL_SRC_MODULE_MAX, or
> MAX_TQM_RELEASE_REASON respectively would write past the end of the
> arrays causing memory corruption.
> 
> Add bounds checks using likely() and WARN_ON_ONCE() before incrementing
> each counter, consistent with the existing pattern used elsewhere in
> the ath12k codebase.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
> 
> Fixes: c5c62287e690 ("wifi: ath12k: Add device dp stats support")
> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> index 587d58eeccfa..632230e77802 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> @@ -582,7 +582,10 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
>  
>  	wbm_status = le32_get_bits(status_desc->info0,
>  				   HTT_TX_WBM_COMP_INFO0_STATUS);
> -	dp->device_stats.fw_tx_status[wbm_status]++;
> +	if (likely(wbm_status < MAX_FW_TX_STATUS))
> +		dp->device_stats.fw_tx_status[wbm_status]++;
> +	else
> +		WARN_ON_ONCE(1);

My review agent tells me this will now double warn since the default: case of
the switch (wbm_status) that follows will also ath12k_warn()

So for wbm_status warn in one place or the other, but not both

>  
>  	switch (wbm_status) {
>  	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
> @@ -984,11 +987,17 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
>  		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
>  		buf_rel_source = le32_get_bits(tx_status->info0,
>  					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
> -		dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
> +		if (likely(buf_rel_source < HAL_WBM_REL_SRC_MODULE_MAX))
> +			dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
> +		else
> +			WARN_ON_ONCE(1);
>  
>  		rel_status = le32_get_bits(tx_status->info0,
>  					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
> -		dp->device_stats.tqm_rel_reason[rel_status]++;
> +		if (likely(rel_status < MAX_TQM_RELEASE_REASON))
> +			dp->device_stats.tqm_rel_reason[rel_status]++;
> +		else
> +			WARN_ON_ONCE(1);
>  
>  		/* Release descriptor as soon as extracting necessary info
>  		 * to reduce contention
> base-commit: 691e5e43b2aa
> --
> 2.34.1



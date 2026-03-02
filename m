Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CCCD58E43
	for <ath12k@archiver.kernel.org>; Mon,  2 Mar 2026 01:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kL/TuXcE9gf7aYW7lJRqr95c37rKLHGoDKsfTHS5Quo=; b=Z5//SJQR4YsTfhKWF2KrwVKlwv
	SVodD4gE359272GeCIZweumeiIblxOZjwzk1bkDqtscVBHdzgwguJk1KctMdnJ8jDpKqSL3UXz3rY
	RqpyYbhPKeLTqXAx4B2x0yLFiTr8cJRlHgw9USPVYDZ0MuZMXgwPe4o+UCXYWc63YAjA5T/VdQvx/
	oree4rlmWU8REn2c0yhywZjGip1fH2SWrJcZMmQYGjZAWZ9yUEK06b6bRUY/E0IbIybv6AyTrUJ6q
	/m/ZuIXp5hc5Llqrcd9nXImyh8zSq35Z61Z0NElED2pgxT0WRMK7A8q8kGJ5j9/BSdB6f4Kjc0rLs
	1cqomcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vws7S-0000000C47S-1r96;
	Mon, 02 Mar 2026 01:30:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vws7Q-0000000C474-1aUJ
	for ath12k@lists.infradead.org;
	Mon, 02 Mar 2026 01:30:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621NK2j02342009
	for <ath12k@lists.infradead.org>; Mon, 2 Mar 2026 01:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kL/TuXcE9gf7aYW7lJRqr95c37rKLHGoDKsfTHS5Quo=; b=OD2TbpnoaXakn5WW
	yeZ3CkXuQNA9ZuZmamjgd7MioS3XzQV+LRacqVNQXc6YNOl/Qih4huLwHH8kcMN2
	8M9TK/cNNaZ0MzTJegTk5u/7XgP03TBoY2e8Xif1peVjsEzMBkLLwGwiD9plCaHZ
	CzyT52qcNjmoQEzPaT24hOZ8tAzaGNtqC6PyNc0JPpmjeb+FGtelwK0bYj4XguGS
	+9sUdy05TvleWH4LgPeT9RiIhrP4VJhPe1AYpx74bznYK6OflNd8+zeHhn0RMNX1
	WOCwsQHtMRsnOh0jk1LwWcO1+lyQkDqFLBfHuNiPHQz3/Ki9OsNDcDvmubmBemkj
	eKW89w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd3hvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 01:30:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso2913891a91.2
        for <ath12k@lists.infradead.org>; Sun, 01 Mar 2026 17:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772415041; x=1773019841; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kL/TuXcE9gf7aYW7lJRqr95c37rKLHGoDKsfTHS5Quo=;
        b=Ht6id5XnoliIewc3x3slFggh8GoxXu7fWLNoHOi0wFgIJKSMzqED4Px480rALAoYRl
         F0FksdVC3LvXZ/R94yT5UHW7XSQIGitZZJIeUgNpLXSugQ+XM5EWAu6B7SXFw3pz0luT
         M7adfVIVwnHJmmiIBu2u+4rznNL0uEd3a/v7LlZSC6EdsLcBb4HpPtoQy8m2cM57W45U
         LdrWsE5MUF5+jtJ+dIHA+qsGX4ElnIvy6hOW08qhXi7ut5KaMp4qmUy4Ahe59x+L6iVp
         qROG0MABuDcwlM61cyyF2ba8/hvAKOQT27TVVzmVBoZsuNITkFMl0LXN9cgQcLSHOO26
         9qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772415041; x=1773019841;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kL/TuXcE9gf7aYW7lJRqr95c37rKLHGoDKsfTHS5Quo=;
        b=IQha8Ok1ZnkgkdeEyfCrCnNreapBIcyip2i4rWeKkp03H/UjVujK2K+dTULRbftJXn
         1vT+cyzQoATwUFAq8851uLzDXoquGQ7jc9uYAQ6cUu2Hx0G8HDanI6sHq4wArfb/OMJW
         HY0unvJ+19qoqN+/WAQajYMtrx56uaeeZ7oVCjjMmItFMJ/0V7elSDgwq23lZe15GJjg
         0FJMwEa/Uv2Kp3aQkutJ6bNypcIZdRRZ9aDpLussX7Hkoyr0M2RddPAkZDh6mzJ/FnAf
         apSgYhRmy6X+edKBXPhnc+nbGGk3Ls22ElXIKv9gNXHL0MIErJDdQHusXOtJ58whhWga
         oUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQUZr16ppeVr87X7i45Q5SkZb93KLFhEY0jyStuC14JUyPj+ra2IaifGdi/KXrwIVGhe6F0Mg=@lists.infradead.org
X-Gm-Message-State: AOJu0YymJmMPgDryXklwbXpmMCq6qRkNXL08h1raQy7keULDaGnEKZnF
	dZ5DzTLM3/UPI/IGBhd7CpCI/Jad03+TaVU0aE+aNcIx6ZMqQiRlIMsV3tHdDLDNEXRWIIRl/cV
	RZ+vxGWjZreaN627hB7KgwlsLgpTNe+QDGsG8QvvmC+GLl8t0VMg0mxv79wNQDCom
X-Gm-Gg: ATEYQzz4HYJqWa7ZmRKtP/7FUK1qcudJQVELGSTGHIQH4LTdbeq/k3pQuwyYSAYOEYz
	yqb74wXEb2WTLXowJYBQMbvw67pakSPhzkMwDwbFAJFhcgqNMdyGoETQpn5UWLBOEwQE8O0rv6P
	c6eoRbbmEoKNHYPe4ZRgA+kav7r9qW6l21C8mxhBzQH7yBYV9U8bKFj+GkQ4EuNBLN2rOWcoelI
	Lv0ibV7zNtX2q0l+819uReingwtGmfYU1SuHzBGDRKGn9wX/5PYUGSodE1BLbGulQuOKT1InkqU
	U9rcfc2DfRU0RbEoMhSoORG+ZWe7oy5FIz3XQDjN1Z6+vay8e6RUK2c9zT1/reuPFKdP9jlXbtd
	8PIU17BdsbTjp1VblbQ6Ig888W/VmEwqsgNq346viaLsoUZYY9HsrrmTJL/26BatvD3O3HEByDW
	dRhra+LZvdPYwOULShchA=
X-Received: by 2002:a17:90b:240e:b0:359:8d0d:5905 with SMTP id 98e67ed59e1d1-3598d0d5c70mr1239662a91.9.1772415041130;
        Sun, 01 Mar 2026 17:30:41 -0800 (PST)
X-Received: by 2002:a17:90b:240e:b0:359:8d0d:5905 with SMTP id 98e67ed59e1d1-3598d0d5c70mr1239632a91.9.1772415040565;
        Sun, 01 Mar 2026 17:30:40 -0800 (PST)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa65sm120951355ad.58.2026.03.01.17.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 17:30:40 -0800 (PST)
Message-ID: <c4cb8b56-717f-401d-8b98-5fec557a7abb@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 09:30:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: account TX stats only when ACK/BA
 status is present
To: Sarika Sharma <sarika.sharma@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260226051947.1379716-1-sarika.sharma@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260226051947.1379716-1-sarika.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zkABVtIwFx6R4ccY-EI56yggjfRILBys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAxMSBTYWx0ZWRfX7vhUHgucbSXN
 C9FLFwEn56sEHTKkMBHkqpFO4et/xes4f4SQR2yDM8Rg6XMo36WtVnBboEG5lTDYbKxk2rKxcVL
 bdDM4vLWlL2I1JBRKSAgerGPO5zNyQ/6u75igy5kwx9yMTT58t0cw8mF8nf5bTvRdr3PrmmYriV
 KvXvecIbqnMPq9+ncgNFbGfkjh9axeusSB+9mjTZreWRVJMLowhAobDkhTt/pYjDyWzrkgWhfGw
 bONKv1JZalmMX9J/wDSaSv54EWGqpQFew0/0naJNwyciEHJHwzI6lmqWQOjRVYeRZLVq6Sg27GP
 UZb1nZsgKijQzAHUwi1HiVFtxWHLySg0VdoyzDLVKdhGMAYjPhuT4M59EytJYIs3rgKWqQTwtzL
 jA3I4XQhNoz8/UZ6wOsLTErhPvuDDQ7DYrl/pfotTtNYJ4GClb7p6OHE1aWqzrYCzAV0KlrCcX5
 B7z80YR5/yQwQtOWSew==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a4e842 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CSDw-C9IAAAA:8 a=VLjYsMtYoAVcrLbv3zkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=wzwtrm5WU4lM03trS8pa:22
X-Proofpoint-GUID: zkABVtIwFx6R4ccY-EI56yggjfRILBys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_173044_582460_BABEC230 
X-CRM114-Status: GOOD (  19.95  )
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



On 2/26/2026 1:19 PM, Sarika Sharma wrote:
> The fields tx_retry_failed, tx_retry_count, and tx_duration are
> currently updated outside the HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS
> flag check. In certain scenarios, firmware delivers multiple PPDU
> statistics for the same PPDU, first without BA/ACK information, and
> later with BA/ACK status once it becomes available. As the same PPDU
> is processed again, these counters are updated a second time,
> resulting in duplicate TX statistics.
> 
> To address this, move the accounting of tx_retry_failed and
> tx_retry_count under the ACK/BA status flag check, and similarly gate
> tx_duration on the same path. This ensures that each PPDU contributes
> to these counters exactly once, avoids double counting, and provides
> consistent reporting in userspace tools such as station dump.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Fixes: a0b963e1da5b ("wifi: ath12k: fetch tx_retry and tx_failed from htt_ppdu_stats_user_cmpltn_common_tlv")
> Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_htt.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
> index cc71c5c5de5a..61c1c3b2350e 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_htt.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
> @@ -205,16 +205,9 @@ ath12k_update_per_peer_tx_stats(struct ath12k_pdev_dp *dp_pdev,
>  	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
>  		return;
>  
> -	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON)) {
> +	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
>  		is_ampdu =
>  			HTT_USR_CMPLTN_IS_AMPDU(usr_stats->cmpltn_cmn.flags);
> -		tx_retry_failed =
> -			__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_tried) -
> -			__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_success);
> -		tx_retry_count =
> -			HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
> -			HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
> -	}
>  
>  	if (usr_stats->tlv_flags &
>  	    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS)) {
> @@ -223,10 +216,19 @@ ath12k_update_per_peer_tx_stats(struct ath12k_pdev_dp *dp_pdev,
>  					  HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M);
>  		tid = le32_get_bits(usr_stats->ack_ba.info,
>  				    HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM);
> -	}
>  
> -	if (common->fes_duration_us)
> -		tx_duration = le32_to_cpu(common->fes_duration_us);
> +		if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON)) {
> +			tx_retry_failed =
> +				__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_tried) -
> +				__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_success);
> +			tx_retry_count =
> +				HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
> +				HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
> +		}
> +
> +		if (common->fes_duration_us)
> +			tx_duration = le32_to_cpu(common->fes_duration_us);
> +	}
>  
>  	user_rate = &usr_stats->rate;
>  	flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);
> 
> base-commit: 62f9b9b19939138c34ce0ac1e5d4969d617ecbb6

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



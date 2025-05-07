Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113C9C3ABBF
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 02:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VF6c+e+jpYznaLMZRfpvFuOUew+AQHUzbCeS8GkSXxE=; b=2lM2iBobRkTHS5pZDbM+q5T7SR
	lTdTjbdRoFgrlVkE8Iwec8ea028/7t8zfvxyRj5HCRlKd2u17GcVsEZVCWq69uDNbisbcN3K0yYt8
	FDC8mcAak16UUkHCCLCOtvxQeJCxRd9NIkjyfkgfXLmaJbSmYm1ex6vZnfKZLyh9a5UAlNwdmq/EH
	GuTY/NbY5ZDqbARyIDkxxNvvjPhE6uzbqP6akz4TkJ5M8JDaykNYAUMW+od9x2ckq5xgEfdUAaP7Q
	wNNzinSnID8BUgOlp9bsHz4x8vuGWmANLMXjvPuzz1Ml9stOA6LONGv07Jgn1W4dc7kQjLziflN+a
	Hc7i7HrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUd8-0000000Dz03-2E2B;
	Wed, 07 May 2025 02:35:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCSU0-0000000DmYn-21mg
	for ath12k@lists.infradead.org;
	Wed, 07 May 2025 00:17:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546HDW3T007903;
	Wed, 7 May 2025 00:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VF6c+e+jpYznaLMZRfpvFuOUew+AQHUzbCeS8GkSXxE=; b=OeYE+q2erNjJ/rha
	oYK/B5EbxEXLm7M4IVzmRSGMJodGqiBGzy7Hb7kJIqG7TzRzPspUMbLq4FA3pPYI
	699Fz3L5ZDkouVNpFX//MKIRws9ONnDi/T05YwEHbEW/wh0df0FOx7G9FWdhlH+h
	Zh17380ObSjPPn68QjodKpSleSbrEpeo1TFXBNrzd9vI8uhhKIJ+qYBN3q9qwHBk
	JeARYplHxKgkaB4OJ2Xt5kbLJ4x5in4yFbFg1stJ4j1GmMciBb/pgCoBfDxxEF0a
	nGjHqkiQ+3MFz5wtQmrwGLTadjMIPqRxnthlBQrEUGIu9YkL+fGAmo+EhiP1ExRA
	Z3ibbg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep9d61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 00:17:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5470Hhgg014977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 00:17:43 GMT
Received: from [10.231.217.95] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 17:17:40 -0700
Message-ID: <5833f7c0-3d90-4dd9-b1bf-cfbe1bf1fd0e@quicinc.com>
Date: Wed, 7 May 2025 08:17:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix ring-buffer corruption
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: Steev Klimaszewski <steev@kali.org>,
        Clayton Craft
	<clayton@craftyguy.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250321095219.19369-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <20250321095219.19369-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681aa6a9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=5G4roIV5toTAwhoGYC8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cVLjX02tFFxD1raM0xfBu-cTB4braRRV
X-Proofpoint-GUID: cVLjX02tFFxD1raM0xfBu-cTB4braRRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAwMSBTYWx0ZWRfX0u2Ck8pe37Lw
 ylFHnu+0C2SkqxoU1H+2b3U3Sbkeamwo/Owjobsda4f2tJIwzHLscHY7ZibVTS1bXFmEWJczex3
 X77eKe8yxGJytjVFo6ztFzZ9Td6arlHeaKj8tLBUrqrAm0Rn8j1Nuta8SMLMQT3cKZcG/AgC1uF
 JII2J/vZ5+dJ0/zSgnjAg7hr7hHJ32Ay/o0c7OMhJveEwQjxxYNmifqcoFYI4duxBBm7sp3LG9m
 c5c4Xt/ks/u0D0R9D6jS71N5fVY4Cnxdu8QhPbGYpLvJ7a0kDEC7K77Q7MxvQ4hNs4iJpWHXKzK
 GHyZQfEMfxkgA8GGlGF3IKL/tgYE1K4ZJ+kTKpy/z06iPg3X+W8FIbTDUyJfIJ8Wls6W2fiCdpp
 rWU2rso3dFS3CFei/8NKlvSVILwWG0afHo4BQWhogUZS0ANepcLgR0c/ymUJfzV8MduUzLaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_09,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_171756_642213_EF07DD82 
X-CRM114-Status: GOOD (  25.31  )
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



On 3/21/2025 5:52 PM, Johan Hovold wrote:
> Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> breaks and the log fills up with errors like:
> 
>      ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
>      ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> which based on a quick look at the ath11k driver seemed to indicate some
> kind of ring-buffer corruption.
> 
> Miaoqing Pan tracked it down to the host seeing the updated destination
> ring head pointer before the updated descriptor, and the error handling
> for that in turn leaves the ring buffer in an inconsistent state.
> 
> While this has not yet been observed with ath12k, the ring-buffer
> implementation is very similar to the ath11k one and it suffers from the
> same bugs.
> 
> Add the missing memory barrier to make sure that the descriptor is read
> after the head pointer to address the root cause of the corruption while
> fixing up the error handling in case there are ever any (ordering) bugs
> on the device side.
> 
> Note that the READ_ONCE() are only needed to avoid compiler mischief in
> case the ring-buffer helpers are ever inlined.
> 
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Cc: stable@vger.kernel.org	# 6.3
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218623
> Link: https://lore.kernel.org/20250310010217.3845141-3-quic_miaoqing@quicinc.com
> Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/net/wireless/ath/ath12k/ce.c  | 11 +++++------
>   drivers/net/wireless/ath/ath12k/hal.c |  4 ++--
>   2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
> index be0d669d31fc..740586fe49d1 100644
> --- a/drivers/net/wireless/ath/ath12k/ce.c
> +++ b/drivers/net/wireless/ath/ath12k/ce.c
> @@ -343,11 +343,10 @@ static int ath12k_ce_completed_recv_next(struct ath12k_ce_pipe *pipe,
>   		goto err;
>   	}
>   
> +	/* Make sure descriptor is read after the head pointer. */
> +	dma_rmb();
> +
>   	*nbytes = ath12k_hal_ce_dst_status_get_length(desc);
> -	if (*nbytes == 0) {
> -		ret = -EIO;
> -		goto err;
> -	}
>   
>   	*skb = pipe->dest_ring->skb[sw_index];
>   	pipe->dest_ring->skb[sw_index] = NULL;
> @@ -380,8 +379,8 @@ static void ath12k_ce_recv_process_cb(struct ath12k_ce_pipe *pipe)
>   		dma_unmap_single(ab->dev, ATH12K_SKB_RXCB(skb)->paddr,
>   				 max_nbytes, DMA_FROM_DEVICE);
>   
> -		if (unlikely(max_nbytes < nbytes)) {
> -			ath12k_warn(ab, "rxed more than expected (nbytes %d, max %d)",
> +		if (unlikely(max_nbytes < nbytes || nbytes == 0)) {
> +			ath12k_warn(ab, "unexpected rx length (nbytes %d, max %d)",
>   				    nbytes, max_nbytes);
>   			dev_kfree_skb_any(skb);
>   			continue;
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index cd59ff8e6c7b..91d5126ca149 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -1962,7 +1962,7 @@ u32 ath12k_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc
>   {
>   	u32 len;
>   
> -	len = le32_get_bits(desc->flags, HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
> +	len = le32_get_bits(READ_ONCE(desc->flags), HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
>   	desc->flags &= ~cpu_to_le32(HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
>   
>   	return len;
> @@ -2132,7 +2132,7 @@ void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
>   		srng->u.src_ring.cached_tp =
>   			*(volatile u32 *)srng->u.src_ring.tp_addr;
>   	else
> -		srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
> +		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
>   }
>   
>   /* Update cached ring head/tail pointers to HW. ath12k_hal_srng_access_begin()

Reviewed-by: Miaoqing Pan <quic_miaoqing@quicinc.com>



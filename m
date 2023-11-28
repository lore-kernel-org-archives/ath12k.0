Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9BCC4167B
	for <ath12k@archiver.kernel.org>; Tue, 28 Nov 2023 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPDR3/GFVguaTqXeyd6TkB5KeWTAvbZZrEOrNW8O6lw=; b=lycjnqwGyLTc2T
	B3hchCynY7FLYyEU7pniWnfSJTG1klUWrZcYbQJ4tOlCYgjzD73bGVGXkAqLxoxf45Ky/o/M7RGQS
	m8iKV1fRI2f/hqiKzZd2wKCQVpJnKSnPMtOOHrhKRZZHfjrnVfblloJVQBtLDoODZzpJW9eVq8zUS
	5o8Vgc9I+ZJ9i7+TeUbJvXkYX+gEoorajYIssbmG+3adedN4+3f4u8uzM7O7DqdYaCeu7rg0ZQj4m
	2Z+13La9fSoOXXqmPeyHGzaT0WuubN2oAOPiEn59NR5vAV3OCjNTsbHtG+BvA1/7cJGAjUeNE722e
	iC+mIfFfYc79Nve1E2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80JJ-005j7u-3D
	for ath12k@archiver.kernel.org;
	Tue, 28 Nov 2023 15:47:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r80JG-005j7W-2o
	for ath12k@lists.infradead.org;
	Tue, 28 Nov 2023 15:47:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASBoPLt008184;
	Tue, 28 Nov 2023 15:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=a2JHhS2pwIzZgJSxms+DFFnjgcPM+4+z3hQTxLTWwOo=;
 b=RSmlJijOhRLvMpdySbsuheipXMJS1PC2CtA/lbCRhDR6scicv6q0Okiqx3nG0ipde0rw
 g73qy5e2CpMcJmCUHYHbY3HN9OUxmGz9mOo7AVteStjoLLsGp0qiFDcc8Jcp7tdouoXh
 QG1ZcJlnGxsk6/BoJ2y/efO5KZu4gq3i4VreCFgXO6XjUEbvAP2AW5hgezBDJc/1jDm+
 eYPmmxzqAWb+wdRNCKDJSVRi5fY0auA5vwD9qNsBK0mFCEg5Zpk8xCMDUYH2sBXb7ZHv
 X87hjyCc2mvgw/9+6FT+AejRTX3bzf/IVPZ+LT7Az1wbO7p9fGtH6ZvOVkGEyasN0yDs /Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un1atjqv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:47:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ASFlaeE008615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:47:36 GMT
Received: from [10.110.63.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 07:47:35 -0800
Message-ID: <803affe3-c332-457a-b0ca-92450664cb6e@quicinc.com>
Date: Tue, 28 Nov 2023 07:47:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: add support for BA1024
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231128025440.46988-1-quic_bqiang@quicinc.com>
 <20231128025440.46988-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231128025440.46988-3-quic_bqiang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wgkRBi6frFSJbHd5X6e0VDKnurSnIhTR
X-Proofpoint-ORIG-GUID: wgkRBi6frFSJbHd5X6e0VDKnurSnIhTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_17,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_074739_047782_08FBF37F 
X-CRM114-Status: GOOD (  26.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/27/2023 6:54 PM, Baochen Qiang wrote:
> Currently the maximum block ACK window size supported is 256.
> This results in that, when connected to an AP which supports
> larger BA sizes like BA512 or BA1024, only BA256 is
> established, leading to a lower peak throughput.
> 
> So add support for BA1024, this is doen by allocating a larger

nit: s/doen/done/

> REO queue and advertising IEEE80211_MAX_AMPDU_BUF_EHT support
> to MAC80211.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.h       |  2 +-
>  drivers/net/wireless/ath/ath12k/hal_desc.h | 28 ++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/hal_rx.c   | 11 ++++++---
>  drivers/net/wireless/ath/ath12k/mac.c      |  2 +-
>  4 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index 61f765432516..50db1403ebce 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -145,7 +145,7 @@ struct ath12k_pdev_dp {
>  
>  #define DP_RX_HASH_ENABLE	1 /* Enable hash based Rx steering */
>  
> -#define DP_BA_WIN_SZ_MAX	256
> +#define DP_BA_WIN_SZ_MAX	1024
>  
>  #define DP_TCL_NUM_RING_MAX	4
>  
> diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
> index ec204939e50c..f12977aa6afe 100644
> --- a/drivers/net/wireless/ath/ath12k/hal_desc.h
> +++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
> @@ -2517,6 +2517,34 @@ struct hal_reo_update_rx_queue {
>  	__le32 pn[4];
>  } __packed;
>  
> +struct hal_rx_reo_queue_1k {
> +	struct hal_desc_header desc_hdr;
> +	__le32 rx_bitmap_319_288;

are these individual bitmap members ever directly referenced? seems it
would make more sense to have simply:
	__le32 rx_bitmap_1023_288[23]

this would align with struct hal_rx_reo_queue which defines:
	__le32 rx_bitmap[9]

> +	__le32 rx_bitmap_351_320;
> +	__le32 rx_bitmap_383_352;
> +	__le32 rx_bitmap_415_384;
> +	__le32 rx_bitmap_447_416;
> +	__le32 rx_bitmap_479_448;
> +	__le32 rx_bitmap_511_480;
> +	__le32 rx_bitmap_543_512;
> +	__le32 rx_bitmap_575_544;
> +	__le32 rx_bitmap_607_576;
> +	__le32 rx_bitmap_639_608;
> +	__le32 rx_bitmap_671_640;
> +	__le32 rx_bitmap_703_672;
> +	__le32 rx_bitmap_735_704;
> +	__le32 rx_bitmap_767_736;
> +	__le32 rx_bitmap_799_768;
> +	__le32 rx_bitmap_831_800;
> +	__le32 rx_bitmap_863_832;
> +	__le32 rx_bitmap_895_864;
> +	__le32 rx_bitmap_927_896;
> +	__le32 rx_bitmap_959_928;
> +	__le32 rx_bitmap_991_960;
> +	__le32 rx_bitmap_1023_992;
> +	__le32 reserved[8];
> +} __packed;
> +
>  #define HAL_REO_UNBLOCK_CACHE_INFO0_UNBLK_CACHE		BIT(0)
>  #define HAL_REO_UNBLOCK_CACHE_INFO0_RESOURCE_IDX	GENMASK(2, 1)
>  
> diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
> index f6afbd8196bf..6fa874a93d3a 100644
> --- a/drivers/net/wireless/ath/ath12k/hal_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
> @@ -688,23 +688,28 @@ void ath12k_hal_reo_update_rx_reo_queue_status(struct ath12k_base *ab,
>  
>  u32 ath12k_hal_reo_qdesc_size(u32 ba_window_size, u8 tid)
>  {
> -	u32 num_ext_desc;
> +	u32 num_ext_desc, num_1k_desc = 0;
>  
>  	if (ba_window_size <= 1) {
>  		if (tid != HAL_DESC_REO_NON_QOS_TID)
>  			num_ext_desc = 1;
>  		else
>  			num_ext_desc = 0;
> +
>  	} else if (ba_window_size <= 105) {
>  		num_ext_desc = 1;
>  	} else if (ba_window_size <= 210) {
>  		num_ext_desc = 2;
> -	} else {
> +	} else if (ba_window_size <= 256) {
>  		num_ext_desc = 3;
> +	} else {
> +		num_ext_desc = 10;
> +		num_1k_desc = 1;
>  	}
>  
>  	return sizeof(struct hal_rx_reo_queue) +
> -		(num_ext_desc * sizeof(struct hal_rx_reo_queue_ext));
> +		(num_ext_desc * sizeof(struct hal_rx_reo_queue_ext)) +
> +		(num_1k_desc * sizeof(struct hal_rx_reo_queue_1k));
>  }
>  
>  void ath12k_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index fc0d14ea328e..3cfb17f71aa6 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -7474,7 +7474,7 @@ static int __ath12k_mac_register(struct ath12k *ar)
>  	ar->hw->queues = ATH12K_HW_MAX_QUEUES;
>  	ar->hw->wiphy->tx_queue_len = ATH12K_QUEUE_LEN;
>  	ar->hw->offchannel_tx_hw_queue = ATH12K_HW_MAX_QUEUES - 1;
> -	ar->hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
> +	ar->hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_EHT;
>  
>  	ar->hw->vif_data_size = sizeof(struct ath12k_vif);
>  	ar->hw->sta_data_size = sizeof(struct ath12k_sta);

Are any related changes needed to struct hal_reo_get_queue_stats_status?
Or to ath12k_hal_reo_status_queue_stats()?
There I see the 256-bit bitmap being dumped -- do you need to dump the
1024-bit bitmap? Is there a mechanism which allows that?



-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

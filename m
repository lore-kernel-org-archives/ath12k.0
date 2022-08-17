Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895FCC25B0E
	for <ath12k@archiver.kernel.org>; Wed, 17 Aug 2022 00:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0XX6XJY2UWlQnPf3MYLZuPtfHSz2+5nZZrRhQcYhd4=; b=Hu2oiKlZnfe/YH
	LICOERmqFyGuUQaNYB6e3W8eSt1qAoQcMJxIed084G8nKF3L/4qbuiT97O0DdWl0JTAX7Xv9CLmE4
	fL9c/2HpvrAe92SmSouOtoPfCn1i630m47rZ+mU4sGcMWGrRbp1ndw9TSQQVWdLCe0G5eM8SApSyn
	0bPAWKS35IRAdbLaMf1Wbdx0v0kd9QKDmZz7dYZYUd+og6QH7vJM77+QeWKyQOK9oD9oi/x4cbJXS
	H0VZc8Ah/rJTQT8ayYkIuyOmlAkWxvFYZdE8VqEQinvRiKc9MxtTUqX5EsVkgdVU0cprr9sNR00Ru
	HXaDx53j8e53hAbWINVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO73d-008EQB-KH
	for ath12k@archiver.kernel.org; Wed, 17 Aug 2022 00:37:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO73a-008EOw-4A
	for ath12k@lists.infradead.org; Wed, 17 Aug 2022 00:37:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GNSaux020235;
	Wed, 17 Aug 2022 00:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=y81cjkN+/y7I79zdn2eXvOkWrpupcI4sxkAdlBDlyo0=;
 b=GSnaVEmTj2dTey2R3RAy5CjxC4mU8REYOdYMx0I6Z5sg8q9ZXIkj8WDryv1ucJDsbEzc
 sdjsz4LbYmcvEVXCZYVlVeMaOXR9wZBdumAcmuNMZHEBBhfQQU0AAMlyDoNz69wsOtvT
 BjaDnsIRT5bgfPNpJxstu1vMYxXd9Z1UCI5igRUj/S6+9Of1bkp1WVhr0k7/CEwKfeks
 1gsrhaZ/lYw95630NjJsK1/fjggb3E0gB/eWXpLPF7fWAszW521MdTkgKBQS7igmd8bl
 02e4aDwPuIclDvtrzTMGJK+cYkxCMfUY1m2Xo48K4gXULx9Ldxb7WrRjcSxip0dBsc9R EQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j01w0vedk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 00:37:05 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.47.97.222])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27H0b4iE019027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 00:37:04 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 17:37:04 -0700
Received: from [10.110.78.115] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 16 Aug
 2022 17:37:03 -0700
Message-ID: <576a0720-fe45-36bd-abd1-b772dbe380b0@quicinc.com>
Date: Tue, 16 Aug 2022 17:37:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 15/50] wifi: ath12k: add dp_rx.c
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-16-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-16-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oPtYrkNBob7cO_CVA93XmtJIe-UPdR2e
X-Proofpoint-GUID: oPtYrkNBob7cO_CVA93XmtJIe-UPdR2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=863 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_173714_364141_27837D23 
X-CRM114-Status: GOOD (  33.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/12/2022 9:09 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp_rx.c | 4308 +++++++++++++++++++++++++++++++
>   1 file changed, 4308 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c

snip

> +static u16 ath12k_dp_rx_h_frag_no(struct ath12k_base *ab,
> +				  struct sk_buff *skb)
> +{
> +	struct ieee80211_hdr *hdr;
> +
> +	hdr = (struct ieee80211_hdr *)(skb->data + ab->hw_params->hal_desc_sz);
> +	return le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;

should there be an ieee80211.h function for this? we already have:
ieee80211_is_first_frag()
ieee80211_is_frag()

> +}

snip

> +static int ath12k_dp_purge_mon_ring(struct ath12k_base *ab)
> +{
> +	int i, reaped = 0;
> +	unsigned long timeout = jiffies + msecs_to_jiffies(DP_MON_PURGE_TIMEOUT_MS);
> +
> +	do {
> +		for (i = 0; i < ab->hw_params->num_rxmda_per_pdev; i++)
> +			reaped += ath12k_dp_mon_process_ring(ab, i, NULL,
> +							     DP_MON_SERVICE_BUDGET,
> +							     ATH12K_DP_RX_MONITOR_MODE);
> +
> +		/* nothing more to reap */
> +		if (reaped < DP_MON_SERVICE_BUDGET)
> +			return 0;
> +
> +	} while (time_before(jiffies, timeout));

i'm very confused by this loop.
1) 'reaped' is only initialized at the begining of the function.
2) inside the loop the first time we call ath12k_dp_mon_process_ring() 
'reaped' will be the # of packets reaped in that first iteration.
3) if this is < DP_MON_SERVICE_BUDGET then we will exit the function.
4) if this is >= DP_MON_SERVICE_BUDGET then we will loop again. in all 
of the subsequent iterations 'reaped' will be increased by the number of 
packets reaped (which could be 0!!!), and that ongoing sum will always 
be >= DP_MON_SERVICE_BUDGET (at least until we wrap the counter!!) and 
hence even if we don't reap any packets in the subsequent calls we will 
continue to loop until we exceed the timeout.

So it seems that 'reaped' should be initialized to 0 inside the do loop.

In addition it seems strange to have a budget but then not defer 
additional processing, i.e. yield(), if you use up the budget.

> +
> +	ath12k_warn(ab, "dp mon ring purge timeout");
> +
> +	return -ETIMEDOUT;
> +}
> +
> +/* Returns number of Rx buffers replenished */
> +int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab, int mac_id,
> +				struct dp_rxdma_ring *rx_ring,
> +				int req_entries,
> +				enum hal_rx_buf_return_buf_manager mgr,
> +				bool hw_cc)
> +{
> +	struct ath12k_buffer_addr *desc;
> +	struct hal_srng *srng;
> +	struct sk_buff *skb;
> +	int num_free;
> +	int num_remain;
> +	int buf_id;
> +	u32 cookie;
> +	dma_addr_t paddr;
> +	struct ath12k_dp *dp = &ab->dp;
> +	struct ath12k_rx_desc_info *rx_desc;
> +
> +	req_entries = min(req_entries, rx_ring->bufs_max);
> +
> +	srng = &ab->hal.srng_list[rx_ring->refill_buf_ring.ring_id];
> +
> +	spin_lock_bh(&srng->lock);
> +
> +	ath12k_hal_srng_access_begin(ab, srng);
> +
> +	num_free = ath12k_hal_srng_src_num_free(ab, srng, true);
> +	if (!req_entries && (num_free > (rx_ring->bufs_max * 3) / 4))
> +		req_entries = num_free;
> +
> +	req_entries = min(num_free, req_entries);
> +	num_remain = req_entries;
> +
> +	while (num_remain > 0) {
> +		skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
> +				    DP_RX_BUFFER_ALIGN_SIZE);
> +		if (!skb)
> +			break;
> +
> +		if (!IS_ALIGNED((unsigned long)skb->data,
> +				DP_RX_BUFFER_ALIGN_SIZE)) {
> +			skb_pull(skb,
> +				 PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
> +				 skb->data);
> +		}
> +
> +		paddr = dma_map_single(ab->dev, skb->data,
> +				       skb->len + skb_tailroom(skb),
> +				       DMA_FROM_DEVICE);
> +		if (dma_mapping_error(ab->dev, paddr))
> +			goto fail_free_skb;
> +
> +		if (hw_cc) {

hw_cc is a very cryptic name. is there a better name for this?
presumably this has something to do with hardware giving us unique 
cookies so we don't have idr overhead?

> +			spin_lock_bh(&dp->rx_desc_lock);
> +
> +			/* Get desc from free list and store in used list
> +			 * for cleanup purposes
> +			 *
> +			 * TODO: pass the removed descs rather than
> +			 * add/read to optimize
> +			 */
> +			rx_desc = list_first_entry_or_null(&dp->rx_desc_free_list,
> +							   struct ath12k_rx_desc_info,
> +							   list);
> +			if (!rx_desc) {
> +				spin_unlock_bh(&dp->rx_desc_lock);
> +				goto fail_dma_unmap;
> +			}
> +
> +			rx_desc->skb = skb;
> +			cookie = rx_desc->cookie;
> +			list_del(&rx_desc->list);
> +			list_add_tail(&rx_desc->list, &dp->rx_desc_used_list);
> +
> +			spin_unlock_bh(&dp->rx_desc_lock);
> +		} else {
> +			spin_lock_bh(&rx_ring->idr_lock);
> +			buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 0,
> +					   rx_ring->bufs_max * 3, GFP_ATOMIC);
> +			spin_unlock_bh(&rx_ring->idr_lock);
> +			if (buf_id < 0)
> +				goto fail_idr_remove;
> +			cookie = u32_encode_bits(mac_id,
> +						 DP_RXDMA_BUF_COOKIE_PDEV_ID) |
> +				 u32_encode_bits(buf_id,
> +						 DP_RXDMA_BUF_COOKIE_BUF_ID);
> +		}
> +
> +		desc = ath12k_hal_srng_src_get_next_entry(ab, srng);
> +		if (!desc)
> +			goto fail_list_desc_add;
> +
> +		ATH12K_SKB_RXCB(skb)->paddr = paddr;
> +
> +		num_remain--;
> +
> +		ath12k_hal_rx_buf_addr_info_set(desc, paddr, cookie, mgr);
> +	}
> +
> +	ath12k_hal_srng_access_end(ab, srng);
> +
> +	spin_unlock_bh(&srng->lock);
> +
> +	return req_entries - num_remain;
> +
> +fail_list_desc_add:
> +	if (hw_cc) {
> +		spin_lock_bh(&dp->rx_desc_lock);
> +		list_del(&rx_desc->list);
> +		list_add_tail(&rx_desc->list, &dp->rx_desc_free_list);
> +		rx_desc->skb = NULL;
> +		spin_unlock_bh(&dp->rx_desc_lock);
> +	}
> +fail_idr_remove:

should the idr_remove logic be if (!hw_cc) since it will only be added 
above in the if (hw_cc) else path?

> +	spin_lock_bh(&rx_ring->idr_lock);
> +	idr_remove(&rx_ring->bufs_idr, buf_id);
> +	spin_unlock_bh(&rx_ring->idr_lock);
> +fail_dma_unmap:
> +	dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
> +			 DMA_FROM_DEVICE);
> +fail_free_skb:
> +	dev_kfree_skb_any(skb);
> +
> +	ath12k_hal_srng_access_end(ab, srng);
> +
> +	spin_unlock_bh(&srng->lock);
> +
> +	return req_entries - num_remain;
> +}

I've only reviewed up to this point, but want to checkpoint my review 
for the workday.

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

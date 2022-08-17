Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C40C28B2B
	for <ath12k@archiver.kernel.org>; Thu, 18 Aug 2022 04:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e44oeQ4OFeeiHJeZAdzg1mDOgYpjjR49coX9dEiCShs=; b=FXtrCh+6TXBVdy
	bDrYHU5wqbuHjs0jdXvL/icPCOUJnGzv6FM2ocG+Nv1qK1um0Hnp0gdp+nJXcAy+Oy8KAkhE0gSKe
	APY/972TtvN7MYL0fu4S6HHKKDze1hn4JK7k2akRudN+g2OpY70oFZsopUuMfLxwa1baoDwDtqfjC
	lNQnL4dTLOG5eeAHOqJN/4tcG2dkWncMf8vwMKZO0zaeG4Yg3Q30ZnIWI8flz3c0yo4WbdbtezVqf
	1vedCEYSt40WTjsGDf4iWynWjbi64H/qtuf+QQk/3KekZZ1mfvOjxdzJt2yZ989/SeOFnPsluVw/N
	G6aDkzhQE/NAuDB8r4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOX2k-00EENw-DQ
	for ath12k@archiver.kernel.org; Thu, 18 Aug 2022 04:22:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOX2h-00EEC4-Kc
	for ath12k@lists.infradead.org; Thu, 18 Aug 2022 04:22:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27I3c8H6014118;
	Thu, 18 Aug 2022 04:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=n5rANvhQziLuL4jRFXMDIVjHzI5kiW5rSHtTteykABM=;
 b=doApX9Uqsbi8ov++t6Kij22KdXUpg8kNWDeFnzqINAgXlj9cFAPReEeis9yKLAjWR+lE
 tXERqonCoBeycuTo6t/GE5XCY5+Z2gJhh4SxRSj+mfdqm5Ycu17CavchrRf5lNfACNcF
 gZ/1vElY1UFcUwWS1Jg1TbdVwkgxBXO5lj03b0zfPUKXwB7eu2++tSRNTO4AJ9y2/OvV
 7hIOUB+d6G3ActJLV0FQXSf4I3Di0jLVXuBI6CPhe9SBdZMnTR9jzFJpnBAoYTxgjlQl
 7LVaCZv7XSSzrLdv34k1UVgwvZQMI2SY5sueCCBxnDFEqEAR+sRErpn63+Plxi/E5HXD kA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j13v1ja69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 04:21:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27I4Gu0E012160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 04:16:57 GMT
Received: from [10.110.78.115] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 17 Aug
 2022 16:35:28 -0700
Message-ID: <de6d5e1a-0ff4-a303-ed25-508816a39a0d@quicinc.com>
Date: Wed, 17 Aug 2022 16:35:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 17/50] wifi: ath12k: add dp_tx.c
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-18-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-18-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hIY7nBrVZVhmCZ45YgXLENkT_ko-mIZ9
X-Proofpoint-ORIG-GUID: hIY7nBrVZVhmCZ45YgXLENkT_ko-mIZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_212203_873464_39741B90 
X-CRM114-Status: GOOD (  21.27  )
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
>   drivers/net/wireless/ath/ath12k/dp_tx.c | 1206 +++++++++++++++++++++++++++++++
>   1 file changed, 1206 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c

snip

> +static struct ath12k_tx_desc_info *ath12k_dp_tx_assign_buffer(struct ath12k_dp *dp,
> +							      u8 pool_id)
> +{
> +	struct ath12k_tx_desc_info *desc = NULL;

nit: initializer always overwritten

> +
> +	spin_lock_bh(&dp->tx_desc_lock[pool_id]);
> +	desc = list_first_entry_or_null(&dp->tx_desc_free_list[pool_id],
> +					struct ath12k_tx_desc_info,
> +					list);

snip

> +int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
> +		 struct sk_buff *skb)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	struct ath12k_dp *dp = &ab->dp;
> +	struct hal_tx_info ti = {0};
> +	struct ath12k_tx_desc_info *tx_desc = NULL;
> +	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
> +	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
> +	struct hal_tcl_data_cmd *hal_tcl_desc;
> +	struct hal_tx_msdu_ext_desc *msg;
> +	struct sk_buff *skb_ext_desc;
> +	struct hal_srng *tcl_ring;
> +	struct ieee80211_hdr *hdr = (void *)skb->data;
> +	struct dp_tx_ring *tx_ring;
> +	u8 pool_id;
> +	u8 hal_ring_id;
> +	int ret;
> +	u8 ring_selector = 0, ring_map = 0;

nit: ring_selector initializer always overwritten

> +	bool tcl_ring_retry;
> +	bool msdu_ext_desc = false;
> +
> +	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
> +		return -ESHUTDOWN;
> +
> +	if (!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
> +	    !ieee80211_is_data(hdr->frame_control))
> +		return -ENOTSUPP;
> +
> +	pool_id = skb_get_queue_mapping(skb) & (ATH12K_HW_MAX_QUEUES - 1);
> +
> +	/* Let the default ring selection be based on current processor
> +	 * number, where one of the 3 tcl rings are selected based on
> +	 * the smp_processor_id(). In case that ring
> +	 * is full/busy, we resort to other available rings.
> +	 * If all rings are full, we drop the packet.
> +	 * TODO: Add throttling logic when all rings are full
> +	 */
> +	ring_selector = ab->hw_params->hw_ops->get_ring_selector(skb);

snip

> +int ath12k_dp_tx_htt_monitor_mode_ring_config(struct ath12k *ar, bool reset)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	int ret = 0;

nit: initializer always overwritten

> +
> +	ret = ath12k_dp_tx_htt_tx_monitor_mode_ring_config(ar, reset);

snip

> +int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	struct ath12k_dp *dp = &ab->dp;
> +	struct htt_rx_ring_tlv_filter tlv_filter = {0};
> +	int ret = 0, ring_id = 0;

nit: both initializers always overwritten

> +
> +	ring_id = dp->rxdma_mon_buf_ring.refill_buf_ring.ring_id;
> +	tlv_filter.offset_valid = false;
> +
> +	if (!reset) {
> +		tlv_filter.rx_filter = HTT_RX_MON_FILTER_TLV_FLAGS_MON_BUF_RING;
> +		tlv_filter.pkt_filter_flags0 =
> +					HTT_RX_MON_FP_MGMT_FILTER_FLAGS0 |
> +					HTT_RX_MON_MO_MGMT_FILTER_FLAGS0;
> +		tlv_filter.pkt_filter_flags1 =
> +					HTT_RX_MON_FP_MGMT_FILTER_FLAGS1 |
> +					HTT_RX_MON_MO_MGMT_FILTER_FLAGS1;
> +		tlv_filter.pkt_filter_flags2 =
> +					HTT_RX_MON_FP_CTRL_FILTER_FLASG2 |
> +					HTT_RX_MON_MO_CTRL_FILTER_FLASG2;
> +		tlv_filter.pkt_filter_flags3 =
> +					HTT_RX_MON_FP_CTRL_FILTER_FLASG3 |
> +					HTT_RX_MON_MO_CTRL_FILTER_FLASG3 |
> +					HTT_RX_MON_FP_DATA_FILTER_FLASG3 |
> +					HTT_RX_MON_MO_DATA_FILTER_FLASG3;
> +	}
> +
> +	if (ab->hw_params->rxdma1_enable) {
> +		ret = ath12k_dp_tx_htt_rx_filter_setup(ar->ab, ring_id, 0,
> +						       HAL_RXDMA_MONITOR_BUF,
> +						       DP_RXDMA_REFILL_RING_SIZE,
> +						       &tlv_filter);
> +		if (ret) {
> +			ath12k_err(ab,
> +				   "failed to setup filter for monitor buf %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

snip

> +int ath12k_dp_tx_htt_tx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	struct ath12k_dp *dp = &ab->dp;
> +	struct htt_tx_ring_tlv_filter tlv_filter = {0};
> +	int ret = 0, ring_id = 0;

nit: ring_id initializer always overwritten

> +
> +	ring_id = dp->tx_mon_buf_ring.refill_buf_ring.ring_id;

snip

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

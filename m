Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AFDC3ABA8
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 04:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI9yfzh6gvLXjj/UXCrYFsAAL92KZZ6aqqe5+BxceRg=; b=ajUpFCodIhVjMvDHcJ5YA1dZUG
	aER1hDSbr0kE0QuVpGUPjwUCrnic1ICCNu1wTKewxyi8JZkEJC9A2+rvol9yx5B8WjqK9r/GC3uVc
	shuF2rkVPrCcglA18I72X02xONbFc0K1h5/YHayHq0/cMiXm4IgkoAEKr/oeIiF3Qa0KUDaZ3OADd
	ZEq+Ek6H/KQbmrxplIN993t6bNGkECbFS5P5HyNRcvX0B/hnb9UadaIplGDKgEroCNl4VSemVrT4R
	Rf4AFj9A/Ftwqnj+CfdOd1laHQ5CR0aPoN2wh5SQAr/fFlXeeAbWOe57h/mEeSXTf8Pca4e/tuGRi
	+AvJo/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cno-00000008JvW-1rvj;
	Tue, 29 Apr 2025 04:42:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cmR-00000008JpC-1kHV
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 04:41:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNr8QH014387;
	Tue, 29 Apr 2025 04:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RI9yfzh6gvLXjj/UXCrYFsAAL92KZZ6aqqe5+BxceRg=; b=lIFpUnf4Q4v2rTir
	MtT0EhclssUZNoEBK/ubxJrF5NcI7rmoSjucU55gwCvThJnFxMTkmab98CWhUpby
	fGiSiKdQgezRzPPe+6luX6w55N9XH2DuK/QeIBTGZNK4npA4Yk6VJKWdcqsHNPil
	+L/5aWYFzdn78XArl17HwDTmSQ53qduWxLYdIyK8xbdPMnDc+vmqN7fvqGqyiKFi
	1Wy6eflTlhcoCopclrIow7XkXROJXqB0mAECo0WGE3xgpbWOuDSDkiZBJ41T29uS
	EkxL9lhy0sGFAwGnx+FKdSBjkQvLIVacRgm4gPBBLacpwd9O17O5VDuDW5LCMXCV
	aKzFog==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn259w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 04:41:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T4fESo003087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 04:41:14 GMT
Received: from [10.216.24.29] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 21:41:12 -0700
Message-ID: <931e066d-ebe6-4a94-9831-bb1634ae7601@quicinc.com>
Date: Tue, 29 Apr 2025 10:11:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/3] wifi: ath12k: Add device dp stats support
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vinith Kumar R
	<quic_vinithku@quicinc.com>
References: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <20250425012802.698914-3-nithyanantham.paramasivam@oss.qualcomm.com>
From: Mahendran P <quic_mahep@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250425012802.698914-3-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8zssqQQb6VIFLiD5ouiZE8y6-rqjJ2A8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzMyBTYWx0ZWRfX+0QF9U2o7yvq ywj+KLBgbuTn2j7vYbC4Zw5eQGCZzmLxRT8oPEYQMQzNb18ZL9gfXEOT7FJcm9bfE1WZ+HvGLji oMXCiEZFfMA72OYy5amXSQCYivhiA46ZuKhGJ5GwfkRbcNCnpQoH9L9AwoBtg9WBEuA/1YnHN9B
 MIQs+nshc78l0k98C31vlpJ64OF4gYi/balv+P5n8Kk0t9q5/u1eKnRK+PYGzuTeCWSYGf59+r1 3TPrh/DhBrDyXiXJOGtCOTM2A+cjO+q0z+wORwont0ZEFiobpVhwkkcRsdurNrGVVUj6QlZIhXW NgEi6hVdzTp8KUvSYFoXtOKnLGVPPxNuHLPeylHdNGK40U0TB8jJC2DekmxK0tGuxrCNgtmJglY
 QBmvZmsV0qWEXKXWk8lE7fMmkYthDjl0+Rt+3eZWuLP1OVqd+iWK57jbsiuEcNG1sh8v0XRS
X-Proofpoint-GUID: 8zssqQQb6VIFLiD5ouiZE8y6-rqjJ2A8
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6810586a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qXg5RoXZXzj2emjSrToA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_214115_468547_B304CEA2 
X-CRM114-Status: GOOD (  20.95  )
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

On 4/25/2025 6:58 AM, Nithyanantham Paramasivam wrote:
> From: Vinith Kumar R <quic_vinithku@quicinc.com>
> 
> Add support for data path related device specific stats. This
> information helps to debug connectivity and performance issues
> in AP, STA, and Mesh modes.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Vinith Kumar R <quic_vinithku@quicinc.com>
> Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h     |  7 +++++++
>  drivers/net/wireless/ath/ath12k/dp.h       |  3 +++
>  drivers/net/wireless/ath/ath12k/dp_rx.c    |  8 ++++++++
>  drivers/net/wireless/ath/ath12k/dp_tx.c    | 22 ++++++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/hal_desc.h |  5 +++++
>  5 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 00c58fc0cc4b..99ef000aad7e 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -891,6 +891,13 @@ struct ath12k_device_dp_stats {
>  	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
>  	u32 hal_reo_error[DP_REO_DST_RING_MAX];
>  	struct ath12k_device_dp_tx_err_stats tx_err;
> +	u32 reo_rx[DP_REO_DST_RING_MAX][ATH12K_MAX_DEVICES];
> +	u32 rx_wbm_rel_source[HAL_WBM_REL_SRC_MODULE_MAX][ATH12K_MAX_DEVICES];
> +	u32 tqm_rel_reason[MAX_TQM_RELEASE_REASON];
> +	u32 fw_tx_status[MAX_FW_TX_STATUS];
> +	u32 tx_wbm_rel_source[HAL_WBM_REL_SRC_MODULE_MAX];
> +	u32 tx_enqueued[DP_TCL_NUM_RING_MAX];
> +	u32 tx_completed[DP_TCL_NUM_RING_MAX];
>  };
>  
>  struct ath12k_reg_freq {
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index 706d766d8c81..c4ddf30aa79f 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -266,6 +266,9 @@ struct ath12k_pdev_dp {
>  /* Invalid TX Bank ID value */
>  #define DP_INVALID_BANK_ID -1
>  
> +#define MAX_TQM_RELEASE_REASON 15
> +#define MAX_FW_TX_STATUS 7
> +
>  struct ath12k_dp_tx_bank_profile {
>  	u8 is_configured;
>  	u32 num_users;
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index e81a117cbc06..313b11421a26 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -2835,6 +2835,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
>  				 DMA_FROM_DEVICE);
>  
>  		num_buffs_reaped[device_id]++;
> +		ab->device_stats.reo_rx[ring_id][ab->device_id]++;
>  
>  		push_reason = le32_get_bits(desc->info0,
>  					    HAL_REO_DEST_RING_INFO0_PUSH_REASON);
> @@ -3982,6 +3983,7 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
>  	int num_buffs_reaped[ATH12K_MAX_DEVICES] = {};
>  	int total_num_buffs_reaped = 0;
>  	struct ath12k_rx_desc_info *desc_info;
> +	struct ath12k_device_dp_stats *device_stats = &ab->device_stats;
>  	struct ath12k_hw_link *hw_links = ag->hw_links;
>  	struct ath12k_base *partner_ab;
>  	u8 hw_link_id, device_id;
> @@ -4155,6 +4157,12 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
>  			dev_kfree_skb_any(msdu);
>  			continue;
>  		}
> +
> +		if (rxcb->err_rel_src < HAL_WBM_REL_SRC_MODULE_MAX) {
> +			device_id = ar->ab->device_id;
> +			device_stats->rx_wbm_rel_source[rxcb->err_rel_src][device_id]++;
> +		}
> +
>  		ath12k_dp_rx_wbm_err(ar, napi, msdu, &msdu_list);
>  	}
>  	rcu_read_unlock();
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
> index 128fa0e3c229..5a2b9c3f5e4b 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -477,6 +477,8 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
>  		arvif->link_stats.tx_enqueued++;
>  	spin_unlock_bh(&arvif->link_stats_lock);
>  
> +	ab->device_stats.tx_enqueued[ti.ring_id]++;
> +
>  	ath12k_hal_tx_cmd_desc_setup(ab, hal_tcl_desc, &ti);
>  
>  	ath12k_hal_srng_access_end(ab, tcl_ring);
> @@ -557,6 +559,7 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
>  	info = IEEE80211_SKB_CB(msdu);
>  
>  	ar = skb_cb->ar;
> +	ab->device_stats.tx_completed[tx_ring->tcl_data_ring_id]++;
>  
>  	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
>  		wake_up(&ar->dp.tx_empty_waitq);
> @@ -614,6 +617,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab, void *desc,
>  
>  	wbm_status = le32_get_bits(status_desc->info0,
>  				   HTT_TX_WBM_COMP_INFO0_STATUS);
> +	ab->device_stats.fw_tx_status[wbm_status]++;
>  
>  	switch (wbm_status) {
>  	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
> @@ -760,7 +764,8 @@ static void ath12k_dp_tx_update_txcompl(struct ath12k *ar, struct hal_tx_status
>  
>  static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
>  				       struct ath12k_tx_desc_params *desc_params,
> -				       struct hal_tx_status *ts)
> +				       struct hal_tx_status *ts,
> +				       int ring)
>  {
>  	struct ath12k_base *ab = ar->ab;
>  	struct ath12k_hw *ah = ar->ah;
> @@ -777,6 +782,7 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
>  	}
>  
>  	skb_cb = ATH12K_SKB_CB(msdu);
> +	ab->device_stats.tx_completed[ring]++;
>  
>  	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
>  	if (skb_cb->paddr_ext_desc) {
> @@ -907,6 +913,8 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
>  	struct hal_wbm_release_ring *desc;
>  	u8 pdev_id;
>  	u64 desc_va;
> +	enum hal_wbm_rel_src_module buf_rel_source;
> +	enum hal_wbm_tqm_rel_reason rel_status;
>  
>  	spin_lock_bh(&status_ring->lock);
>  
> @@ -963,6 +971,15 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
>  		desc_params.skb = tx_desc->skb;
>  		desc_params.skb_ext_desc = tx_desc->skb_ext_desc;
>  
> +		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
> +		buf_rel_source = le32_get_bits(tx_status->info0,
> +					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
> +		ab->device_stats.tx_wbm_rel_source[buf_rel_source]++;
> +
> +		rel_status = le32_get_bits(tx_status->info0,
> +					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
> +		ab->device_stats.tqm_rel_reason[rel_status]++;
> +
>  		/* Release descriptor as soon as extracting necessary info
>  		 * to reduce contention
>  		 */
> @@ -979,7 +996,8 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
>  		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
>  			wake_up(&ar->dp.tx_empty_waitq);
>  
> -		ath12k_dp_tx_complete_msdu(ar, &desc_params, &ts);
> +		ath12k_dp_tx_complete_msdu(ar, &desc_params, &ts,
> +					   tx_ring->tcl_data_ring_id);
>  	}
>  }
>  
> diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
> index 49eededbfa9d..f31b4a37ee35 100644
> --- a/drivers/net/wireless/ath/ath12k/hal_desc.h
> +++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
> @@ -1008,6 +1008,10 @@ enum hal_reo_entr_rxdma_ecode {
>  	HAL_REO_ENTR_RING_RXDMA_ECODE_FLOW_TIMEOUT_ERR,
>  	HAL_REO_ENTR_RING_RXDMA_ECODE_FLUSH_REQUEST_ERR,
>  	HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_FRAG_ERR,
> +	HAL_REO_ENTR_RING_RXDMA_ECODE_MULTICAST_ECHO_ERR,
> +	HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_MISMATCH_ERR,
> +	HAL_REO_ENTR_RING_RXDMA_ECODE_UNAUTH_WDS_ERR,
> +	HAL_REO_ENTR_RING_RXDMA_ECODE_GRPCAST_AMSDU_WDS_ERR,
>  	HAL_REO_ENTR_RING_RXDMA_ECODE_MAX,
>  };
>  
> @@ -1809,6 +1813,7 @@ enum hal_wbm_rel_src_module {
>  	HAL_WBM_REL_SRC_MODULE_REO,
>  	HAL_WBM_REL_SRC_MODULE_FW,
>  	HAL_WBM_REL_SRC_MODULE_SW,
> +	HAL_WBM_REL_SRC_MODULE_MAX,
>  };
>  
>  enum hal_wbm_rel_desc_type {

Reviewed-by: Mahendran P <quic_mahep@quicinc.com>



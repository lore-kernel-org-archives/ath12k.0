Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B21C04FFE
	for <ath12k@archiver.kernel.org>; Tue, 14 May 2024 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT9xjKDbFudmxXVQCTT/Z3m5wd7z5t5okcQzrzk8Yhc=; b=hVR97cACCvLcfd4YoV8iCHn0L6
	Bdc3Jr5UgDdpkrFt4rIHlscs+1hq3LoEWYAYf3Pm7ltJkJqug2e2hZ5wiwRwKe3r7wRo5As2jG6Cq
	laOjfQXrGgN+TGyccd0eDEl2X36Yv3iI+UeXJc8PpBLyE2cLIh92NxZ7ucekHohU8/KA8fMbcVKm5
	UXULpOZmDyfmZx8ER6GOQlTnmd4nmn40clc3VPXqWYIxq82RvBPCqr+HinMQcSG8W6L5O8H2uo0h+
	6rQOahVDNST6wPxtYvlY9BI7KzWt3qflWaMUUetbcs/W/UxrO8odCUKIVxpyWEpWxb5+IBMkv9CU+
	Qk1TR4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6whU-0000000GnWa-1sCA
	for ath12k@archiver.kernel.org;
	Tue, 14 May 2024 18:16:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6vXp-0000000Gaw0-2WsP
	for ath12k@lists.infradead.org;
	Tue, 14 May 2024 17:02:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EH2C05013294;
	Tue, 14 May 2024 17:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=WT9xjKDbFudmxXVQCTT/Z3m5wd7z5t5okcQzrzk8Yhc=; b=lx
	kakiOEjEOKX9nAvpIAuGRNkfFXbO1tbqAGgpYjhcHxg6X/+uashQ1eux6RE+6vsL
	Fx8PdizihbMkjm4ez+DTLVWcidXj8ddWMG7cdvoviguZuWz9dEZoq2WO3i15LzbI
	+N+BdS+ZuNSfhSSGQAc7n6rpE56/ALM7nVB/9vsWp7SvR/meR0+aTZmWKhYT01FC
	z73IVinAgL04q5GOY7dqKq8z5FeWDBuZ4dnwDfVSAr8dChScOVqavuLugoJJMKK0
	YKQ0v7vvb7a0DZOUF6fSutlkJPAbiKyeE1bBX3KdSiPwPG2W2OrcLEnntFJcQd1u
	Gk78+Xn0++rUNJLF9e3A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1ymq716w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 17:02:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EH2AbO007974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 17:02:10 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 10:02:09 -0700
Message-ID: <27d7b0d8-5e1b-4df1-987a-159b559b85d8@quicinc.com>
Date: Tue, 14 May 2024 10:02:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: support average ack rssi in station dump
Content-Language: en-US
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sivashankari Madhavan
	<quic_sivamadh@quicinc.com>
References: <20240514124949.2197384-1-quic_ssreeela@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240514124949.2197384-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t1xuQZMNLysgXRKlff_VZdi0D46fBe21
X-Proofpoint-ORIG-GUID: t1xuQZMNLysgXRKlff_VZdi0D46fBe21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_10,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405140119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_100229_958269_E3C8D7DD 
X-CRM114-Status: GOOD (  20.06  )
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

On 5/14/2024 5:49 AM, Sowmiya Sree Elavalagan wrote:
> From: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
> 
> Currently, the ACK RSSI value is not shown in station dump. Enable WMI
> resource flag for ACK RSSI in WMI INIT command to add ACK RSSI value in
> management TX completion event from WMI. Update ACK RSSI value obtained
> in management and data frame completion path to ieee80211_tx_info. Also
> advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag during hardware
> register to mac80211 layer so that ACK RSSI is added to station dump
> message.
> 
> Example output :
> Station 00:03:7f:12:cc:cc (on wlo1)
>         inactive time:  600 ms
>         rx bytes:       288106
>         rx packets:     1446
>         tx bytes:       41818
>         tx packets:     342
>         tx retries:     64
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      602
>         rx drop misc:   51
>         signal:         0 dBm
>         beacon signal avg:      -44 dBm
>         tx duration:    0 us
>         rx bitrate:     1441.1 MBit/s 80MHz HE-MCS 9 HE-NSS 3 HE-GI 0 HE-DCM 0
>         rx duration:    0 us
>         last ack signal:-51 dBm
>         avg ack signal: -50 dBm
>         authorized:     yes
>         .......
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> Depends-On: wifi: ath12k: fix the issue that calculation of ack signal strength
>  https://patchwork.kernel.org/project/linux-wireless/patch/20240511030917.65811-1-quic_lingbok@quicinc.com/

Does your patch not need to consider whether or not
WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT is enabled?

> ---
>  drivers/net/wireless/ath/ath12k/dp_tx.c |  2 ++
>  drivers/net/wireless/ath/ath12k/mac.c   |  1 +
>  drivers/net/wireless/ath/ath12k/wmi.c   | 15 +++++++++++----
>  drivers/net/wireless/ath/ath12k/wmi.h   |  3 +++
>  4 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
> index 32496015cf9a..43bdb49d08e2 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -541,6 +541,8 @@ static void ath12k_dp_tx_status_parse(struct ath12k_base *ab,
>  
>  	ts->ppdu_id = le32_get_bits(desc->info1,
>  				    HAL_WBM_COMPL_TX_INFO1_TQM_STATUS_NUMBER);
> +	ts->ack_rssi = le32_get_bits(desc->info2,
> +				     HAL_WBM_COMPL_TX_INFO2_ACK_FRAME_RSSI);
>  	if (le32_to_cpu(desc->rate_stats.info0) & HAL_TX_RATE_STATS_INFO0_VALID)
>  		ts->rate_stats = le32_to_cpu(desc->rate_stats.info0);
>  	else
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 96dc5c2e096f..1f4739269544 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -8733,6 +8733,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  
>  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
>  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
> +	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
>  
>  	wiphy->cipher_suites = cipher_suites;
>  	wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 3004c7463be9..fe909d866539 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -3468,7 +3468,8 @@ ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cf
>  	wmi_cfg->max_bssid_rx_filters = cpu_to_le32(tg_cfg->max_bssid_rx_filters);
>  	wmi_cfg->use_pdev_id = cpu_to_le32(tg_cfg->use_pdev_id);
>  	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config |
> -				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64);
> +				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 |
> +				     WMI_RSRC_CFG_FLAG1_ACK_RSSI);
>  	wmi_cfg->peer_map_unmap_version = cpu_to_le32(tg_cfg->peer_map_unmap_version);
>  	wmi_cfg->sched_params = cpu_to_le32(tg_cfg->sched_params);
>  	wmi_cfg->twt_ap_pdev_count = cpu_to_le32(tg_cfg->twt_ap_pdev_count);
> @@ -5134,7 +5135,7 @@ static int ath12k_pull_mgmt_rx_params_tlv(struct ath12k_base *ab,
>  }
>  
>  static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
> -				    u32 status)
> +				    u32 status, u32 ack_rssi)
>  {
>  	struct sk_buff *msdu;
>  	struct ieee80211_tx_info *info;
> @@ -5158,8 +5159,11 @@ static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
>  	dma_unmap_single(ar->ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
>  
>  	info = IEEE80211_SKB_CB(msdu);
> -	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) && !status)
> +	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) && !status) {
>  		info->flags |= IEEE80211_TX_STAT_ACK;
> +		info->status.ack_signal = ack_rssi;
> +		info->status.flags |= IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
> +	}
>  
>  	ieee80211_tx_status_irqsafe(ath12k_ar_to_hw(ar), msdu);
>  
> @@ -5200,6 +5204,8 @@ static int ath12k_pull_mgmt_tx_compl_param_tlv(struct ath12k_base *ab,
>  	param->pdev_id = ev->pdev_id;
>  	param->desc_id = ev->desc_id;
>  	param->status = ev->status;
> +	param->ppdu_id = ev->ppdu_id;
> +	param->ack_rssi = ev->ack_rssi;
>  
>  	kfree(tb);
>  	return 0;
> @@ -6110,7 +6116,8 @@ static void ath12k_mgmt_tx_compl_event(struct ath12k_base *ab, struct sk_buff *s
>  	}
>  
>  	wmi_process_mgmt_tx_comp(ar, le32_to_cpu(tx_compl_param.desc_id),
> -				 le32_to_cpu(tx_compl_param.status));
> +				 le32_to_cpu(tx_compl_param.status),
> +				 le32_to_cpu(tx_compl_param.ack_rssi));
>  
>  	ath12k_dbg(ab, ATH12K_DBG_MGMT,
>  		   "mgmt tx compl ev pdev_id %d, desc_id %d, status %d",
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 496866673aea..7ebd52a7ebb8 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -2410,6 +2410,7 @@ struct wmi_init_cmd {
>  #define WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT 4
>  #define WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION		GENMASK(5, 4)
>  #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64	BIT(5)
> +#define WMI_RSRC_CFG_FLAG1_ACK_RSSI BIT(18)
>  
>  struct ath12k_wmi_resource_config_params {
>  	__le32 tlv_header;
> @@ -4180,6 +4181,8 @@ struct wmi_mgmt_tx_compl_event {
>  	__le32 desc_id;
>  	__le32 status;
>  	__le32 pdev_id;
> +	__le32 ppdu_id;
> +	__le32 ack_rssi;
>  } __packed;
>  
>  struct wmi_scan_event {



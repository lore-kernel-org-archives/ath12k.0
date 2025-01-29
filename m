Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BADC02192
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 06:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xR7iLwVZwXBkaruQ2HRoNLZmzSEbHs1BNLkHCEb5H5g=; b=izRzlIOVe63sWH56nV58mSwFLW
	vGvGGOjrIuUH0KWE3chroLVv7slTnm6jZOvjuJXXyd+A5VI1JkPR0c0BLv+A6tvdJMrbEGnpn5j9Q
	YdcNV8GSBkGBdjmY+3eJKJxWJsYrKMrkoq2W7u0m066/1wLRLSenod+R2RJhgaWZcsiC5+s578uIE
	aYqyD+geq0c1SO72oQhjF9Pi9wwll4TI+yzg9ZMJCOx2DzLWCBAUm/vBuIM2DulM6rK93/dPXXjvY
	9F4AADNsq+JPtAtAvnZBPVsKK+NJQLUrPJ+aC16gIvsRSNwJrnj7jL17fDs1CVD9q3P4JG1KAEhWR
	yQLqtXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td1Ho-00000006OYQ-2qCa
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 06:10:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td1Hm-00000006OY4-3aoU
	for ath12k@lists.infradead.org;
	Wed, 29 Jan 2025 06:10:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2gYLH002541;
	Wed, 29 Jan 2025 06:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xR7iLwVZwXBkaruQ2HRoNLZmzSEbHs1BNLkHCEb5H5g=; b=Hujfy9OoapxIy2wY
	kNOalY1PJHeIKlgIpRisXVPp4flmQ2bxDA9OR5SNJewlAFXmm3N7XyOCOTalfETk
	8TyHue87popG13PB36SsH/ifD+KoQcu5gJTCFmGOdZi6dl+0oVGV4RyzjvWppM5C
	w8qMPj9ZyrRLlAdWI96IBgTQH2z4lvY0I3rhcbRjil8SQqOTvHtoeBb88QOz5ebk
	i2yMW4tJlfP+bhgdWjoCK1Av6xdi6cpnGzmk3cNLNjZtgiNnZYeiknZrnDv/+o+O
	xiX4CNJWyEciwSwuSvXECasG45JZJjb8WunISrEhUrNFEmoXal5bcGiHdevWk3CH
	X6waHA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f97q0gt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 06:10:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T6AmS1007714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 06:10:48 GMT
Received: from [10.216.32.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 22:10:45 -0800
Message-ID: <79ae0e23-1547-52f0-b0c6-606a7883a0fb@quicinc.com>
Date: Wed, 29 Jan 2025 11:40:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 7/7] wifi: ath12k: add monitor interface support on
 QCN9274
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Nicolas Escande <nico.escande@gmail.com>
References: <20250127114030.43479-1-quic_periyasa@quicinc.com>
 <20250127114030.43479-8-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250127114030.43479-8-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mKLY3Dt_oA3LTtq4YUKF19gtuhOSgbjt
X-Proofpoint-ORIG-GUID: mKLY3Dt_oA3LTtq4YUKF19gtuhOSgbjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_221051_025665_43E567B3 
X-CRM114-Status: GOOD (  21.32  )
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



On 1/27/2025 5:10 PM, Karthikeyan Periyasamy wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Currently, the monitor interface is not supported. To support the monitor
> interface, configure the monitor vdev state identifier, configure the HTT
> filter setup, subscribe the mac80211 WANT_MONITOR_VIF feature and prevent
> monitor interface to transmit packet. Therefore, add these procedures to
> add monitor interface support and enable the monitor interface support on
> the QCN9274 platform through the hardware parameter.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Tested-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c  |  5 +++++
>   drivers/net/wireless/ath/ath12k/dp_tx.c |  8 +++++++-
>   drivers/net/wireless/ath/ath12k/hw.c    |  4 ++--
>   drivers/net/wireless/ath/ath12k/mac.c   | 22 +++++++++++++++++++++-
>   4 files changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 2dd0666959cd..ec2c2b23bc1c 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1272,6 +1272,11 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>   				     ath12k_mac_tx_mgmt_pending_free, ar);
>   			idr_destroy(&ar->txmgmt_idr);
>   			wake_up(&ar->txmgmt_empty_waitq);
> +
> +			ar->monitor_vdev_id = -1;
> +			ar->monitor_conf_enabled = false;
> +			ar->monitor_vdev_created = false;
> +			ar->monitor_started = false;
>   		}
>   	}
>   
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
> index aa8058dd2da6..63b048626128 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -1,12 +1,13 @@
>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include "core.h"
>   #include "dp_tx.h"
>   #include "debug.h"
> +#include "debugfs.h"
>   #include "hw.h"
>   #include "peer.h"
>   #include "mac.h"
> @@ -1409,6 +1410,11 @@ int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
>   					HTT_RX_MON_MO_CTRL_FILTER_FLASG3 |
>   					HTT_RX_MON_FP_DATA_FILTER_FLASG3 |
>   					HTT_RX_MON_MO_DATA_FILTER_FLASG3;
> +	} else {
> +		tlv_filter = ath12k_mac_mon_status_filter_default;
> +
> +		if (ath12k_debugfs_is_extd_rx_stats_enabled(ar))
> +			tlv_filter.rx_filter = ath12k_debugfs_rx_filter(ar);
>   	}
>   
>   	if (ab->hw_params->rxdma1_enable) {
> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
> index a106ebed7870..021a4b565e8b 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <linux/types.h>
> @@ -1049,7 +1049,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>   					BIT(NL80211_IFTYPE_AP) |
>   					BIT(NL80211_IFTYPE_MESH_POINT) |
>   					BIT(NL80211_IFTYPE_AP_VLAN),
> -		.supports_monitor = false,
> +		.supports_monitor = true,
>   
>   		.idle_ps = false,
>   		.download_calib = true,
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index a00dc02adb5d..59cb22a8e8d1 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1356,9 +1356,15 @@ static int ath12k_mac_monitor_start(struct ath12k *ar)
>   		return ret;
>   	}
>   
> +	ret = ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "fail to set monitor filter: %d\n", ret);
> +		return ret;
> +	}
> +
>   	ar->monitor_started = true;
>   	ar->num_started_vdevs++;
> -	ret = ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
> +
>   	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac monitor started ret %d\n", ret);
>   
>   	return ret;
> @@ -7269,6 +7275,11 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>   	u8 link_id;
>   	int ret;
>   
> +	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
> +		ieee80211_free_txskb(hw, skb);
> +		return;
> +	}
> +
>   	link_id = u32_get_bits(info->control.flags, IEEE80211_TX_CTRL_MLO_LINK);
>   	memset(skb_cb, 0, sizeof(*skb_cb));
>   	skb_cb->vif = vif;
> @@ -8130,6 +8141,9 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
>   	}
>   
>   err_vdev_del:
> +	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR)
> +		ar->monitor_vdev_id = -1;
> +
>   	ath12k_wmi_vdev_delete(ar, arvif->vdev_id);
>   	ar->num_created_vdevs--;
>   	arvif->is_created = false;
> @@ -11060,6 +11074,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   	ieee80211_hw_set(hw, QUEUE_CONTROL);
>   	ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
>   	ieee80211_hw_set(hw, REPORTS_LOW_ACK);
> +	ieee80211_hw_set(hw, WANT_MONITOR_VIF);
>   
>   	if ((ht_cap & WMI_HT_CAP_ENABLED) || is_6ghz) {
>   		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
> @@ -11257,6 +11272,11 @@ static void ath12k_mac_setup(struct ath12k *ar)
>   
>   	wiphy_work_init(&ar->wmi_mgmt_tx_work, ath12k_mgmt_over_wmi_tx_work);
>   	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
> +
> +	ar->monitor_vdev_id = -1;
> +	ar->monitor_conf_enabled = false;
> +	ar->monitor_vdev_created = false;
> +	ar->monitor_started = false;
>   }
>   
>   static int __ath12k_mac_mlo_setup(struct ath12k *ar)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


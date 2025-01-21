Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD670C02182
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/Tu5iheKIXCDUxloPMF6QaQq3tbg6UkOGG56tzgrEQ=; b=cAvb7BNhDFWGGwprQAwBdubkwa
	dr8aEgSDIrBTx1yH6FDlg7cwQ9i9Vgd1xjiWa8M5zYNY53VtY3+6+xIZOpBTyivL6v2QlcV2hU4+a
	dbXMey26DnmKo4Ee5ATC0kopYVkZPeXO6jqZt/sZzYGXoh/K6rf7aRHj6v61UeVTlvsuuUaYy3TDE
	5P5uf78uV4IK0krqjlAz8z51tIT1E3Dd6sjJlTcR0E1vPPpt1XEigsZzHTJomux3MHIbwydkKJ1yO
	Hsn39010twX0FEXJAGmjxQnkItYwndT5KvJltxc8GV+xsZitY2sAPCSs6y4xzhK13/w0iQame6oVm
	kekmBsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBUO-00000007Zd7-1ysW
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 10:28:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBU8-00000007ZZ1-022V
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 10:27:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8Yl2n027213;
	Tue, 21 Jan 2025 10:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/Tu5iheKIXCDUxloPMF6QaQq3tbg6UkOGG56tzgrEQ=; b=o0KXp6rAE0T/9dMX
	UyMEWQebcjqL1/iGGZ8DE8Uk15CTMAK4Pyd+LPce6h9OttZXKOMU185m4SfCJ7Hf
	GS/YJ1pb/TvImtBNAj21zz34y3KjgKVvg0aSEuCtR71EF3VYy9RIm5pohjT8aPQu
	VTxV/8vKATxUe5oSOWVekyY8BjYGeYQ1ReklPTIm+jWUxmZcpl8znYcIVAi46b+w
	Hhd8rkXf/5+Np5RUP41vFRm5N7Fv3j4vpt/5RP9eEoX4WqFrl0waHCyp4N1lu0nR
	1+x/4Sg58/UgU81GhCWQmA+nNkbaYxKbrAZVFo0uQbVO8SuQszhEoY47+5p6H6Sp
	652vpw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a6vxrp3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 10:27:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LARmdw026745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 10:27:48 GMT
Received: from [10.216.5.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 02:27:46 -0800
Message-ID: <aa86ba11-9a03-3473-cd7a-60034ec325f2@quicinc.com>
Date: Tue, 21 Jan 2025 15:57:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] wifi: ath12k: add support of station average signal
 strength
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250121093834.25132-1-nico.escande@gmail.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250121093834.25132-1-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UKHWRmdqvTLM6-P_1Lmo5TSoTC2GU8s0
X-Proofpoint-ORIG-GUID: UKHWRmdqvTLM6-P_1Lmo5TSoTC2GU8s0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_022752_068931_4CCD0AEB 
X-CRM114-Status: GOOD (  18.39  )
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



On 1/21/2025 3:08 PM, Nicolas Escande wrote:
> This adds support for reporting to the kernel the average rssi. This is
> done the same way as it was done in ath11k. A simple ewma (with the same
> parameters) is updated with each rssi update.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
> v2:
>    - removed spurious exta new line at the beggining of core.h
> 
> v1: https://lore.kernel.org/ath12k/20250117172819.3357534-1-nico.escande@gmail.com/
>    - initial version
> ---
>   drivers/net/wireless/ath/ath12k/core.h   | 4 ++++
>   drivers/net/wireless/ath/ath12k/dp_mon.c | 2 ++
>   drivers/net/wireless/ath/ath12k/mac.c    | 5 +++++
>   3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index ee595794a7aee..83af4381b79ff 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -15,6 +15,7 @@
>   #include <linux/ctype.h>
>   #include <linux/firmware.h>
>   #include <linux/panic_notifier.h>
> +#include <linux/average.h>
>   #include "qmi.h"
>   #include "htc.h"
>   #include "wmi.h"
> @@ -477,6 +478,8 @@ struct ath12k_wbm_tx_stats {
>   	u64 wbm_tx_comp_stats[HAL_WBM_REL_HTT_TX_COMP_STATUS_MAX];
>   };
>   
> +DECLARE_EWMA(avg_rssi, 10, 8)
> +
>   struct ath12k_link_sta {
>   	struct ath12k_link_vif *arvif;
>   	struct ath12k_sta *ahsta;
> @@ -496,6 +499,7 @@ struct ath12k_link_sta {
>   	u64 rx_duration;
>   	u64 tx_duration;
>   	u8 rssi_comb;
> +	struct ewma_avg_rssi avg_rssi;
>   	u8 link_id;
>   	struct ath12k_rx_peer_stats *rx_stats;
>   	struct ath12k_wbm_tx_stats *wbm_tx_stats;
> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
> index 5a21961cfd465..e53d5674b4368 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> @@ -2157,6 +2157,7 @@ static void ath12k_dp_mon_rx_update_peer_su_stats(struct ath12k *ar,
>   		return;
>   
>   	arsta->rssi_comb = ppdu_info->rssi_comb;
> +	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
>   
>   	num_msdu = ppdu_info->tcp_msdu_count + ppdu_info->tcp_ack_msdu_count +
>   		   ppdu_info->udp_msdu_count + ppdu_info->other_msdu_count;
> @@ -2329,6 +2330,7 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k *ar,
>   		return;
>   
>   	arsta->rssi_comb = ppdu_info->rssi_comb;
> +	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
>   
>   	num_msdu = user_stats->tcp_msdu_count + user_stats->tcp_ack_msdu_count +
>   		   user_stats->udp_msdu_count + user_stats->other_msdu_count;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 2d062b5904a8e..5be8cf0e41279 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5403,6 +5403,7 @@ static int ath12k_mac_station_add(struct ath12k *ar,
>   		}
>   	}
>   
> +	ewma_avg_rssi_init(&arsta->avg_rssi);
>   	return 0;
>   
>   free_peer:
> @@ -10054,6 +10055,10 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   	/* TODO: Use real NF instead of default one. */
>   	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
>   	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
> +
> +	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi) +
> +		ATH12K_DEFAULT_NOISE_FLOOR;
> +	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
>   }
>   
>   static int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,


Reviewed-by: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>


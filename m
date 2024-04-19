Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CA6C4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 18:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkrN5L8U9JNuomuUts6cmhMNhhk6vgPKaArDqv26aA4=; b=b7Izx77CMllWxw6lZKv4HnIwtQ
	T1oqfS9yBiPP/CwXfz3nINMz05M4pN0Jphd6NYxzBI/MawqRC1Yjpm0zu9c5c9f9rLeh+bFYW7XMz
	sh7ctEeMfD3pqDSjw6/WU+VoUw09+mIc32TuaNoxOpbk9hmuVA79QOmSC75UEiGbcFAgKr8E84hZE
	J5G3m6430T3QzA2BPb3V80C6uH69S8Ci0VddXe8Asluh5NWjV2M08yBzdwSsGfLNvAt5F7jox3FB3
	CzNCx0FXrUHQCGESR3odqFPWEUvXlFCK9Jxlzm4j4j/gV/+NN2k0zVfjkfEzBu32/w07PuaPEkT8M
	BIC0LjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxsf9-00000006cT6-3kzS
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 18:08:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxsf7-00000006cSY-0q6f
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 18:08:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43J3TWde008799;
	Fri, 19 Apr 2024 18:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=dkrN5L8U9JNuomuUts6cmhMNhhk6vgPKaArDqv26aA4=; b=Wm
	orReolWHf/frtzWE+pg2aERvXb6Wsw97+N1dn1R/jTINASLXC99pV/YXLRWUPNmn
	ZVCYx0gs7WrzDfqI8Rrf9wViHRErGvqlitGmPwme/AvkU5hswn5S7kbE4xJItA/B
	49nKVkTaCu+ULu01AdnNO+W/UhDhA+/C4pjVhOdUxu94XMviVwrCTuGLaQ2+I3Rk
	lqsAhQ6Q5pnf0RTt/TWIVgVxLZ+VIOXfCyvrqowE/wFdLXhT48cLOjkFDy8Ul7I5
	mz2j/TvkIpVFYuORg4NpIsc3l60r7HBSxCezkZmqlBPSY6JB1+OLLmJQR44oGpWf
	ap29xZlQdSHRbtttcC8g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkgrmhp67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 18:08:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JI8YjF023760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 18:08:34 GMT
Received: from [10.110.56.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 11:08:33 -0700
Message-ID: <b52f04d9-4569-4b4d-9e67-93ebc8775dae@quicinc.com>
Date: Fri, 19 Apr 2024 11:08:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: drop failed transmitted frames from metric
 calculation.
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240419170314.3117623-1-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240419170314.3117623-1-quic_kathirve@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 57gODWAUUVHYBv2laaOkvGV-3ruO8R1a
X-Proofpoint-ORIG-GUID: 57gODWAUUVHYBv2laaOkvGV-3ruO8R1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_13,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_110837_429238_BAA06A11 
X-CRM114-Status: GOOD (  23.38  )
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

On 4/19/2024 10:03 AM, Karthikeyan Kathirvel wrote:
> In mesh node traffic, internal firmware-transmitted failures are
> reported as transmitted failures in mesh metric calculation, leading
> to the breakage of the mesh link.
> 
> Fix the issue by dropping the internal firmware-transmitted failures
> before updating the TX completion status to mac80211, in order to
> prevent false failure averaging in mesh metric calculation.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_tx.c    | 38 ++++++++++++++++------
>  drivers/net/wireless/ath/ath12k/hal_desc.h | 20 ++++++++++++

My Qualcomm Innovation Center copyright checker reports:
drivers/net/wireless/ath/ath12k/hal_desc.h copyright missing 2024

>  2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
> index 9b6d7d72f57c..164431b7eb4e 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -481,18 +481,36 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
>  	/* skip tx rate update from ieee80211_status*/
>  	info->status.rates[0].idx = -1;
>  
> -	if (ts->status == HAL_WBM_TQM_REL_REASON_FRAME_ACKED &&
> -	    !(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
> -		info->flags |= IEEE80211_TX_STAT_ACK;
> -		info->status.ack_signal = ATH12K_DEFAULT_NOISE_FLOOR +
> -					  ts->ack_rssi;
> -		info->status.flags = IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
> +	switch (ts->status) {
> +	case HAL_WBM_TQM_REL_REASON_FRAME_ACKED:
> +		if (!(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
> +			info->flags |= IEEE80211_TX_STAT_ACK;
> +			info->status.ack_signal = ATH12K_DEFAULT_NOISE_FLOOR +
> +						  ts->ack_rssi;
> +			info->status.flags = IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
> +		}
> +		break;
> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_TX:
> +		if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
> +			info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
> +			break;
> +		}
> +		fallthrough;
> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_MPDU:
> +	case HAL_WBM_TQM_REL_REASON_DROP_THRESHOLD:
> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_AGED_FRAMES:
> +		/* The failure status is due to internal firmware tx failure
> +		 * hence drop the frame do not update the status of frame to

there is a separator missing here, so should be something like:
...drop the frame and do not update...
...drop the frame -- do not update...
...drop the frame; do not update...
...drop the frame (do not update...)

> +		 * the upper layer
> +		 */
> +		dev_kfree_skb_any(msdu);
> +		goto exit;
> +	default:
> +		ath12k_dbg(ab, ATH12K_DBG_DP_TX, "tx frame is not acked status %d\n",
> +			   ts->status);
> +		break;
>  	}
>  
> -	if (ts->status == HAL_WBM_TQM_REL_REASON_CMD_REMOVE_TX &&
> -	    (info->flags & IEEE80211_TX_CTL_NO_ACK))
> -		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
> -
>  	/* NOTE: Tx rate status reporting. Tx completion status does not have
>  	 * necessary information (for example nss) to build the tx rate.
>  	 * Might end up reporting it out-of-band from HTT stats.
> diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
> index 63340256d3f6..677f31879553 100644
> --- a/drivers/net/wireless/ath/ath12k/hal_desc.h
> +++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
> @@ -2048,6 +2048,19 @@ struct hal_wbm_release_ring {
>   *	fw with fw_reason2.
>   * @HAL_WBM_TQM_REL_REASON_CMD_REMOVE_RESEAON3: Remove command initiated by
>   *	fw with fw_reason3.
> + * @HAL_WBM_TQM_REL_REASON_CMD_DISABLE_QUEUE: Remove command initiated by
> + *	fw with disable queue.
> + * @HAL_WBM_TQM_REL_REASON_CMD_TILL_NONMATCHING: Remove command initiated by
> + *	fw to remove all mpdu until 1st non-match.
> + * @HAL_WBM_TQM_REL_REASON_DROP_THRESHOLD: Dropped due to drop threshold
> + *	criteria
> + * @HAL_WBM_TQM_REL_REASON_DROP_LINK_DESC_UNAVAIL: Dropped due to link desc
> + *	not available
> + * @HAL_WBM_TQM_REL_REASON_DROP_OR_INVALID_MSDU: Dropped due drop bit set or
> + *	null flow
> + * @HAL_WBM_TQM_REL_REASON_MULTICAST_DROP: Dropped due mcast drop set for VDEV
> + * @HAL_WBM_TQM_REL_REASON_VDEV_MISMATCH_DROP: Dropped due to being set with
> + *	'TCL_drop_reason'
>   */
>  enum hal_wbm_tqm_rel_reason {
>  	HAL_WBM_TQM_REL_REASON_FRAME_ACKED,
> @@ -2058,6 +2071,13 @@ enum hal_wbm_tqm_rel_reason {
>  	HAL_WBM_TQM_REL_REASON_CMD_REMOVE_RESEAON1,
>  	HAL_WBM_TQM_REL_REASON_CMD_REMOVE_RESEAON2,
>  	HAL_WBM_TQM_REL_REASON_CMD_REMOVE_RESEAON3,
> +	HAL_WBM_TQM_REL_REASON_CMD_DISABLE_QUEUE,
> +	HAL_WBM_TQM_REL_REASON_CMD_TILL_NONMATCHING,
> +	HAL_WBM_TQM_REL_REASON_DROP_THRESHOLD,
> +	HAL_WBM_TQM_REL_REASON_DROP_LINK_DESC_UNAVAIL,
> +	HAL_WBM_TQM_REL_REASON_DROP_OR_INVALID_MSDU,
> +	HAL_WBM_TQM_REL_REASON_MULTICAST_DROP,
> +	HAL_WBM_TQM_REL_REASON_VDEV_MISMATCH_DROP,
>  };
>  
>  struct hal_wbm_buffer_ring {
> 
> base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
actual code LGTM, will ack a v2 with the nits addressed


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FA0D66BAA
	for <ath12k@archiver.kernel.org>; Wed, 27 Nov 2024 02:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEQACcglWxOBFBM0Bf/kDo3J5HyON2p3tjrDZCoF7kk=; b=J3TEz7BvqR+v26nqlBV0Fv/HzF
	qFRs6CkgxmlQrG+l6ORldmvalyGRORZG0YRER8Rbkb2yUp/LPUB5FRwQ/+/z+6FLSOpXTPckkYaSt
	6k53Ks04ixLErlunVXaTs301wcEt6Fwtbq3mYPY5IDC4muzPv/nXh6HDiNEDGN6jhj2fDiwjOzu1C
	pkD6rhQf37O7v5BYQcQesvGyHUIhH7ZeEFhNaPHF5Jpf5zRBsRLhCnI5FxRUofr+3AEgpbWXafDZc
	aguRs5MRbKmDh4ryzLV73+iYzJnWd12BV6zV9we4/xFUROubMdH1BZwRHxbrzKxGaqrrb/GjX/Mlm
	LscXx2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7sZ-0000000C511-0iMi
	for ath12k@archiver.kernel.org;
	Wed, 27 Nov 2024 02:34:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG7sX-0000000C50Z-00cz
	for ath12k@lists.infradead.org;
	Wed, 27 Nov 2024 02:34:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKL2oo029226;
	Wed, 27 Nov 2024 02:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fEQACcglWxOBFBM0Bf/kDo3J5HyON2p3tjrDZCoF7kk=; b=GadUDscqBdjgT0t+
	03RWkO6iE19ebN80xVI4zRnQUTVbvyQD7nx+okzsN1lHY/Afi5ZcqxA5iOVcudEh
	+19UgV5de+pe70GZ0YQMrwvSjpRmFZu5GYLGK0JgYFKdm1AR/tyZUa2rWlV1lMEH
	QqrgfwbDKxHAp5U/FnKaXmkL0XOPLQMxkitRIVEHCS9ZZdV9NNyZyJqPZ2163FU+
	xh82iVvooow8KyItjgI5lvbWRi+XofLUhzLTksQwm195fknUD2zT+p+nFU5/xyZW
	4lIuTVi+kVOO2kue5pBzW6yPthpkcWpNdsAzwLVXwnjiJb1HklPjW59DvtgKWznZ
	QemmmA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg66kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 02:34:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR2Y3eq009948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 02:34:03 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 18:34:02 -0800
Message-ID: <83b2325e-4d98-49a1-ae32-a69d7962e4a3@quicinc.com>
Date: Wed, 27 Nov 2024 10:34:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] wifi: ath12k: convert struct
 ath12k::wmi_mgmt_tx_work to struct wiphy_work
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
 <20241126171139.2350704-2-kvalo@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20241126171139.2350704-2-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NDx8IW7jKTrMUXz5cb2JUkRRVSBntead
X-Proofpoint-ORIG-GUID: NDx8IW7jKTrMUXz5cb2JUkRRVSBntead
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_183409_054149_BA25659C 
X-CRM114-Status: GOOD (  23.87  )
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



On 11/27/2024 1:11 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> To simplify locking for the next patches convert struct
> ath12k::wmi_mgmt_tx_work to use wiphy_work. After this
> ath12k_mgmt_over_wmi_tx_work() is called with wiphy_lock() taken. In
> ath12k_core_suspend() we need to take wiphy_lock() because
> ath12k_mac_wait_tx_complete() requires it.
> 
> Also add lockdep_assert_wiphy() to document when wiphy_lock() is held.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c |  6 ++++++
>  drivers/net/wireless/ath/ath12k/core.h |  2 +-
>  drivers/net/wireless/ath/ath12k/mac.c  | 20 ++++++++++++++++----
>  3 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index c57322221e1d..263a7c789122 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -79,11 +79,17 @@ int ath12k_core_suspend(struct ath12k_base *ab)
>  		ar = ab->pdevs[i].ar;
>  		if (!ar)
>  			continue;
> +
> +		wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
> +
>  		ret = ath12k_mac_wait_tx_complete(ar);
>  		if (ret) {
> +			wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
>  			ath12k_warn(ab, "failed to wait tx complete: %d\n", ret);
>  			return ret;
>  		}
> +
> +		wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
>  	}
>  
>  	/* PM framework skips suspend_late/resume_early callbacks
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index c1d5e93b679a..5be977008319 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -679,7 +679,7 @@ struct ath12k {
>  
>  	struct work_struct regd_update_work;
>  
> -	struct work_struct wmi_mgmt_tx_work;
> +	struct wiphy_work wmi_mgmt_tx_work;
>  	struct sk_buff_head wmi_mgmt_tx_queue;
>  
>  	struct ath12k_wow wow;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 60702bf07141..a6fe998c177e 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -6726,6 +6726,8 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
>  {
>  	int num_mgmt;
>  
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
why would we need wiphy lock protect here? I don;t see anything in this function need it.

> +
>  	ieee80211_free_txskb(ath12k_ar_to_hw(ar), skb);
>  
>  	num_mgmt = atomic_dec_if_positive(&ar->num_pending_mgmt_tx);
> @@ -6787,6 +6789,8 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
>  	int buf_id;
>  	int ret;
>  
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
and here the same question as above. I know this function is only called from
ath12k_mgmt_over_wmi_tx_work() which is under wiphy lock protection. But the function
itself doesn't need to assert it if the function does not need its protection.

> +
>  	ATH12K_SKB_CB(skb)->ar = ar;
>  	spin_lock_bh(&ar->txmgmt_idr_lock);
>  	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
> @@ -6841,7 +6845,7 @@ static void ath12k_mgmt_over_wmi_tx_purge(struct ath12k *ar)
>  		ath12k_mgmt_over_wmi_tx_drop(ar, skb);
>  }
>  
> -static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
> +static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work *work)
>  {
>  	struct ath12k *ar = container_of(work, struct ath12k, wmi_mgmt_tx_work);
>  	struct ath12k_skb_cb *skb_cb;
> @@ -6850,6 +6854,8 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
>  	struct sk_buff *skb;
>  	int ret;
>  
> +	lockdep_assert_wiphy(wiphy);
we are definitely under wiphy lock protection since this is a wiphy_work item, hence no
need to assert it explicitly. see also

ieee80211_sta_monitor_work()
ieee80211_beacon_connection_loss_work()
ieee80211_csa_connection_drop_work()
ieee80211_teardown_ttlm_work()

> +
>  	while ((skb = skb_dequeue(&ar->wmi_mgmt_tx_queue)) != NULL) {
>  		skb_cb = ATH12K_SKB_CB(skb);
>  		if (!skb_cb->vif) {
> @@ -6904,7 +6910,7 @@ static int ath12k_mac_mgmt_tx(struct ath12k *ar, struct sk_buff *skb,
>  
>  	skb_queue_tail(q, skb);
>  	atomic_inc(&ar->num_pending_mgmt_tx);
> -	ieee80211_queue_work(ath12k_ar_to_hw(ar), &ar->wmi_mgmt_tx_work);
> +	wiphy_work_queue(ath12k_ar_to_hw(ar)->wiphy, &ar->wmi_mgmt_tx_work);
>  
>  	return 0;
>  }
> @@ -6981,10 +6987,12 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>  
>  void ath12k_mac_drain_tx(struct ath12k *ar)
>  {
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
> +
>  	/* make sure rcu-protected mac80211 tx path itself is drained */
>  	synchronize_net();
>  
> -	cancel_work_sync(&ar->wmi_mgmt_tx_work);
> +	wiphy_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &ar->wmi_mgmt_tx_work);
>  	ath12k_mgmt_over_wmi_tx_purge(ar);
>  }
>  
> @@ -7101,6 +7109,8 @@ static void ath12k_drain_tx(struct ath12k_hw *ah)
>  	struct ath12k *ar;
>  	int i;
>  
> +	lockdep_assert_wiphy(ah->hw->wiphy);
> +
>  	for_each_ar(ah, ar, i)
>  		ath12k_mac_drain_tx(ar);
>  }
> @@ -9134,6 +9144,8 @@ static int ath12k_mac_flush(struct ath12k *ar)
>  
>  int ath12k_mac_wait_tx_complete(struct ath12k *ar)
>  {
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
> +
>  	ath12k_mac_drain_tx(ar);
>  	return ath12k_mac_flush(ar);
>  }
> @@ -10604,7 +10616,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
>  	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
>  	INIT_WORK(&ar->regd_update_work, ath12k_regd_update_work);
>  
> -	INIT_WORK(&ar->wmi_mgmt_tx_work, ath12k_mgmt_over_wmi_tx_work);
> +	wiphy_work_init(&ar->wmi_mgmt_tx_work, ath12k_mgmt_over_wmi_tx_work);
>  	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
>  }
>  



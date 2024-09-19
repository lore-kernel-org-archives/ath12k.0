Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1460FCDD56E
	for <ath12k@archiver.kernel.org>; Thu, 19 Sep 2024 03:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsUfgKidG4jpRKsu1Gd654cSHqYQPIg/wTCO6kLZdyM=; b=vc2MJY32nUhSva5lfctA1eYOUe
	DHlEJJbVf5bvZrwusLFRLxfCVzrF8ngWGXGMwxsZBYaGeLzxCXYF/EaEI/LTKfi78J7ERhCi4maWw
	E4bMXcv8NGnHRhrbA6/ztHO4CQi8LfWhxbC0XLsuq4wTiqP8MUmVFiQ8xD/KOtb2QoTuBppPp9UzJ
	K/qP/Ph1h5b+1JOlKGLAG6Pc+j+u84mRSfhWTJDIZq+w4tKvbmf65/YKqqYz5fHY4BB+8PLkh8gxT
	2FjI4Jf0B+pzdNXnT1cJZdrRDIWVOWU28sQaxIyeKkYyB7ryFiyE4ROJeHDxJAGyJIPrx/IUK9M+x
	PYlR4txA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sr7Pt-00000009KvV-2Zh7
	for ath12k@archiver.kernel.org;
	Thu, 19 Sep 2024 03:01:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sr7Pq-00000009Kun-1ngU
	for ath12k@lists.infradead.org;
	Thu, 19 Sep 2024 03:01:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IKwIqX022941
	for <ath12k@lists.infradead.org>; Thu, 19 Sep 2024 03:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsUfgKidG4jpRKsu1Gd654cSHqYQPIg/wTCO6kLZdyM=; b=eRQbEVWjqW50mKFW
	fA5Dnyc7qS+HnCOtHvI7nqb7iLT7eOjG8gRpxXbYgqACKsIL7Z+YRCl8oySBZT7p
	GM/p4CFvJ8jmyukyLhqT+ffODrfsa7hduCJq0OUarI/vh+4nedoadQgYk2DqHldm
	u1ReXMHhgAOusn3nggXix75a8sOYPadMNW1D4hthHgX0rKqYmnCs8yMnz2SCjrBo
	z2x94uXiyu0J0f9U61fTk9D0BuSA/+aCDnJC2igrVuQn4a+pvAQMSTQ16RBavVvH
	OC5IZ9xg0O8PFv6NJlxivH0b24bkqge7VYz7L25FjZ+obfdWgSmY2DH7aMmoZDFE
	SCMDVg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnuudc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Sep 2024 03:01:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48J318f3013902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Sep 2024 03:01:08 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Sep
 2024 20:01:07 -0700
Message-ID: <96cf0f76-764f-44a7-8adc-1ec647afc809@quicinc.com>
Date: Thu, 19 Sep 2024 11:01:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/4] wifi: ath12k: convert struct
 ath12k_sta::update_wk to use struct wiphy_work
To: <ath12k@lists.infradead.org>
References: <20240918181042.91891-1-kvalo@kernel.org>
 <20240918181042.91891-5-kvalo@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240918181042.91891-5-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sYcnpAHY9jW8r4Mhl03kUz-85QdFAKCR
X-Proofpoint-ORIG-GUID: sYcnpAHY9jW8r4Mhl03kUz-85QdFAKCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_200110_520982_58FA38AE 
X-CRM114-Status: GOOD (  22.02  )
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



On 9/19/2024 2:10 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> As ath12k is now converted to use wiphy lock we can convert
> ath12k_sta_rc_update_wk() to use wiphy_work_queue(). This is just for
> consistency.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h |  2 +-
>  drivers/net/wireless/ath/ath12k/mac.c  | 14 ++++++++------
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 7551494716b5..ebfc1e370acc 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -451,7 +451,7 @@ struct ath12k_sta {
>  	u32 smps;
>  	enum hal_pn_type pn_type;
>  
> -	struct work_struct update_wk;
> +	struct wiphy_work update_wk;
>  	struct rate_info txrate;
>  	struct rate_info last_txrate;
>  	u64 rx_duration;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 80db9004cdd7..e70b4212ae80 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4258,7 +4258,7 @@ static int ath12k_station_disassoc(struct ath12k *ar,
>  	return 0;
>  }
>  
> -static void ath12k_sta_rc_update_wk(struct work_struct *wk)
> +static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *work)
>  {
>  	struct ath12k *ar;
>  	struct ath12k_vif *arvif;
> @@ -4274,7 +4274,9 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>  	struct ath12k_wmi_peer_assoc_arg peer_arg;
>  	enum wmi_phy_mode peer_phymode;
>  
> -	arsta = container_of(wk, struct ath12k_sta, update_wk);
> +	lockdep_assert_wiphy(wiphy);
> +
> +	arsta = container_of(work, struct ath12k_sta, update_wk);
>  	sta = container_of((void *)arsta, struct ieee80211_sta, drv_priv);
>  	arvif = arsta->arvif;
>  	ar = arvif->ar;
> @@ -4571,7 +4573,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>  	/* cancel must be done outside the mutex to avoid deadlock */
remove this comment

>  	if ((old_state == IEEE80211_STA_NONE &&
>  	     new_state == IEEE80211_STA_NOTEXIST))
> -		cancel_work_sync(&arsta->update_wk);
> +		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);

with wiphy lock used, the race condition with ar->conf_mutex is gone so deadlock is not possible. therefore we don;t need to do work cancel individually here, better to squash this hunk into the other one. This also achieves symmetry.


	} else if ((old_state == IEEE80211_STA_NONE &&
		    new_state == IEEE80211_STA_NOTEXIST)) {
		...
		/* I mean here */
		...
	}

>  
>  	ar = ath12k_get_ar_by_vif(hw, vif);
>  	if (!ar) {
> @@ -4585,7 +4587,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>  	    new_state == IEEE80211_STA_NONE) {
>  		memset(arsta, 0, sizeof(*arsta));
>  		arsta->arvif = arvif;
> -		INIT_WORK(&arsta->update_wk, ath12k_sta_rc_update_wk);
> +		wiphy_work_init(&arsta->update_wk, ath12k_sta_rc_update_wk);
>  
>  		ret = ath12k_mac_station_add(ar, vif, sta);
>  		if (ret)
> @@ -4792,7 +4794,7 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
>  
>  	spin_unlock_bh(&ar->data_lock);
>  
> -	ieee80211_queue_work(hw, &arsta->update_wk);
> +	wiphy_work_queue(hw->wiphy, &arsta->update_wk);
>  }
>  
>  static int ath12k_conf_tx_uapsd(struct ath12k_vif *arvif,
> @@ -8065,7 +8067,7 @@ static void ath12k_mac_set_bitrate_mask_iter(void *data,
>  	arsta->changed |= IEEE80211_RC_SUPP_RATES_CHANGED;
>  	spin_unlock_bh(&ar->data_lock);
>  
> -	ieee80211_queue_work(ath12k_ar_to_hw(ar), &arsta->update_wk);
> +	wiphy_work_queue(ath12k_ar_to_hw(ar)->wiphy, &arsta->update_wk);
>  }
>  
>  static void ath12k_mac_disable_peer_fixed_rate(void *data,


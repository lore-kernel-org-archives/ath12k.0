Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B431DC3DA4A
	for <ath12k@archiver.kernel.org>; Thu, 22 Aug 2024 06:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6iHOFRmO3NGVSdMKgU64/5mnpGJ5isycI6vB6lnwTo=; b=uYpnGLXzkit0sce//0PsgqikdR
	9h0tHyK+2qdz0Y7fNYdkjAAxEXAfHHi2Iky2b7uMqdxPvrFCSunFwAEWYd+IKOqr8nSbNLEbDMuot
	T/zMVmCesEl6MBibqrpBxN3VM6JDJkLe9uLVU3sVEmXuT2aJWcUkYjOjHrmhsz5mBNSZUiISpjznZ
	F/S2I7aHCFALrq4StXDgSHEvaBAw6/tmXLuiSydUqAC7GMJHcFSeFkyFVfHFJfLCQzsk1xmquYRww
	kDUqWKRt6UIA9AqSJvvDDlOL+VzulIEJW9j/L5NTsnh8uqF1obrmMhhfBtrKpsJ7c6uD3jrIpuzUB
	c9Hv/oSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1AS-0000000BZ9Z-1RLK
	for ath12k@archiver.kernel.org;
	Thu, 22 Aug 2024 06:19:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1AP-0000000BZ94-052k
	for ath12k@lists.infradead.org;
	Thu, 22 Aug 2024 06:19:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M12dGH006773;
	Thu, 22 Aug 2024 06:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6iHOFRmO3NGVSdMKgU64/5mnpGJ5isycI6vB6lnwTo=; b=QmQ1Oj3kg+iwjmLV
	sVKx88rQeeZeU5r/SLqsaUgcxJDKwm2RfXRp/t4WIJ86GiaJGqp4Qz09Nyllg/UI
	WAwM1bDgnOzFH9R15BUpOxn81F7sQgMrjblomVBlvTvz1lRhDkpt6+4d2wQKPNwf
	HCFu8XBTmr8Z7Kz2QRtadJ3CQtP8iP3BWUBpDKPUeXtCkHwa5PrhM9j0i6IkVNOH
	Jd0AdamVqnb9d614XQqcMz2K9lPwMKBf3dV4SE3Iv8WEB0j8d/O/41O072/TFXOq
	83H29xScbOQ2JVLtT0A3OtoCAF3P43se9Kz/kqnK6t2bqSP3dVASwA6qUGQPH2+D
	oqXt0g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415bkwbfgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 06:19:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47M6JNDJ032317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 06:19:23 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 Aug
 2024 23:19:21 -0700
Message-ID: <7717fa70-38f0-44e9-bf3b-26ce71389707@quicinc.com>
Date: Thu, 22 Aug 2024 14:19:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] wifi: ath12k: convert struct
 ath12k_sta::update_wk to use struct wiphy_work
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240821153728.2121600-1-kvalo@kernel.org>
 <20240821153728.2121600-5-kvalo@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240821153728.2121600-5-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vjUS5gSa8qpGLUaagru3noUVNa-zZD-j
X-Proofpoint-GUID: vjUS5gSa8qpGLUaagru3noUVNa-zZD-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_02,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408220044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_231929_105641_5009DA5A 
X-CRM114-Status: GOOD (  18.93  )
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



On 8/21/2024 11:37 PM, Kalle Valo wrote:
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
>  drivers/net/wireless/ath/ath12k/mac.c  | 17 +++++++++--------
>  2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 7fad2150d9bd..cc28185be650 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -445,7 +445,7 @@ struct ath12k_sta {
>  	u32 smps;
>  	enum hal_pn_type pn_type;
>  
> -	struct work_struct update_wk;
> +	struct wiphy_work update_wk;
>  	struct rate_info txrate;
>  	struct rate_info last_txrate;
>  	u64 rx_duration;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 80db9004cdd7..8bf7b026f8e4 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4258,9 +4258,9 @@ static int ath12k_station_disassoc(struct ath12k *ar,
>  	return 0;
>  }
>  
> -static void ath12k_sta_rc_update_wk(struct work_struct *wk)
> +static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *work)
>  {
> -	struct ath12k *ar;
> +	struct ath12k *ar = wiphy_priv(wiphy);
wiphy_priv() returns pointer to ieee80211_local, not ath12k.

>  	struct ath12k_vif *arvif;
>  	struct ath12k_sta *arsta;
>  	struct ieee80211_sta *sta;
> @@ -4274,10 +4274,11 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>  	struct ath12k_wmi_peer_assoc_arg peer_arg;
>  	enum wmi_phy_mode peer_phymode;
>  
> -	arsta = container_of(wk, struct ath12k_sta, update_wk);
> +	lockdep_assert_wiphy(wiphy);
> +
> +	arsta = container_of(work, struct ath12k_sta, update_wk);
>  	sta = container_of((void *)arsta, struct ieee80211_sta, drv_priv);
>  	arvif = arsta->arvif;
> -	ar = arvif->ar;
>  
>  	if (WARN_ON(ath12k_mac_vif_chan(arvif->vif, &def)))
>  		return;
> @@ -4571,7 +4572,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>  	/* cancel must be done outside the mutex to avoid deadlock */
>  	if ((old_state == IEEE80211_STA_NONE &&
>  	     new_state == IEEE80211_STA_NOTEXIST))
> -		cancel_work_sync(&arsta->update_wk);
> +		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
>  
>  	ar = ath12k_get_ar_by_vif(hw, vif);
>  	if (!ar) {
> @@ -4585,7 +4586,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>  	    new_state == IEEE80211_STA_NONE) {
>  		memset(arsta, 0, sizeof(*arsta));
>  		arsta->arvif = arvif;
> -		INIT_WORK(&arsta->update_wk, ath12k_sta_rc_update_wk);
> +		wiphy_work_init(&arsta->update_wk, ath12k_sta_rc_update_wk);
>  
>  		ret = ath12k_mac_station_add(ar, vif, sta);
>  		if (ret)
> @@ -4792,7 +4793,7 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
>  
>  	spin_unlock_bh(&ar->data_lock);
>  
> -	ieee80211_queue_work(hw, &arsta->update_wk);
> +	wiphy_work_queue(hw->wiphy, &arsta->update_wk);
>  }
>  
>  static int ath12k_conf_tx_uapsd(struct ath12k_vif *arvif,
> @@ -8065,7 +8066,7 @@ static void ath12k_mac_set_bitrate_mask_iter(void *data,
>  	arsta->changed |= IEEE80211_RC_SUPP_RATES_CHANGED;
>  	spin_unlock_bh(&ar->data_lock);
>  
> -	ieee80211_queue_work(ath12k_ar_to_hw(ar), &arsta->update_wk);
> +	wiphy_work_queue(ath12k_ar_to_hw(ar)->wiphy, &arsta->update_wk);
>  }
>  
>  static void ath12k_mac_disable_peer_fixed_rate(void *data,


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DB4C54E58
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 21:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3Ea4GIpIUqyKvoDn2psci6XloEJ1E517SgOQPy2B20=; b=Yjj1dtO3TtpfoGsG7x6VdUE//O
	6OB/6m5WXbjQ1GZT2wsMh7DRegjXTvjf5VBehTwkpEuWA0H8h2H//usyNTUZiMmjUGsMk3A+cewFk
	GGUKEhSsijNuZLweirDpq2d/dKxAEPo3dFumTXUIhDHqgthJiHAkVsrGSAFVBd3T4VUNmoJU+QGPv
	DAH9Fpvo4OVJJfdkI/ROA8E0hVfahLnh9jfaqGFsUFaIbDyiw/tiE4TJkz+66XtgcbzRgyIYOaAws
	eH16MJwTd2FmSFcVEbrPXUvGjAlkAM/I3G1BzamZW81bOactHg9Mr1giUNna55atO4oNO+sHwLxA9
	vQY8/rOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnPaw-00000004cor-0AF3
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 21:05:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnPat-00000004coG-0pbm
	for ath12k@lists.infradead.org;
	Thu, 21 Mar 2024 21:05:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LIhtJs032760;
	Thu, 21 Mar 2024 21:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=T3Ea4GIpIUqyKvoDn2psci6XloEJ1E517SgOQPy2B20=; b=dO
	XhttMRZsGM/P4UssdiJn/tm7yKPIVCAweiKb/fiCtcNPxZ90B7Kx83okELKmkPZ4
	No3kzYKK0evLE4QMntRVzMY5+WxNLcVIBEk99Z7UWHJAwK0nlIwv83X5xzfr1zJP
	yXTV/n3zggkdAzvL8rK004F9HvkJjx5ydFTzxZPaak1xo2+efaiGvGgQkUcj8EHi
	4qpdrtFTCFGX67RYYwvq6nzTYQhE8bddXmRGMYN5KiZ8iooJPVO5U9Wy28LmbR6t
	sf1c8vZMmDQrxDlmjLG91rrDY2onDZMQ4D7/NMgwtW8zJjHxUYvtBNctLclp7AUc
	eNBixQOsNbcPzoeIEiag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0f1nj3mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 21:04:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LL4uDl019066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 21:04:56 GMT
Received: from [10.110.74.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 14:04:55 -0700
Message-ID: <29d302e7-dbc5-4d39-b890-067a24a84782@quicinc.com>
Date: Thu, 21 Mar 2024 14:04:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] wifi: ath12k: Cache vdev configs before vdev
 create
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240320190943.3850106-1-quic_ramess@quicinc.com>
 <20240320190943.3850106-8-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240320190943.3850106-8-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X8wLyqhEcaqmEWyp0PftqDOIrI2jIjx2
X-Proofpoint-ORIG-GUID: X8wLyqhEcaqmEWyp0PftqDOIrI2jIjx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=996 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_140459_356160_66C2D5C0 
X-CRM114-Status: GOOD (  32.90  )
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

On 3/20/2024 12:09 PM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Since the vdev create for a corresponding vif is deferred
> until a channel is assigned, cache the information which
> are received through mac80211 ops between add_interface()
> and assign_vif_chanctx() and set them once the vdev is
> created on one of the ath12k radios as the channel gets
> assigned via assign_vif_chanctx().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>

in any of these patches where you are performing significant rework please
feel free to add a Co-developed-by: tag for yourself

> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h |  19 ++++
>  drivers/net/wireless/ath/ath12k/mac.c  | 149 ++++++++++++++++++++-----
>  2 files changed, 140 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 507f08ab3ad5..fa0606c460c6 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -214,6 +214,24 @@ enum ath12k_monitor_flags {
>  	ATH12K_FLAG_MONITOR_ENABLED,
>  };
>  
> +struct ath12k_tx_conf {
> +	bool changed;
> +	u16 ac;
> +	struct ieee80211_tx_queue_params tx_queue_params;
> +};
> +
> +struct ath12k_key_conf {
> +	bool changed;
> +	enum set_key_cmd cmd;
> +	struct ieee80211_key_conf *key;
> +};
> +
> +struct ath12k_vif_cache {
> +	struct ath12k_tx_conf *tx_conf;
> +	struct ath12k_key_conf *key_conf;
> +	u32 bss_conf_changed;
> +};
> +
>  struct ath12k_vif {
>  	u32 vdev_id;
>  	enum wmi_vdev_type vdev_type;
> @@ -268,6 +286,7 @@ struct ath12k_vif {
>  	u8 vdev_stats_id;
>  	u32 punct_bitmap;
>  	bool ps;
> +	struct ath12k_vif_cache cache;

in my v4 comment I had suggested that this cache be a pointer.
instead you chose to add pointers to the subordinate records within the cache.
why take that approach?

>  };
>  
>  struct ath12k_vif_iter {
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 50c8c6ddc167..0274eac33b1f 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -3021,12 +3021,14 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>  
>  	ar = ath12k_get_ar_by_vif(hw, vif);
>  
> -	/* TODO if the vdev is not created on a certain radio,
> +	/* if the vdev is not created on a certain radio,
>  	 * cache the info to be updated later on vdev creation
>  	 */
>  
> -	if (!ar)
> +	if (!ar) {
> +		arvif->cache.bss_conf_changed |= changed;
>  		return;
> +	}
>  
>  	mutex_lock(&ar->conf_mutex);
>  
> @@ -3517,12 +3519,11 @@ static int ath12k_clear_peer_keys(struct ath12k_vif *arvif,
>  	return first_errno;
>  }
>  
> -static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
> -				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
> -				 struct ieee80211_key_conf *key)
> +static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
> +			      struct ieee80211_vif *vif, struct ieee80211_sta *sta,
> +			      struct ieee80211_key_conf *key)
>  {
> -	struct ath12k *ar;
> -	struct ath12k_base *ab;
> +	struct ath12k_base *ab = ar->ab;
>  	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
>  	struct ath12k_peer *peer;
>  	struct ath12k_sta *arsta;
> @@ -3530,28 +3531,11 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>  	int ret = 0;
>  	u32 flags = 0;
>  
> -	/* BIP needs to be done in software */
> -	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
> -		return 1;
> -
> -	ar = ath12k_get_ar_by_vif(hw, vif);
> -	if (!ar) {
> -		WARN_ON_ONCE(1);
> -		return -EINVAL;
> -	}
> -	ab = ar->ab;
> +	lockdep_assert_held(&ar->conf_mutex);
>  
> -	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags))
> +	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags))
>  		return 1;
>  
> -	if (key->keyidx > WMI_MAX_KEY_INDEX)
> -		return -ENOSPC;
> -
> -	mutex_lock(&ar->conf_mutex);
> -
>  	if (sta)
>  		peer_addr = sta->addr;
>  	else if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
> @@ -3643,6 +3627,51 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>  	spin_unlock_bh(&ab->base_lock);
>  
>  exit:
> +	return ret;
> +}
> +
> +static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
> +				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
> +				 struct ieee80211_key_conf *key)
> +{
> +	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
> +	struct ath12k_key_conf *key_conf;
> +	struct ath12k *ar;
> +	int ret;
> +
> +	/* BIP needs to be done in software */
> +	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
> +	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
> +	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
> +	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
> +		return 1;
> +
> +	if (key->keyidx > WMI_MAX_KEY_INDEX)
> +		return -ENOSPC;
> +
> +	ar = ath12k_get_ar_by_vif(hw, vif);
> +	if (!ar) {
> +		/* ar is expected to be valid when sta ptr is available */
> +		if (sta) {
> +			WARN_ON_ONCE(1);
> +			return -EINVAL;
> +		}
> +
> +		key_conf = arvif->cache.key_conf;
> +		if (!key_conf) {
> +			key_conf = kzalloc(sizeof(*key_conf), GFP_KERNEL);
> +			if (!key_conf)
> +				return -ENOSPC;
> +			arvif->cache.key_conf = key_conf;
> +		}
> +		key_conf->cmd = cmd;
> +		key_conf->key = key;
> +		key_conf->changed = true;

if you are allocating the individual structs do you need this flag? isn't the
presence of the cache.<foo>_conf pointer itself sufficient?

> +		return 0;
> +	}
> +
> +	mutex_lock(&ar->conf_mutex);
> +	ret = ath12k_mac_set_key(ar, cmd, vif, sta, key);
>  	mutex_unlock(&ar->conf_mutex);
>  	return ret;
>  }
> @@ -4473,11 +4502,22 @@ static int ath12k_mac_op_conf_tx(struct ieee80211_hw *hw,
>  {
>  	struct ath12k *ar;
>  	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
> +	struct ath12k_tx_conf *tx_conf;
>  	int ret;
>  
>  	ar = ath12k_get_ar_by_vif(hw, vif);
>  	if (!ar) {
> -		/* TODO cache the info and apply after vdev is created */
> +		/* cache the info and apply after vdev is created */
> +		tx_conf = arvif->cache.tx_conf;
> +		if (!tx_conf) {
> +			tx_conf = kzalloc(sizeof(*tx_conf), GFP_KERNEL);
> +			if (!tx_conf)
> +				return -ENOSPC;
> +			arvif->cache.tx_conf = tx_conf;
> +		}
> +		tx_conf->changed = true;
> +		tx_conf->ac = ac;
> +		tx_conf->tx_queue_params = *params;
>  		return -EINVAL;
>  	}
>  
> @@ -6121,6 +6161,57 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
>  	return ret;
>  }
>  
> +static void ath12k_mac_vif_cache_free(struct ath12k *ar, struct ath12k_vif *arvif)
> +{
> +	struct ath12k_key_conf *key_conf = arvif->cache.key_conf;
> +	struct ath12k_tx_conf *tx_conf = arvif->cache.tx_conf;
> +
> +	lockdep_assert_held(&ar->conf_mutex);
> +
> +	kfree(tx_conf);
> +	arvif->cache.tx_conf = NULL;
> +	kfree(key_conf);
> +	arvif->cache.key_conf = NULL;
> +	arvif->cache.bss_conf_changed = 0;
> +}
> +
> +static void ath12k_mac_vif_cache_flush(struct ath12k *ar,  struct ieee80211_vif *vif)
> +{
> +	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
> +	struct ath12k_key_conf *key_conf = arvif->cache.key_conf;
> +	struct ath12k_tx_conf *tx_conf = arvif->cache.tx_conf;
> +	struct ath12k_base *ab = ar->ab;
> +
> +	int ret;
> +
> +	lockdep_assert_held(&ar->conf_mutex);
> +
> +	if (tx_conf && tx_conf->changed) {

as mentioned above if you are allocating the per-op cach structs individually
then you should not need the changed flag, this can just become:
	if (txconf) {

> +		ret = ath12k_mac_conf_tx(arvif, 0, tx_conf->ac,
> +					 &tx_conf->tx_queue_params);
> +		if (ret)
> +			ath12k_warn(ab,
> +				    "unable to apply tx config parameters to vdev %d\n",
> +				    ret);
> +	}
> +
> +	if (arvif->cache.bss_conf_changed) {
> +		ath12k_mac_bss_info_changed(ar, arvif, &vif->bss_conf,
> +					    arvif->cache.bss_conf_changed);
> +	}
> +
> +	if (key_conf && key_conf->changed) {

	if (key_conf) {

> +		ret = ath12k_mac_set_key(ar, key_conf->cmd, vif, NULL,
> +					 key_conf->key);
> +		if (ret) {
> +			WARN_ON_ONCE(1);

why have this when you're using ath12k_warn()?

> +			ath12k_warn(ab, "unable to apply set key param to vdev %d ret %d\n",
> +				    arvif->vdev_id, ret);
> +		}
> +	}
> +	ath12k_mac_vif_cache_free(ar, arvif);
> +}
> +
>  static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
>  						    struct ieee80211_vif *vif,
>  						    struct ieee80211_chanctx_conf *ctx)
> @@ -6201,10 +6292,11 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
>  		goto unlock;
>  	}
>  
> -	/* TODO If the vdev is created during channel assign and not during
> +	/* If the vdev is created during channel assign and not during
>  	 * add_interface(), Apply any parameters for the vdev which were received
>  	 * after add_interface, corresponding to this vif.
>  	 */
> +	ath12k_mac_vif_cache_flush(ar, vif);
>  unlock:
>  	mutex_unlock(&ar->conf_mutex);
>  out:
> @@ -6316,6 +6408,7 @@ static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ieee80211_vif *vif)
>  	spin_unlock_bh(&ar->data_lock);
>  
>  	ath12k_peer_cleanup(ar, arvif->vdev_id);
> +	ath12k_mac_vif_cache_free(ar, arvif);
>  
>  	idr_for_each(&ar->txmgmt_idr,
>  		     ath12k_mac_vif_txmgmt_idr_remove, vif);



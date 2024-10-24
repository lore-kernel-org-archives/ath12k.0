Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD771CE8E6A
	for <ath12k@archiver.kernel.org>; Thu, 24 Oct 2024 18:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u6Nxk1PVH678bpfJjRZkhY2xEU242GgL6SOd66t1jk=; b=TUvbk0dil7N56LgMZex6Lo3dPa
	/knOa1a9NgUB848+jwKFbDKRxOuPX5IZ03SR6vCw1xw7j5Flkbxbfsb2ri430V9frlfBkIThYuY1b
	c0YQA/ktWKw5+JK4XUjZxPOuwLDQZ3z/Xc9MgbZWhs4FeTaU/eD3xXGrwClCvOAG9YsLX6wSLr3S4
	WgLN29PGPKdLQuso53LmkhbjvQfL/b9A/KDzTdaOtDwPzbIb3+MI1d+qL4R3yS4By2icGx1HOwPnR
	8GDGAI0G29VZSkoDqNRXy1alX/55TaNTJEIUdsr0at2RhDhQbpvKha+EHdtKOiv1eFkajthKxOlke
	J3U6WNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42JH-00000001QZh-1sKc
	for ath12k@archiver.kernel.org;
	Thu, 24 Oct 2024 18:11:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t42Hr-00000001QDk-3VbG
	for ath12k@lists.infradead.org;
	Thu, 24 Oct 2024 18:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A87CB5C4770;
	Thu, 24 Oct 2024 18:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343B9C4CEC7;
	Thu, 24 Oct 2024 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729793419;
	bh=D1oGPE8iY8SLhbcXjgJNlgsYs6nH9gYfciNl9/OSycQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qy6bYx7rToXkBdQ/acrG1YZmsbnel3MZcTAqXMHBroyZxZsPEi/RSUILGUbu37HoL
	 azTQNG3GKkt8Y+RfQMjr/XbXjZz7u0WVLvcMUTAuc63ERCD/zVsbmdvUI8kQYpY1Lh
	 gdziTx7xcx4tJPLe20wGwZzNE/GD+XCUJA7rsBbonzkLoPMCJHIJ6rJCrqlZPQVw3J
	 zr7pI8/n5MUzZwzJqYn5dIKW479kRyFlP8AoBXEGB8m3A3T6VwdlKJctsNbzNywB/2
	 CeqBY/vUluDJ3nffCzHw/gm2cd/nx3SupIFxhpCiNiBUNOMUCewCnwhhzYeEr0/nX4
	 YPqzq3mgAKDeQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/8] wifi: ath12k: MLO vdev bringup changes
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-3-kvalo@kernel.org>
	<b79d33c6-a7cc-4a23-9b85-b2481c508d07@quicinc.com>
Date: Thu, 24 Oct 2024 21:10:16 +0300
In-Reply-To: <b79d33c6-a7cc-4a23-9b85-b2481c508d07@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 08:19:02 -0700")
Message-ID: <871q05mkxj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_111019_990157_3D59F394 
X-CRM114-Status: GOOD (  23.40  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/23/2024 6:29 AM, Kalle Valo wrote:
>
>> From: Sriram R <quic_srirrama@quicinc.com>
>> 
>> Add changes to add the link vdevs dynamically whenever a channel is assigned
>> from mac80211 for a link vdev. During vdev create, update ML address of the
>> vdev to firmware using the new WMI parameter (WMI_TAG_MLO_VDEV_CREATE_PARAMS).
>> 
>> During vdev start, notify the firmware that this link vdev is newly added and
>> also indicate all its known partners so that the firmware can take necessary
>> actions to internally update the partners on the new link being added.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
>> Co-developed-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
>> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/mac.c | 90 ++++++++++++++++++++++++++-
>>  drivers/net/wireless/ath/ath12k/wmi.c | 85 ++++++++++++++++++++++++-
>>  drivers/net/wireless/ath/ath12k/wmi.h | 74 ++++++++++++++++++++++
>>  3 files changed, 244 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index f45f32f3b5f6..d4aa4540c8e6 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -648,6 +648,18 @@ struct ath12k *ath12k_mac_get_ar_by_pdev_id(struct ath12k_base *ab, u32 pdev_id)
>>  	return NULL;
>>  }
>>  
>> +static bool ath12k_mac_is_ml_arvif(struct ath12k_link_vif *arvif)
>> +{
>> +	struct ath12k_vif *ahvif = arvif->ahvif;
>> +
>> +	lockdep_assert_wiphy(ahvif->ah->hw->wiphy);
>
> should we have helper functions ath12k_<foo>_to_wiphy() to abstract out the
> underlying linkages?

While working on these patches I started to like the current form, extra
abstractions are always an extra layer to check when working on the
code. Maybe we should revisit this after MLO works? It's easy to add the
new helper in a separate patch.

>> +static void
>> +ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
>> +			     struct wmi_ml_arg *ml_arg)
>> +{
>> +	struct ath12k_vif *ahvif = arvif->ahvif;
>> +	struct wmi_ml_partner_info *partner_info;
>> +	struct ieee80211_bss_conf *link_conf;
>> +	struct ath12k_link_vif *arvif_p;
>> +	unsigned long links;
>> +	u8 link_id;
>> +
>> +	lockdep_assert_wiphy(ahvif->ah->hw->wiphy);
>> +
>> +	if (!ath12k_mac_is_ml_arvif(arvif))
>> +		return;
>> +
>> +	if (hweight16(ahvif->vif->valid_links) > ATH12K_WMI_MLO_MAX_LINKS)
>> +		return;
>> +
>> +	rcu_read_lock();
>
> what is this protecting?

Access to ahvif->link[] and vif->link_conf[]. Protection for
ahvif->links_map is still not clear for me, I need to analyse that more.

> do all of the statements between here and the for loop really need RCU protection?

No, they do not need it. And actually we can could change it to
wiphy_dereference() so we don't need to take rcu_read_lock() at all.
I'll do that in v2.

>> +/* 2 word representation of MAC addr */
>> +struct wmi_mac_addr {
>> +	union {
>> +		u8 addr[6];
>> +		struct {
>> +			u32 word0;
>> +			u32 word1;
>> +		} __packed;
>> +	} __packed;
>> +} __packed;
>
> we already have:
> /* 2 word representation of MAC addr */
> struct ath12k_wmi_mac_addr_params {
> 	u8 addr[ETH_ALEN];
> 	u8 padding[2];
> } __packed;
>
> why aren't we consistently using that?

Ouch, I'll switch to using that. Thanks for the review!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


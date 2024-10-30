Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7837DD6B6BB
	for <ath12k@archiver.kernel.org>; Wed, 30 Oct 2024 18:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZ2VV9UA1MXFHJAaoVVpZkcFn4LWWvfhmjNPx7cs2d4=; b=EG+aQ6LvaOfKUOew2ICbdimcm6
	jbuLuP0Rm9S0CxRSj9FaKeksaId7cz3FGh1BANx3jfRBbIMsDLQbsEu6xgda72VZFPR/vx1zcEfhJ
	QX6e+hBIUQx6bReIadR97M1Un/9TXNW0TzSCpvR7SXqbuL6HDr9Vq2KR/lbmX8KHou2z5vpf3Lx+G
	n9T8secU6Jo0eitpUvO0TTo7FLDDvFGT0KCRU28cBIkUcGU8V3Cir6ZbqZTO4gQm0GtloKZpv1gPJ
	hFkp7zEtAj4pAXiUVKqo3WIKoKzpbT7+EBUXUkLhjE7Mf6xGZHPTF2a+53X9KoOVZosdxoS2MeAHb
	cKmUkxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6DQi-00000001Qo5-0iE0
	for ath12k@archiver.kernel.org;
	Wed, 30 Oct 2024 18:28:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6DQf-00000001Qnh-3C41
	for ath12k@lists.infradead.org;
	Wed, 30 Oct 2024 18:28:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5F645C59EB;
	Wed, 30 Oct 2024 18:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9C4C4CECE;
	Wed, 30 Oct 2024 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730312904;
	bh=YrW+oeMKVVlAQ7H063JZ50DV/sT7OK0FZ5VyEc7WfHQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=IoXxepA6Pu039nVCutwafRFxHzi4Dn2piqAfTy1XzaG/xGERCscnq9/krQ1iPMbNl
	 Q6V6xTR/PRUcgZiU8cPq9tgGbCpfnx0kXZ73+IiVgBGj+OnAAvF+9mBgu8imDDGC0B
	 Z1k5o4U5T8yyCPwt20LHBJHb7Lp56TbAqXBIc1QPLhQphTm152iXr4yVubrVWGuO+E
	 WTSjflcJkxK49mg5Sv/F6MH75NsrGe0iKG7prb4dXV1ct2gp6O/GoQCkHmasOCRNi3
	 +9KreLOfC+p/ZSiFo3GJvsOMAwM9K5s/aEqInyFOiPMev26GRUE6E3RI2Y8YyIhyTJ
	 h1XiNML83VbeQ==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 3/8] wifi: ath12k: Refactor sta state machine
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-4-kvalo@kernel.org>
	<a4b92b80-ec57-4db3-acd7-9c6c7644d7c9@quicinc.com>
	<875xpahqc5.fsf@kernel.org>
	<cd19db4a-953d-4230-85b1-695140bb185c@quicinc.com>
Date: Wed, 30 Oct 2024 20:28:21 +0200
In-Reply-To: <cd19db4a-953d-4230-85b1-695140bb185c@quicinc.com> (Aditya Kumar
	Singh's message of "Wed, 30 Oct 2024 09:35:37 +0530")
Message-ID: <87frodfnsq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_112825_913565_6DA9B125 
X-CRM114-Status: GOOD (  22.37  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> On 10/29/24 21:08, Kalle Valo wrote:
>> + aditya
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> 
>>>> +static int ath12k_mac_station_unauthorize(struct ath12k *ar,
>>>> +					  struct ath12k_link_vif *arvif,
>>>> +					  struct ath12k_link_sta *arsta)
>>>> +{
>>>> +	struct ath12k_peer *peer;
>>>> +	int ret;
>>>> +
>>>> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>>>> +
>>>> +	spin_lock_bh(&ar->ab->base_lock);
>>>> +
>>>> +	peer = ath12k_peer_find(ar->ab, arvif->vdev_id, arsta->addr);
>>>> +	if (peer)
>>>> +		peer->is_authorized = false;
>>>> +
>>>> +	spin_unlock_bh(&ar->ab->base_lock);
>>>> +
>>>> +	/* Driver should clear the peer keys during mac80211's ref ptr
>>>> +	 * gets cleared in __sta_info_destroy_part2 (trans from
>>>> +	 * IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC)
>>>
>>> I'm unable to understand this comment
>> Indeed, that's weird. Aditya, do you have any idea what the comment
>> is
>> trying to say?
>> 
>
> At present, ath12k clear the keys in ath12k_station_disassoc() which
> gets executed in state change from IEEE80211_STA_ASSOC to
> IEEE80211_STA_AUTH.
>
> However, in mac80211, once the station moves from
> IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC itself, the keys are
> deleted. Please see - __sta_info_destroy_part2() ->
> ieee80211_free_sta_keys().
>
> Now, ath12k peer object (struct ath12k_peer) holds the key reference
> from mac80211 (see ath12k_peer::keys[]). Hence, once mac80211 deletes
> the key, driver should not keep a reference to it or else it could
> lead to issues.
>
> Therefore, it is important that the driver should clear the peer keys
> during transition from IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC
> it self since we know that once we return from here, mac80211 is going
> to remove the keys.
>
> ath12k_mac_station_unauthorize() gets called when station moves from
> state IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC hence call to
> ath12k_clear_peer_keys() is moved from ath12k_station_disassoc() to
> ath12k_mac_station_unauthorize().
>
> Is this clear now?

Super clear :) Thanks!

> May be the comment in the code could be re-written as below?
>
> /* Driver must clear the keys during the state change from
>  * IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC, since after
>  * returning from here, mac80211 is going to delete the keys
>  * in __sta_info_destroy_part2(). This will ensure that the driver does
>  * not retain stale key references after mac80211 deletes the keys.
>  */

Looks good to me, I'll add that if it's ok for Jeff as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


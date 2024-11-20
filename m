Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949F5D743C6
	for <ath12k@archiver.kernel.org>; Wed, 20 Nov 2024 19:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMcF5NMGxX915PnmVK6LhrTlsPrAT8bQ4GzTvP5+FW4=; b=t0AGju0W3bIkRmDvnRGkIQXYO8
	HbyOheyU0kZujXVTI0gZNvOOKdfJZrK2G+6K0AGgNYStTT1cm92YJTJcpcJTNSIh5F4WuSC7Ionfz
	TFQzKAoGnjYbtVvscQT29QflHFGtZsmzjn0rlbhAkjGop3l285Px9bz50MFOpGhn4xjqdMYPqJq4b
	N8u4gp/eJScHjabRvhVdE/fdcq1OtY1SYXRFtmRJ8iv5to0Cog/0WmN2vaViqz3l6bTVrFajPlcwg
	T0EO596Jhf7b7ym6Jzy9YKfYhBkFR/GdGfNIF2xbMkMggMheg1flJ6T3jmZf7U5Ap3xbxtrpGSgS9
	8QV9vZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqRc-0000000G7vA-1C0a
	for ath12k@archiver.kernel.org;
	Wed, 20 Nov 2024 19:32:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqRa-0000000G7um-2qzK
	for ath12k@lists.infradead.org;
	Wed, 20 Nov 2024 19:32:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BDBF5C477A;
	Wed, 20 Nov 2024 19:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02CAC4CECD;
	Wed, 20 Nov 2024 19:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732131173;
	bh=8RViDHVQohi3sNBuWakf9/jPFYOFlqXp6zZeaqIbCbA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UTh19gybPp/R/wnVizKE5kSr51Oo1t2T1dIq75NIovzR/3yV9jq5Jm5w91xTOl8B9
	 mA07DR2WFvAfSfZESxRXlY1NMFzPiPHasjgrLp3Ygr3CzB9lCs0T7jc6yLp/zOg90U
	 0vWiblIpIk/AQt0G8s1ziYOhWGqmL9H3oqy4Vgwr3/mB1NOz8Xqf2vIqzFwXGEKx8I
	 IulMhhLoNt5k57B27IEVBRIa0o8Y7S/JGQILov62Te83HCV9FHXSKBrIShkv1XlaJV
	 hMrgdfTGZdhmW5jP6SSvQGC+TfBoFEETsfU8xMgxpY1i0WE9p26iuO/kxB4eeAVuL1
	 9Lr8hwhggJ3ZQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
References: <20241106142617.660901-1-kvalo@kernel.org>
	<20241106142617.660901-2-kvalo@kernel.org>
	<2e706d58-5d83-4867-9963-c62441cdd4da@quicinc.com>
	<87y11o2x9h.fsf@kernel.org>
	<97f3f465-6ebd-4ca1-b672-4c8c7f42220d@quicinc.com>
Date: Wed, 20 Nov 2024 21:32:50 +0200
In-Reply-To: <97f3f465-6ebd-4ca1-b672-4c8c7f42220d@quicinc.com> (Baochen
	Qiang's message of "Wed, 13 Nov 2024 10:55:22 +0800")
Message-ID: <87bjy9zonx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_113254_759907_411B65CD 
X-CRM114-Status: GOOD (  11.84  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

>>>> +static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
>>>> +					      struct ath12k_sta *ahsta,
>>>> +					      u8 link_id)
>>>> +{
>>>> +	struct ath12k_link_sta *arsta;
>>>> +
>>>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>>>> +
>>>> +	if (WARN_ON(link_id >= IEEE80211_MLD_MAX_NUM_LINKS))
>>>> +		return;
>>>> +
>>>> +	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
>>>> +
>>>> +	if (WARN_ON(!arsta))
>>>> +		return;
>>>> +
>>>> +	ath12k_mac_unassign_link_sta(ah, ahsta, link_id);
>>>> +
>>>> +	arsta->link_id = ATH12K_INVALID_LINK_ID;
>>>> +	arsta->ahsta = NULL;
>>>> +	arsta->arvif = NULL;
>>>
>>> if arsta is not deflink and would be freed, can we avoid these
>>> cleanup?
>> 
>> I think that's something we can cleanup later if needed. Sure, it's
>> extra assignments but it's not really doing any harm.
> exactly, but ideally we should avoid unnecessary effort if possible.
>
>> 
>>>> +	if (arsta != &ahsta->deflink)
>>>> +		kfree(arsta);
>>>
>>> I know the actual free happens here, but why split them?
>> 
>> You mean why have a separate function ath12k_mac_unassign_link_sta() and
>> instead just have all code the in
>> ath12k_mac_free_unassign_link_sta()?
>
> yes. such that we can have synchronize_rcu() and kfree() located together.

Ok, I think I now get what you mean. Does this look better:

static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
					      struct ath12k_sta *ahsta,
					      u8 link_id)
{
	struct ath12k_link_sta *arsta;

	lockdep_assert_wiphy(ah->hw->wiphy);

	if (WARN_ON(link_id >= IEEE80211_MLD_MAX_NUM_LINKS))
		return;

	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
	if (WARN_ON(!arsta))
		return;

	ahsta->links_map &= ~BIT(link_id);
	rcu_assign_pointer(ahsta->link[link_id], NULL);

	if (arsta == &ahsta->deflink) {
		arsta->link_id = ATH12K_INVALID_LINK_ID;
		arsta->ahsta = NULL;
		arsta->arvif = NULL;
		return;
	}

	synchronize_rcu();
	kfree(arsta);
}

BTW your lines are really long, please check your settings:

https://patchwork.kernel.org/project/linux-wireless/patch/20241106142617.660901-2-kvalo@kernel.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


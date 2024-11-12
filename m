Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18A8D42BA2
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LY63BpwihPypyqIBBZzjJqNj5sXn4cmuFK8qqrR0IYM=; b=qiyeEd1Hj00ICAFaNFlZPKTig5
	vXVrrzNOd3Dq7VQk2n8/eML4eTOWUVqn8pR74GELPctdbhMan+OKU92GSZAR8Z+xhfpkISiJUzR0z
	CmP037MJd8QHHvMcwm6Tk/OKKwfu5Tir2xtp5IhOWQ3UMCP3SCPkiKZrnoDiNWz3hUkmiV/w3DoOF
	pi4pHdsM8MrxiI3hquZBNy5viNdYdt1wzIsDwCuyenfAN+2JNM4YxR/QLMsbuZXGrPTWb7tHkr72D
	+EHdLLMsW2MYjZ3ACXarlSGPlYKuLbLJOG3VpjzGH8yKhnA2+ATXWHAU89nhHN1TPte9COeL2d9pd
	w1qFqGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtQ7-000000044mN-2u9z
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 16:07:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtMR-000000043va-2aTw
	for ath12k@bombadil.infradead.org;
	Tue, 12 Nov 2024 16:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LY63BpwihPypyqIBBZzjJqNj5sXn4cmuFK8qqrR0IYM=; b=MiyUNJ1LGWB28itApwJhwtCBtr
	f+gUlPL/YEWUZqMQ1bpmeKd8q16U2PwawqeFDdnpdMQ2r7/3jA50R3StJwT3SHOFVczPEjqL6SFWd
	uEHBEgbSuOB47dY1Aog1cvu89rbZaLcx7zjSSSG4KURbjZGbA93ASES+vPnNkmU/jMqfuTZ3aLfjk
	892QS4/mj7AMnrwOJ0sp/TdvwxIK+PongEpDlC/PAGtBbmppqvRPrLMgajVIRnkZiKNj2xg86IEg2
	AWonNNNzBxg6Nq1LMApwjyyA+nL/dsdDUr8XgibOV0ma6A2y8wLOEKu2K2T2LcsbaRiA3s1gNJJIU
	1cwtNfMA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtMO-0000000D6Vh-1eBU
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 16:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75A475C580C;
	Tue, 12 Nov 2024 16:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16A6C4CECD;
	Tue, 12 Nov 2024 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731427396;
	bh=8G4W4n8t/inFGN91oJVtFV80XrFO1IiQUQJw1iuNLMY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ePK04v5nYEEI+lmSdA6zIJe3gquqkdyAFnF7LiP9ZS3oRVBhMEkRQgqd3Q3EQypql
	 9hJw/cg2tOZzX+4dEL7RCeSMq7I1EoKzZ07ZD0xPGXJDZ7x4IMseeJwOmhMjhGWL2d
	 cC2HYrNlK3N4l1EqSjOYbqeox+17r09cM0dwAcAx7wMOKBZIMj12dqN1nBfqprM6bv
	 ZKRxgEwYSwUw2C9IKjOyrECSnKR/sQC5br73qnFAnAkDvnhWl3UV3A5Y/E7rob4Flo
	 nsEJGIWbLVCR/YYAzUXD5HksqcqdRfyDUxQiHMFqMkKAQ2P6b3yq+D4NcxMDzsZ/0q
	 WhwbCHTCHUb/w==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
References: <20241106142617.660901-1-kvalo@kernel.org>
	<20241106142617.660901-2-kvalo@kernel.org>
	<f75d7222-514b-4c6f-985d-e6ffd67e317a@quicinc.com>
Date: Tue, 12 Nov 2024 18:03:13 +0200
In-Reply-To: <f75d7222-514b-4c6f-985d-e6ffd67e317a@quicinc.com> (Baochen
	Qiang's message of "Thu, 7 Nov 2024 10:26:56 +0800")
Message-ID: <877c984eym.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_160320_647555_22F7E968 
X-CRM114-Status: GOOD (  13.28  )
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

> On 11/6/2024 10:26 PM, Kalle Valo wrote:
>> +static int ath12k_mac_assign_link_sta(struct ath12k_hw *ah,
>> +				      struct ath12k_sta *ahsta,
>> +				      struct ath12k_link_sta *arsta,
>> +				      struct ath12k_vif *ahvif,
>> +				      u8 link_id)
>> +{
>> +	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
>> +	struct ieee80211_link_sta *link_sta;
>> +	struct ath12k_link_vif *arvif;
>> +
>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>> +
>> +	if (!arsta || link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
>> +		return -EINVAL;
>> +
>> +	arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
>> +	if (!arvif)
>> +		return -EINVAL;
>> +
>> +	memset(arsta, 0, sizeof(*arsta));
>> +
>> +	link_sta = wiphy_dereference(ah->hw->wiphy, sta->link[link_id]);
>> +	if (!link_sta)
>> +		return -EINVAL;
>> +
>> +	ether_addr_copy(arsta->addr, link_sta->addr);
>> +
>> +	/* logical index of the link sta in order of creation */
>> +	arsta->link_idx = ahsta->num_peer++;
>> +
>> +	arsta->link_id = link_id;
>> +	ahsta->links_map |= BIT(arsta->link_id);
>
> would be better to put this after rcu_assign_pointer()?

My thinking is that it's racy anyway so it doesn't really matter.
links_map is not really protected properly right now but luckily there's
only one function which accesses outside of the wiphy lock. My plan is
to fix that in a later patch.

>> +	arsta->arvif = arvif;
>> +	arsta->ahsta = ahsta;
>> +	arsta->state = IEEE80211_STA_NONE;
>> +	wiphy_work_init(&arsta->update_wk, ath12k_sta_rc_update_wk);
>> +
>> +	rcu_assign_pointer(ahsta->link[link_id], arsta);
>> +
>> +	synchronize_rcu();
>
> what are we waiting for here?

That's a good question. I didn't analyse that thoroughly but I'm just
making sure here that all readers have access to the new arsta before we
return to mac80211. The delay shouldn't be that long anyway, I hope.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


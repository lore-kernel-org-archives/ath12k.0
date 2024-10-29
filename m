Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC540D3A676
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57IL6V/5LP03jIKa2vLAgr72fWHbly5Wb7QR1g5uBvo=; b=FCZm6GU2cVHfmlC3CB37ZrgIvi
	JVtB4EFW/dHgCW/DkCXrfZXQGds9P1F1Wbxh/P8L83IZUz9SdkIMQCaV0vWHVLBtwgVW0gHITZQEo
	PGmmng8edgMrftJcucv58gBc9duTjiZpsiOKZNn+vF9IrQ/CXUhJWND4jg1Q2DUPLbOxDr+JruC9I
	lzQ+Tq59eCqjIi9iMHN2xcLujhxaQSetoMw3UCg8odJ4uwnxNmi3pXTEqOrqTluTcKv1auN2K5mt/
	y2y/AH8e2iW4tqr5iUcdxN6PdQL2onPa6UWuqmM8swRJspXb3vxF6/KNWIK6KMPUwBoYGm0Tw2k6g
	heDDGekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q83-0000000FHc7-2Fvo
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 17:35:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oA5-0000000EvsJ-38zN
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 15:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D74C4A418A8;
	Tue, 29 Oct 2024 15:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8185C4CECD;
	Tue, 29 Oct 2024 15:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730215776;
	bh=jVF6P/ogG/ibV5uI1RXvZ7DnU+aL+cl/ZwkSts+NohQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fKEDQhhgDmqVAgseHSYznUlusXemNhmPICz1kjOqP7nnqbsnjvdNhCIGkBDiNn+jl
	 3SeIXXcenkeISNrJqmI/hTR4aZ3sHEHPmoi08RgrBduLKWYo7uziGf0ArFVNQp1JQK
	 iPGmeLGwo5xYYEOYsQspsagsAqL5FDQZAeLud/WCP+ouEfRBx8erHXyZsLnacya1ky
	 zeUD9LDhUqHUFIwvZoiiVMXz20dOpkAkjFESP7QmhI4q107bvcN8M8Jwn8FN/oENHS
	 yUuu++lG1y9SETYELq0ccxu0/rFYJWd+YSQwbhnXFoGyVxjAMgXGBzP/UaKCDjFXeB
	 DlbyvGqq9gVJA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 3/8] wifi: ath12k: Refactor sta state machine
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-4-kvalo@kernel.org>
	<a4b92b80-ec57-4db3-acd7-9c6c7644d7c9@quicinc.com>
Date: Tue, 29 Oct 2024 17:29:33 +0200
In-Reply-To: <a4b92b80-ec57-4db3-acd7-9c6c7644d7c9@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 08:38:09 -0700")
Message-ID: <87a5engc6a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_082937_956649_603BE360 
X-CRM114-Status: GOOD (  19.54  )
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
>> +static void ath12k_mac_station_post_remove(struct ath12k *ar,
>> +					   struct ath12k_link_vif *arvif,
>> +					   struct ath12k_link_sta *arsta)
>> +{
>> +	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
>> +	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
>> +	struct ath12k_sta *ahsta = arsta->ahsta;
>> +	struct ath12k_peer *peer;
>> +
>> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>> +
>> +	ath12k_mac_dec_num_stations(arvif, arsta);
>> +
>> +	spin_lock_bh(&ar->ab->base_lock);
>> +
>> +	peer = ath12k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
>> +	if (peer && peer->sta == sta) {
>> +		ath12k_warn(ar->ab, "Found peer entry %pM n vdev %i after it was supposedly removed\n",
>> +			    vif->addr, arvif->vdev_id);
>> +		peer->sta = NULL;
>> +		list_del(&peer->list);
>> +		kfree(peer);
>> +		ar->num_peers--;
>> +	}
>> +
>> +	spin_unlock_bh(&ar->ab->base_lock);
>> +
>> +	kfree(arsta->rx_stats);
>> +	arsta->rx_stats = NULL;
>> +
>> +	if (arsta->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
>> +		rcu_assign_pointer(ahsta->link[arsta->link_id], NULL);
>> +		synchronize_rcu();
>
> I've mentioned this in the past in some internal discussion and seems now is a
> good time to bring this to light.
>
> It concerns me that this happens so late in the process. In theory another
> thread could already have a valid arsta pointer and could be trying to
> dereference that pointer while the code above is destroying underlying data
> (i.e. arsta->rx_stats).
>
> Should we set this to NULL and synchronize RCU at the beginning of the process
> so that we know all access to the struct has finished before we start
> destroying the data?
>
> Or can this not actually happen in practice due to other synchronization
> mechansims? And if so, should we document that somewhere?

I think you are correct, AFAICS the kfree(arsta->rx_stats) should be
after synchronize_rcu(). But this race was already in the code before
this patch so we need to fix in a separate patch. I have added this to
my todo list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


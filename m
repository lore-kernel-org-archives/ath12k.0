Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71736D10BEC
	for <ath12k@archiver.kernel.org>; Sat, 26 Oct 2024 09:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btuFwdi+NfuAQ8uNsSIeJuVZklWu4qKd6lUc99MXsVM=; b=SDOkt0dmL0c3Q+t2RitaOa9S2j
	4LjSE7BAX7I8NLmwPju71qCnDRacj2lLiHCg0FDVXfkQfn/dn/HAh3I98v5acll8PXt13G3vd5mwO
	QMwOUaap4oopvnefQoBLBJK6+h7DLkD0yBNdWRzvQW+s1ytE4R9AxzEULZev4CRgXRJYoZ8IBK3v7
	LQIPDXr6sO1d20zNkbh8vWAlcf224DFhHC2UvyoBDAxykqeFHzjAn4uGafw9qBSqq3DrRRO9jdUYM
	Crs4B/4pKuE5crL5hsqLv02Vys12j2mdRjLx5r2+49eO42rqSG2ARVsXwKswNqRWbwEcpjw6YDBg5
	KqRqWe1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4cms-00000006Gka-3SbB
	for ath12k@archiver.kernel.org;
	Sat, 26 Oct 2024 09:08:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4cmp-00000006Gk7-1Wzw
	for ath12k@lists.infradead.org;
	Sat, 26 Oct 2024 09:08:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14C815C4CFB;
	Sat, 26 Oct 2024 09:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B517C4CEC6;
	Sat, 26 Oct 2024 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729933721;
	bh=MbVYq5hP582/qyZUS1tqQD3SG2ii9UrEUkQvpbS/jLE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ij1JNBhb2toHdck78qZ13KU3D4f0OmZljPlCtnHY4Rm0piNHUzBQLKSvWMMkYQfxz
	 DNq2wg+6RZvO64GD63O+gQjoT0DEaFwfXed1L7UeANUeIJVCE4LdyMDCV9zKKC4sJb
	 B7kKkVxum1wgwJONabJWoigxFNd/MaejU2eZZmx4hRxM3MtKtBmnSL9IxE/fYfifxc
	 y31C/z1Gi7XHFrvJf11J1U3iU2nnksPbVOal8qQoMBXe8NPBTYMKzppuItFbjRK+a1
	 78dEAkBanNccZUpOeDVR5LY9k/A/klay3Sv3tqdnNvgNRPnc2UMPaBqJMyutC4Llnm
	 5ps7oIBRdeltg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 3/8] wifi: ath12k: Refactor sta state machine
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-4-kvalo@kernel.org>
	<e886a4c0-14f9-4299-97ef-f8cd811c94e6@quicinc.com>
Date: Sat, 26 Oct 2024 12:08:39 +0300
In-Reply-To: <e886a4c0-14f9-4299-97ef-f8cd811c94e6@quicinc.com> (Baochen
	Qiang's message of "Thu, 24 Oct 2024 10:58:56 +0800")
Message-ID: <87o737kz8o.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_020843_472230_B01A60B1 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

> On 10/23/2024 9:29 PM, Kalle Valo wrote:
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
>> +		ahsta->links_map &= ~(BIT(arsta->link_id));
>
> should we put this ahead of rcu_assign_pointer()?

I agree, I'll do that in v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


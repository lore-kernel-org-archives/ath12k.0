Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804DCD10BE8
	for <ath12k@archiver.kernel.org>; Sat, 26 Oct 2024 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6IhPoDGMKs+7Qxk1bsDBL0Ez1rOSmtAt4hk1GXrkZs=; b=lV1r6KNgNyEQtFowVUTqtsu4j1
	Q6y+G4GWwaL959BvQE0ALg0w3p23VEpXMxG7YpOky1M8Gpqj5jgXWf+aLuL4f/KJbr7dkC4JShIAD
	Me5oNnrVGOY00AnCvWMYkr0z7bX1oeSyQQVA/uEiWu7KP8z930cR1diUjSbHSQ76QfZz+TWalPuoL
	34xGCmmwTtSBaSQNbhfnM+yKfHkxcBi6ES4eEoRvuRU7IxXDe8/+wnOaxdYEVooG2K9HlF9zmNM6C
	BKvF/iNv9t0eQLGJOsgVlygFurE7E9mnVSDYImlSTC6T6o98+vm/FGVclq6XMdYhM9+V0I2irDsmY
	R8vMiUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4cny-00000006Gvn-0Xhc
	for ath12k@archiver.kernel.org;
	Sat, 26 Oct 2024 09:09:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4cnu-00000006GvL-40FN
	for ath12k@lists.infradead.org;
	Sat, 26 Oct 2024 09:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F9BDA400C4;
	Sat, 26 Oct 2024 09:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AD1C4CEC6;
	Sat, 26 Oct 2024 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729933789;
	bh=GdSlBnU5mW6xXp7829fFirSG7AH/4sa35q2q65bh1/s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tjjKXTx0EDLJyDpYwqmlLteJi+DSeja8xk4hYcKLiiSMmkaVGEbnCraatkjjL1zuu
	 imPrDTldw0ciFXEVWEcS70Ub3pSpLp6MSmyIXAEwSzfwICG5gfGypna8FwCntoVYy5
	 dwODwT4cykaZ2sYAwthcqnujcfF+xmEiJzol1KXbMCjx0OQqqCBbjfiU+NksISL6Xc
	 T/huWa0jpcrC56wnd4KpfzNhg0anw2rCWgl0SU7UEJTfrMPO9s9828CAH26eR26P1+
	 Fi3muMxnTIX+iqHE16DZRSodRNPNR9bwoZJU6kQQbZQhdgBOps5Wk7i1S/IpmJslpw
	 DRUqmGJngQujQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 5/8] wifi: ath12k: Add helpers for multi link peer
 creation and deletion
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-6-kvalo@kernel.org>
	<fdcc379d-b5ac-4554-8963-55653337db61@quicinc.com>
Date: Sat, 26 Oct 2024 12:09:46 +0300
In-Reply-To: <fdcc379d-b5ac-4554-8963-55653337db61@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 08:43:44 -0700")
Message-ID: <87jzdvkz6t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_020951_078333_50F52520 
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/23/2024 6:30 AM, Kalle Valo wrote:
>> From: Sriram R <quic_srirrama@quicinc.com>
>> 
>> Add helper functions for multi link peer addition and deletion. And add address
>> validation to ensure we are not creating link peers (belonging to different
>> clients) with same MLD address. To aid in this validation for faster lookup,
>> add a new list of ML peers to struct ath12k_hw::ml_peers and use the same for
>> parsing for the above address validation use cases.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
>> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
> ...
>> +int ath12k_peer_mlo_create(struct ath12k_hw *ah, struct ieee80211_sta *sta)
>> +{
>> +	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
>> +	struct ath12k_ml_peer *ml_peer;
>> +
>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>> +
>> +	if (!sta->mlo)
>> +		return -EINVAL;
>> +
>> +	ml_peer = ath12k_ml_peer_find(ah, sta->addr);
>> +	if (ml_peer) {
>> +		ath12k_hw_warn(ah, "ML peer (%d) exists already, unable to add new entry for %pM",
>
> The Linux coding style says:
> Printing numbers in parentheses (%d) adds no value and should be avoided.

Good point, I'll remove them.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


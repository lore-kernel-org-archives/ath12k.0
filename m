Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31280D3A661
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI8EH+4MuZwHmT3NZ1/UFKQ52kbUmtwfRIE+bHNBY3s=; b=raWt596dW50wAVfUL9j9sGS4Q1
	pQCyQst2QH1V0Ej5cgqMcNlycmF90QKywZsyWnOkYABWzYk/w6d9TTCfON1tRG8vIMm3XG0dlhAnI
	yfF2qoIX3nhFTI7xKUgwZ/2MxSqb1PqC2JDjBb4R6LI2OqpVZBpEsXLFnlb3jojLAzn3ABPjoK7/P
	CmLO9luydWoAGjZZ5cMjBqK9zDWKVxNiqDFZBsbEIa8G31QU13UUtOrcYEFrssyryd8Lb9HmPK2Ok
	vtK3rN2szoUtPMDLqAvhfjeqSyAUFohpcOiTMFe7blskqf0ApJilVQhlkq/XePOZO3grQVS5ofzFk
	klmfXoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oXf-0000000F1CX-3jka
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 15:53:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oIX-0000000Ex5h-3R4a
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 15:38:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31131A42A34;
	Tue, 29 Oct 2024 15:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE452C4CECD;
	Tue, 29 Oct 2024 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730216300;
	bh=7koc/GFdhTZdrZ0NcZyL5CVWROPPIVBdXCdcDMNX7nQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jwc0OTsMz+5dZu9WOLGpG7j1ctZehTtE0+zFlkQlV/IuxStxXYNY/uUSAguHFd2W+
	 TFDXWLnPOJZSJ9BRn7a0p4458IYujLrZZvR38rvDbivuUmRM+Vq2MmzdIAVWNOnBlY
	 LYjhehcVb7Xr8V213wAvMm7HlSOyhpOSrbLmk0ex0q3L5nPTgR8KATgB2rUKzNRjcR
	 RkDxQ0Sha65gQI1s8qPgR/OjZIlDG4aNInmzjoPjZWHCiO79ZDXT28gA57H8SxiE5k
	 94ax96frk7sQTydU3xpVt8SfmLYbMOVwkhcN2MCAg3joBdImIsDP8igaWbEA8HYM8R
	 hpb/bZReH3fYw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Aditya Kumar Singh
 <quic_adisi@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 3/8] wifi: ath12k: Refactor sta state machine
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-4-kvalo@kernel.org>
	<a4b92b80-ec57-4db3-acd7-9c6c7644d7c9@quicinc.com>
Date: Tue, 29 Oct 2024 17:38:18 +0200
In-Reply-To: <a4b92b80-ec57-4db3-acd7-9c6c7644d7c9@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 08:38:09 -0700")
Message-ID: <875xpahqc5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_083821_952550_F8CDE69A 
X-CRM114-Status: UNSURE (   9.26  )
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

+ aditya

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

>> +static int ath12k_mac_station_unauthorize(struct ath12k *ar,
>> +					  struct ath12k_link_vif *arvif,
>> +					  struct ath12k_link_sta *arsta)
>> +{
>> +	struct ath12k_peer *peer;
>> +	int ret;
>> +
>> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>> +
>> +	spin_lock_bh(&ar->ab->base_lock);
>> +
>> +	peer = ath12k_peer_find(ar->ab, arvif->vdev_id, arsta->addr);
>> +	if (peer)
>> +		peer->is_authorized = false;
>> +
>> +	spin_unlock_bh(&ar->ab->base_lock);
>> +
>> +	/* Driver should clear the peer keys during mac80211's ref ptr
>> +	 * gets cleared in __sta_info_destroy_part2 (trans from
>> +	 * IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC)
>
> I'm unable to understand this comment

Indeed, that's weird. Aditya, do you have any idea what the comment is
trying to say?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


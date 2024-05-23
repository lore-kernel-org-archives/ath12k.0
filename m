Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC39CC25B79
	for <ath12k@archiver.kernel.org>; Thu, 23 May 2024 12:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NH5MqAH8ivRyv9bLoOfIcBVM00gTkUcxV9FFHpWaAt4=; b=UkStA4uUc2FH81pDFOIbJX5HOu
	9znUHy1lLv4KsEBqW2Tjuv1tfJgLVCV9Ms5k6g0rv5TVoxAwJhB6jNLCdeEYwqKTRMvy/1+OSwy3j
	nVGl9oXo/1010SOQOpGx/8dIaxcdgZ0Y0ntldi1Q5GZkFhQL55lnlKHCtL3rAKXQD2E8guFI9ek3k
	/x9WmPKJgwYU1t3Es9+7g3ciwE60RM+hgrgXZCNhWec0sv18lRVXqGWR1VCpWXkhcDgaogJNj5hn+
	ikNBcmXZobM1OUFDs4txiatqDmsg0usDaUXETKuB4LQ3FMS1tTzeM8CCmSgMORLU51qT89M8O4tnC
	ixMrsfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7yl-00000006HiD-1vPC
	for ath12k@archiver.kernel.org;
	Thu, 23 May 2024 12:55:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7yi-00000006Hhn-2G92
	for ath12k@lists.infradead.org;
	Thu, 23 May 2024 12:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDA7762DFE;
	Thu, 23 May 2024 12:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A00C2BD10;
	Thu, 23 May 2024 12:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716468927;
	bh=H7x7rZBnnIHpTamBE2p08RqJBe/ZOmnl1rL5sp92f+o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Tn9j6Nu5RWnGvfsSGyOmDKzefvjhvyHI4uqR8rZPPlogww0Ou3J9BoJqwCkAubZtW
	 qoeummKv2LkMNhUby0fAhy9O9qziJtmB6TLxoyb6EZlgifTJI8b4XsJZ9KGVLAfHnb
	 AoqeQmqlhs4Z2kzSa7ZsX+fdqKSeRsVw2393jszKf4GYikJYYcKB9ihK1xEtpVav6C
	 ITEmvJF253nv5613BVt4db7s1wwYFJtjijODLZl+0ZlzM2dzlqkCsMvDckF7MchgSJ
	 lRkAyDrcuQOVKv87fVYrNuqlgDjksNNh792c3GTt0GNVuv+bK0q5N11Zed3zs98oe7
	 Ofi0UsDiwZDbw==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] wifi: ath12k: Fix Pdev id in HTT stats request
 for WCN7850
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
	<20240510050806.514126-4-quic_rgnanase@quicinc.com>
	<87pltfd2bt.fsf@kernel.org>
	<667cea80-9b62-4ca4-9d28-c5940582832a@quicinc.com>
Date: Thu, 23 May 2024 15:55:24 +0300
In-Reply-To: <667cea80-9b62-4ca4-9d28-c5940582832a@quicinc.com> (Lingbo Kong's
	message of "Thu, 23 May 2024 20:34:51 +0800")
Message-ID: <87ed9sbscj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_055528_655606_AB97C7D7 
X-CRM114-Status: UNSURE (   9.31  )
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

Lingbo Kong <quic_lingbok@quicinc.com> writes:

>>> +struct ath12k_vif *ath12k_mac_get_vif_up(struct ath12k_base *ab)
>>> +{
>>> +	struct ath12k *ar;
>>> +	struct ath12k_pdev *pdev;
>>> +	struct ath12k_vif *arvif;
>>> +	int i;
>>> +
>>> +	for (i = 0; i < ab->num_radios; i++) {
>>> +		pdev = &ab->pdevs[i];
>>> +		ar = pdev->ar;
>>> +		list_for_each_entry(arvif, &ar->arvifs, list) {
>>> +			if (arvif->is_up)
>>> +				return arvif;
>>> +		}
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>> I'm not seeing any protection here, is that on purpose?
>
> you means there need to add lockdep_assert_held(&ar->conf_mutex)?

I mean what's the locking design here? Is it safe to concurrectly access
ab->pdevs and arvif->is_up?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


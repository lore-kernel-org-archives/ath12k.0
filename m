Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9657D78779
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xPmND0lF4pfvvWChQagcPeHJ7yws0udHjev7G3eH1w=; b=XvSOfciTFxhzlWEWsXGzYDs479
	yyhNqORny+ytxbx535pPK62eovJBVccmRcIZhMnwI6tJKiR9g1+nkWQpmMwrfQVBri/x0kSr7NyNR
	iQJewdipxJ54BJ4c9eLSn0okik/tXv0IgbJ7RFAiF3Tf9/Cm2YD7OsqkF6h5n73Kh0ZoEt2OqVJ7z
	8QwStuLGEa2KjgQYD1shyy29qeLLhITUEaw9HvDRDOQFh2cCI543/4N0OksXkl5f6ODAmFzdUz9rd
	DHElF+3IrwxNCMf9JIup+anW3PLN/z2jaDEGrrDaxnrDlunT4ROW0qu05uVTeJSiibx7naFOBQqbL
	tNTHcNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8Wt-00000000GLV-2PTw
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 14:51:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8Wr-00000000GK6-13Te
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 14:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24828A40805;
	Thu, 21 Nov 2024 14:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DDCC4CECC;
	Thu, 21 Nov 2024 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732200692;
	bh=LngvGLFZC5Qou5Dlop/OMXQo8eWU8KDZaEVR0Requvs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=g4JNW5KYADtwNCUdxfO2dazs6BM0Eo6zK23MtkcpjV9Pl1nTUYiV2viZaolwCuS1h
	 xux8VSpZ0rvk0Pw2+Y26B9Co/1g/7hGViCDY4TJJIZw+W7MzJwlzdHWEY6QGeccmQa
	 1bPJZyysepzJIwqq0yH1JVCEa/+VUyLY77zM9ZyVilVneOVvSsBUhPh0tBpEpFudOA
	 KLHAXz3WeayeRjq+BVRMx4fDY0SD2vFWemOUsvYv/Ll9e15vmb7mUGP1ZFrVI+9Rbh
	 yAOB3FhI1eYDeCpr4J8eTuwT0QHR4NT23rlgT7y2GIvk4gog+mb/ooWNuGtEW/N9gG
	 gBxH4I4jBdnxg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
References: <20241106142617.660901-1-kvalo@kernel.org>
	<20241106142617.660901-2-kvalo@kernel.org>
	<2e706d58-5d83-4867-9963-c62441cdd4da@quicinc.com>
	<87y11o2x9h.fsf@kernel.org>
	<97f3f465-6ebd-4ca1-b672-4c8c7f42220d@quicinc.com>
	<87bjy9zonx.fsf@kernel.org>
	<d7a0d62c-4723-4e9f-a362-2ea51aaba3ed@quicinc.com>
Date: Thu, 21 Nov 2024 16:51:29 +0200
In-Reply-To: <d7a0d62c-4723-4e9f-a362-2ea51aaba3ed@quicinc.com> (Baochen
	Qiang's message of "Thu, 21 Nov 2024 11:35:30 +0800")
Message-ID: <87jzcwwsge.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_065133_353974_0AEF915B 
X-CRM114-Status: UNSURE (   7.39  )
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

>> Ok, I think I now get what you mean. Does this look better:
>> 
>> static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
>> 					      struct ath12k_sta *ahsta,
>> 					      u8 link_id)
>> {
>> 	struct ath12k_link_sta *arsta;
>> 
>> 	lockdep_assert_wiphy(ah->hw->wiphy);
>> 
>> 	if (WARN_ON(link_id >= IEEE80211_MLD_MAX_NUM_LINKS))
>> 		return;
>> 
>> 	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
>> 	if (WARN_ON(!arsta))
>> 		return;
>> 
>> 	ahsta->links_map &= ~BIT(link_id);
>> 	rcu_assign_pointer(ahsta->link[link_id], NULL);
>
> below synchronize_rcu() should be moved to here, such that any change
> to arsta can happen only AFTER all existing RCU readers finish
> accessing it.

Good point, I'll move it.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


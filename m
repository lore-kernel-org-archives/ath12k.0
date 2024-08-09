Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC8CC3DA4A
	for <ath12k@archiver.kernel.org>; Fri,  9 Aug 2024 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0hiVudNQfmB8nlre1ocxtsPzApkAvzHY36BfVzleXk=; b=pA/kQzxzYZ5ycmTbxOvqzAFI/v
	/qk4mAZtXX0wn2F5rSJa4GmxibvaPbkDYSLwDAV6vEr1nV0TLNF6JZv0QDDkUQa3Ig8IxZXYwvgqS
	j64bweTWTLlmOHsPke8lOUfP5H2w85z3pkk5+zTPAiMnqL7gJZ+WwnltD6gCiHekNIyLYPMejutDr
	98y/PFLioy8/sphJxlXdWT6F1MNmD/MFTxjWktyM5zovV+08fz400sLERmFAy9VopkSIn8b6PDIth
	bjSPJwfJdB1zhg/u+L8N8ZV+WTd3jKSX7sljS2qYkXAizCmpb8ANqvJdHr72ct1JpPLmolC7EmnHi
	RpGtGU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQcg-0000000BY5R-0LWh
	for ath12k@archiver.kernel.org;
	Fri, 09 Aug 2024 14:29:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQc9-0000000BXvz-0q3p
	for ath12k@lists.infradead.org;
	Fri, 09 Aug 2024 14:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4808961645;
	Fri,  9 Aug 2024 14:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D31AC4AF0E;
	Fri,  9 Aug 2024 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723213748;
	bh=1DpMIwjYrxzhcdFiyt6vv5L5bslGMP21p/QGue97o+I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Biu17mnn57A5Mv1km4BvauhVsPdR9zEpZxQ3umEJbDQualSozkC+ddqeJ1vsNhFFb
	 HcehSlbEWiw2UXUc+b0jDxC3P8Suj/eI55geDec3kzup0hL5hfvz/yfCjjrTxonkqA
	 GxzZxLsWPw4ZCTyX/rXVs9RySLMNXbJBl2CLIO+0GjtxP25axl/+VZZg/TQWmyx4Qj
	 wRf0DCGMdxZUNoW0H7ZUR38/ZfEBXFaZj4Ugu1J1b9Yjt572xzFcQgtHzVkigpppr6
	 AtKAOWoY0i0RC8wp8F2eBVRDQ0fLI5ZvqEMaQmA5HM9u5djeujqx6Agd4OSith2uYF
	 Zh8x6wuLeFjkA==
From: Kalle Valo <kvalo@kernel.org>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram
 R <quic_srirrama@quicinc.com>
Subject: Re: [PATCH v6 1/3] wifi: ath12k: prepare vif data structure for MLO
 handling
References: <20240711165511.3100433-1-quic_ramess@quicinc.com>
	<20240711165511.3100433-2-quic_ramess@quicinc.com>
	<87frrj70nz.fsf@kernel.org> <87sevf2seg.fsf@kernel.org>
	<2b78c227-ef2e-4d98-baf3-762e4f5bd155@quicinc.com>
Date: Fri, 09 Aug 2024 17:29:05 +0300
In-Reply-To: <2b78c227-ef2e-4d98-baf3-762e4f5bd155@quicinc.com> (Rameshkumar
	Sundaram's message of "Thu, 8 Aug 2024 22:12:26 +0530")
Message-ID: <87bk213h3i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_072909_372476_3BFFC94A 
X-CRM114-Status: GOOD (  15.12  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:

> On 8/8/2024 4:27 PM, Kalle Valo wrote:
>> Kalle Valo <kvalo@kernel.org> writes:
>> 
>>> Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:
>>>
>>>> Locking:
>>>>   Currently modifications to members of arvif and arsta are
>>>> protected by ar->conf_mutex
>>>>   and it stays as such.
>>>>   Now with these hw level structure (ahvif) being introduced, any modifications
>>>>   to its members and link objects (i.e., arvifs[] which are dynamically allocated)
>>>>   needs to be protected for writing and ah->conf_mutex is used for the same.
>>>>   Also, atomic contexts(say WMI events and certain mac_ops) that
>>>> we currently have in driver
>>>>   will not(shouldn't be allowed) do any modifications but can read them and
>>>>   rcu_read_lock() is used for the same.
>>>
>>> Please elaborate more about your locking design. Because of past bad
>>> contributions from Qualcomm the bar is really high for adding any new
>>> locks. I'm doing the locking analysis right now but it would help a lot
>>> if you could provide your own analysis.
>
> The new ah->conf_mutex is particularly introduced to protect the
> members and dynamically allocated link objects of ahvif and ahsta
> (ahvif/sta->links[]) in process context (i.e. between call backs from
> mac80211 and ath12k's workers)
> The same is protected by rcu in case of atomic contexts(tasklets of
> WMI and in datapath)

I need more info than that. I can't understand which conf_mutex protects
what data exactly, currently it just looks random to me.

Let's take an example:

static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
...
	mutex_lock(&ah->conf_mutex);
	arvif = &ahvif->deflink;
	ar = ath12k_get_ar_by_vif(hw, vif);
	if (!ar) {
		cache = ath12k_arvif_get_cache(arvif);
...

	mutex_lock(&ar->conf_mutex);

	ath12k_mac_bss_info_changed(ar, arvif, info, changed);

So first mac80211 calls ath12k_mac_op_bss_info_changed() with wiphy
mutex held. Then ath12k takes ah->conf_mutex and soon after also
ar->conf_mutex. So we are basically holding three locks and it's not
clear for me the difference between ah and ar mutexes. For example, do
ath12k_get_ar_by_vif() & ath12k_arvif_get_cache() require ah->conf_mutex
to be held? Or why are we taking it here?

I guess ahvif->deflink access does not require any protection because in
ath12k_mac_op_tx() we access ahvif->deflink without any protection:

	struct ath12k_link_vif *arvif = &ahvif->deflink;

Anyway, I just could not understand this locking design and besides it
just looks uncessarily complex. I propose dropping the new conf_mutex in
this patchset altogether and handle the locking in a separate patchset
later on.

AFAICS removing ah->conf_mutex from this patchset should be safe as
mac80211 is holding the wiphy mutex already. Of course I might have
missed something but at least that's what it looks like.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


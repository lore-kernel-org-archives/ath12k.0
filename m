Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8621FD42BB7
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 17:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1LcuHVhF5bY0aDH8f1404p81yQJf6phZUrEZiz7DFQ=; b=vZKEE+90Hks8eb/TWojO4dxYvi
	6y2gPxn0/QGl0DEP3oQxXPYlDjIWXu3GxQj3p8+hwiAxnRQL8fDjkaKLKDOPn0CVrTX/9z/uw4nQt
	hFXRTwdEqsIK/CubnVC/f+6pQyXKRRoUeUPVOc3wWXS8TmmthdncaWQahd2pSL/E5i9K6r7aJI8Xv
	R/P9zA9tDYK8WO1TWDiL9NWhRwrmPVuzTdDAqiaCz10Lcegwld+2CNHOg7Ii3Y1Fa2ANFh/24g4Jm
	KYMCsUpvzDMRwPpl/a1UuIWhEWPkXvTRwrfP5rsPpngB7gF6Tv9tA4VykmF8zIKtyRhWrRPi27Qll
	D+/cpCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuo5-00000004OMP-14WX
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 17:36:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuPm-00000004Io3-1WUL
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 17:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05A565C137D;
	Tue, 12 Nov 2024 17:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0BFC4CECD;
	Tue, 12 Nov 2024 17:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731431453;
	bh=9bdSwINWYk5CZRoQUnoiwG9Ag0Qrlyljvolp9cXLSgM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gY90mmDlrqH/xJlfTU0pi9st/Pg4oMo5XQt5Zd/FXQEFNsW/PyuviEqn8sqgln9tz
	 OvXDoZI3Yj5HZXnn4Hnsu0d8rPoGwfM5plszqeGoZoB9HZ2A7KoRfazDCAhJPBp2eE
	 v7VKGRIIyFA4GJo42XTPvNcbl3jJo+j1XVxtTH9DjKCAO6PFKZen21d5siaxcsvrZb
	 5M8v4GzK2TxaIyYW+tL2Nkenlru8k4TJsWvzFeK4KPt1N+lbzK5ssiktoPjdZLmm1k
	 RKreVYPdsxKWW632LtK9ebXJKagutEBellsilFr/63mA6TNMXWwsJtynBXRkaqmN2m
	 rj1dqKmpUdolQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
References: <20241106142617.660901-1-kvalo@kernel.org>
	<20241106142617.660901-2-kvalo@kernel.org>
	<2e706d58-5d83-4867-9963-c62441cdd4da@quicinc.com>
Date: Tue, 12 Nov 2024 19:10:50 +0200
In-Reply-To: <2e706d58-5d83-4867-9963-c62441cdd4da@quicinc.com> (Baochen
	Qiang's message of "Thu, 7 Nov 2024 10:45:07 +0800")
Message-ID: <87y11o2x9h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_091054_524549_F4CF7ACE 
X-CRM114-Status: GOOD (  16.13  )
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
>> +static void ath12k_mac_unassign_link_sta(struct ath12k_hw *ah,
>> +					 struct ath12k_sta *ahsta,
>> +					 u8 link_id)
>> +{
>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>> +
>> +	ahsta->links_map &= ~BIT(link_id);
>> +	rcu_assign_pointer(ahsta->link[link_id], NULL);
>> +
>> +	synchronize_rcu();
>
> this looks strange: generally we call synchronize_rcu() to wait for
> any RCU readers to finish, such that we can then safely free
> something. but here we do nothing ...

Same comment as in the other email, this is to make sure that we don't
continue the mac80211 call flow before all readers have the new value.
Is that a problem? And we can always optimise later.

>> +static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
>> +					      struct ath12k_sta *ahsta,
>> +					      u8 link_id)
>> +{
>> +	struct ath12k_link_sta *arsta;
>> +
>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>> +
>> +	if (WARN_ON(link_id >= IEEE80211_MLD_MAX_NUM_LINKS))
>> +		return;
>> +
>> +	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
>> +
>> +	if (WARN_ON(!arsta))
>> +		return;
>> +
>> +	ath12k_mac_unassign_link_sta(ah, ahsta, link_id);
>> +
>> +	arsta->link_id = ATH12K_INVALID_LINK_ID;
>> +	arsta->ahsta = NULL;
>> +	arsta->arvif = NULL;
>
> if arsta is not deflink and would be freed, can we avoid these
> cleanup?

I think that's something we can cleanup later if needed. Sure, it's
extra assignments but it's not really doing any harm.

>> +	if (arsta != &ahsta->deflink)
>> +		kfree(arsta);
>
> I know the actual free happens here, but why split them?

You mean why have a separate function ath12k_mac_unassign_link_sta() and
instead just have all code the in ath12k_mac_free_unassign_link_sta()?

> these two hunks give me the impression that we may (in the future?)
> have cases to call ath12k_mac_unassign_link_sta() alone somewhere else
> rather than directly calling ath12k_mac_free_unassign_link_sta(). am I
> feeling right? what are those cases?

At least I'm not aware of anything else calling
ath12k_mac_unassign_link_sta(). So I'll just remove that function and
move the code to ath12k_mac_free_unassign_link_sta().

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


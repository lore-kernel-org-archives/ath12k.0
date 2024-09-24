Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A3ACF9C71
	for <ath12k@archiver.kernel.org>; Tue, 24 Sep 2024 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9wOe+IO/eo+MAr1nVEI1JV0uxJldoPbeMrTpl+iu3c=; b=Wod6ThDrceL69a5PN5zyxSBp1v
	uYUME5cAXWFcSR2z+Pll2bvTDuI68bdt5isuwv52sPFWdEJJu62hhmmA0k1Z+estV1Eqbc89Gg5Jj
	C1c/EQ9uKaioSP3mlF8OcYzN77Rl7mmmL7+sp9KeqbZhnaoTkxd9vvFuq8fqL6pdXri2uxRFjgzCa
	4q4HPlcZ8ovX3+zO3XEDVuIdn8J4x0llSwrGWPN4KiYEQI+hjdMJguDj3kf6vlgOjR9BjI25dq46S
	XVx/EuUO101XAN1d+ddb6sg+I920Mgimel8sBsa7PSCxIp+pGWp3UmbNgDmBhL+BldP/CO/1VN8Cm
	LVq9nDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1bf-00000001kjy-45iG
	for ath12k@archiver.kernel.org;
	Tue, 24 Sep 2024 09:13:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1Zl-00000001kEy-2uSX
	for ath12k@lists.infradead.org;
	Tue, 24 Sep 2024 09:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C94D5C5477;
	Tue, 24 Sep 2024 09:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07964C4CEC4;
	Tue, 24 Sep 2024 09:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169076;
	bh=E+OVsVTME16mVT99zvFxAxUSip6UlzcwqZUbZKjr/Dw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qgf1IvBlVj19NZirdVOdPALXM09jI9ECp+/v7AjJhp62aazjb1Mn80VORcXEqxG5E
	 ZO/W1/oJ33i+5b55hwmyoRI3mnrIJoNJOA3qLnjVcQjSVCItmkYo2o/aeUH59aV3Xt
	 kd92rzHq2rkHjb+parUOJczWm1GPjpyRgVSA/0CDEiwqXGWf7qdfuFJw9w1N+SeifV
	 SVS1hGyPp6o97WB64C31dGYDMBCoKKZL4CE21+V8PwvGcaa2Qdu6mej7ZoeuuB91aD
	 IvFFPZO0HVSLJBKGLryspua7bo+bv4H1Dwj2ShZLDNA8ETRwt1s8HEXQef5aViNrjo
	 TWXLPPtNpTghQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/4] wifi: ath12k: switch to using wiphy_lock()
 and remove ar->conf_mutex
References: <20240918181042.91891-1-kvalo@kernel.org>
	<20240918181042.91891-2-kvalo@kernel.org>
	<33ea3a62b4257b6ef789c30fa8f7bf7e9f1865b5.camel@sipsolutions.net>
Date: Tue, 24 Sep 2024 12:11:14 +0300
In-Reply-To: <33ea3a62b4257b6ef789c30fa8f7bf7e9f1865b5.camel@sipsolutions.net>
	(Johannes Berg's message of "Thu, 19 Sep 2024 09:06:21 +0200")
Message-ID: <87o74da025.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_021117_845506_52E2C399 
X-CRM114-Status: GOOD (  29.52  )
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

Johannes Berg <johannes@sipsolutions.net> writes:

> On Wed, 2024-09-18 at 21:10 +0300, Kalle Valo wrote:
>> 
>> There is now a new sparse warning, but to keep this long patch simple the
>> labels will be cleaned up in following patches:
>> 
>> drivers/net/wireless/ath/ath12k/mac.c:6635:1: warning: statement expected after label
>
> I believe this is a compiler error on some compilers (in particular
> clang), so you probably need to combine patches a little bit.

I had actually already fixed this but forgot to update the commit
message, did that now in v3.

>> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
>> @@ -15,14 +15,14 @@ static ssize_t ath12k_write_simulate_radar(struct file *file,
>>  	struct ath12k *ar = file->private_data;
>>  	int ret;
>>  
>> -	mutex_lock(&ar->conf_mutex);
>> +	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
>
> I don't think this is an issue here, but I'm not sure if you're aware
> that in general, locking the wiphy mutex in some debugfs file handlers
> can lead to deadlocks, specifically if those files are later _removed_
> while holding the wiphy lock, as is e.g. the case for station, netdev
> and link debugfs files. For this, we have wiphy_locked_debugfs_read()
> and wiphy_locked_debugfs_write() [1].
>
> [1] you are not required to understand how they are implemented ;-)

Thanks, this is good to know. I'm not that worried about that, at least
it's not showing up in my tests, so my plan is to fix that in a separate
patchset.

>> @@ -4310,7 +4301,7 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>>  
>>  	spin_unlock_bh(&ar->data_lock);
>>  
>> -	mutex_lock(&ar->conf_mutex);
>> +	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
>
> Baochen already pointed out that you seem to not remove this later in
> patch 4, but in this patch alone you also introduce a bug (that lockdep
> should point out to you), which is that you cancel_work_sync() this in
> ath12k_mac_op_sta_state(), which clearly holds the wiphy mutex already.
>
> This causes a deadlock. It's fine after patch 4:
>
>>  	/* cancel must be done outside the mutex to avoid deadlock */
>>  	if ((old_state == IEEE80211_STA_NONE &&
>>  	     new_state == IEEE80211_STA_NOTEXIST))
>> -		cancel_work_sync(&arsta->update_wk);
>> +		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
>
> since for wiphy work it's required to ca<ll it with the mutex held./

Excellent find! I fixed it so that I moved this patch before switching
to use wiphy_lock(). There should not be a deadlock anymore, hopefully
:)

> You really should remove that comment too though, and perhaps then the
> code can be simplified by moving this to the later code also handling
> removal (none->notexist transition).

Good point. In v3 I added a new patch for this.

Thanks again for the review, I owe you so many beers[1] that it's starting
to get difficult to store them ;)

[1] https://en.wikipedia.org/wiki/Karhu_(beer)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


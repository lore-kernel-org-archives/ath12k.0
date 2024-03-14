Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294FDC54E5D
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 16:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYBnJ18XKwpAbOvEsmJL5tBfia+4M8Q1hVLJH5yybwM=; b=uZKu33jL4Qtz6a+qKaRXXaQRO2
	JzCyCxcLSBf/L4vHd8Gt2SYT+sNzIxGt3A6lGEo2ECp+0JLpLsGD5C+gGyYxxVgb7o9U7ztz2OWoT
	87SKmPb3R0GXHuoYDrdxZBKbxEJegi+YYGAdnJa9S4yTm7cq4WEPL1N9DBHbSNoExRsE9CLXeYDmd
	DL5tPa+PLyJ5ycuGM8qBJeNC9frtKRvFZJCph7QTt4FKQ7p4JLeiEC6PSPwvO/eDGzKaJtWsJHVVM
	JvqMfrpx8dGQKTJXXzEl+c2rmr0yP2jkiMBcz1+CWNnZHOpYjtM2ZvRMCQHLMfixYOiwV0eIYRrFt
	ArqIpkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkoCc-0000000F2fB-3hsC
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 16:45:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkoCZ-0000000F2e3-3EhH
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 16:45:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C814CCE1DFF;
	Thu, 14 Mar 2024 16:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D58DC433F1;
	Thu, 14 Mar 2024 16:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710434705;
	bh=3rUj+mXvS6cQYpRc7HsWZ1EgGhCgHVdn29FomCViicU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PvvSvmapt1obVEFRIEgdCGApBQKWx+t2FVCtYbnwFEC7JXMloJ78Cal02lQFQD7Sl
	 QYFn/tuRgDBS/rW4Z0CKhkxkEV1Ks0qNrMoC8hRGPrsAkMeFp+pEmbZJIBkMwrZwzC
	 MVPLiIy8Yj2qI4vL0Y+WekYRZm0JZeV1WkfgzxEJ55gajYibvVGgDEigZO+TIs5KEF
	 qexHDpgVTYBA3v7o3nU4MBCbFb/P++9iGb/eCmzIe7sVLOHavTsRVHXFQ8hh3Dfzbp
	 6E2bhPtyiEU8qEw8BwtYNAFMtiRIIfxClgX12qXghaGd04YyfehepzCPhSnlU6Nt26
	 w0Y+EutFr2XJQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,  Miri Korenblit
 <miriam.rachel.korenblit@intel.com>,  ath12k@lists.infradead.org
Subject: Re: [PATCH 2/2] wifi: iwlwifi: mvm: disable MLO for the time being
References: <20240314110951.b50f1dc4ec21.I656ddd8178eedb49dc5c6c0e70f8ce5807afb54f@changeid>
	<20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
	<87bk7g4x08.fsf@kernel.org>
	<09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
	<87plvwepjq.fsf@kernel.org>
	<db6a60e0dbd66f307a5890d958f67029ad5bcb4f.camel@sipsolutions.net>
Date: Thu, 14 Mar 2024 18:45:02 +0200
In-Reply-To: <db6a60e0dbd66f307a5890d958f67029ad5bcb4f.camel@sipsolutions.net>
	(Johannes Berg's message of "Thu, 14 Mar 2024 17:40:21 +0100")
Message-ID: <87le6kep9t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_094508_097128_3EFF5AEC 
X-CRM114-Status: GOOD (  14.59  )
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

> On Thu, 2024-03-14 at 18:39 +0200, Kalle Valo wrote:
>> Johannes Berg <johannes@sipsolutions.net> writes:
>> 
>> > On Thu, 2024-03-14 at 18:08 +0200, Kalle Valo wrote:
>> > > 
>> > > > -		hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
>> > > > +		hw->wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
>> > > 
>> > > I think we should add the same for ath12k, right?
>> > > 
>> > 
>> > It's really up to you, I think. I'm hoping to even get this into stable,
>> > FWIW.
>> 
>> ath12k doesn't support MLO yet but I feel that disabling wext already
>> now would be consistent from user's point of view.
>
> Ah, you're in the situation where wext is still enabled now, but will
> disappear when you enable MLO.

Exactly.

> Agree then that it would make sense to disable wext right now so it's
> not a software upgrade for the same hardware that removes it.

Good, thanks for confirming.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


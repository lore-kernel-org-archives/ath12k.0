Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C34C54E60
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lABueEjsjHsz1dEQkBPiVFr1ueO4+utrsBBCIV7/O5Y=; b=Whq7m5EBvN2R4oOlPPVfEXG/34
	u4ZcSYSmqpZzVvGHqX74oTA9fuI5Q6ICQTHIQUXPjx9m40GhwokxseEnpe3Nh0hDp0Se/6hQeUXQH
	2pYaQUh6cs6OpO2uucOj2ejYh56rgfkKytC9rjaga28+yDnhkgHW2NuDqLiEEBG3Rv8sUb9rioNxQ
	9ZuL+K2C0A8hMi+yQmWK6gDgGsXRdJYT9dpiQyBirvdfVLMcr5nLVYzprNcQd4IvYiQ3efK87cZYJ
	YUsKIpQZY+Aen8XN+iCllRnYf4h8VLaagvWgqH08btAXFuIcICIGScx08Y9CUtCkTJMrkopVBNh5a
	S0tjxmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko6t-0000000F1x8-2sZm
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 16:39:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko6p-0000000F1wi-2NlI
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 16:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EAA60CE1DCF;
	Thu, 14 Mar 2024 16:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4619AC433F1;
	Thu, 14 Mar 2024 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710434348;
	bh=rF2DLgDO55iegvKQy0bAVedrMvrHU7TJp19+CD7rlrI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QjdiiwLIYrllow9oz3zUDcu5mG5et8UeBpwFKRRNIGZZStNPNmuIb6D28KejV6hz2
	 SxedUW41SfgRXy9ipE0WZEq5mb+o/6I0WS93lRU0GM6KA1d0euGesEkZtZG0np5/xL
	 slOs9D1KPyy34QXCrlqRJIjWspGc0wOodUdA4vlsqX0ECYNa9TpZZoyRr5JCOA0Out
	 FQZiCW5qEMMFWtJjkcOpdy5FTIyb7UXGm8e78AhaA4GPf3HeF0Qb2t8vMLcgw8SXpP
	 tQjt4x8kccjdF43zTwEX3yPJL8DLgAFBOaGPK+rdcyErtIdw2XWNstUyhV5J5PErFA
	 0OzjO8uQ5NppQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,  Miri Korenblit
 <miriam.rachel.korenblit@intel.com>,  ath12k@lists.infradead.org
Subject: Re: [PATCH 2/2] wifi: iwlwifi: mvm: disable MLO for the time being
References: <20240314110951.b50f1dc4ec21.I656ddd8178eedb49dc5c6c0e70f8ce5807afb54f@changeid>
	<20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
	<87bk7g4x08.fsf@kernel.org>
	<09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
Date: Thu, 14 Mar 2024 18:39:05 +0200
In-Reply-To: <09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
	(Johannes Berg's message of "Thu, 14 Mar 2024 17:09:47 +0100")
Message-ID: <87plvwepjq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_093911_849474_B0917F56 
X-CRM114-Status: UNSURE (   9.55  )
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

Johannes Berg <johannes@sipsolutions.net> writes:

> On Thu, 2024-03-14 at 18:08 +0200, Kalle Valo wrote:
>> 
>> > -		hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
>> > +		hw->wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
>> 
>> I think we should add the same for ath12k, right?
>> 
>
> It's really up to you, I think. I'm hoping to even get this into stable,
> FWIW.

ath12k doesn't support MLO yet but I feel that disabling wext already
now would be consistent from user's point of view.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


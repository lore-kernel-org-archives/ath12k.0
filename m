Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCC9C4345F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BO5nli/bOm+TbAmfW21xSYnyBDEA3cVZ83o5MW2vpEU=; b=yFqSgWcBWmX6fypro8UROMKU/N
	i4kfYgczQjRxwKt5Y67zWLxQ+s6ldTPX1HvKr1SaJ8n9DDQ2j7byCUwbOwnHsZam9XyZJOYSX+r+g
	hRJx9OnfUuyRShI/En9WQNi00WyICQkoDSfVaWpsD8fMpaGcjFDWbKYYM9GRAKAj7cYD9Ae980SvL
	aX2GOoirPQXeK3TJpDtoXuv/MTDjATAcg8VDyVvtwpy6rcyxaOonEQE0GG5X155rhojX7rynmbcFo
	rBzzkO9bPIM8oLFoX/9DcJktHR9KO8RgFjOdZn1HN3PRET0WkcQ5Kg7R/nelrBg9A+ye8i9e5HF/E
	ifDqSwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbYX-000000041XM-18wa
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 12:16:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbYU-000000041Wh-0Nj3
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 12:16:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7058260E26;
	Wed, 24 Apr 2024 12:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1347AC32782;
	Wed, 24 Apr 2024 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713961013;
	bh=OX1on8q3Ad03sND9POMGUlaAeb8HEwb6ksC2BxoGMGU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Pun7+FC189HqJhl6WcjO1UjNciuekhr5SuR4olEM8WJaflIO5OcXBY3Cg/23DZfc7
	 cCwWkvIfyVwegxRfkPCmEF0EmRa2SThUyhrTmXMwqE2nIXLRrR8fnuBpn//qsSWuQs
	 kEtT+qy6LKa86KIBAMLM13OtkgGMcHJTdFWWqO4iZqkHNXaXOI0hMGS1Tq3UQYlzLi
	 ELYzYbqCPfv+ykzhjnvnWqNGMsw6/O3kGe5GhTtPM+Q32ESd3qBqtUf/MykRPGktw2
	 pldpuqZCgHi/7l5EzZuxFgg/KmI+iS8wVze60G5FjLeAD32sOrMKEQIjZaHSvgt3NC
	 Rbbh29Yhc+77A==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
  ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 3/3] wifi: ath12k: Add lock to protect the hardware
 state
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
	<20240424065646.1666166-4-quic_periyasa@quicinc.com>
	<517caf852d37b3803bcf087a6b575f2ecdb5ba10.camel@sipsolutions.net>
	<87il07t7zq.fsf@kernel.org>
	<3dc4339f5c3f603027c2214058e7e3251652a7f0.camel@sipsolutions.net>
	<87edavt7h8.fsf@kernel.org>
	<0bfbb5549b48296e6219488d47caccd10e818700.camel@sipsolutions.net>
Date: Wed, 24 Apr 2024 15:16:50 +0300
In-Reply-To: <0bfbb5549b48296e6219488d47caccd10e818700.camel@sipsolutions.net>
	(Johannes Berg's message of "Wed, 24 Apr 2024 11:52:22 +0200")
Message-ID: <87a5ljt0p9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_051654_192567_4C9B3696 
X-CRM114-Status: GOOD (  19.94  )
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

> On Wed, 2024-04-24 at 12:50 +0300, Kalle Valo wrote:
>> Johannes Berg <johannes@sipsolutions.net> writes:
>> 
>> > On Wed, 2024-04-24 at 12:39 +0300, Kalle Valo wrote:
>> > > 
>> > > Exactly. Swithing to use wiphy_lock() definitely one of my longterm
>> > > goals in ath12k. I already started working on switching ath12k to use
>> > > wiphy_lock() but IIRC I got blocked by not being able to call
>> > > wiphy_delayed_work_cancel() without taking wiphy_lock.
>> > 
>> > That's because I didn't want to have an async version, but theoretically
>> > we could have a version of it that just cancels the timer. If you don't
>> > hold the wiphy mutex already you could even wait for it to finish. It
>> > just adds more complexity there, and I was trying to make it all a lot
>> > more obvious :)
>> 
>> Yeah, understandable. I think changing ath12k WMI event handling to use
>> wiphy_work makes sense, running them in tasklet context feels overkill.
>
> Maybe. Note that the wiphy lock _can_ create delays etc. here, if you're
> doing other configuration work at the same time, or similar. Though I
> guess eventually you need locking there anyway, to access the HW. So it
> can be a bit of a trade-off.
>
> I expect this will evolve over time even in mac80211, though so far we
> haven't seen any bad effect from it.

Good point. And now that I think of this more I don't think we can use
wiphy_work with WMI events as we are waiting some events while holding
wiphy_lock, that would end up as deadlock. So most likely we need to use
a normal workqueue with WMI events and take wiphy_lock manually in
certain cases. But I'll need to investigate more and do some
experiments.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


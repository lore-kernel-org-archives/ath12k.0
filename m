Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7BEC0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i98dv1hcShtHP6AHCDM9O3+gtS5Xr9m1puc+d9u+8pg=; b=k+/QqKa0olx38L+rkJZXlYPaMd
	XaTdTDIEviffqOTe4t/U3og4fxJPrUco/d6d7sXL8LM293W8SiEVp8LBqiht8eDTRqG0lgUQH5t79
	ulvdgkG2n1n1yJ8A7F/wDpO6sqQ40ppvJ0nzbWyQX1oeqTdcqgA98va6ow3FliAS23z9mTS0U7Eu9
	LetEnM2DOZgyRuun/R2v+rdw10Gr6Suw0vJxXyaHczrZBpDWC+9hpTsdTpGEAUYf9fNAfwegkvOcP
	cjY4n3cbH0qosXQzmy8kHC0TnwAPvJ1KmdeIObSdB5gMY3ODBYiqGsVsgQD47ranp1WroioqJ0sNr
	H6dMdrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdqzJ-0000000AgCa-09zT
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 13:23:13 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdqzG-0000000AgC2-2T2X;
	Fri, 31 Jan 2025 13:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=i98dv1hcShtHP6AHCDM9O3+gtS5Xr9m1puc+d9u+8pg=;
	t=1738329788; x=1739539388; b=AiqK1yvnOCK8B2UerNkt4zS0UxpRSxALGoLtzuiqZlxAJXL
	A7HNQSLyiPYSJohN6LPrqe81GITGK+Ths22DONTCZmgEnQtLKrsXu35KphTuH0RyMrky7RWH/bySr
	8FYMpRLP5se2Qpo3Jd4b6rKi6queDw0iLpGQRcTygVRuMhfZOnsPmxe20F+JHBi7ZhvBO7wHDxTuS
	ZnKH27AfrEX/owh91jGj0x4EHiqxpRasT7knznbskwjPt4GNLFteP4ZLKT0mx4oO5WRPyNSy5/SnL
	rz+DNF9q/OfwfPcL60g8o4Avxi9wTHwEbnTNGa/XZMLHhRLuhOfgk09LD1ehwFQg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tdqzA-0000000G9Bj-3JqL;
	Fri, 31 Jan 2025 14:23:05 +0100
Message-ID: <21896d2788b8bc6c7fcb534cd43e75671a57f494.camel@sipsolutions.net>
Subject: Re: Stepping down as maintainer
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Cc: ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath10k@lists.infradead.org
Date: Fri, 31 Jan 2025 14:23:03 +0100
In-Reply-To: <87wmefguqt.fsf@kernel.org>
References: <87wmefguqt.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_052310_638231_192EABCF 
X-CRM114-Status: GOOD (  20.66  )
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

Hi Kalle, all,

> I'm stepping down from all my maintainer roles. My first commit
> feed9bab7b14 ("spi: omap2_mcspi PIO RX fix") to the kernel was back in
> 2008 for v2.6.24 so I have been here for a long time. Thank you everyone
> who I have worked with, there are too many to list here.

First and foremost, let me add my thanks to the list here. We've worked
together for many years on wireless now and I appreciate that greatly,
personally and also in the role you've played in shaping wireless, be it
through the reviews directly, or the more indirect things like sharing
the tree maintenance etc. Thank you!

This is also an opportunity to thank Qualcomm for sponsoring your work
here. Certainly I'd expect they also got a lot of value out of it, but
we the community definitely got a lot, so thank you Qualcomm!

> Jeff continues to maintain ath10k, ath11k and ath12k drivers so they are
> unaffected. But for the wireless driver maintainer (drivers/net/wireless/=
)
> there is no replacement at the moment. If anyone is interested, please
> do let Johannes and me know.

I'll be honest and say that I did delay my reply to see if anyone would
speak up, but in the short term I really didn't expect anyone to step
up. We're pretty niche in wireless, after all :)

There's obviously reluctance of netdev picking up any wireless related
activity, and that would anyway be impractical if cfg80211 and/or
mac80211 were to remain separate. There's also a clear separation of the
lists, and given the volumes involved I think that's likely better for
everyone.

In the short term at least, I therefore expect that I will (need to) be
the custodian of the wireless trees. And I say "custodian" rather than
"maintainer" quite intentionally, because I cannot really take on the
role as you've filled it in the past. Shoes a few sizes too big, I
guess.


So as the wireless community, I think we will need to come to terms with
the fact that our workflow and processes will change now, and we'll
invariably have to take on some new work. In some ways, netdev has
already undergone such a transformation in the past, with
 * maintenance shared across more people (to some extent),
 * a lot more emphasis on reviewers _other_ than the maintainers, and
 * automation to take care of rote things.

I'm not sure we will be able to find (trusted) people willing to share
the maintenance with in the short term, but the other two things seem
entirely manageable in the short term. I'm already checking if I can get
(interim) automation set up in the short term, with a more permanent
setup, independent of myself or hopefully any company, to come later.

As for reviews, I suppose that'll be a new thing in the wireless world
where pretty much everyone (with few exceptions) works in their driver
niche. I would think that was also the case for Ethernet in the past
though, where now we see "cross-vendor" Reviewed-by tags on many
patches, even ones specific to other drivers. This is where we should
get to, to distribute reviews across more people. For those of you who
may not have seen, Jakub also publishes statistics about that, e.g.
https://lore.kernel.org/netdev/20250121200710.19126f7d@kernel.org/

Hopefully then over time we'll see where things fall, and find one or
multiple people to share the tree maintenance with again. Bus factor and
all that.


However, that's only *my* vision for how we continue to maintain the
wireless tree going from here. I'm open to other suggestions (though
pre-emptively reject the suggestion that "every driver has their own
maintainer and that's good enough...")


Thanks for reading this far, and thanks again Kalle! :-)

johannes


PS: I'll update patchwork auto-delegation accordingly soon, just have to
remember when I have enough time to click all the slow buttons there


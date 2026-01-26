Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4F5CF65DA
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDd2JzWliFqrWbZfJPu0/NotnK4TNAffHVQLEGs7TDg=; b=XJ5l4vi2FFwQ5U4AR1Bmpwlonx
	F5EbqBNa0lcb40Skif5mctOUReyvwToR8pT8WeuZMgvdqpp7dgqhnJz/oroZJC9dpSXfaRlu/x8fr
	8jNQB1zZs24Tkgs84AJZhAixp/hAJwe82dUgj1jiOBPmkcHX11qmCfpjpzhKcD1TDOQ5tXTaPjOws
	7839mBg1vH9W0WvxH62mUJe3V4/hEIo7URkD8UlTd1TdJrFNKh2lxrMPCv0ydkaBWip9MI7sXmGk9
	13/cD21CaHUvdrmz29MvJfFiknH5HRswSch6CLPf4+IR86znoWM7RcKnAZnoi0/1tjQFLkBkmhuC2
	ffq8bqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJyF-0000000CIrb-2LSD;
	Mon, 26 Jan 2026 10:37:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJyD-0000000CIrB-2KLL
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 10:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=YDd2JzWliFqrWbZfJPu0/NotnK4TNAffHVQLEGs7TDg=;
	t=1769423841; x=1770633441; b=RvHWp4DXyqqxnEcqDM65mv7EIi11e26iLai41V3a3rO+ovi
	ASeC/xqoes7xAjpcMXQGloRkJoN10wqqVU1bmXKnzPJwCJaX77qXVhv2bMBakww/hhooFsdOPyNCu
	OWAHI5Lj4Y5swne8dVZ8GP/kmC9Xp6ZUkeEezP9rzlLXBWUW+iVyBTwwbO5Dilpme6uLrN36HQ8+7
	o9k9YSlU6qnvYhgVgJnqkb+8x9gqJkSrVd5+ZU+UXl0ooggPRBKcva0BrzR/+2Yv5SOXgpqIKrjwA
	NQDrAEz/cRbuN5K9uf9dZ/SFvlN7mT4CPutsz+FrWXcuhFT+iA/el2ggVPz/bo8A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vkJy7-0000000473k-1vfK;
	Mon, 26 Jan 2026 11:37:15 +0100
Message-ID: <2a4013ab012305907d69beaf9250f762a04ed844.camel@sipsolutions.net>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
From: Johannes Berg <johannes@sipsolutions.net>
To: Nicolas Escande <nico.escande@gmail.com>, Pablo MARTIN-GOMEZ
	 <pmartin-gomez@freebox.fr>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 26 Jan 2026 11:36:17 +0100
In-Reply-To: <DFYFUQNL5YRY.24VJC5QJMQFVF@gmail.com> (sfid-20260126_111133_479894_9D5E7AD9)
References: <20260123144224.2216923-1-nico.escande@gmail.com>
	 <d26ee979-b5d5-4f50-b423-f8783122f603@freebox.fr>
	 <bfed10db742d29f0609acb04d3354695f87b24e2.camel@sipsolutions.net>
	 <b0e79f6c-36d7-4e49-9d43-8e305a598201@freebox.fr>
	 <26bfd810c1dabc9ed86d4ba68cd20f6434c1d3a2.camel@sipsolutions.net>
	 <DFYFUQNL5YRY.24VJC5QJMQFVF@gmail.com>
	 (sfid-20260126_111133_479894_9D5E7AD9)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_023721_619724_6DDF5AB5 
X-CRM114-Status: GOOD (  10.20  )
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

On Mon, 2026-01-26 at 11:11 +0100, Nicolas Escande wrote:
> > Ah, you're asking why mac80211 doesn't clear those bits ... I guess it
> > just doesn't matter. If you're not on 320 MHz I'd guess the bits are
> > never checked, so it's not really relevant at all, although then could
> > argue that you only need the first line here as well.
>=20
> I you want Johannes, I can post a patch that also clears those bits in ma=
c80211
>=20

I don't think it really matters much, though I think in some older cases
we might be clearing more related bits.

johannes


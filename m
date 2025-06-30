Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2B4C8302D
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYe4cjPabOuRUub+QHwJtNEwLEuE25UXE6C1ayUhmVU=; b=TjkABlsmRnvaU4Drax5i8Jw/0a
	2IetE34XHcdrUJEe5SvKEsawzA21rkZmT39YkxU5Y3UbMEormaANToCQmYjNqbnA1hQqatF1R9sTu
	sdH/6xLTyIacA1rqgg0yi1FlqQ9jGZiumRxJo28/Ovo+fWQoWKEJbgfOxPIn8n+Ty/SMIc3rZmLRx
	IDEUFQWZR52ft//ovalR0R0P8Mzl288f8bIohFTFjG7r//ORg0LiqIJbuew7VbIYiJhpISwmSPdM5
	xvaNUMvjOl2D9lBG/F29MH9wiLsehTpc3nYrHAnTpwlPeSSs6ZqtMrK1GIrMPxn21ZCrNkEcglibh
	pvcp50Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEWq-00000002Mwh-2SOl;
	Mon, 30 Jun 2025 13:26:36 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWERj-00000002MAW-2DCn
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 13:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zYe4cjPabOuRUub+QHwJtNEwLEuE25UXE6C1ayUhmVU=;
	t=1751289679; x=1752499279; b=dS7daHgRsf9v+Zeh90Bor8jYIpzg9MkaFOix1f9dmrMebeI
	baq3Ae8/ALfLOxjZQrltc8rb6Qv5jOX5ncXG7tKVeVPaw85iE9DD4JIi2sk7KtmHsDxHTaMuu+RWm
	QIbry6YOiLqAJI6hqvWeyyVjPXmCzouSRrqKqD9Yz54up+xrKZwnaYf7XMBpIgxd4C34yf11mNlHQ
	v8srracgYQxpn4ZIbc4F69jhBka1eV4/JcfkMlEzu4F5SP3afnOBdKbkUc+v+aogzc+YjYP6LiRHO
	a81qQrCH+0aY9CDEXk4zwon0ZOfzcf7wurilTODl0KDhihOqEhODD4nkKKN87Hdw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uWERf-00000001LGD-2l9m;
	Mon, 30 Jun 2025 15:21:15 +0200
Message-ID: <61d6cdebee2c89e5d2d93d3297c94051efb70790.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next 0/3] wifi: Preamble puncturing support for
 mesh
From: Johannes Berg <johannes@sipsolutions.net>
To: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Ramasamy Kaliappan
	 <rkaliapp@qti.qualcomm.com>
Date: Mon, 30 Jun 2025 15:21:14 +0200
In-Reply-To: <21b7d547-b550-23a9-3bff-1f1787e307a8@oss.qualcomm.com>
References: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
	 <a8ff80ff5a811a09cf5556e20c7232eb1e201c2b.camel@sipsolutions.net>
	 <21b7d547-b550-23a9-3bff-1f1787e307a8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_062119_565166_602D6BAD 
X-CRM114-Status: GOOD (  24.07  )
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

On Fri, 2025-06-27 at 19:49 +0530, Ramasamy Kaliappan wrote:
> > I ... don't really understand how this is supposed to work.
> >=20
> > Say, for the sake of simplicity, we have an 80 MHz channel, the lowest
> > channel is the control channel (so puncturing 0x1 is invalid). Possible
> > puncturing values are 0x2, 0x4 and 0x8.
> >=20
> > If locally we have 0x2, that means (I assume, since that's how chandef
> > is meant to work) CCA and RX is always on the control channel and upper
> > 40 MHz parts. If you're now going to transmit to a station that has
> > puncturing 0x8, you didn't do CCA on the 0x2 subchannel, but ...
> > transmit anyway?
> >=20
> Yes,we do not transmit blindly to mesh peers with different puncturing.
> Before initiating transmission, the driver computes the intersection of=
=20
> the local and peer puncturing bitmaps to determine the set of valid sub=
=20
> channels.

Hm, I guess that's fair, but why not do that in mac80211 instead, that'd
be simpler and far more obvious/safe?

Also, clearly your driver _doesn't_ do what you say "the driver" does,
if anything it magically and "undocumentedly" happens in firmware.

> > I mean, maybe this could work if the remote puncturing is a superset of
> > the local puncturing? But just blindly doing it the way it appears to b=
e
> > done in this patchset seems ... questionable at best?
> >=20
> > Can you explain more how this is even supposed to work?
> >=20
> When associating with a mesh peer, the mesh peer's puncture pattern is=
=20
> shared with the driver. The driver evaluates the intersection of this=20
> bitmap with local pattern.

Could also be done in mac80211, I guess.

> if the resulting pattern corresponds to valid transmission bandwidth,=20
> the valid subchannels used for transmission.
>=20
> If the resulting pattern does not support a valid bandwidth, the driver=
=20
> falls back to using only the primary 20 MHz control channel for=20
> transmission.

Right.

I also note that there's not even any definition where the puncturing
pattern is rooted ... is it relative to the local chandef? Relative to
the peer's chandef? Clearly not even that is documented. What happens if
the bitmap changes? Why does userspace track it rather than mac80211,
which has the beacon of the peer and handles CSA, so what happens with
puncturing in CSA?

Did you think about any of these questions, or are you just using me as
a design tool? ;-)

johannes


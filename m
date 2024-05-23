Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF9CC25B75
	for <ath12k@archiver.kernel.org>; Thu, 23 May 2024 16:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUNMhSfcsZzZ+4SrDEiidjrks5CH3D/PEvNzaiYNfWI=; b=W/VoCapUsX18TPkC1DUJkceD/3
	ExjOFhY4235GIRzlB9/ob/johiH3ksP9VoAKNY/92Q3dzJ5k7w1nglSW95IwBPvi4XfG37zeVG5+g
	vYLg/ABu6iyiV3VCglnGstGtP+Q8XzEUQkME1lqGdwD4M4lwtr78xOVn2nyPQYDPq81OCXniRdVrk
	4OLZK2nQinYM1Gv3YVADgXLEyDiuVqDiVVPNzk8HAPsCwAroML/+xmEW6b958rbCBlU+zU7RWzrKh
	0VduV9bjXH0FE0yvV5LQUsJRzgKpYHPS5uRgKbUYw2rq8Dt4X+8ADK6X6XmRtkCZkP+iLTBI7hepb
	QtAX7eTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sABVv-00000006o3F-1iZ9
	for ath12k@archiver.kernel.org;
	Thu, 23 May 2024 16:41:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sABVr-00000006nzo-0ZAP
	for ath12k@lists.infradead.org;
	Thu, 23 May 2024 16:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dUNMhSfcsZzZ+4SrDEiidjrks5CH3D/PEvNzaiYNfWI=;
	t=1716482507; x=1717692107; b=GcAcskWQWYMNfOaKcmSoozX28qUkDDciE8Qlw9jLYCcaPpf
	D4XunjCPzNffgVa99u5Fdcr9CisHGqyI9KCsolvhUiZYqx11ln3YmhelEwLoDzL7JIgucF0qk8fpD
	CE4n8b40BHwoWaRGfpChsZq8Wq3AA6dPTEuWWibycrUXM7GhItGNMnG2PkvKIRKruQpPmlf3zCCkQ
	pI+S16a2xoabHJNSbyLfctgcpejAQiM5OHQqFfTeDmc0eGvBT/KLMH5m5TJgVfLD7GXpKElIsKSNt
	xsg++6zjcx2uaNGMQV6132o3tzpatbRHEhfXUO8biiGHVihw9JAsp6PX6+EbMfUQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sABVf-00000006iDn-4BmH;
	Thu, 23 May 2024 18:41:44 +0200
Message-ID: <d86fc714375c8adf772ddc83ab4de514273034bd.camel@sipsolutions.net>
Subject: Re: [PATCH 00/13] wifi: Add multi physical hardware iface
 combination support
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, Karthikeyan Periyasamy
	 <quic_periyasa@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 23 May 2024 18:41:43 +0200
In-Reply-To: <0dcc9afc-98ed-4f58-a368-79a5242a5bec@nbd.name>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <0dcc9afc-98ed-4f58-a368-79a5242a5bec@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_094155_204465_4EDB8835 
X-CRM114-Status: GOOD (  19.84  )
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

On Wed, 2024-05-22 at 16:55 +0200, Felix Fietkau wrote:
>=20
> The key differences are:
> - Only band bitmask and optionally frequency ranges are provided, so no=
=20
> per-radio channel list
> This is easier to track and vastly reduces the amount of data sent to=20
> user space in the wiphy dump

That makes sense, though in your RFC I'd probably remove the band bitmap
thing, and make the frequency range not be optional. Perhaps in the
kernel it could be filled in by cfg80211 via a band enum (taking
lowest/highest frequency in the band's channels that are there), but I
don't know if I'd want to have to check with this all optional
throughout the kernel and the userspace advertising API.

> - No integration with ifcomb. I don't really see the need for that one=
=20
> at this point. It can easily be added later if it's actually needed.

I mean, sure? But I think that's being lazy, I think everyone else
thinks it's actually needed. I just got a question about interface
combinations being broken on iwlwifi because we advertise AP interface
type in a combination with two channels, which can't be right. I'm
fixing that, but actually it _would_ be good to know for hardware that
actually does physically have the capability to operate on two channels,
and then have the bands etc.

So I do think (some) integration with interface combinations is needed.

> - Validation happens in mac80211 instead of cfg80211, because that=20
> removes a lot of complexity

Sure, that's an internal thing. I don't really _like_ that too much, but
I also don't like the approach of building a huge list here. Perhaps a
reasonable compromise would be for mac80211 to pass some 'iterate' and
'getinfo' callbacks or something to a validation function, instead of
having to pre-build. Then the iteration can be in mac80211, but the
validation can be in mac80211, and IMHO that makes the separation and
how validation happens also easier to understand.

> The radio id is tracked per chanctx and only one chanctx per radio is=20
> allowed.

I may be misunderstanding this, but as phrased this seems completely
wrong? We absolutely support two channel contexts on a single radio
today, with e.g. a regular BSS connection and a P2P-client interface. So
not sure what you mean here, but I think it needs to be captured by the
driver what it actually supports here, and that's basically interface
combinations today for a single radio.

johannes


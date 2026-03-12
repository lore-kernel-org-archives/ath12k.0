Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5135B106ACDF
	for <ath12k@archiver.kernel.org>; Thu, 12 Mar 2026 19:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6q4rh5v1FfxDKm6chdHrxsbiY7AY2DsNWJQ9IE1ea4=; b=Cc4A8hTYQePmVd0lnvLSfy8rjh
	sZ5s6jsBa9n4CS0An1kkl9qm2C5iv7EKswNJ6BlPfW3FrO8Vdh+Ae7VnjG86CyzB8z9qfXdBrRJKF
	HWMDOByuMh3+aVa1L3NU8f23JbICpTgWap8RcC7sO0ZFPx4B80BVoro6CnX2swZNMIjSG/l1onQ5n
	FjpWLCG0r4ZRevRIxVuB84EkQB13ljPMFnwZiCUQCMTCHURSO27KnA9kSliPzIh7wJAYOspULnm1e
	aXfgQkTifGnTyRDrpkSqOM5hRbcBdw9OociWIACvKLIXrHy8OCXyg04OM/nxQYizQ6Q17dvbxaEh/
	Jy9QU4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0llj-0000000F7ZE-09Nz;
	Thu, 12 Mar 2026 19:32:27 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0llg-0000000F7YL-2fKy
	for ath12k@lists.infradead.org;
	Thu, 12 Mar 2026 19:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=y6q4rh5v1FfxDKm6chdHrxsbiY7AY2DsNWJQ9IE1ea4=;
	t=1773343944; x=1774553544; b=k3uJWXgIWtVAv7IOF066j1dvwYMtXtVBAQ3IY5SNm+LB44G
	9FxB0Tp2VEK29iL2L/OUdEnJxWxtE+fLjiZOKRfkwS4TXsU7wphRopWAY2qsbXdtx2bRVfrD3zeC+
	su/JA0kM1oEKjXEEuFpzOci1wDxvKSHaSAMqPHhOC2HP0zWEqLvo1Go4cDnOrNBBNz7Vsmx7oZgxO
	kL4qkuLzOkUvB5sWBbLYvM/35g2sJH1jr70tdtNTdIjEf/2h53USpw5xl3ljrE4e49hjqj1f4RIMr
	w7VfGGnVnqPFUsTCsrmUEW77z8VR9K9cecc9qcmu70pO32iK3nDPw4h6WDSSo21g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1w0llZ-0000000G3bN-0qR7;
	Thu, 12 Mar 2026 20:32:17 +0100
Message-ID: <1cf0ae795b0e3e95b38cb7abf84ffad34c187fdf.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v8 2/3] wifi: cfg80211: add initial UHR
 support
From: Johannes Berg <johannes@sipsolutions.net>
To: Harshitha Prem <harshitha.prem@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>, 
	vasanthakumar.thiagarajan@oss.qualcomm.com, Lorenzo Bianconi
 <lorenzo@kernel.org>, 	ath12k@lists.infradead.org, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>,  Ping-Ke Shih <pkshih@realtek.com>, Manish
 Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>, Jouni Malinen	
 <j@w1.fi>, Benjamin Berg <benjamin@sipsolutions.net>
Date: Thu, 12 Mar 2026 20:32:16 +0100
In-Reply-To: <c676b2cd73463fa88f459f0416c60b03f20dd027.camel@sipsolutions.net>
References: <20260130154259.265130-5-johannes@sipsolutions.net>
		 <20260130164259.54cc12fbb307.I26126bebd83c7ab17e99827489f946ceabb3521f@changeid>
		 <f96125eeda23451c19067359eb9d10b4047bcdd3.camel@sipsolutions.net>
		 <5d54feea-d0cd-4bd7-b0d2-02e42f0fe5e1@oss.qualcomm.com>
		 <be9ab3c7f05b0f56f19aee0ffc7c2f96138b9a05.camel@sipsolutions.net>
		 <156d6d48-d135-4acf-a5d7-c9ae80523864@oss.qualcomm.com>
		 <0f4b34f0b529fd93fc608d8bbac0e98516b7a3d2.camel@sipsolutions.net>
		 <f3282007-a11a-4f68-86d8-0945e4979d65@oss.qualcomm.com>
		 <d3ecf6e5580cbe50eee807b1e63109e42e3b956c.camel@sipsolutions.net>
		 <416d08f1-6b8d-4bf7-9a63-c3c68497d990@oss.qualcomm.com>
	 <c676b2cd73463fa88f459f0416c60b03f20dd027.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_123224_871276_BB97CB50 
X-CRM114-Status: GOOD (  32.50  )
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


> > Because of this, an event-driven approach was considered.

So - starting this again from scratch. Benjamin and I spent some time
discussing this today too, and hashed out a (mostly?) workable solution
that should address most of the issues. I'll try to summarise that
below.

As will become obvious - and that's why I quoted only the line _you_
wrote before - this means we (including myself :)) need to stop being
afraid of hostapd doing (soft?) real-time [1] tasks...

[1] I'm using that word in the (formal) sense of having a deadline, not
of having to be particularly fast.


Let's assume the following constraints:

- preparing a beacon template as a real-time task can be done by
hostapd, given enough heads-up time
- no periodic events in a steady state when the AP is operating
normally
- TSF drift between links is correctly handled (maintaining <=3D30us
offset at any time)

We evidently already make these assumptions:

- if beacon intervals are not the same, the TBTT offset in RNR is
filled in by firmware (I see no way around this)
- either firmware fills in TSF offset, or it's just zero, and not
really accounting for slight drifts (but that's probably OK since it
never adds up given the <=3D30us requirement)

And also let's introduce some new operations to driver/firmware:

- the firmware can drop a frame that it's not able to transmit before
a given (as frame metadata) TSF value on the link, and indicate to
the driver that this is the reason the frame was dropped
- the firmware can create events at/after beacon TBTT (or beacon
transmission), this can be controlled by the driver; these events
contain the next TBTT's timestamp value
- the TSF offsets between links can be known to the driver, if they can
change (I suspect CSA could do that?) this can somehow be noticed by
or given to the driver

With that, it seems we can redesign this whole thing to be event-driven
and (mostly?) race-free.

In steady state, basically nothing would change from what hostapd is
doing today. It simply configures beacon templates, occasionally updates
them if elements need to change, and sends probe responses,
(re)association responses etc. as usual.

During any sort of update (CSA, color change, EHT updates, UHR updates)
things operate a bit differently:

1) hostapd enables TBTT / beacon transmit events, these events would be
generated by firmware and passed up, for each link, containing also the
TBTT timestamp of the _next_ beacon to be transmitted

2) hostapd waits for the TBTT event for the link that it wants to do the
update on, ignoring events for other links

3) starting from that TBTT event, on each TBTT event hostapd generates a
new beacon template for the link the event was for, and configures it to
the driver/firmware. Since that's a future beacon, it has to predict the
content of that beacon using
- the TBTT of the first beacon carrying the update announcement
- the TSF offsets between the links
- the beacon intervals of all the links
(a bit more on this later)

4) After applying the updates (a bit more on this later) and noticing
that the announcements are finished, hostapd waits for one more TBTT
event for each link and configures the beacons back to steady state,
after which it turns off the events.

If, at any time during this, hostapd needs to send a probe response,
(re)association response, EPP Capa/Operation response (or others?) which
holds information about the updates with the current counter values,
hostapd will create the frame per the current counters that it
maintains, and will transmit this frame with a TSF cut-off value
indicating that it must be transmitted before the next TBTT (over all
links), or dropped.
If this frame ends up being dropped by firmware because it didn't get
out before the indicated TSF, hostapd gets a specific notification for
this and then simply re-generates it and sends it again. This could
possibly repeat if TBTTs are close together on multiple links, but I
think it's not worth optimising for this case, though it could be done
by deferring the response slightly based on timers, or at the expense of
a more complex API ("defer until X and don't send after Y" vs. "don't
send after Y"), neither seems really worthwhile.


I said I'd give more information for (3) and (4) above, so:

For (3), also consider that it already has to effectively be able to do
this for the templates thing we discussed, it has to predict what each
link is going to look like in the future. I think this isn't too much of
an issue, but care must be taken especially if beacon intervals differ.

For (4), I think the way how the updates are done may depend on what the
update is. If, for example, it's DBE increasing the bandwidth, then
could just do the update _before_ the 0 beacon is transmitted, and if
it's decreasing bandwidth could do it _after_ the 0 beacon is
transmitted. Some of these may potentially require management by the
kernel or even driver/firmware (how do you switch NPCA parameters at the
exact right point if not in FW?), and perhaps (especially for CSA?)
there will be some considerations regarding multiple interfaces.
I mostly think this question is orthogonal, since armed with a TBTT
hostapd could also request that this update be done at a given TBTT.


We haven't really been able to poke significant holes into this, but
maybe that doesn't mean much. Couple of thoughts on that:

 * For each link, hostapd has roughly the whole beacon interval to build
   the next beacon's template, which seems reasonable.
 * There's a really weird corner case where an assoc response is
   attempted to transmit just before a beacon, doesn't get an ACK, but a
   retransmission isn't possible until after the beacon and it's dropped
   due to the TSF cut-off. Doesn't seem worth worrying about.
 * If the TBTTs for two links are at the same time, and the events to
   userspace for them are not coming "updated link first", then the
   beacon transmitted at the same time on the unchanged link may not yet
   be announcing the update, depending on the event order, given that
   hostapd waited for the affected link's first TBTT event. This doesn't
   really seem like a problem, but I think could be addressed by
   updating all the links on the first event immediately or so, or
   (Benjamin prefers this I think) adding the first beacon's TBTT to the
   response to the event enable command, I just worry that would cause
   other races that would need to be addressed.

That's it for now :) Let me know what you think.

johannes


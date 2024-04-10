Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D2CD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 07:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0scYqStgxZbWMDUaVHUNB5CmHlQnGVtrgSLw2qoU8g=; b=gvMZb7StquvvqEu20TB4T2HcX8
	W8QtYJfBJMOk4cA6IsoyjpbdAfLmj7Xk2g5IpSzxcwSA0/SpwI2+zef05BglttUFzuYtJpWP64Uhp
	qpH6Av7lCW/FXIIuD8ga6/Z+bJyz7YyMUBXjsmJ9IjaJKSsktqczlXRkNJU0y39YT5gD5N32zBCZV
	Lu1x8Bj9vL+2LB2g/q5Qg1g1iNEcXrXJY0BLMgjuTtCzMyMo1gI0GO/Na3mAMgThvdQShV6isNfQk
	D71Xk1gB5SRmKub09jO8xYjZ99g+d67CsR9t/o1uwvmsI3nBUJVQQyESUb2mieTfq3pUzhGSdq+1E
	eo1cFZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSoy-00000005jZQ-3JGU
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 07:56:40 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSow-00000005jYS-2oqY
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 07:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=m0scYqStgxZbWMDUaVHUNB5CmHlQnGVtrgSLw2qoU8g=;
	t=1712735798; x=1713945398; b=UqZvfscrpsYke4BS3Z5DuoLsbMjYn3Cl7wMYsUVZS8qCFvV
	7sA0EbsF5MvemvQKypHQvC5XYNOw7Yxwvo4Mj/Esm9wkrn4xs5Mt5nWfeqJqk4Vw3gDu6LwMJgj7t
	oyO1ERMPhLntEVm78P/pr709tIQKTXwUnyQ4qLREU3SQU+ibXjLrvF3bxrSnnHXuJzS/58Dtdmh44
	8tkCCYJZixiWwkaPZmsqhnrXK3z+2B/57QjX4cQPG4vNjZrzQWo32MAHsT7H71myYCj8z3edbcfwL
	rYENjDVskENLLBYDWtPG7gP5G8OpiS+qAaK9wHXisqc3PSb5zVo/mcJ8pA0suydg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ruSos-00000001Ei3-1Y5e;
	Wed, 10 Apr 2024 09:56:34 +0200
Message-ID: <31f30c0e318904f3a082c7f213576ceb1f407141.camel@sipsolutions.net>
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise
 multiple radio in one wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Ben Greear <greearb@candelatech.com>, Vasanthakumar Thiagarajan
 <quic_vthiagar@quicinc.com>, Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>,  ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 10 Apr 2024 09:56:33 +0200
In-Reply-To: <80fe5786-f764-455d-ac44-22adf7aeaf94@candelatech.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
	 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
	 <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
	 <ef6b6a7a4a9d3b01c0eb6abf0991e7e27425e102.camel@sipsolutions.net>
	 <80fe5786-f764-455d-ac44-22adf7aeaf94@candelatech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_005638_734993_0311BD07 
X-CRM114-Status: GOOD (  17.86  )
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

On Fri, 2024-03-29 at 07:47 -0700, Ben Greear wrote:
> On 3/29/24 07:30, Johannes Berg wrote:
> > On Fri, 2024-03-29 at 19:41 +0530, Vasanthakumar Thiagarajan wrote:
> > > >=20
> > > > > + * @hw_chans: list of the channels supported by every constituen=
t underlying
> > > > > + *	hardware. Drivers abstracting multiple discrete hardware (rad=
io) under
> > > > > + *	one wiphy can advertise the list of channels supported by eac=
h physical
> > > > > + *	hardware in this list. Underlying hardware specific channel l=
ist can be
> > > > > + *	used while describing interface combination for each of them.
> > > >=20
> > > > I'd expect there to be a limit on channels being within a single ba=
nd on
> > > > a single "hardware"?
> > > >=20
> > >=20
> > > There are ath12k hardware supporting multiple band which need to be
> > > registered under one mac80211_hw/wiphy. This design is to support suc=
h
> > > hardware.
> >=20
> > Oh OK, that was something that I didn't have in mind any more, or never
> > knew or paid attention to.
>=20
> Would it work to leave the phy reporting pretty much as it is now, but ad=
d
> a 'associated_peer_radios' list section, so that each phy could report th=
e phys
> associated with it?  Then user-space, driver, mac80211 etc could look up =
the
> other phys as needed to get a full picture?
>=20

There's not really a good way to _do_ that short of creating multiple
wiphys, but that causes _massive_ complexity in the stack (both cfg80211
and mac80211) so we rejected it years ago.

johannes


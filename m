Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2660CD128A
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwTqnHnJJ2QLV1zJVZUgS64ZDJVq53r7OiGOg7qIs9Y=; b=k5PsaSHShSlWCap54HTH5LYCG4
	czEy3TTn4Kn0dpFBGAaiW3xeeF2uvJDTFnUoKY4dHMvWAmDkjGo6NfkcLNzGXHApmXZtAFQUdUJnb
	rgaX5lwuJAH3iEVslLHcHT8rU9uzo8qS2ZVYc+rOLb/GuaFpPR6YKvBGYW88ktfGTWwCVx07AXiUB
	FQ6HhgiZOwmc61M/qswZBDwYT2kmR9HpfLPXWn0wDGdmerS3TE6xGmb/6Xw+7kjVx8+0G52xrUPz+
	GOvTx8kXiZfuS8K67K+xfiKHSCGo1dK3/hrGY7wruMyTV9ui1RGsGPOrAAktQSLdIsmTX7Lunactj
	90J4uh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rua5Z-00000007q7q-2GYL
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 15:42:17 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rua5W-00000007q5O-0cqJ
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 15:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=HwTqnHnJJ2QLV1zJVZUgS64ZDJVq53r7OiGOg7qIs9Y=;
	t=1712763733; x=1713973333; b=sjKGqqgKqGs+jgSrejAjKGkDLF8F2mWNJlybRlR4t5C3hmO
	opGkqZsMz1F7T8V3HdE68ZN7Mqu6iu68eXmyORtPVmGKoJj6D5YQeQaFhinVp/dh/aTYlja/uFbPr
	QlB0SSUxLd9KSttSVIGg7d24lRwX4QPnSkssKiKl4d3v+nsrkiXbb1jDtZPY4JIOX7rgjw+addgsj
	ULbtQxz7quBILJAwOQFF+OEDgEr0Iacz1MySNEvywivSXXlIWNdVg3W33XsuEw2qWFx5kmVg5TSLE
	llwe0xc+HJTSQb5RRr8EJGitcfv2wX2OaPK8zqQx0LsAjwtyPjf2rpb+6RSKMfPw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rua5S-00000001VfA-2SeY;
	Wed, 10 Apr 2024 17:42:10 +0200
Message-ID: <614bb8a8f1d9174ad7d87cf7636f657cda7b1ef9.camel@sipsolutions.net>
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise
 multiple radio in one wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Ben Greear <greearb@candelatech.com>, Vasanthakumar Thiagarajan
 <quic_vthiagar@quicinc.com>, Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>,  ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 10 Apr 2024 17:42:09 +0200
In-Reply-To: <20b56e52-a5e2-70cd-a62a-8c4a3526c2cf@candelatech.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
	 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
	 <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
	 <ef6b6a7a4a9d3b01c0eb6abf0991e7e27425e102.camel@sipsolutions.net>
	 <80fe5786-f764-455d-ac44-22adf7aeaf94@candelatech.com>
	 <31f30c0e318904f3a082c7f213576ceb1f407141.camel@sipsolutions.net>
	 <20b56e52-a5e2-70cd-a62a-8c4a3526c2cf@candelatech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_084214_435634_4C0BDB1C 
X-CRM114-Status: GOOD (  26.47  )
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

On Wed, 2024-04-10 at 07:37 -0700, Ben Greear wrote:
> On 4/10/24 00:56, Johannes Berg wrote:
> > On Fri, 2024-03-29 at 07:47 -0700, Ben Greear wrote:
> > > On 3/29/24 07:30, Johannes Berg wrote:
> > > > On Fri, 2024-03-29 at 19:41 +0530, Vasanthakumar Thiagarajan wrote:
> > > > > >=20
> > > > > > > + * @hw_chans: list of the channels supported by every consti=
tuent underlying
> > > > > > > + *	hardware. Drivers abstracting multiple discrete hardware =
(radio) under
> > > > > > > + *	one wiphy can advertise the list of channels supported by=
 each physical
> > > > > > > + *	hardware in this list. Underlying hardware specific chann=
el list can be
> > > > > > > + *	used while describing interface combination for each of t=
hem.
> > > > > >=20
> > > > > > I'd expect there to be a limit on channels being within a singl=
e band on
> > > > > > a single "hardware"?
> > > > > >=20
> > > > >=20
> > > > > There are ath12k hardware supporting multiple band which need to =
be
> > > > > registered under one mac80211_hw/wiphy. This design is to support=
 such
> > > > > hardware.
> > > >=20
> > > > Oh OK, that was something that I didn't have in mind any more, or n=
ever
> > > > knew or paid attention to.
> > >=20
> > > Would it work to leave the phy reporting pretty much as it is now, bu=
t add
> > > a 'associated_peer_radios' list section, so that each phy could repor=
t the phys
> > > associated with it?  Then user-space, driver, mac80211 etc could look=
 up the
> > > other phys as needed to get a full picture?
> > >=20
> >=20
> > There's not really a good way to _do_ that short of creating multiple
> > wiphys, but that causes _massive_ complexity in the stack (both cfg8021=
1
> > and mac80211) so we rejected it years ago.
>=20
> I thought the problem ath12k is trying to fix is that there are currently=
 multiple phys (radios) that needed to be made to
> look like a single phy?

Correct.

> For dual and tri-concurrent radios, I think we will need them to look lik=
e 3 individual radios for non-MLO use
> cases

No, I don't see why, and if you want that we wouldn't support it anyway,
you'd have to have a module option or something to decide which way to
go.

But it really ought to not be needed - the point of these patches is to
give userspace enough information to know how to (and where) to create
separate BSSes, with or without MLO between them.

> For instance, mt7996 currently reports 3 single-band wiphys, and each can=
 be used independently.
> But assuming it starts supporting MLO, then those 3 single band wiphys wi=
ll need to start acting
> at least somewhat like a single entity

Yes.

> (while also concurrently being able to act as individual
> wiphys so that one can do a mix of MLO and non MLO sta/AP.)

No.

johannes


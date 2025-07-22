Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F3DC83F27
	for <ath12k@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVrkRJwvwO9Stjf8IK1IhWAXIF4hQK1ta2M33Nepzhg=; b=FvtdUJSRD3+6qZ/VPgTHS1R2hO
	wjxKqsP/yPJgmZIk3tO6fNwJn622ADzlOVpJhKgeuhynWmuDhFkz8DulkNZYOhOfyO0RlQWimTU5y
	i9hKkmQ532H5NvdnYQIBsG3kC6xTcmvJFEoM/tBeoiI0nS00ZqaoyKDHBFl1GU35zp6eu14o0ywIN
	9yOR+FZun8xfhrrUPXugCRT3GivkGGyG2lwBsXvId8EDnCr5CaX6nYlnRVtgWFDkxI/PeSzDLD39e
	mNcsjpAK0czmYE1MQ7OM2D93+1zCefW28UB+sW1n6F3Hk0YrnUzh5Vj/QQ+rmmpChnt4mFJF47tTW
	ksMGiE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFOF-00000002wKh-0aBQ;
	Tue, 22 Jul 2025 15:58:51 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEcD-00000002p9Z-2dap
	for ath12k@lists.infradead.org;
	Tue, 22 Jul 2025 15:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=IVrkRJwvwO9Stjf8IK1IhWAXIF4hQK1ta2M33Nepzhg=;
	t=1753196953; x=1754406553; b=uLVFMItnAVykNzHixGgdPdArkAx4SbCsvErdwy8+u3tQLWa
	xQlqLjvYXQNf7r9SRAtZqh9kvmt3Bgbd08jTfKcYGDUHtzrJHOJe9uc7h0dh/ZOStPmEMrgM8X6Q8
	7eLITbluCNOvfXHeOMONDPbjdjTjRmDsAJEHvoUxLPcEdHQto34vgTfIkzzgGUii5moz39tNRPpiH
	qZT3jeaV6gz6hFmD1XTChikcJjAkbhIkcI4TT0tJwqqDWbAM/APvf0Gb5OwSJoamaJ1MN2cNu+QNt
	5rl+GACW2jqlXNYcJj2A3/vGisCMOt7XI6sUx0St7T4Lb9lIvuurSA2EW87Q5RgA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ueEcA-00000002GZm-1vEv;
	Tue, 22 Jul 2025 17:09:10 +0200
Message-ID: <e60b34c3f1f7638e942dc2c42d77448349cfbc2a.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next 0/3] wifi: Preamble puncturing support for
 mesh
From: Johannes Berg <johannes@sipsolutions.net>
To: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Ramasamy Kaliappan
	 <rkaliapp@qti.qualcomm.com>
Date: Tue, 22 Jul 2025 17:09:09 +0200
In-Reply-To: <94354e7b-1931-da3a-bec6-78e578468dd2@oss.qualcomm.com>
References: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
	 <a8ff80ff5a811a09cf5556e20c7232eb1e201c2b.camel@sipsolutions.net>
	 <21b7d547-b550-23a9-3bff-1f1787e307a8@oss.qualcomm.com>
	 <61d6cdebee2c89e5d2d93d3297c94051efb70790.camel@sipsolutions.net>
	 <94354e7b-1931-da3a-bec6-78e578468dd2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_080913_668728_0F97D98A 
X-CRM114-Status: GOOD (  29.70  )
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

Hi,

Sorry for the late reply - going through and saw I missed this.

On Mon, 2025-07-14 at 00:29 +0530, Ramasamy Kaliappan wrote:
> Hmm, I originally thought the bandwidth determination would need to=20
> happen within the driver,  since it=E2=80=99s required at the time of pac=
ket=20
> transmission for each mesh STA. The assumption was partly influenced by=
=20
> our existing firmware design.
>=20
> But yeah, since the bandwidth doesn=E2=80=99t really change much across P=
PDUs=20
> for the same STA, it actually makes more sense to handle it in mac80211=
=20
> and drivers can use it.

Well I guess a device still has two settings:

 - per STA what it can actually transmit to that STA
 - for yourself, what BW you will receive and do CCA for

Given the CCA, obviously the per-STA channels used must be a subset of
the ones used by the device.

Which interesting because if say one STA has 80 MHz channel 36 (and
secondaries 40/44/48) with puncturing bitmap 0x8 (i.e. using 36/40/44)
and the other STA has the same with puncturing bitmap 0x4 (i.e. using
36/40/48) then effectively they can only communicate on 40 MHz,
_however_ they're both doing CCA on their respective 60 MHz. That's ...
inefficient?

But I guess it's also unavoidable unless you only have a single STA or
so. Or want to reduce the bandwidth when ... ohh, we have this "min_def"
concept in mac80211, we could use that here for mesh as well? We already
do almost precisely this for AP mode. And for client side I used it for
OMI stuff. So I guess here we could - whenever STAs are added/removed -
recalculate the min_def, and thereby in this case avoid doing CCA on the
whole 80/60 MHz channel. Actually seems fairly easy.

But also then that can be future optimisation. Arguably, it could
already be done today without puncturing, when other mesh STAs are just
not even using 80 MHz for example.

> Yes that's right, the intersection and BW selection is done for every=20
> PPDU at Firmware.

Seems like one of those "we want to do more firmware" cases ;-) Intel is
certainly not immune to that either :)

> When not considering CSA scenario then the puncturing pattern is an=20
> intersection of the local channel def and puncturing pattern advertised=
=20
> by peer.

Right.

> If the local and peer mesh are capable of EHT, the negotiated EHT=20
> bandwidth of the peer mesh is considered first. The intersection of=20
> puncturing patterns is then applied on top of this to derive=20
> bandwidth=E2=80=94potentially reduced and with or without additional punc=
turing.
>=20
> > What happens if
> > the bitmap changes? Why does userspace track it rather than mac80211,
>=20
> When a channel switch is triggered by a userspace application,
> the user space is fully aware of the bitmap changes and pass them to the=
=20
> mac80211 driver.
> But when a peer mesh initiates a channel switch via CSA, the mac80211=20
> driver on the local mesh receives bitmap changes through CSA=20
> beacon/action frames and processes the channel changes internally.

Makes sense.

> However, unless the new bitmap is explicitly forwarded to userspace, the=
=20
> userspace component might not be aware of the bitmap changes.

Does it have to? But the bitmap is part of the chandef so userspace
should be aware of it.

> I am thinking something like below for CSA with puncturing in Mesh,
> 1. Acquire the puncturing bitmap from the peer initiating the CSA action=
=20
> / beacon frame.
> 2. Validate the new channel's compatibility with the new puncturing=20
> pattern, and apply the new channel context.
> 3. Forward the csa beacon/CSA action.
> 4. Reset the existing bitmap and apply the new bitmap to associated STAs.
>=20
> I didn't take care of this in the patch series. I am planning to address=
=20
> this in the upcoming series

Honestly I'm not completely sure how CSA works in mesh today, so I guess
I'll just leave it to you to consider.

> > Did you think about any of these questions, or are you just using me as
> > a design tool? ;-)
> >=20
>=20
> No, certainly not Johannes! =F0=9F=98=8A

:-)

johannes


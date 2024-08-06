Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D71C52D6F
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 22:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x92JJMnksrdswWDvcf98xWpAg3P6+kdAl4wC+lFFrHM=; b=cdml+D3QXlg25ZetRqa16VeDCq
	cn2T19e4GAeU4JuqUHW1SYZKND1lbyCAP4+6spB94eln6JrRTQHNYCP06LqVUiDf0ziVrGDRuMCeq
	WMrNKmkfR5jsqv9WrMza+cZ/M6/OTBOZ7cBD6H/a4BtkskUgZrD9/04+PIMe0jsFDOK+PKJxZmY+2
	2tOIsKnNCyw4RD0eQXkaGPSFlwd9A3Ekx1AuQdcSDD0GNTYyqGt25yZ+TQakpZkvvpTgMGm7VDON2
	cZgqr9VbgBJXv0hGnNArc+HjmPN5u8mMuRwXT4/mJ0yW7qzHePJhltx6Kwq5GeZz7ldvaFX3SVEeM
	DXAstZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSIB-000000035bT-2EW7
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 22:04:31 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSI8-000000035ZD-1fRG
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 22:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722981865;
	bh=x92JJMnksrdswWDvcf98xWpAg3P6+kdAl4wC+lFFrHM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uAHXZgtVb0Z4ejy+B3LsjhUjlogoyvcqzyDWBDFa3nO29n3YZlTLHgyRjUJDzpq8r
	 e3peacasSB4hCBFOGeirNTN3fKxDjtUv8204LaPlmsN3U6A4UiLsvRsIM44csbOSJS
	 TsAJ8ieB967NYpXUiq9qaRrnxL43CRr5XRdGNLu7WQWOgfOjbxFxDnElu3wzd3Dtot
	 bkXpMKV8ddY1Ah36CVvEpx8R1s5z4KeC2T7BtT/2Xj1Y+jh3SDY5krmoXIQQQA/LMu
	 UYpIZtKBHCS//YXtQuLSzG/qVMzhadu0TFlUnF/IC4HZWBWuhlJeHdPlU7j9qGRGsn
	 QpvQqGaGI5Ucw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WdnQd3RwFz4w2J;
	Wed,  7 Aug 2024 08:04:25 +1000 (AEST)
Date: Wed, 7 Aug 2024 08:04:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: linux-next: request to include ath.git tree
Message-ID: <20240807080423.45efb506@canb.auug.org.au>
In-Reply-To: <87ed7163yd.fsf@kernel.org>
References: <87ed7163yd.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2Dxztpywhj4hqJGc_IHL1im";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_150428_904287_790B705A 
X-CRM114-Status: GOOD (  22.82  )
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

--Sig_/2Dxztpywhj4hqJGc_IHL1im
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kalle,

On Tue, 06 Aug 2024 18:55:38 +0300 Kalle Valo <kvalo@kernel.org> wrote:
>
> ath.git is a tree for Atheros and Qualcomm Wi-Fi drivers residing under
> drivers/net/wireless/ath/. Jeff and I are the maintainers. Over the
> years multiple people have been requesting including the tree to
> linux-next and finally we are biting the bullet.
>=20
> So we are requesting to pull two branches from our ath.git tree to linux-=
next:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
> git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
>=20
> for-current feeds the wireless tree and for-next feeds the wireless-next
> tree.

Added from today.  I have listed just you as a contect, should I list
anyone else (or a mailing list)?

> Because our for-next branch is very active one problem with is that the
> chances of having conflicts between the branches is high and that would
> be extra work for you :/ Do you have any suggestions for this? For
> example, should we create temporary merges for you or something like
> that? Just for this reason we do try to keep the number of patches going
> to for-current minimal and only take important fixes.

Well, your for-next branch should only contain patches that are ready
for integration i.e. reviewed and unit tested, so it should not be all
that busy.  I expect you may also have a development branch for patches
you are still testing.  Otherwise, you should concentrate on your own
tree and I will notify you of conflicts (and ask advice if the
conflicts are too difficult for me to resolve).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/2Dxztpywhj4hqJGc_IHL1im
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaynegACgkQAVBC80lX
0GywuAf/a8+0nKxZXozMmMWGjZtvuHmORM3yJrjEFklRRq1SCSqf7pd4KADfJld7
38ihuNDqgtvjFFX5xvG5SFOYM3+s1jhguyiCAN70kKF/fV7WYa8Bo/m6jHuZuGta
cMcnuCZVVOFy0CZX5NqTYb0Kdqlu2S8IIq00CVa+SCr60PCsHrfMwYTYiu4LPNyv
Sw3qtDMvZw7+LjbOcvjl1GLW1xKiE6B1mZ/ylq7aqMs9rmZSpHho3y2SvfFRJLQ6
NPI38NojMzo9xL0lNTXS+cIF34YofOKb8jIlEDs/cWKvNJmAPgJZk+7N7CiY251B
EtdmdWuVwCWrXgRFKlfumCUlB1wSJw==
=e4jz
-----END PGP SIGNATURE-----

--Sig_/2Dxztpywhj4hqJGc_IHL1im--


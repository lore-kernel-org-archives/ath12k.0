Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA48DC19F32
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 00:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ku3DMkLSDJrrHzEgYbO69j04S6unATPZdunPnRs1vGQ=; b=F5dDfspfsbq060A4bqg0PhVBJ8
	OrptxqlRxs5COaIiAnxUr1WhBlp1vsak/SKCQEzAWqi1dEHL/BQDeIrWY+bmqsWLBlgJdVmYegMCI
	DgIOdVNr2KxkSoqMfLg0dKfeV1tIRXK9imhpuONSNYtY0o+viVzLq67/Yem8E1x1aPpgoQSfLEtY0
	HyRYHdjGaXCbX9Cu30+zW46HHJcvOd1cD7Z9PPSUHk2v/K7Wxz8SyVx2W/kIma1M6Cjjg2r5isyIq
	DDwCiZ6dLQLswf9PzPTiJ4Yhaz8MytJMWwbDa6bkIHsl29PsSsYh2uwvR1hygU8THBdVvDOujc7+u
	ZPL46ioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoX1-00000009JZH-2Bxg
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 00:47:11 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoWz-00000009JYP-0K8f
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 00:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Ku3DMkLSDJrrHzEgYbO69j04S6unATPZdunPnRs1vGQ=;
	t=1740703628; x=1741913228; b=XPel2GR5VIevRvNJ5U9TbIWmZZ2TIwGv8NkmAwT/8ZFpGXN
	oKQdP4MpN6HLLuwoxn/RaIkLQxIxmRV8KFznFxkElhhjbxw9oueLQxL2yaykqNgjIte6XrV0kJ70v
	DFGRnAJXBtMUlDfEuE2ETFJeqlPSZNJ6UvgbxkDcvwuMP37GQFAruOBoRGFQ5Yg9H+o2wBOYCM4PS
	kl5UjkZWJitAKgvvsdQMoULof9xR0Cg9GAZpq4Y0E4GiLOahIqaaDvJM/KTAZF+KlalD4P1oyOi1V
	DYUJwnnTIiV4PvmgUwEaKDRi7yAUFVayp/txcz3mmNmDKdajkENvVaaMAva7FjhA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tnoWt-0000000D0LN-0og3;
	Fri, 28 Feb 2025 01:47:03 +0100
Message-ID: <98b73681e9ebe7e6252dc2a1d62cacf4b0524ff5.camel@sipsolutions.net>
Subject: Re: [PATCH v3 0/5] wifi: mac80211/ath12k: add support to fill link
 statistics of multi-link station
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Ping-Ke Shih
	 <pkshih@realtek.com>, Sarika Sharma <quic_sarishar@quicinc.com>, 
 "ath12k@lists.infradead.org"
	 <ath12k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Date: Fri, 28 Feb 2025 01:47:02 +0100
In-Reply-To: <8bccb677-de56-475a-9b27-ccd55bcaebc5@oss.qualcomm.com>
References: <20250227045824.91480-1-quic_sarishar@quicinc.com>
	 <bac3fdc3bd39e45150e5b7d60be01b5d732a04bf.camel@sipsolutions.net>
	 <df26e3aeb3724d969f444eab65d8c872@realtek.com>
	 <900f042d03d34385fa3507610ae291a36ca4885b.camel@sipsolutions.net>
	 <8bccb677-de56-475a-9b27-ccd55bcaebc5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_164709_388403_1BD3A7AC 
X-CRM114-Status: GOOD (  12.28  )
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

On Thu, 2025-02-27 at 11:35 -0800, Jeff Johnson wrote:
> On 2/27/2025 1:32 AM, Johannes Berg wrote:
> > On Thu, 2025-02-27 at 09:30 +0000, Ping-Ke Shih wrote:
> > >=20
> > > I have encountered structural (not functional) dependency problem too=
.=20
> > > Could you share how I can tell NIPA the dependency between two patchs=
et?
> > >=20
> >=20
> > I don't think you can at all, at this point.
>=20
> So it doesn't support the mechanism 'b4' can handle, namely having a
> base-commit: tag along with one or more prerequisite-patch-id: tags?

I don't really know, but I don't think so. Note that (afaict) b4 also
doesn't really use it to select the base to apply things to, it uses it
to make a 3-way merge to the tree you want to apply the patches to. I
doubt that would have helped here, given that it was trying to apply the
patches to the wireless-next tree, where that commit likely wouldn't
have been present anyway.

johannes


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2EEE68974
	for <ath12k@archiver.kernel.org>; Thu, 31 Oct 2024 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dl8hdDnBmAY1nRSMxM8dTCsNcNJfOb9j7hsGPdHbtO4=; b=NLrAqoX8W4yNrtOCt4O3qK7KuL
	jdGidChIh3x8nZoK6MAeqbIJ4aABpiVtTPSSyqJRp3MObD4jCfJg7eVPmLzkRHQRR2whDa0Fh0QhW
	Ew00rJveDIrdg8XLhhx5cwctHe8fEvE6q5AUMU/xSpHyTywsuJ9aaYVcyiNa8k94gWdj6yMhyaIT2
	hgMf/vuT8JBgHauT6hxuUMCvek8dfCLCDND5bGgxfr2QyIZswMYUI0vyJd06HS5U2PF+5DHgpkYKt
	GZoiLCvGDaQb+AdJZAQauUpHbFL6hwf90ngagSViUV3gDY/gJ7dp3S6xdCsmK/0xN6RvEa8yD3lTo
	kILBMrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Sk0-00000003IyP-1WmT
	for ath12k@archiver.kernel.org;
	Thu, 31 Oct 2024 10:49:24 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SiO-00000003Ipu-1aeU
	for ath12k@lists.infradead.org;
	Thu, 31 Oct 2024 10:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Dl8hdDnBmAY1nRSMxM8dTCsNcNJfOb9j7hsGPdHbtO4=;
	t=1730371662; x=1731581262; b=J8ixEjRz7+8cS3dpZT8HdDSdR55q69bfNVNwdoDiMj0yl1Q
	jrMRYwLemIXMjqlDegYidSI0/j6abZmRc3QmqyWruFJoG5G3dwmbSiFPLfSjiRT3S1quKzHQGSe4B
	MaDWwAWLfJck8PGp7QTAmD1kYVHkCfZT0r+GbR6nMdP2NqteldXj2xn5LOp6qKeUaYCabTu+rlciV
	EFguMIvUd4PcSXOsgqoNvY97T/KytaY0QCg9ot26AqfGs4/YtswOZNbqDTrjC4Qd6qCL/FQx5urt/
	M0sdk6E7twwgInI9GMMJZE8Q1Cbi110gLKQYuyGtP+bqIPKXlxdeQa5sQho7b93g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1t6SiH-0000000APAw-1SY6;
	Thu, 31 Oct 2024 11:47:37 +0100
Message-ID: <f6ec91977050f6a1f08d995b4e36ef4067ad3de2.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: cfg80211: Correctly handle Medium Synchronization
 Delay
From: Johannes Berg <johannes@sipsolutions.net>
To: Benjamin Berg <benjamin@sipsolutions.net>, Lingbo Kong
	 <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 31 Oct 2024 11:47:35 +0100
In-Reply-To: <b07102047bf2f076c090948b1a06ae4f22a881ff.camel@sipsolutions.net>
References: <20241030025515.16004-1-quic_lingbok@quicinc.com>
	 <e56621b7a8b229f726d644ffde7b98ba0c11b06b.camel@sipsolutions.net>
	 <3a74f2f1-fd9f-46a5-87c1-fdc0235a50e5@quicinc.com>
	 <b07102047bf2f076c090948b1a06ae4f22a881ff.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_034744_437651_C5CBC53E 
X-CRM114-Status: GOOD (  12.30  )
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

On Thu, 2024-10-31 at 10:25 +0100, Benjamin Berg wrote:
>=20
> Right, which does seem to imply that a non-NSTR AP can very well set a
> Medium Delay Synchronization.

Yes, we also pass it to the firmware in iwlwifi, so definitely.

> > Regarding the statement =E2=80=9CCould it be that this is intended to b=
e used by=20
> > NSTR APs only,=E2=80=9D I did not find any explicit indication in the s=
pec that=20
> > the multi-link probe response carrying the medium sync delay subfield i=
s=20
> > solely applicable to NSTR APs.
> >=20
> > Additionally, do you have any suggestions on how to address this issue?=
=F0=9F=99=82
>=20
> Not really. I don't grasp the intention of the specification here. But
> if an AP may include the field in an ML Probe Response, then we
> obviously cannot rely on the value to be consistent.
>=20
> Seems to me that the option to remove the check is still the best way
> forward right now.

Agree, let's just remove it - Lingbo do you want to send a patch?

We should probably compare "extended MLD capabilities and ops" though,
haha.

johannes


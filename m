Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79491E77180
	for <ath12k@archiver.kernel.org>; Mon, 16 Dec 2024 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXW/KrOnrQEg3uxnrQTksUnT8jElnfsXwjmHXlglEG4=; b=wv9Cghe+zh0nySllINFJ4k3IWv
	anS5fg5bdI80CTHFZNe5a6zUsz5C5h/CMz5j1Rx6edk/Zz2xlRwCivwTeXYQ2lMXXb1A5gmiiMraQ
	vGFZfjuWQr1HMiMtzKN2pxmBXO9OeB97K9wLbgBvhWDJZww3253P9bRphyuaxwkaUNRh6ZauqOcGZ
	+HHtpYrBvyMolR6JWsNEu9D8NSa6gvpNWNj8Xf2ym7Q1r8JH4epzobq/2YlqbmH5tnz2Q3x/DREKj
	t665rN/oeCoj+6kzxNJz7BSSOldbaDktHCZqrF6ZP8nqPfrpLlJ10VK4j35ifIFFXqvjlq8jIgJS+
	iyeJo6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHD6-0000000BBLQ-17r9
	for ath12k@archiver.kernel.org;
	Mon, 16 Dec 2024 19:56:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHD4-0000000BBL2-06EC
	for ath12k@lists.infradead.org;
	Mon, 16 Dec 2024 19:56:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A6495C1125;
	Mon, 16 Dec 2024 19:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14CCC4CED0;
	Mon, 16 Dec 2024 19:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734379013;
	bh=mfQ+UvS9zCNDDMgy2pSAaJ5A6FtaL/xqQkyF0asjCys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFO8e9lS7ftXOKI+ufABMtvFzYaO48rUzAhicggP7Toly8vWQD+u0j0TTVIBW338P
	 EBgSeyHWzW5KfeBpf1SQXrwqNKtbbQxkCd3tdM2x69ue5JP50DiDlox99vEIteHyjJ
	 rSrjnt+1OfCaJYARZi1mnmG8Kosr65ovqzGkk5pZQCHfPJbV66kv2BmZxLQqIkqUoZ
	 lLMuJ+4JV6nia/MP4/gaAwdiQqLU0xLmfeoddi8kS5QjsRcZpIT+AJ741qpfKV3Gg6
	 6Ygror5DsnhIkuwgZVrgtPwO5wX+35nIe1pJfRGOIFHExja3I/dcY/cSPmOO0yFfkH
	 dyLP1DOolb7xw==
Date: Mon, 16 Dec 2024 19:56:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/8] wifi: ath12k: MLO support part 7
Message-ID: <20241216-moonlight-perpetual-d49029337c17@spud>
References: <20241211153432.775335-1-kvalo@kernel.org>
 <173436785894.3413746.14923997859754791913.b4-ty@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4t8WLMfWCtEr09Pn"
Content-Disposition: inline
In-Reply-To: <173436785894.3413746.14923997859754791913.b4-ty@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_115654_110223_6B0F0818 
X-CRM114-Status: GOOD (  11.19  )
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


--4t8WLMfWCtEr09Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 08:50:58AM -0800, Jeff Johnson wrote:
>=20
> On Wed, 11 Dec 2024 17:34:24 +0200, Kalle Valo wrote:
> > Implementing Multi-Link Operation (MLO) continues. Bindings document is=
 added
> > to get WSI information from DT (patch 1) with the code parsing the info=
rmation
> > (patch 2). Rest of the patches are about configuring MLO in firmware.
> >=20
> > Device Tree bindings were reviewed as RFC earlier:
> >=20
> > [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k PCI modu=
le with WSI
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/8] dt-bindings: net: wireless: Describe ath12k PCI module with WSI
>       commit: 30e36fa89d8266d9221ee992d4f43553a59a3431

Delayed through being unexpectedly afk last week, I left an r-b on v2 a
few mins ago. I don't give a shit about getting credit for tags, but
figured it was worth mentioning it on the applied version of the series.

--4t8WLMfWCtEr09Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2CGAQAKCRB4tDGHoIJi
0vsYAQDkoxDUoc1/fj7CS11vgTGaiWCoFhMoPF5TgURTVSzXsgEA0A9T++taG4dc
SpaXgaEwIquY2rZrISfeuuUmHJ4RoQw=
=wprf
-----END PGP SIGNATURE-----

--4t8WLMfWCtEr09Pn--


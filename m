Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF89E7717F
	for <ath12k@archiver.kernel.org>; Mon, 16 Dec 2024 19:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPKYbKhrRn57E0Khe5c1oBXu/7EPWCwEmdm0TJzGS/U=; b=cDLsxZ3+mhmOqnIKs/eWA+AYBi
	oNjrPvWHN4P/PEKqHBrjwPdcC61WLiLkMHKNduvTp5E6xuj8083euQ2bK1IsTUg9i20wr1mtJfWUQ
	1fr/kHhZ8IYB9ex14g9hav2hYu/2EUUkQQBLgpIHTYjDyX61TqH29gBxZ78Gov/l4dL2z2snIJy2z
	/npWXZ6JYBOs4tAfA+tKn57wR32qaqpC82UMhIkR769CaUgEi+ucXcL+KWN2B81qVrPtumB0BzkB1
	Vyq5WzbIAaBNm+YVb9PjB1YgriBVNCT2FJOLj9dafbdnxb9rwTaZzlVemsNZEyaGU/0BfQ+KxVG7/
	oOy1AlKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHBb-0000000BB6c-3QGD
	for ath12k@archiver.kernel.org;
	Mon, 16 Dec 2024 19:55:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHAr-0000000BB15-1dEP
	for ath12k@lists.infradead.org;
	Mon, 16 Dec 2024 19:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C39A1A41A39
	for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 19:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509C8C4CED0;
	Mon, 16 Dec 2024 19:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734378876;
	bh=0VFiKC4boAv/+7uBTzQJqCRPDrjkoWJN1WOJILavTrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SnuoTe0Bx/1XdHewh5DSy+c7JLqOzvJYtcQwJVIdvG0VDWQz0HXA1G8NH+2GXNtrK
	 SpgWkYblqLtUxSw5MmO3xBsSYGqNrBQgNMGEBWkdAI53VGyioAEVwLwvCMoCZIh8Dl
	 qItmc59oNA63J9nynR5SO6qinuF8kbbvmKWA2Avyjz2PABnXz02HTgwdrzCXADzat5
	 dPTjeXvvj/gGy7UWe4LdE2WvtXygSrqCagVpUmBOfALRSnmgUwi+dHmq9I2ppU8DP9
	 JZJKpNQhyd6wLFA3KE0SDZVyFFLwEGDf52A1TCk2ds4k4Y0rIMq4jRwb3r2w9JJIXB
	 xEr8JcrzHhzKQ==
Date: Mon, 16 Dec 2024 19:54:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: net: wireless: Describe ath12k PCI
 module with WSI
Message-ID: <20241216-croak-outwit-207ea8d3025d@spud>
References: <20241209153034.50558-1-kvalo@kernel.org>
 <20241209153034.50558-2-kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aXgPcGwIaTEPwO1U"
Content-Disposition: inline
In-Reply-To: <20241209153034.50558-2-kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_115437_490929_F34AD808 
X-CRM114-Status: GOOD (  14.36  )
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


--aXgPcGwIaTEPwO1U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2024 at 05:30:27PM +0200, Kalle Valo wrote:
> From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>=20
> The QCN9274 WiFi device supports WSI (WLAN Serial Interface). WSI is used
> to exchange specific control information across radios using a doorbell
> mechanism. This WSI connection is essential for exchanging control
> information among these devices. The WSI interface in the QCN9274 includes
> TX and RX ports, which are used to connect multiple WSI-supported devices
> together, forming a WSI group.
>=20
> Describe QCN9274 PCI wifi device with WSI interface.
>=20
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  .../net/wireless/qcom,ath12k-wsi.yaml         | 205 ++++++++++++++++++
>  1 file changed, 205 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,a=
th12k-wsi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-w=
si.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.ya=
ml
> new file mode 100644
> index 000000000000..7fec15e10a94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml

Usually I'd comment on the mismatch between this and the compatible, but
naming the file after the pcie id would do noone any favours. This seems
fine to me,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--aXgPcGwIaTEPwO1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2CFeAAKCRB4tDGHoIJi
0jdbAQCrxn0AOA9faLcR0u5ERNVSe3bZPX9blHiLEHsON0gQgAD/U+OuTurH5kBz
mkIDbiIEEpc/WqcExwcWJPxcwfJuPAo=
=hKTb
-----END PGP SIGNATURE-----

--aXgPcGwIaTEPwO1U--


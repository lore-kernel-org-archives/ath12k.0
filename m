Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AA2C001DE
	for <ath12k@archiver.kernel.org>; Thu, 10 Aug 2023 08:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f/xF5jiw2c2NpiMQ6iqs6pegJHD4muRZOO6oou3hO0=; b=ub9zCN2f6brs3/2icrJP7ZUUqX
	EwMV/NFImPbZXEHQWbsGJZn49pZs9S3vROskd+BZVjQ5RbgdQwsuAINzcWH7uLMwMlcdH9Riuxe2B
	CM+XhcPdpt36nbQSh10x0IlFNRt6GsO5a9kL5wAy+mT3u5EQ6XyVs/v9L4h4Ee9hN1oDqZCNEzk4k
	oM0YBZxYByrCBi89ODI/Vl1LUFCQs+Bb6sdzrInqByX1wXqwMcTGkxhyDXEN9BxVXqGPVutIqRvqw
	S1O2aJ7SZjI+npuUVCIJbixv/owG56ZaoPAgc2wdxSXWeVve0sW+BqAYjhuHjzLg1zKmUIl2XM53m
	a2ThoSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0pB-006qSj-2z
	for ath12k@archiver.kernel.org;
	Thu, 10 Aug 2023 08:15:17 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0p9-006qQg-35
	for ath12k@lists.infradead.org;
	Thu, 10 Aug 2023 08:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1691655311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLlflyYOngEb2hRwNwugn1tbiottu6X5hyIKDMBoaAk=;
	b=JjL5skd+laa1ZwveR79V9J9EC64MRni9MkP3prlWPFyZ2iz7HFe3qhNq3Ko/ZcZeDvMz9X
	ok57Jn+v04/zDwRK9HLmcocvY3OCxSJ3DFWTVCA3MBtG8W/Z+lQsh/ARZTN5O1AWll9E7R
	fExEWWYQ1kQ1AGUiERGlJKy/TAL9N0I=
From: Sven Eckelmann <sven@narfation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org,
 Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath12k: Fix buffer overflow when scanning with extraie
Date: Thu, 10 Aug 2023 10:15:09 +0200
Message-ID: <9198694.rMLUfLXkoz@ripper>
In-Reply-To: <4161316.1IzOArtZ34@ripper>
References: <20230809081241.32765-1-quic_wgong@quicinc.com>
 <db119d06-7549-3be9-524f-327485d34da9@quicinc.com>
 <4161316.1IzOArtZ34@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_011516_163753_75DC1A34 
X-CRM114-Status: GOOD (  10.12  )
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
Content-Type: multipart/mixed; boundary="===============3389501328648705322=="
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

--===============3389501328648705322==
Content-Type: multipart/signed; boundary="nextPart3052943.CbtlEUcBR6";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3052943.CbtlEUcBR6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org
Date: Thu, 10 Aug 2023 10:15:09 +0200
Message-ID: <9198694.rMLUfLXkoz@ripper>
In-Reply-To: <4161316.1IzOArtZ34@ripper>
MIME-Version: 1.0

On Thursday, 10 August 2023 10:09:25 CEST Sven Eckelmann wrote:
[...]
> This was for ath11k. See my patch for it in 
> https://lore.kernel.org/r/20211207142913.1734635-1-sven@narfation.org
> So I doubt that it is ok to add the same backtrace for an ath12k commit.
> 
> And if I compare both patches, it looks to me that you don't handle the 
> params->extraie.len > 16 bit (see WMI_TLV_LEN) in ath12k.

Ok, just saw that the v1 had handling for that but it was not split into two patches.
https://lore.kernel.org/r/20230809081657.13858-1-quic_wgong@quicinc.com

So just ignore this remark.

Kind regards,
	Sven
--nextPart3052943.CbtlEUcBR6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmTUnI0ACgkQXYcKB8Em
e0ZjHw/+N9VA/8VaWv4Ms52vwZTowjPU8NgfkaPnSVx7boynE9sun1JujW6P+SXj
pDCb9++Sm+yDdHfPN/j5SYKh5HqqZ/YKNzy0Sesz6TJLEzZBaHoLLFIJfid71Czy
QcNAK5M9g97OlMGgo/tVsE0BA6+2LKDplMiwBmT/p4RGS7VM0aw8lY9L6ElcHold
TiPDpJyWjk9hT9S/Y0rSEoeyOKgpOBAoYEgIpR+s5F8OgCt/HivImemFQkQOhoaE
dU1oKB6/gqIYURzsOoZGCMJuNyf+7JcAP+gPWs5otHqYPXIoDEjOEO9OzyD0g2GS
hNvsKtvOjUVqILZH7Y6VS2YA0LAho37z6WX6M/UW8Mhaebjjj0vu2T5n5DuJJwUS
5LbZyLhKoMAD6JcvbEFJ5U8NIoQwC++39dK+Gjw1rjEmAMQg/FA0dHjvD6Wn74uI
YBrryCkE4uZCw0gmar9LVXibvzFjXV3iOHKGZm2gmkJ8LPU7KTb9Pve893zOaZ++
H2qP9VVfXqXAYQfTsxk/90PXR89kk52B5MNSHCZ3sQELSDspb84zs1sGnTvwNVUf
pQgfCbZt3eDr2SVYXZ56EuoEMUT3EUKaT6bPPLHlhjNBexkDXrReX486kGWQwzA9
tsVlxxGhdH1LrZJiFOYHaSTh+E8o/R2McMT6w57OJcfj8+lptYs=
=BGuC
-----END PGP SIGNATURE-----

--nextPart3052943.CbtlEUcBR6--





--===============3389501328648705322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

--===============3389501328648705322==--





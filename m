Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD139C001DE
	for <ath12k@archiver.kernel.org>; Thu, 10 Aug 2023 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtVzwNuvPLp6aiLQHq27s0m/JZnrg/CgXjSUVe+zJQE=; b=S4x4oZIlnLs1GRO2SR0XJyDN9g
	inKFzRRVUfpKip5pp6zNr+aYLdlrxMaDmAtWTiQAR+yIllcUNkHmWi5P11ZkzFnYBt/oztBn27s5f
	NrhFwYOXSqk48sVOntEiH7cGBgOdB3RFM5hBTiFXcm9qwc6ejEFDjJL9P8zS6jKwye07i1wYjpx6k
	8l45e6kCgsCejfMTCYdTACZLXlsW4tOjdynf7uYyhBlanhvCwjjxTNayO0s2fj5HfqKLnV7P80vqu
	BiD1vbZzUBPQq7ybKBDR2VlQnYy0J9Eo0jGr2gdFUqyq8foW4l7yPMa4rpx9FsX8B02NakIuVu96I
	XEWNY7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0jj-006ok8-1m
	for ath12k@archiver.kernel.org;
	Thu, 10 Aug 2023 08:09:39 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0jg-006oi6-0e
	for ath12k@lists.infradead.org;
	Thu, 10 Aug 2023 08:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1691654971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gWf7pVy4VSkBn4LU83suocRKaD90O0axOs+3iQ7JA2s=;
	b=n17IXXXh5p46YQz//PUBcM6ylgfUMMCLw5qoBoXGwRojP5iDssn8Uag7pylYIFd++Q+qw/
	JYABeshYLWhne/4HR0kUYT+YcxKGOMmVyfSqm19Ha9vL7Xa+dStDZ99gFLRMV3F+y+KnMH
	yYKCX1md3cu98kJcxQJqPpwC3OMiUOQ=
From: Sven Eckelmann <sven@narfation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org,
 Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath12k: Fix buffer overflow when scanning with extraie
Date: Thu, 10 Aug 2023 10:09:25 +0200
Message-ID: <4161316.1IzOArtZ34@ripper>
In-Reply-To: <db119d06-7549-3be9-524f-327485d34da9@quicinc.com>
References: <20230809081241.32765-1-quic_wgong@quicinc.com>
 <3206e181-f770-c599-87e1-364114b9746a@quicinc.com>
 <db119d06-7549-3be9-524f-327485d34da9@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_010936_378475_2245DFEF 
X-CRM114-Status: GOOD (  15.05  )
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
Content-Type: multipart/mixed; boundary="===============3954363568817160520=="
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

--===============3954363568817160520==
Content-Type: multipart/signed; boundary="nextPart2644003.BddDVKsqQX";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2644003.BddDVKsqQX
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org
Date: Thu, 10 Aug 2023 10:09:25 +0200
Message-ID: <4161316.1IzOArtZ34@ripper>
In-Reply-To: <db119d06-7549-3be9-524f-327485d34da9@quicinc.com>
MIME-Version: 1.0

On Thursday, 10 August 2023 06:31:02 CEST Wen Gong wrote:
> On 8/10/2023 2:16 AM, Jeff Johnson wrote:
> > On 8/9/2023 10:31 AM, Jeff Johnson wrote:
> >> On 8/9/2023 1:12 AM, Wen Gong wrote:
> >>>
> [...]
> >>
> >> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> >
> > Wen, can you please add a Fixes: tag since based upon the discussion 
> > you actually observed a crash
> >
> Jeff, do you mean I should add the crash call stack or other thing in 
> this patch?

I think a reference to the commit which is fixed should be added.

> The crash is observed by Sven Eckelmann <sven@narfation.org>  on 07 Dec 
> 2021 here:
> Subject: Re: [PATCH] ath11k: enable 
> IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for WCN6855
> https://lore.kernel.org/linux-wireless/3267805.el9kkjlfUZ@ripper/

This was for ath11k. See my patch for it in 
https://lore.kernel.org/r/20211207142913.1734635-1-sven@narfation.org
So I doubt that it is ok to add the same backtrace for an ath12k commit.

And if I compare both patches, it looks to me that you don't handle the 
params->extraie.len > 16 bit (see WMI_TLV_LEN) in ath12k.

Kind regards,
	Sven
--nextPart2644003.BddDVKsqQX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmTUmzUACgkQXYcKB8Em
e0aMaw/5AZ4D6mNNbQCEz4PivXFwvT/Wz/zdb5/b1JfgZXmtIdUQg6wgVJYzVO6g
yL5RVKYfMKG0aITyAWQvI9eSYabuAhLZKFucdjArwtPVY1u07x0pzbH81yP8Wfkn
nzYW1IG8FafG6LV0oYpQf6xr30layDjhq6VPHaVmx4Bap5yaY7kRpngNTZCtNEoc
7zpH+VgUJQu+5qMfHe3A8kgS7Tg8GhhXW/AOh1DHrKoK7QjZ5FueR+jdVq2iDyCa
K7wyIurAmltLm/xJxxIeMkYd05p06tLWAYDjz7oYT8yDiNaOAFQGMAiQ6OGn/wJx
h+rCNP0EdUOeGVVRGHe8CPHW+iHn91KRicNsjV7kZ0dZQ/L8a8e6ekwffw8MS9wg
1bq6+O7+n4sIMfZGqhX5+2m+a2BRZIdK0Paz1u/E27k1G+ETubk2ITCKjJ/sPLBf
nl3BhRa6woAhhy7PSkAkUEGxnineoTmhhEn47yWmBtDDHQ46zDUKZ61C83iwYEPk
FEkthQTXF3jN0/xYRGbwcPZN78AgnyzeeD4tUO1Os7rVMrN8QsoFhEJg8a55/xMJ
neipHEWxOTKs9JR5arxDcWDokiq4TjOFDE3kcvHK2fL/cOmJJ+DKq4/88f2Ye1mo
jLOTCZtO/BcxUV83E5W23VcYakZTWzkyXyJzKWJv4uuIumdLMg0=
=bxKb
-----END PGP SIGNATURE-----

--nextPart2644003.BddDVKsqQX--





--===============3954363568817160520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

--===============3954363568817160520==--





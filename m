Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3D4C3DA41
	for <ath12k@archiver.kernel.org>; Mon,  8 Jul 2024 21:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6XBRzh9DZg2tX9b2GATh0K63Iw+3VDyPu6Zm+GFSGE=; b=zSyRA39WXFKI3Z6FZ3UMeoGq1m
	bnWYNz+W2bCJWx5kgrmP1sM2hW9P9iJicEEd36YLjIq0dLFuUqGOPOnlSA6yMLMYiRP39DwXoq9cY
	cdF+2OLF/R+sPQvVVasktLSKppQ5ZzDzXPqPPs0g4XqAMeRvunqYw5J/TRPQRKYA2r3O8e9DRsKpC
	ldC4jbpbKC7hnCP+BqsJEBgR3ok5B5Yi7jsGX9OTHSjWlxMCS4N/qPHx871gwvufepSwYJKhRFP0B
	WtipPvUM3DMkJUh7saS/k1aVB3b54x1x5kLgTz66ZJszJxwblrMB21KycFx005K8iCUMTuni5Vvfj
	xUba8f+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQw59-000000056eK-1gLQ
	for ath12k@archiver.kernel.org;
	Mon, 08 Jul 2024 21:39:35 +0000
Received: from s1.sapience.com ([72.84.236.66])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQw54-000000056cn-3kYx
	for ath12k@lists.infradead.org;
	Mon, 08 Jul 2024 21:39:33 +0000
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id 22A814809B4;
	Mon, 08 Jul 2024 17:39:27 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1720474767;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=S6XBRzh9DZg2tX9b2GATh0K63Iw+3VDyPu6Zm+GFSGE=;
 b=yFadK6fYZClrUUSqbjrUqWdX+CuOe+tZwiBYVMdm3NQxzGRQWmm+p6GOq0QWUH/XmJIlV
 pd/0fLmoBq0lEXKCQ==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1720474767;
	cv=none; b=Y6aM1GPihBomft2cRY+L3F0qHviR8LJALidAQioa8TSmckWKaCUsKFkfotGb4uqnrxhaD+La+W/9B3XS1YCbdT3/QJA2j6upPpd9OUoxkYeaylFBC2K3UiaquNIfjK7WmHxzD3aoAJrtfvDuC5IT9bTBXgEHLwgOqIGbt63w4QBPAzAfSjQPf3xtl1u2RBYTK8C6gjpFfT0me7ohntT/eir2vmgOD4Lq3onOCy0DTUHNvw2WfSkILPyZ51/QeO7BzpFuHeZdZ3mUFkhn2laXyZuHu4ZC6nTvlRNZ3Cxvfu1CeCDdS0UUZBZETnHTYTuEkFvogCZKIALzjfHnCNHrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1720474767; c=relaxed/simple;
	bh=4TtO2sntfGeQOH6q4WlC+yYcVRb75tRgpuRvumGtajY=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=sOw3Y/dUovCQLzuOqXykvrWd72qzM27Co5QGXT+HkMyxfAw5IuWi0huiqGpZKovTzy9I18t09ki6QKiIkHqCK1KppIa4RfqK1Ewb3jrrNE1Ix1LrDYBDs4TSzLF6XR3fV9D/kj7pcrtOV91XqgP36Y6ygcKcm2LYSMlLn9zRfdNlG7YXi2Qu7iUUgXwh4PHZ+hHl+7kywnW9hJJj44Kt4g1CnLjhbpXogVXawREWk7t3WIjF5K3rJM7CaFnU2kxhhuujD5fXn6wMJpAYAr/ptZGq/HjQl32o5MeG9T7yUSR20K2lIfTP8x2CZhrBk0sl199n9A0mRvGkKmN3rokCaw==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1720474767;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=S6XBRzh9DZg2tX9b2GATh0K63Iw+3VDyPu6Zm+GFSGE=;
 b=hNHn5/CK6EHhd32MdfK/emAv/oNXE5yby7GAtXKB8hC2gWgdbl6TWtJR5RH4MEJlvmjGk
 P9X9U3uDrzS72C1gljKJ0T13VvxCa+KnTUttaNn/ybueQyG59Bg5WcYdCtuUTmeQEd2fL4x
 +i30Lueh6A4kSRsEwzWkEDLK6MH6xHaWPzDUJT6Sd7ABKvhSXrG6JWiLm0u4+2LXBVO0noj
 gzj4lttVd0n7PNhHQPyLY2VB8G9/xbsXqFdEAWFnCRcIUgnROJ8rb2wlxuFaRUwX/g0V3is
 vPcePJth0IJXXj2nhcO1KGAjvqUSaGbMnbqvEuVIsvXA0Zxy2mIbCvRxBk6w==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id EE9AF28001A;
	Mon, 08 Jul 2024 17:39:26 -0400 (EDT)
Message-ID: <a6e0a7d79f9599621a1b4a3263a7b7b5dd810300.camel@sapience.com>
Subject: Re: crosstool: x86 kernel compiled with GCC 14.1 fails to boot
From: Genes Lists <lists@sapience.com>
To: Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@kernel.org>
Cc: linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
Date: Mon, 08 Jul 2024 17:39:26 -0400
In-Reply-To: <0ddafa32-1fc2-45e1-b71c-beb64f8cd589@app.fastmail.com>
References: <87y16bbvgb.fsf@kernel.org>
	 <0ddafa32-1fc2-45e1-b71c-beb64f8cd589@app.fastmail.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-iwKPurN+EOys0t/g2faq"
User-Agent: Evolution 3.52.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_143931_026605_4A71D1DF 
X-CRM114-Status: GOOD (  18.76  )
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


--=-iwKPurN+EOys0t/g2faq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-07-08 at 21:03 +0200, Arnd Bergmann wrote:
> On Mon, Jul 8, 2024, at 20:16, Kalle Valo wrote:
> > Hi Arnd,
> >=20
> > I installed GCC 14.1 from:
> >=20
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_6
> > 4/14.1.0/
> >=20
> > But I have a problem that a kernel compiled with that compiler
> > fails to
> > boot on my x86 NUC test box. I don't see any errors, just black
> > screen
...

>=20
>=20
> Thanks for the report. Unfortunately I have no idea what the
> problem may be, and so far nobody else has reported this.
>=20
...

> =C2=A0=C2=A0=C2=A0=C2=A0 Arnd
>=20

Another data point in case it's helpful.

I =C2=A0have been compiling on Archlinux using the native gcc 14.1 toolchai=
n
since early May.

I have had no problems at all booting and running either stable or
mainline on several x86-64 machines including 2 NUCs.
One is NUC6i5SYB and the other is NUC10i5FNK.

  Gene


--=-iwKPurN+EOys0t/g2faq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZoxcjgAKCRA5BdB0L6Ze
2yH6APwIP/9tgi0VYheywdzzRJFHVlevvtmUOCp1cShuaG8gMAEAtBF/4xNIAvkI
Na5bkoEp1j6pJIF8V0HND86pgnLeZQo=
=XUoM
-----END PGP SIGNATURE-----

--=-iwKPurN+EOys0t/g2faq--


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C77C001E0
	for <ath12k@archiver.kernel.org>; Tue, 25 Jul 2023 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysPXmeG8XSgNBlw+LKWWEeVKCX0EcMLczP8CiI4qM58=; b=tDeye41KgZzmQ6t2A8LZz9yWXn
	xkN47rBmr3Kd1KYe0nGC6fRgi4gVUp7pxq6ix3A4NbO/412zcXduak16WnRnf7hXywPQN7nIzoJmy
	1sBp5qPeomNyKccyTVMS2d77Hx31ZFGkT9xpou6BU6tI2FOQB+XBMXDe87nZMLJgE51eYjTKROif1
	uPW+nUsG4KOG0Qp1Qd78uk04Ao8N7TiduYnBWZQ8oPc+EJaoRJy+ikKJ5C4grOtVKip8wm7QnDL8K
	tULgKU6h8i9e9LQno5ihzSYDjBGMRaVgH9ei8ZmSK7X0nYUrbnx36bywmX+vJ8BrhUbjq5iPqefk/
	ck2YBHrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFBd-0075Ya-2Q
	for ath12k@archiver.kernel.org;
	Tue, 25 Jul 2023 10:22:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFBY-0075Wj-1z;
	Tue, 25 Jul 2023 10:22:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b89d47ffb6so26989955ad.2;
        Tue, 25 Jul 2023 03:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690280547; x=1690885347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=st1c6y6bpzS1m6/OLQ/WRJ6hdioncwRRD9te/qaHNm0=;
        b=oNjiEPYT5xOd9syCdBiia6JXFOYaOrHnjHetbNWxCruQpkyjk8GxUDHaUBmzcM9sfI
         h8TTZ8w/VZ7QrAR9K9e6Ysre8HdyuCc6K6zRwM+AJv7wRMtSr9hkiAcpkR0FiIAYJT7+
         1vwauLkrXnK3A9JSX8+3X9S7MPKt+skRTqGpiAcoQhpiDwn6zMQArGrgd9qLBed+0CBq
         AwHuQ4GTKICZM7nheNUM2qFjR9b0SfxernYQmC47+DAmnzp8oRE0pnG9cinfWRETHmf9
         AFT3/0FNfpB9o0z0rtsxJG4TB3sFgRSigpCQSs6GMV68uOzx1Xja6I3569vu5Tnpd3f4
         mgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280547; x=1690885347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st1c6y6bpzS1m6/OLQ/WRJ6hdioncwRRD9te/qaHNm0=;
        b=IJhUfowMn+mgeW6wsgbulaU64StCucjds6X2Nj1TOTBHRMjgcW8jl+qC0uxemqsyf5
         ZjOK2Q5ZuJBM67U5A49T97bHDWGbK9bCzM+KK8wHGlEqiUr5iDa2tYJPquD1ilN2V10+
         B5u9Au2sPxHZi0MStERNSchUbxWcHc/6B6nb2SjNvb8/uDl1apI+8602oTlieGfpNCNC
         zIW8QJvAdJkuwhSwDY5yDu+nXVN7jZGillOZQF3l170Eko/Tyo4G6jK5DLQC93/Y5eT/
         +/TS9ZEOl8qaAWLgfO9C3z7yuHWl+AXEYx39SQXFELTclfoCDVzGF6cCFuGh7WP9ndVd
         tGWw==
X-Gm-Message-State: ABy/qLaQgrk6blZFWJcDeR8Oo6HmyUvJ7OpqHhkuqqPvs40ozReyK78d
	G+dwBNJlD8V5mwH9ZeqCp+Ao6JVPA9eQ/w==
X-Google-Smtp-Source: APBJJlH8waVFJBjk2pzAHNfgFspl+McpQX/EQlkc8JCDxWgqg42Zzi0aaMimRtwVYCQrMlU5sF7BLg==
X-Received: by 2002:a17:902:ea04:b0:1b8:b3f9:58e5 with SMTP id s4-20020a170902ea0400b001b8b3f958e5mr12806537plg.38.1690280547139;
        Tue, 25 Jul 2023 03:22:27 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902c1c900b001bb8be10a84sm6239417plc.304.2023.07.25.03.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:22:26 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 2EE88811C67C; Tue, 25 Jul 2023 17:22:22 +0700 (WIB)
Date: Tue, 25 Jul 2023 17:22:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kalle Valo <kvalo@kernel.org>, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Jeff as ath10k, ath11k and ath12k
 maintainer
Message-ID: <ZL+iXrR1yNz3cfV8@debian.me>
References: <20230725094248.3205486-1-kvalo@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230725094248.3205486-1-kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_032232_655913_2FE200D3 
X-CRM114-Status: GOOD (  14.11  )
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
Content-Type: multipart/mixed; boundary="===============0466059282769998964=="
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


--===============0466059282769998964==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0xVLwENwrMrscJsq"
Content-Disposition: inline


--0xVLwENwrMrscJsq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 12:42:48PM +0300, Kalle Valo wrote:
> Jeff will now start maintaining these drivers together with me.
>=20
> Signed-off-by: Kalle Valo <kvalo@kernel.org>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42e78a696be6..292910ef17d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17433,6 +17433,7 @@ F:	drivers/media/tuners/qt1010*
> =20
>  QUALCOMM ATH12K WIRELESS DRIVER
>  M:	Kalle Valo <kvalo@kernel.org>
> +M:	Jeff Johnson <quic_jjohnson@quicinc.com>
>  L:	ath12k@lists.infradead.org
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
> @@ -17440,6 +17441,7 @@ F:	drivers/net/wireless/ath/ath12k/
> =20
>  QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
>  M:	Kalle Valo <kvalo@kernel.org>
> +M:	Jeff Johnson <quic_jjohnson@quicinc.com>
>  L:	ath10k@lists.infradead.org
>  S:	Supported
>  W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath10k
> @@ -17449,6 +17451,7 @@ F:	drivers/net/wireless/ath/ath10k/
> =20
>  QUALCOMM ATHEROS ATH11K WIRELESS DRIVER
>  M:	Kalle Valo <kvalo@kernel.org>
> +M:	Jeff Johnson <quic_jjohnson@quicinc.com>
>  L:	ath11k@lists.infradead.org
>  S:	Supported
>  W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k
>=20

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--0xVLwENwrMrscJsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZL+iVwAKCRD2uYlJVVFO
o+acAP9X8xYaesXihr/7vqWc6wUpnMRtMCbxV78gKtoPHMbG6gEAnyUtaVWC3EPc
RMQk45NVfU1ycG+UPXGAtjUWiMYT2gU=
=lWF5
-----END PGP SIGNATURE-----

--0xVLwENwrMrscJsq--


--===============0466059282769998964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

--===============0466059282769998964==--


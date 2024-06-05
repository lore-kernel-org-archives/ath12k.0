Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41473C27C53
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 11:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oL4Uemjj5nxcyfxVZcOlO3/v3QvoxM8aFI8L2ffattY=; b=03/Q4JqVZ6ojB2JvNTyp6Fc1xh
	AnAdA+X1so269ZY7bd/CGBFShbDyb0wijhUZduuBTzKlrGl/4eoZA1MDPayJoq4m0+IzjLZ19m486
	Ec6s9CicCpmRKUPI7CFSho2Aqa9V3o8cqjbE7YqQEtURj+g7ZOlz9RGkYWLOAgyhv2KEZXwSN3zpw
	J2j1BWd2U991eHF5vqSJUeZX3u6ytBQfj0IfhuDvCRMNvP1mdz8uESMWvTPXO0L4C7QB22RLDE2XW
	Yen3QNRu9fBz5L0Uq2SZlYC/ZlBG4bTl7v+uDg8E3C2QoMMy88Ajux3E6lxz8OTrNYZ9PIENukHn9
	3oZoHwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEoZb-00000005fb0-42vQ
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 11:12:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEoZY-00000005fYr-3uz5;
	Wed, 05 Jun 2024 11:12:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CE65DCE1764;
	Wed,  5 Jun 2024 11:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314C4C32786;
	Wed,  5 Jun 2024 11:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717585969;
	bh=yYAj163noFkob5L7lXkiWLT1nMsl/P7iRUgZ6mMxCvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXvanTAihYAPX/RJQpmYDHZb43VOd2kMMK/Hi3Ffzhpmrs+iX8mOmJ93cqF6ZQO+9
	 N2AH7FCTKu9GBr/SW4Bq0kfYXgJFDRpUPxsEdC1GLTxmBbsus3CmJKx4XXuBlBoOF4
	 y/daZufRlf0Q2x2hYGl5PgYltv3WUuuWQqCOl31qsY826eQOplQep9OWxxhrHkoIYT
	 NIApGI8rmQzjAtznelf2nu7sLBeNs31TUjBI1tef6CBmq2dqgRNDBH6NgyCPiT+eeF
	 SrvdpFtgm3dYC0phg7owIH7IrrmbD6dIvyh5itRgsCZ14/J3QgOUUan3e+WDH2HL5R
	 w+KruQVRvX7/Q==
Date: Wed, 5 Jun 2024 12:12:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath12k@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 01/17] regulator: dt-bindings: describe the PMU module
 of the QCA6390 package
Message-ID: <21a00ea1-1749-4fcc-87cd-1af8876a7efd@sirena.org.uk>
References: <20240528-pwrseq-v8-1-d354d52b763c@linaro.org>
 <20240604173021.GA732838@bhelgaas>
 <CAMRc=MeNPvZUyu6rtsWtdvXFmOOpmjKCEpkoc5zBfJy6qBpxrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ja+GgII04rJlrfXo"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeNPvZUyu6rtsWtdvXFmOOpmjKCEpkoc5zBfJy6qBpxrg@mail.gmail.com>
X-Cookie: Simulated picture.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_041253_419017_8751856E 
X-CRM114-Status: GOOD (  10.77  )
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


--Ja+GgII04rJlrfXo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2024 at 11:13:04AM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 4, 2024 at 7:30=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:

> > LDO?  Again below, but maybe this is obvious to everybody.

> Yes, this is an acceptable abbreviation to use, it's all over the
> bindings and regulator drivers.

Vastly more people are going to understand LDO than would be able to
expand the acronym.

--Ja+GgII04rJlrfXo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZgSCUACgkQJNaLcl1U
h9ByZgf/TG0Lj2GpWhjqjqffaI1t0B0aafiDHRBlSOkaq9el1b4FEPEjjrECf1Qh
ne5c8PYSt81tN22LJRsh4gK53Ff9ziSn2l0KjKes7LCUwu58zAXDKgrsji++9+Vw
vqxnhPdP5to25T28H3ds9QoF2jluYqiT/aQXtpRxZWWkO2xHYZ7eAwJe0vOn4rx8
cqMEBHu9a57G8kN5BIs6cwaNmwlorGxdPKyLdXx3F6+3NvqtbvHGT9XDAkIU+GtC
2QjuqiW8jM+xvSVYi+ALcYY0djf8Q7J8gmhyQaZa6UNFwO1H8AibziDOF9X7v7nB
oouRPtsj7Oma2IMcaDj8MW3Ry5Jhsw==
=tpqW
-----END PGP SIGNATURE-----

--Ja+GgII04rJlrfXo--


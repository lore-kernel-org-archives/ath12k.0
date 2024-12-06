Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DED4E77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1G7ggNV+HjnLVfjbvJlHCOP3F03LlqaoU9+GY+mXsk=; b=p8QhdkQQcORtJ7JYjleeNjXkrg
	no2MkKJar/js5di8Y4hnstds6+SL15Nbhbg6PhmnjYzgSfQ3m1JcBtYhVie3WQ5YMTD4wKA5tU5BO
	35Zcy8/bCTeAxsk+7YD/js1MArX/nwLXMDVF0XA2Q+OYyL7QdhgMMozFPCxGbMb3iQaiR5Mq/TKcc
	xkp5oPzoeOgJ7go/DtimcQY9ObYLA+EAVOD1FjQjI+rAnC3vr5S4XwQIrMy02ynTe+TEfvXF0teyL
	CmQZFBITSNxuatRTphHut/coDRFdyaIOA9FpPbrlDSs4XwmphlxsU08N4EgAguUnoUNbbOp8AQMkj
	L28Qcizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJblN-00000002HSN-3zyL
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 17:05:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJblL-00000002HRn-2g2x
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 17:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DE045C5FEC
	for <ath12k@lists.infradead.org>; Fri,  6 Dec 2024 17:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F83C4CED1;
	Fri,  6 Dec 2024 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733504706;
	bh=pbxJUWJTY5TChbpv/rOEyLYJArC43EGSJ74ar6wX124=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njoO97azQzfrxhKDbMbM1MoCM22qO+jl6/gMYabgA/pyEt60n18vcTV2Lu5XfrzRp
	 //AW8MPK2fNgSgHgy7so4yrlY5fXd8AxTMmfEI9Sew0LNgiEGECRLnCQyMNR5hoALa
	 kUmzp4WORoBEhpaFnvn31AUrjwukejUsvm8Yv4lxlzCvLyWZWp8u3FNFFhlDddjfhD
	 xwG3d6dv7xZaTrWlAgmE6CXWVTPjt+pvBgUDgV2hf6Wg1eyTiZ8M+yMYrpr6gDkPvN
	 720gvfZCjYbTrLC4nkfgdukvNLXbQ83qJhPHFGnG1SIW7Ue8JFtnvF1msnYPWP9AXq
	 s4Rb9GUhGid4w==
Date: Fri, 6 Dec 2024 17:05:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: net: wireless: Describe ath12k PCI
 module with WSI
Message-ID: <20241206-sugar-surely-9efffa93aa5c@spud>
References: <20241205203044.589499-1-kvalo@kernel.org>
 <20241205203044.589499-2-kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rdo5ZU0gHnMChw1D"
Content-Disposition: inline
In-Reply-To: <20241205203044.589499-2-kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_090507_720627_12D74C61 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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


--rdo5ZU0gHnMChw1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 10:30:37PM +0200, Kalle Valo wrote:
> +  qcom,wsi-controller:
> +    type: boolean
> +    description:
> +      The WSI controller device in the WSI group aids (is capable) to
> +      synchronize the Timing Synchronization Function (TSF) clock across
> +      all devices in the WSI group.

This should be type: flag btw.

--rdo5ZU0gHnMChw1D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1MuvwAKCRB4tDGHoIJi
0tfyAQCB/Ej4u6h44VI4yxBcx++if1Ey/ODl4wlzozM57MTJWAD+MoBttC+tWASw
y3QxDHh59f6noENg6hoj5hUX6dVQLQ8=
=r5SO
-----END PGP SIGNATURE-----

--rdo5ZU0gHnMChw1D--


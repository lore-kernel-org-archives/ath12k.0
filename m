Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876AFC2BBCA
	for <ath12k@archiver.kernel.org>; Fri, 28 Jun 2024 08:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nmE9a3gJXPwiVvhVnNyIAtbt7fKAiKt89PIciBVLNw=; b=JxGlUa0OigaungV/GUzDw+uLsp
	D419AwQYbImaSMEdAp2VW8RfUGhJuhlmLUuCrL3H5DxssrzvVyv2qwWuuq3Vd46NzCRaY5ZHRsidk
	O8a+d+YAOJNeyi0IOQcrz/Us7mdhZ1kbEx+Z+CyxIonF878NGKR5bLHxBO/epgGAAxeP0+pQOmOz1
	11Lv21zpiNCD/3D7nIfIMDlGgZt5RFxKakpttBi4H0zUL3klMo4Gfza28E74jNAHSCphrXu9Ywf+i
	q0IUr8jzJJfFPzyK8LyuaE4GaQTYVuom/Ip/EY/CrNzVckQ5Lh+lhO85vuYn5l7puoSrrpO4hDQv+
	mE4K+cxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6mX-0000000D2Oy-0pp6
	for ath12k@archiver.kernel.org;
	Fri, 28 Jun 2024 08:16:33 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6mU-0000000D2OT-0udU
	for ath12k@lists.infradead.org;
	Fri, 28 Jun 2024 08:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=9nmE9a3gJXPwiVvhVnNyIAtbt7fKAiKt89PIciBVLNw=;
	t=1719562589; x=1720772189; b=e7Tgug4G8dbU2SMgJKsUC0mJcSKJkAdEQdS04M/0JqIEMcO
	OZz/C/QHmuY23eactGqY1p5c2rmiBOdVYeZYf50V1se0DBRenIi1v6wV997J+1NUTR2OFty7cApHF
	F0u1F0Lxb74PSBc5D/MTkZtfEKeh1Uxta9a5Av4mWmlUz885ZWu1CyrWKIT6G0IQ+m74wME6z73KR
	S0Nas5R4Zv8s1oI5ZtBMTFJvw9ZhgxKzqjKrHOJ7NV0vP/nGY5pJ4opZ7FJpwvW0bccrKFPxySKHA
	nNl0bqxnyapayEsucd5RGx4SpHOBJPoalO9BFcPPAktxAkD61MSAfEtgy//CsbAw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sN6mR-00000009VCd-0ngL;
	Fri, 28 Jun 2024 10:16:27 +0200
Message-ID: <ba67b440b18876ca4e296a66a5197c2be81921d8.camel@sipsolutions.net>
Subject: Re: [PATCH 03/10] wifi: cfg80211: extend interface combination
 check for multi-radio
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Fri, 28 Jun 2024 10:16:26 +0200
In-Reply-To: <47e02b920cce18ed56e3fa7c93537124ce10024a.1718881762.git-series.nbd@nbd.name>
References: <cover.a7730420cfba0f204a60e4c30e6b0e07b441ff6b.1718881762.git-series.nbd@nbd.name>
	 <47e02b920cce18ed56e3fa7c93537124ce10024a.1718881762.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_011630_277486_D31A5076 
X-CRM114-Status: GOOD (  11.50  )
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

On Thu, 2024-06-20 at 13:11 +0200, Felix Fietkau wrote:
>=20
> +static inline u32
> +rdev_get_radio_mask(struct cfg80211_registered_device *rdev,
> +		    struct net_device *dev)
> +{
> +	struct wiphy *wiphy =3D &rdev->wiphy;
> +	u32 ret;
> +
> +	if (!rdev->ops->get_radio_mask)
> +		return 0;
> +
> +	trace_rdev_get_radio_mask(wiphy, dev);
> +	ret =3D rdev->ops->get_radio_mask(wiphy, dev);
> +	trace_rdev_return_int(wiphy, ret);

I'd tend to prefer tracing even if it's not implemented, so we see
what's going on? Though personally I guess in this case I don't even
care much since mac80211 will unconditionally implement it ...

> @@ -2366,14 +2374,19 @@ int cfg80211_iter_combinations(struct wiphy *wiph=
y,
>  					    void *data),
>  			       void *data)
>  {
> +	const struct wiphy_radio *radio =3D NULL;
> +	const struct ieee80211_iface_combination *c, *cs;
>  	const struct ieee80211_regdomain *regdom;
>  	enum nl80211_dfs_regions region =3D 0;
> -	int i, j, iftype;
> +	int i, j, n, iftype;
>  	int num_interfaces =3D 0;
>  	u32 used_iftypes =3D 0;
>  	u32 beacon_int_gcd;
>  	bool beacon_int_different;
> =20
> +	if (params->radio_idx >=3D 0)
> +		radio =3D &wiphy->radio[params->radio_idx];

Maybe we should have a sanity bounds check?

Or even really just __counted_by() annotations in struct wiphy_radio, so
we can run with UBSAN in testing (which would be a comment for patch 2,
but I'm not going to send it there again ;-) ).

johannes



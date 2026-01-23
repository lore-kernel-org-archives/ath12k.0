Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B61D778AF
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 19:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lvFd0/mWJQ6ENIAOZ/bB5AWBB9sjd4l9xVMv6ZlsWc=; b=ppFpYjMwmz72RH6UDPw7B5ZuCx
	W4yWWIXyeO3iFZ+DF0ChoaNCrGSdIul3e3hi5Mz9aedaoh3Lgk2FVhBZM6vpwMEQd+EBZcfyeaJlX
	NJax93JS0Qt7Pl7GJqMQjsgmWp7taLA2+X/fNZ3wfQ94ErR5iaDt+3L9Y5CZaElWi42gNCmfMPnDe
	oSGoSPX7cZJgL6I3iP4il6+Ba/OM1VW6JcaVLo6VrlbDhmVgNg/BsFdpw/deuT7mX1PCSWjgvsPkI
	GKQ5prQ0rOzJiyww+624L98tbu5b+mbt5SgAjBRt6R8npQPGMdyXdnPWc1WjeCQFIrhgLmZInBjHW
	HQd1QFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMWP-00000009Nib-0B3h;
	Fri, 23 Jan 2026 19:08:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMWM-00000009NiG-1Diw
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 19:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+lvFd0/mWJQ6ENIAOZ/bB5AWBB9sjd4l9xVMv6ZlsWc=;
	t=1769195318; x=1770404918; b=qrOHZ3TJDjCii1pNpDGR6khg+w9x0i/g51il/B5xPXObFac
	gW31H90v1MIV2B2FQWXbrUtNdjb4iQRwIk9sfPe2oj2Qu3Hg6audP3bgc8yolOpzDZzuVUL9Z4G1a
	N/ZOYphgasZzTcHE6uEJsZhhLpeuhG9Uia3iTBbkdOYIi12bMRh8jE14KQGyuGIROOHYNRcVQTbwI
	dFJGqWA4i0rILuafIDn7OZ8vtx0hNeumLs/Wv150hdGaavEqDtsCh+GRuLITAXG9pBD0kbuDQk7pJ
	bSA3zmADHvv+l5/28WvzAB4iTDCFYnpOE1AL3MhSbpwaU3hGgDv5EAxX3IftrzXw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vjMWF-00000001phA-38b6;
	Fri, 23 Jan 2026 20:08:31 +0100
Message-ID: <bfed10db742d29f0609acb04d3354695f87b24e2.camel@sipsolutions.net>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
From: Johannes Berg <johannes@sipsolutions.net>
To: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>, Nicolas Escande
	 <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 23 Jan 2026 20:08:31 +0100
In-Reply-To: <d26ee979-b5d5-4f50-b423-f8783122f603@freebox.fr> (sfid-20260123_193336_255577_6E33DF75)
References: <20260123144224.2216923-1-nico.escande@gmail.com>
	 <d26ee979-b5d5-4f50-b423-f8783122f603@freebox.fr>
	 (sfid-20260123_193336_255577_6E33DF75)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_110838_356860_241B5CE9 
X-CRM114-Status: GOOD (  10.43  )
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

On Fri, 2026-01-23 at 19:33 +0100, Pablo MARTIN-GOMEZ wrote:
>=20
> > @@ -4901,8 +4902,14 @@ static void ath12k_wmi_eht_caps_parse(struct ath=
12k_pdev *pdev, u32 band,
> >   	for (i =3D 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
> >   		cap_band->eht_cap_phy_info[i] =3D le32_to_cpu(cap_phy_info[i]);
> >  =20
> > -	if (band =3D=3D NL80211_BAND_6GHZ)
> > +	if (band =3D=3D NL80211_BAND_6GHZ) {
> >   		cap_band->eht_cap_phy_info[0] |=3D support_320mhz;
> > +	} else {
> > +		phy_cap[0] &=3D ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
> > +		phy_cap[1] &=3D ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
> > +		phy_cap[2] &=3D ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
> > +		phy_cap[6] &=3D ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
> > +	}
> If you want to clear all 320 MHz fields, you'll also have to clear=20
> IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ and=20
> IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ (not sure why it is not done=
=20
> in mac80211)
>=20

This is, effectively, a firmware workaround. It doesn't belong into
mac80211. All other drivers just have their capabilities managed in the
driver anyway.

johannes


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2617D778AE
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 19:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iasUyJbQU10Eo04yeCkcyUA+uV2FuBVjSWwwbEHdGXM=; b=WFOSzN+rvjUPdgmKPTEn/O+XNq
	icBgHJ5vdrr2jGGOKo4vP5IqNz8BxIlbOfkdyTfaDwfbizRBiUBpUKsP9x7Hs9Z7XLWctuJPOWAr/
	Y6KHkCZnCatnIpJ7c65MNhXSYJ1Y5lSDr8f7SdlA0wHCcDOmXNFm/mt22HIdsbEtcARS3HtS49H5h
	BWuLbIvGb0jr1hF2RW1kp16GXE/DejwnT6U/gdVExn/XvBkvzVL+5e9f5fHxoWpolJ6ZG4yvNW5Xg
	odAiHwVdylEB9yMebxrbvOR49NSEx2hnqgQ/JKaDFAbF7GbdIu/DPJgS3oCrQfSjOnl80kjLNUZQC
	jevG3jQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMqj-00000009QTH-2tXQ;
	Fri, 23 Jan 2026 19:29:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMqh-00000009QSw-0YU5
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 19:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=iasUyJbQU10Eo04yeCkcyUA+uV2FuBVjSWwwbEHdGXM=;
	t=1769196579; x=1770406179; b=LJKNhfL6VX+DFhtwGoxqviX+lgZWocQP6KDcAcGk0xEGwZy
	i/5sNI/Qsug5NEcTwnf+JxaaKZgwFy6sm74PWGOY3ZlS7PNa/x1cx+c09EHyFMcp4zgm4FXW55Gw4
	bmxgwCG75O1DnGbQ5mUc7Ux7Z+To2j9Vnu5glI1qWiBHHJ+0DHYzHKDhCWFhhyI75IdPlPRSjIo2n
	vQhy7VjkWknfKZMTMjV6fVrvVi7PCBlWy5TwBny+OAG42gegHyX9phqOKHTZhwVomxGxV0kOwf4D6
	ePwpPgFH4A6n1HRE2ZUCJBe5oplVPzVrBanlR52GjCzx5pZgoIRXn5kgsluBThXA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vjMqc-00000001q8x-2luF;
	Fri, 23 Jan 2026 20:29:35 +0100
Message-ID: <26bfd810c1dabc9ed86d4ba68cd20f6434c1d3a2.camel@sipsolutions.net>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
From: Johannes Berg <johannes@sipsolutions.net>
To: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>, Nicolas Escande
	 <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 23 Jan 2026 20:29:33 +0100
In-Reply-To: <b0e79f6c-36d7-4e49-9d43-8e305a598201@freebox.fr> (sfid-20260123_202122_653000_95B55B92)
References: <20260123144224.2216923-1-nico.escande@gmail.com>
	 <d26ee979-b5d5-4f50-b423-f8783122f603@freebox.fr>
	 <bfed10db742d29f0609acb04d3354695f87b24e2.camel@sipsolutions.net>
	 <b0e79f6c-36d7-4e49-9d43-8e305a598201@freebox.fr>
	 (sfid-20260123_202122_653000_95B55B92)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112939_317519_2C9F7F9D 
X-CRM114-Status: GOOD (  16.07  )
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

On Fri, 2026-01-23 at 20:21 +0100, Pablo MARTIN-GOMEZ wrote:
>=20
> > > > +	} else {
> > > > +		phy_cap[0] &=3D ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
> > > > +		phy_cap[1] &=3D ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MAS=
K;
> > > > +		phy_cap[2] &=3D ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK=
;
> > > > +		phy_cap[6] &=3D ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
> > > > +	}
> > > If you want to clear all 320 MHz fields, you'll also have to clear
> > > IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ and
> > > IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ (not sure why it is not d=
one
> > > in mac80211)
> > >=20
> > This is, effectively, a firmware workaround. It doesn't belong into
> > mac80211. All other drivers just have their capabilities managed in the
> > driver anyway.
> >=20
> > johannes
>=20
> I wasn't talking about putting this patch in mac80211 (I've seen the=20
> discussion on the patch Nicolas sent on linux-wireless), I'm talking=20
> about the function `ieee80211_put_eht_cap` clearing the Beamformee SS=20
> and Sounding Dimension fields but not the Non-OFDMA UL MU-MIMO and MU=20
> Beamformer fields for each bandwidth.

Ah, you're asking why mac80211 doesn't clear those bits ... I guess it
just doesn't matter. If you're not on 320 MHz I'd guess the bits are
never checked, so it's not really relevant at all, although then could
argue that you only need the first line here as well.

johannes


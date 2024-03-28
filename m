Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54291C54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 14:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFmBhPh8gg8olzgrUk+NQzaUZcs1g3w7206VS3gQTmM=; b=0Y/V9HSRoDETuMXOxZuB689Z7Z
	yOEM94TaoV0NyjJXgZq3pQGiYDpal5FYGj3Pj7hvEJwlnbHa/Xj2mSuLMSz44jIX/1LL7tehLRegD
	zFkgpLKWI1zr2c+Lb/pqs0utjranI/AWROn+xVa6heEkMVqv94Zp6jIAgizhPcbCqs/h1s9ywhT27
	Sn/Ch5tsdhPoa7730LfmOEGOnxbHDLZ4wsF0FPL8QshHymabmGw5MSg6E2w2TuFqPKTlYlI5oKt9b
	y3gLbDs1Aeph4l6QmG6I6FAZ9bWAEKCaDXzpt5RZi2zEY9cZhwqYpzdmo/tQJGnDR3zsV68jVdL2x
	dyVZXe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqYT-0000000EHNt-3kji
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 14:16:33 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqYQ-0000000EHNP-3udM
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 14:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=qFmBhPh8gg8olzgrUk+NQzaUZcs1g3w7206VS3gQTmM=;
	t=1711635390; x=1712844990; b=QnlDM0zi8WSmo7P0Itdv35Sw6pobgOlmWOBXdiRgyT2uEoW
	Km6Mz6GDc3zngyH/DW4HqWu05s9hqdqh8QosCz4ahFVKFIyXdhzrruBYE5LNPklUdnCpFc48BKUZG
	Ww4g9Zh67j9i4Vc95NbzJs9VcG8IYL/9ucyC+ZM0UwZGEDAYf4P+6ntXgRNe02xtRr9PEGUF4NFCt
	9T9Ked0CNmKvrKpMyxjh1bTf2uOLoxJzzQ7L98W7L1Nk2ankM73SHTd5+ggyRyo8G2flMPhLPGYDs
	Lord6DNdpe0JKycLdYN1VdtFK8QB5dsLBn1YpYe/t6watFH+bh2PPoiQjmYnO9Qw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpqYN-000000012MS-2C0b;
	Thu, 28 Mar 2024 15:16:27 +0100
Message-ID: <a24b7d967dbe31ef613fae8c331f4ff718482c93.camel@sipsolutions.net>
Subject: Re: [PATCH 09/13] wifi: cfg80211: Add multi-hardware iface
 combination support
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>
Date: Thu, 28 Mar 2024 15:16:26 +0100
In-Reply-To: <20240328072916.1164195-10-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-10-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_071631_071820_E61C5373 
X-CRM114-Status: GOOD (  29.66  )
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

On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>=20
>   * @new_beacon_int: set this to the beacon interval of a new interface
>   *	that's not operating yet, if such is to be checked as part of
>   *	the verification
> + * @chandef: Channel definition for which the interface combination is t=
o be
> + *	checked, when checking during interface preparation on a new channel,
> + *	for example. This will be used when the driver advertises underlying
> + *	hw specific interface combination in a multi physical hardware device=
.
> + *	This will be NULL when the interface combination check is not due to
> + *	channel or the interface combination does not include per-hw
> + *	advertisement.

This is input, so "will be" doesn't make much sense, more like "must
be"?

But I'm confused as to how that works with num_different_channels being
here too?

This function was, as far as I can tell, always checking the _full_
state. Now you're changing that, and I'm neither sure why, nor does it
seem well documented.

> + * @n_per_hw: number of Per-HW interface combinations.
> + * @per_hw: @n_per_hw of hw specific interface combinations. Per-hw chan=
nel
> + *	list index as advertised in wiphy @hw_chans is used as index
> + *	in @per_hw to maintain the interface combination of the corresponding
> + *	hw.

What?

If I'm reading that correctly, which is all but guaranteed, doesn't that
actually mean you don't need n_per_hw at all, since it necessarily equal
to n_hw_chans?

> +/**
> + * cfg80211_per_hw_iface_comb_advertised - if per-hw iface combination s=
upported
> + *
> + * @wiphy: the wiphy
> + *
> + * This function is used to check underlying per-hw interface combinatio=
n is
> + * advertised by the driver.
> + */
> +bool cfg80211_per_hw_iface_comb_advertised(struct wiphy *wiphy);

Is that even worth an export rather than being inline? Is it even needed
outside of cfg80211 itself?

Also for cfg80211_get_hw_idx_by_chan(), is it really needed?

I'm also wondering if we really should use the "hw_idx" everywhere.
Maybe that'd be more useful as a pointer to struct
ieee80211_chans_per_hw in most places (other than nl80211, obviously)?

The index always feels pretty fragile, a pointer at least gives us type-
checking?

Even in the interface combination advertising, perhaps, though not sure
how that'd work for the drivers.

> +static const struct ieee80211_iface_per_hw *
> +cfg80211_get_hw_iface_comb_by_idx(struct wiphy *wiphy,
> +				  const struct ieee80211_iface_combination *c,
> +				  int idx)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < c->n_hw_list; i++)
> +		if (c->iface_hw_list[i].hw_chans_idx =3D=3D idx)
> +			break;
> +
> +	if (i =3D=3D c->n_hw_list)
> +		return NULL;
> +
> +	return &c->iface_hw_list[i];
> +}

???

Hint: it's perfectly legal to return directly from a loop.

> +static int
> +cfg80211_validate_iface_comb_per_hw_limits(struct wiphy *wiphy,
> +					   struct iface_combination_params *params,
> +					   const struct ieee80211_iface_combination *c,
> +					   u16 *num_ifaces, u32 *all_iftypes)
> +{
> +	struct ieee80211_iface_limit *limits;
> +	const struct iface_comb_per_hw_params *per_hw;
> +	const struct ieee80211_iface_per_hw *per_hw_comb;
> +	int i, ret =3D 0;

The =3D 0 doesn't seem needed.

> +		ret =3D cfg80211_validate_iface_limits(wiphy,
> +						     per_hw->iftype_num,
> +						     limits,
> +						     per_hw_comb->n_limits,
> +						     all_iftypes);
> +
> +		kfree(limits);
> +
> +		if (ret)
> +			goto out;
> +	}
> +
> +out:
> +	return ret;

That 'out' label is pointless.

> +static void cfg80211_put_iface_comb_iftypes(u16 *num_ifaces)
> +{
> +	kfree(num_ifaces);
> +}

Not sure I see value in that indirection?

> +static u16*

missing space

> +cfg80211_get_iface_comb_iftypes(struct wiphy *wiphy,
> +				struct iface_combination_params *params,
> +				u32 *used_iftypes)
> +{
> +	const struct iface_comb_per_hw_params *per_hw;
> +	u16 *num_ifaces;
> +	int i;
> +	u8 num_hw;
> +
> +	num_hw =3D params->n_per_hw ? params->n_per_hw : 1;

I think we're allowed to use the "?:" shortcut.

> +	num_ifaces =3D kcalloc(num_hw, sizeof(*num_ifaces), GFP_KERNEL);
> +	if (!num_ifaces)
> +		return NULL;

But ... maybe we should just cap num_hw to a reasonable limit (4? 5?)
and use a static array in the caller instead of allocating here.

> +	is_per_hw =3D cfg80211_per_hw_iface_comb_advertised(wiphy);

Maybe call that "have_per_hw_combinations" or so? Or "check_per_hw"
even, "is" seems not clear - "what is?"

> +	/* check per HW validation */
> +	if (params->n_per_hw) {
> +		if (!is_per_hw)
> +			return -EINVAL;
> +
> +		if (params->n_per_hw > wiphy->num_hw)
> +			return -EINVAL;
> +	}
> +
> +	if (is_per_hw && params->chandef &&
> +	    cfg80211_chandef_valid(params->chandef))
> +		hw_chan_idx =3D cfg80211_get_hw_idx_by_chan(wiphy,
> +							  params->chandef->chan);
> +
> +	num_ifaces =3D cfg80211_get_iface_comb_iftypes(wiphy,
> +						     params,
> +						     &used_iftypes);
> +	if (!num_ifaces)
> +		return -ENOMEM;

But still like I said above, all this code seems really odd to me now,
it's checking *either* the per-hw and then only for a single HW, *or*
the global, but ... seems it should do full checks for both, if needed?

johannes


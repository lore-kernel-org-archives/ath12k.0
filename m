Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C5BC27C55
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNDpLAZwU/EYJiwT4OGqCeCzsKMxMr8tNN7YDNbfUtI=; b=24rXHWfnxgU9PZeanc0HohIth9
	M/ZrciJx6KLIheuFNVoFN1nhV7wFmfuAwIB128UNflxJ8eyis9A3gsNNdNpHXgTY9mIurec5BVShe
	qKSeFSNseDa3a4xChG7Vsc36GBuDIGVVmBh8+1TbsMVtBx0uZmkVGeJbLOOTwt7RlNtiT/p157cUN
	4qtMZ4hkW3j31EtdaLXCNGBqXvYW0/w+aAMqTMQE0TBvZkXwNkE6bBvQuteF7vT0vcrL6JaFDDX1h
	G8TylbvatvAhyO84yykzk1lKOVWlgp/52KlQhHU/YgoT2egcbpLWfhLTSdzd6iD+dgcOgy2TcjIzg
	EJoKPYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVxr-0000000DLE8-0xtt
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 09:32:51 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVxo-0000000DLDY-3AQz
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 09:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=wNDpLAZwU/EYJiwT4OGqCeCzsKMxMr8tNN7YDNbfUtI=;
	t=1717752768; x=1718962368; b=U+JhinqywtOl5+SnTZZX4KYAkDZ1dhhczruUAN/BgcIL7Pc
	3EaR9RREOa25ZHRAYWa1pZ920diPn0o9ES7ApY3o+dleD5g97UAr6yqkWZKutBjvaAA7GJbAdnrg6
	dwQlip0o/bR9bu+0WJi6f5XcW8Y9HBR8VrKltY8QAS5hSNIb3nVqv5jKKIHyKUwlSlU1qdr0twlVp
	Z1RHVBKH4q73oP1nCGTsSHig8KZdVRf2xsxBVFTkM12xu1xfbfnyeZBCkszs/AJwow28xSgMY4AKY
	HjtjUHOrgaTW1v/394AEfGhSj2i17v6Pw5Gwva4uNtpUhRv8GrKAYa0EsPhRCn6w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sFVxl-00000000rzy-3mMt;
	Fri, 07 Jun 2024 11:32:46 +0200
Message-ID: <65e01dcab3e934b1295fe64d9d311bd1fbdd2665.camel@sipsolutions.net>
Subject: Re: [RFC v3 3/8] wifi: cfg80211: extend interface combination check
 for multi-radio
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Fri, 07 Jun 2024 11:32:45 +0200
In-Reply-To: <754815488294f5b7f599b2adba085f1889b53b1a.1717696995.git-series.nbd@nbd.name>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
	 <754815488294f5b7f599b2adba085f1889b53b1a.1717696995.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_023248_848273_4FCB1602 
X-CRM114-Status: GOOD (  23.09  )
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

On Thu, 2024-06-06 at 20:07 +0200, Felix Fietkau wrote:
>=20
> @@ -4577,6 +4579,7 @@ struct mgmt_frame_regs {
>   *
>   * @set_hw_timestamp: Enable/disable HW timestamping of TM/FTM frames.
>   * @set_ttlm: set the TID to link mapping.
> + * @get_radio_mask: get bitmask of radios in use
>   */
>  struct cfg80211_ops {
>  	int	(*suspend)(struct wiphy *wiphy, struct cfg80211_wowlan *wow);
> @@ -4938,6 +4941,8 @@ struct cfg80211_ops {
>  				    struct cfg80211_set_hw_timestamp *hwts);
>  	int	(*set_ttlm)(struct wiphy *wiphy, struct net_device *dev,
>  			    struct cfg80211_ttlm_params *params);
> +	int	(*get_radio_mask)(struct wiphy *wiphy, struct net_device *dev,
> +				  u32 *mask);


not sure I see the point of this being a callback rather than being
passed in?

(Also, if really needed, do you actually expect a device with 32 radios?
if not you can use a return value instead of u32 *mask out pointer :) )


> +DEFINE_EVENT(wiphy_netdev_evt, rdev_get_radio_mask,
> +	TP_PROTO(struct wiphy *wiphy, struct net_device *netdev),
> +	TP_ARGS(wiphy, netdev)
> +);

and if we do need it that really should trace not just the fact that it
happened but also the return value and mask

>  static void cfg80211_calculate_bi_data(struct wiphy *wiphy, u32 new_beac=
on_int,
>  				       u32 *beacon_int_gcd,
> -				       bool *beacon_int_different)
> +				       bool *beacon_int_different,
> +				       const struct wiphy_radio *radio)
>  {
> +	struct cfg80211_registered_device *rdev;
>  	struct wireless_dev *wdev;
> +	int radio_idx =3D -1;
> =20
>  	*beacon_int_gcd =3D 0;
>  	*beacon_int_different =3D false;
> +	if (radio)
> +		radio_idx =3D radio - wiphy->radio;

This can go oh so wrong ... and technically even be UB. I'd rather pass
the index from the driver, I guess, and validate it against n_radios.
=20
> +	rdev =3D wiphy_to_rdev(wiphy);
>  	list_for_each_entry(wdev, &wiphy->wdev_list, list) {
>  		int wdev_bi;
> +		u32 mask;
> =20
>  		/* this feature isn't supported with MLO */
>  		if (wdev->valid_links)
>  			continue;

Are we expecting this to change? because the premise of this patchset is
MLO support, and yet with real MLO we won't get here?

Or is that because non-MLO interfaces could be created on this wiphy?

> =20
> +		if (radio_idx >=3D 0) {
> +			if (rdev_get_radio_mask(rdev, wdev->netdev, &mask))
> +				continue;


here: given that 'radio'/'radio_idx' is passed in, not sure I see why
the mask couldn't also be passed in?

> +			if (!(mask & BIT(radio_idx)))
> +				continue;

that could use a comment

> -	for (i =3D 0; i < wiphy->n_iface_combinations; i++) {
> -		const struct ieee80211_iface_combination *c;
> +	if (radio) {
> +		c =3D radio->iface_combinations;
> +		n =3D radio->n_iface_combinations;
> +	} else {
> +		c =3D wiphy->iface_combinations;
> +		n =3D wiphy->n_iface_combinations;
> +	}
> +	for (i =3D 0; i < n; i++, c++) {

that c++ is a bit too hidden for my taste there, but YMMV and I guess if
I wasn't reading the diff it'd be more obvious :)

johannes


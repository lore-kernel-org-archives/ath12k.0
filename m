Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FED6C2BBCA
	for <ath12k@archiver.kernel.org>; Fri, 28 Jun 2024 08:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgWzeyjxNHl6j7Gu/TQNjYhErpXP70xJ3qoulgp/PHs=; b=LFxXiQ/e7wPXZt42g/2DCoPSD3
	Rfp2eW4Y9xQ/7D2yZ6/92zpIafpYOyxjhq7FiD4LKub5/iZ5SmHMWpdUt8VAWbmNn3KFz1tRq7Z7O
	nNJ/aNf1MplQFMEDqd8GDG5BrJOAz5Zy+yUNYdtPElRpKOQFrhTucPMKpSuzSSIjUi9anFSTp9EzN
	Kkxm7RNFHMF6Xx/ey9V6FoJeyQ4x3yKPQkDsELsLQ9KfBUUp7PM98n4w6SJAw/m4tMGMkzNVXOb2j
	JLkcrwFhXXFHwkwpCDkTIeUxwTCRraUahu8c0oND03tRS429YEs03Y6ySh2jPwUn7P0wr/XWNYzwm
	vn6ewE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6j9-0000000D1p8-0g7b
	for ath12k@archiver.kernel.org;
	Fri, 28 Jun 2024 08:13:03 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6j6-0000000D1n8-02xa
	for ath12k@lists.infradead.org;
	Fri, 28 Jun 2024 08:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=jgWzeyjxNHl6j7Gu/TQNjYhErpXP70xJ3qoulgp/PHs=;
	t=1719562379; x=1720771979; b=vX7YLNikWSm6m2DibLTPyanQGEVFB/CsfsKhDqJU/gOkFYt
	dFyL3Enok/gOTpptwn/eDILKF9wnlwBGN/GvL2yllbx3eytVYyViI3gwq3AhA9QAI9y8SSz0H/SSM
	7OcLV6uVirNoDAEt3RLKs6XvpAiR4jDnFqs9RTXIxJb7dleeRom49BEbogjxWKs23BpI59NQC2EDS
	4DClMtOfot2tnGO/bUTbODj1KywWxrSwPlxi9aw8uDKSvhgBbzhaMCLmvNCASpUbCapXmyo5k6Syi
	pvX1gLZkj0xc1NJYlC6j1VvOTp5aeP2JJHtQXaHoJi9IzkRfAyMe+4HdarbcGPlQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sN6j2-00000009Uhu-38Ka;
	Fri, 28 Jun 2024 10:12:56 +0200
Message-ID: <757b46fb3a4f107e03ded0bd9c97578bc2234a02.camel@sipsolutions.net>
Subject: Re: [PATCH 02/10] wifi: cfg80211: add support for advertising
 multiple radios belonging to a wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Fri, 28 Jun 2024 10:12:55 +0200
In-Reply-To: <defa3f593a3b9bd42099cb945d3fede22f22f072.1718881762.git-series.nbd@nbd.name>
References: <cover.a7730420cfba0f204a60e4c30e6b0e07b441ff6b.1718881762.git-series.nbd@nbd.name>
	 <defa3f593a3b9bd42099cb945d3fede22f22f072.1718881762.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_011300_152996_B65EA8F7 
X-CRM114-Status: GOOD (  11.81  )
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
> + * @NL80211_WIPHY_RADIO_ATTR_FREQ_RANGES: Nested array of frequency rang=
es
> + *	supported by this radio.

That could point to &enum nl80211_wiphy_radio_freq_range (if it stays
this way)

However, also for new arrays defined in this patchset, which if I'm not
mistaken are

 - NL80211_ATTR_WIPHY_RADIOS
 - NL80211_ATTR_WIPHY_INTERFACE_COMBINATIONS
 - NL80211_WIPHY_RADIO_ATTR_FREQ_RANGES
 - NL80211_WIPHY_RADIO_ATTR_INTERFACE_COMBINATIONS

we should probably go with the times and use the multi-attr array
concept:
https://www.kernel.org/doc/html/latest/userspace-api/netlink/specs.html#mul=
ti-attr-arrays


That would change the structure so that each of the attributes listed
above can simply appear multiple times. I would consider at that point
renaming them all to singular (since each individually represents a
single entry), and perhaps at that point using a simple structure for
NL80211_WIPHY_RADIO_ATTR_FREQ_RANGE instead of the nesting. You could
even just move struct wiphy_radio_freq_range to nl80211.h

> +static int nl80211_put_radio(struct wiphy *wiphy, struct sk_buff *msg, i=
nt idx)
> +{
> +	const struct wiphy_radio *r =3D &wiphy->radio[idx];
> +	struct nlattr *radio, *freqs, *freq;
> +	int i;
> +
> +	radio =3D nla_nest_start(msg, idx);
> +	if (!radio)
> +		return -ENOBUFS;
> +
> +	freqs =3D nla_nest_start_noflag(msg, NL80211_WIPHY_RADIO_ATTR_FREQ_RANG=
ES);

Either way, however, new code should not use _noflag()

johannes



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D5FC27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZJ8Sy1xoeIn97faMJHr6oQebXUpyH/PLOTow55oVOQ=; b=WGEm7M2jdxbI6V626YgJIaY9Q0
	fHD5QqIsdCCBtPXlFcrSj4xmTn69HtYVtCXX+c+vcjeTxmQ3kZ2m77Lki/Wm/jRwHy2bDCEdoO5LI
	uD4d4w0Onf7VLxaeq4MEoNkQ1IxgFJlnDEHaZwcxnkJ4ztabNBz3v0Ah4wyFx2AMAcG2wr0ARYK37
	hR9Ey/8rb3OkHrbwru1wguR35V2xEu2kGrFobhMfK4rob8iTQ3ga0dkge2G8w3PKQgjFpwmTYE1fl
	KnQOGCroRuXdFGKNL2NpvNAFwn4J+7+IfIBPIz/1g0ZFcG0Pz5jSzg9nrhChdPgOvnvJgGNVaqED8
	bFHT61ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVqM-0000000DJ0j-0IkH
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 09:25:06 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVqJ-0000000DIyi-1p18
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 09:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=7ZJ8Sy1xoeIn97faMJHr6oQebXUpyH/PLOTow55oVOQ=;
	t=1717752300; x=1718961900; b=iED4wKgpnA4fN6I7x1SbWD+UuCRSpVS7e2PlSSowiEgAzdO
	DSVn4zMRdbOKy5GnXKETK11sGjp4f7ut5U5UF82FxW3naDfN1NOac8LCNpgb1MsET+sxv7TryTDAU
	eakhjTptP0jGU+L93b7p6c1FGABC1lzT006y9Tqyq1V6i10kG1vJnfpnfz1aMk1GaPHrTYdOkzKoG
	Y5Dti7hl6bNvISVRgxALuxHaJqv6RE+gh5p/qEMuPAB4t6UHU77rfcs/HlGggHwk+9GP8mljsSU2Y
	zZVO8UjzB5mx3CKKSTMV2+kOBH16Dvewrlt07W4+QBwtz3Ex6Ww+NwdR9e5iAYww==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sFVqD-00000000rRJ-2dic;
	Fri, 07 Jun 2024 11:24:57 +0200
Message-ID: <0ae7869140c8c2537fc638dba14223b25383f3d9.camel@sipsolutions.net>
Subject: Re: [RFC v3 2/8] wifi: cfg80211: add support for advertising
 multiple radios belonging to a wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Fri, 07 Jun 2024 11:24:56 +0200
In-Reply-To: <db7d83ea6d97e118a14029727e9e18d6e47b753d.1717696995.git-series.nbd@nbd.name>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
	 <db7d83ea6d97e118a14029727e9e18d6e47b753d.1717696995.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_022503_715076_F5EE91C5 
X-CRM114-Status: GOOD (  18.62  )
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

> The prerequisite for MLO support in cfg80211/mac80211 is that all the lin=
ks
> participating in MLO must be from the same wiphy/ieee80211_hw. To meet th=
is
> expectation, some drivers may need to group multiple discrete hardware ea=
ch
> acting as a link in MLO under single wiphy.

This is of course the motivation now, but I do wonder if this wouldn't
potentially also apply to a single device that's full dual-band capable
in some way? But doesn't really matter now.

But the thing is that it would let userspace differentiate between what
we mostly have today in a single device (multiple channels can be used,
but you have to go to powersave etc.), vs. a fully concurrent device.

IOW, it feels like this could be used to advertise fully concurrent
capabilities?

> + * struct wiphy_radio - This structure describes a physical radio belong=
ing
> + * to a wiphy. It is used to describe concurrent-channel capabilities of=
 the
> + * phy. Only one channel can be active on the radio described by struct
> + * wiphy_radio.

that's a bit long for the 'short description' :P

maybe just say "struct wiphy_radio - physical radio of a wiphy" and move
the full description down.

> + *
> + * @radio: radios belonging to this wiphy
> + * @n_radio: number of radios

Somewhere - either here or above - we should probably say that it's
assumed you only have a single radio (with the properties covered by the
interface combinations in the wiphy itself) if this isn't given at all.

(Which is what we assume today, more or less.)

> +++ b/include/uapi/linux/nl80211.h
> @@ -3401,6 +3401,8 @@ enum nl80211_attrs {
> =20
>  	NL80211_ATTR_ASSOC_SPP_AMSDU,
> =20
> +	NL80211_ATTR_RADIOS,

missing docs

> +/**
> + * enum nl80211_wiphy_radio_attrs - wiphy radio attributes
> + *
> + * @__NL80211_WIPHY_RADIO_ATTR_INVALID: Invalid

maybe if this is WIPHY_RADIO also call it NL80211_ATTR_WIPHY_RADIOS
above?

> + * @NL80211_WIPHY_RADIO_ATTR_FREQ_RANGES: Nested array of frequency rang=
es
> + *	supported by this radio.

Do we really want this complexity? We only have a single range now, do
we expect that to change? Non-contiguous ranges, where a hole in the
middle is supported by another radio?

Not sure I see the value vs. just having min/max freq directly here?

> +	freqs =3D nla_nest_start_noflag(msg, NL80211_WIPHY_RADIO_ATTR_FREQ_RANG=
ES);

Please don't add new _noflag code.

> +	nl_combis =3D nla_nest_start_noflag(msg,
> +					  NL80211_WIPHY_RADIO_ATTR_INTERFACE_COMBINATIONS);

same here

(and yes maybe userspace wants to unify the parsing of this with the
existing interface combinations attribute and pass the attribute ID or
something, but then it can fix the nested flag too.)

johannes


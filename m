Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E42C27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 09:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcyM4J3i8eT5X37rRw9HSt3/1V0+wkACsp31JSdtjMI=; b=eVaaTTvm+zYTo8CLbGGUFbl6ad
	Rf7FTmI0zEiYq0ckt1UrCSUZvkUJf9Uh/NC6PDYtEKKYpb9dxyYHIn0r4M/f+SxQVOAFz1sauAY+X
	QMwo/+Zti6UeV2MnhD4nSt8b4uyQzMJDeXYLrUSo5zxgxWQN6IUrc/9OkcrWR+V0HMejR5ZikLi4z
	QUJDt94mMaD0/Z744wZipekCK5I7ajIlhaqsG+BXqkkjzC69wW7kpEG/Giwf9bO8sK8Ag+5pwmE8k
	ca6qd6oXmAIh2pM7NEVQ55PpXeRydBawuhLS+mmVQddgRix2UanrcAHvJLHi8uBXwHAPPb6IgItOT
	mPDWJGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFW8m-0000000DOFz-1Oow
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 09:44:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFW8j-0000000DOFZ-2ms6
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 09:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JcyM4J3i8eT5X37rRw9HSt3/1V0+wkACsp31JSdtjMI=;
	t=1717753445; x=1718963045; b=qJWUHnOh6rwJHC4P4OcGETcYQ/U7Bo4VokcSfmKcgAi4Z3v
	HenAj0QntZ2sIxm1RYBzSplXbMqahNnc9k2cspfUs1OPC1sEhr8o6yx4HmmQM4EGMdfwmipQHWIZo
	q7MZ1vSKv4kPxlZaZx0l2OdduyF1ONPpb4qFLs7dWcOBhz5lJAcukPnq2S19i4YRr9P3+RNUgg+gY
	8ftduZjNvhFchqJHA09lcRL36AUBsMSbLnmHta2MrYjEFrOySN2Nr2dZauDPlRwtNNbhui5PA9w0G
	yFJpGXfjL9GDLiB2BR8K8I4WY1ys6E8XaZFCAbbYbCzZussy0C4SiY0jXXn60mBA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sFW8e-00000000swZ-3Eyx;
	Fri, 07 Jun 2024 11:44:00 +0200
Message-ID: <a1cff51f789c21b2b307c58ee4d743a62874cec6.camel@sipsolutions.net>
Subject: Re: [RFC v3 8/8] wifi: mac80211: add wiphy radio assignment and
 validation
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Fri, 07 Jun 2024 11:44:00 +0200
In-Reply-To: <9b331a61b8d53284b044bc594cf9952c60164e5f.1717696995.git-series.nbd@nbd.name>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
	 <9b331a61b8d53284b044bc594cf9952c60164e5f.1717696995.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_024405_727566_FB0CEEEF 
X-CRM114-Status: GOOD (  16.34  )
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
> +static bool
> +ieee80211_radio_freq_match(const struct wiphy_radio *radio,
> +			   const struct ieee80211_chan_req *chanreq)
> +{
> +	const struct wiphy_radio_freq_range *r;
> +	u32 freq;
> +	int i;
> +
> +	freq =3D ieee80211_channel_to_khz(chanreq->oper.chan);
> +	for (i =3D 0; i < radio->n_freq_range; i++) {
> +		r =3D &radio->freq_range[i];
> +		if (freq >=3D r->start_freq && freq <=3D r->end_freq)
> +			return true;

IMHO should be inclusive only on one side of the range. Can always make
it work since channels are at least a few MHz apart, but the purist in
me says it's easier to grok if the end is not inclusive :)

Maybe this should be a cfg80211 helper like

struct wiphy_radio *wiphy_get_radio(struct wiphy *wiphy, ... *chandef);

which could also check that the _whole_ chandef fits (though that should
probably also be handled elsewhere, like chandef_valid), and you can use
it to get the radio pointer and then check for =3D=3D below.

The point would be to have a single place with this kind of range logic.
This is only going to get done by mac80211 now, but it'd really be
awkward if some other driver had some other logic later.

>  	if (!curr_ctx || (curr_ctx->replace_state =3D=3D
>  			  IEEE80211_CHANCTX_WILL_BE_REPLACED) ||
> @@ -1096,6 +1117,12 @@ ieee80211_replace_chanctx(struct ieee80211_local *=
local,
>  			if (!list_empty(&ctx->reserved_links))
>  				continue;
> =20
> +			if (ctx->conf.radio_idx >=3D 0) {
> +					radio =3D &wiphy->radio[ctx->conf.radio_idx];
> +					if (!ieee80211_radio_freq_match(radio, chanreq))
> +							continue;
> +			}

something happened to indentation here :)

> +static bool
> +ieee80211_find_available_radio(struct ieee80211_local *local,
> +			       const struct ieee80211_chan_req *chanreq,
> +			       int *radio_idx)
> +{
> +	struct wiphy *wiphy =3D local->hw.wiphy;
> +	const struct wiphy_radio *radio;
> +	int i;
> +
> +	*radio_idx =3D -1;
> +	if (!wiphy->n_radio)
> +		return true;
> +
> +	for (i =3D 0; i < wiphy->n_radio; i++) {
> +		radio =3D &wiphy->radio[i];
> +		if (!ieee80211_radio_freq_match(radio, chanreq))
> +			continue;
> +
> +		if (!ieee80211_can_create_new_chanctx(local, i))
> +			continue;
> +
> +		*radio_idx =3D i;
> +		return true;
> +	}
> +
> +	return false;
> +}

which would also get used here to find the radio first, though would
have to differentiate n_radio still, of course.

johannes


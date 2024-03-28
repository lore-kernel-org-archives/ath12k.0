Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9E2C54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3mavgIZ6BDGJNBJObXPLTocvV0qaxQy/Cey5bC67Sw=; b=CFeXqkYO5LR4eNG80Th1zQMiVi
	4qrUW8TShMLfM5oIAjxo1A+FOTgtODuxQi2YUR13Nj2+u+Xur7HyOe0lbx7X57ShtpxVK9x5ktl8m
	/W4tc+CUKy9MOcnxev0Q+lp+MbhYxqPns5kZrOqWBbHc8MP5PK0eSX8G+AESHKA7YHIMlq+iGINyW
	Y7g6KJC8R1EagXM2zIrx/NWNPzCNqsGK59mQ5RN7aTxaFCh+RisXHum8If+UUpmuzjW4YlA70TB7F
	mf8yfn9rqlwLc/hPlvGYgOou6i/86q2WnB1IfydVxmWHVlRULP4o2AJYwf6+hur/M2QgjEw3mzjY6
	CHbMR3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpq2T-0000000E9zX-00q6
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 13:43:29 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpq2Q-0000000E9yd-0mLS
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 13:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=y3mavgIZ6BDGJNBJObXPLTocvV0qaxQy/Cey5bC67Sw=;
	t=1711633405; x=1712843005; b=oKsBTw3hvYKF8K1cvIYWQA2TZdtfsP6RCE/Cd4P3wVFBxV5
	nhhTQLusujw2NUUXvkBfaMHu3u6h3atxunJs3+l61ApOHGm3vaskmrvw5VyCnZuv+puL1H52hPDFX
	1jUWmcLw04d1NVwQyHjPeTfYaFM48/hLkjHC1qIGrKE5p/tqjzuZ0fEpwOqmlChIFqP+Btyh/m2no
	dyPd2xy1hIX9fsei/rBtRskjuoCe3f9LC1TTrXNXLQvGhZbh+x9aQ9Io9In7Bzx/HNNCseyoHiZ5D
	3r1WpWRO5vrro831S++KVFWrjGnTsa0DTh7StRMLJm46AFRFBM+QZMq6Qkn694GQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpq2M-000000010wi-3fTE;
	Thu, 28 Mar 2024 14:43:23 +0100
Message-ID: <e2c5f81882f86b26be4d9bcf3c9d4b1fd6001b22.camel@sipsolutions.net>
Subject: Re: [PATCH 08/13] wifi: cfg80211: Refactor the iface combination
 iteration helper function
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>
Date: Thu, 28 Mar 2024 14:43:21 +0100
In-Reply-To: <20240328072916.1164195-9-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-9-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_064326_248244_F1A3BB81 
X-CRM114-Status: GOOD (  13.94  )
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
> +static int
> +cfg80211_validate_iface_comb_limits(struct wiphy *wiphy,
> +				    struct iface_combination_params *params,
> +				    const struct ieee80211_iface_combination *c,
> +				    u16 num_interfaces, u32 *all_iftypes)
> +{
> +	struct ieee80211_iface_limit *limits;
> +	int ret =3D 0;

That initialization is useless.

> +
> +	if (num_interfaces > c->max_interfaces)
> +		return -EINVAL;
> +
> +	if (params->num_different_channels > c->num_different_channels)
> +		return -EINVAL;
> +
> +	limits =3D kmemdup(c->limits, sizeof(limits[0]) * c->n_limits,
> +			 GFP_KERNEL);
> +	if (!limits)
> +		return -ENOMEM;
> +
> +	ret =3D cfg80211_validate_iface_limits(wiphy,
> +					     params->iftype_num,
> +					     limits,
> +					     c->n_limits,
> +					     all_iftypes);
> +
> +	kfree(limits);
> +
> +	return ret;
> +}
> +
> +static u16 cfg80211_get_iftype_info(struct wiphy *wiphy,
> +				    const int iftype_num[NUM_NL80211_IFTYPES],
> +				    u32 *used_iftypes)
> +{
> +	enum nl80211_iftype iftype;
> +	u16 num_interfaces =3D 0;
> +

This should probably set *used_iftypes =3D 0.

> +	for (iftype =3D 0; iftype < NUM_NL80211_IFTYPES; iftype++) {
> +		num_interfaces +=3D iftype_num[iftype];
> +		if (iftype_num[iftype] > 0 &&
> +		    !cfg80211_iftype_allowed(wiphy, iftype, 0, 1))
> +			*used_iftypes |=3D BIT(iftype);

and that could really use a rewrite like

		if (!iftype_num[iftype])
			continue;

		num_interfaces +=3D ...

		if (!allowed...)
			*used_iftypes |=3D ...;

I'd say.

>  	for (i =3D 0; i < wiphy->n_iface_combinations; i++) {
>  		const struct ieee80211_iface_combination *c;
> -		struct ieee80211_iface_limit *limits;
>  		u32 all_iftypes =3D 0;
> =20
>  		c =3D &wiphy->iface_combinations[i];
> =20
> -		if (num_interfaces > c->max_interfaces)
> -			continue;
> -		if (params->num_different_channels > c->num_different_channels)
> +		ret =3D cfg80211_validate_iface_comb_limits(wiphy, params,
> +							  c, num_interfaces,
> +							  &all_iftypes);
> +		if (ret =3D=3D -ENOMEM) {
> +			break;
> +		} else if (ret) {
> +			ret =3D 0;
>  			continue;

Seems that 'break' is equivalent to just 'return ret'? And that setting
ret =3D 0 seems ... strange.

> -	return 0;
> +	return ret;
>  }

And then you don't need that either which is much nicer anyway...

johannes


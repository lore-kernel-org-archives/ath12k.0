Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECF1CD8C92
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 07:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhDeRmileUJXcl1fvdlAJxA6CEwCjrZVRNbCymhRyUU=; b=37jM5S95Pmrn4vXlcCm4g0ViJM
	kdr4wrfEnPKxbdxP0w7Id1GE4MmzDSJ5JE7kMnLTMqnQmeUduxGaTCtbJViXXAkQg3avpcB3wT7i+
	2zSKS3Q/edAx8gZ4XMDkygrP08zxSHEE4n2lhpRmFFO5qWJ13Qb+j+rOr7mlfE4R9A5RsznkD02dj
	IyCev9YNCgB1JCyb9FyvfaLZZfO4thCI7Bks9h3/UpjSrr3fYJNpgpBB/9ZRiVF0slWshiQV1B3Bh
	pRsmKgO2vVomlYXApQFK057vKyC9BIfywv/co87DC+IZN3MP4NUJEJjJlGIA2y2uUhwGyCjhmSHF6
	5XMEkk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUdG-000000030XQ-0FnH;
	Mon, 08 Jun 2026 07:42:50 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUdD-000000030Wy-18oS
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 07:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=uhDeRmileUJXcl1fvdlAJxA6CEwCjrZVRNbCymhRyUU=;
	t=1780904567; x=1782114167; b=GdJkj5nV0nr1l6v+ss/5d/RfpQfnpxutH5S62NJzAXKFBPs
	+qeZQ18CZdq8WFWoWs2olJq76HMUK/yJ4PALmY/gsJNndXxFsXB2MJgv/L8UOyvRV8mVrR1Th+HYs
	OxU2kXJsJrZXkjiRBm9zH6aLg47YYJ2dS4N/QUlkWUynGFmjvql3W0KhC8bl+PHvylhsZ+mxAnHc3
	CYQlU0OtYcWxCVB9PfKrLN0eGcZqJf75qgIOOzdf7SLP9A3n/nKLcr979rNTs6c6Vujj7u7cFOpPP
	ZLXlxqrzUui7yo/SvLSBbt5YRDbmeJfAMIcepWndyzcm25o9lMnGuRn2qVe7uhMw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wWUd9-00000005Zjo-3oQp;
	Mon, 08 Jun 2026 09:42:44 +0200
Message-ID: <88c183f827eb184e6d471964662b7ee89caf63ad.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next 4/5] wifi: cfg80211: Fragment per-link
 station stats in nl80211_dump_station()
From: Johannes Berg <johannes@sipsolutions.net>
To: P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Mon, 08 Jun 2026 09:42:43 +0200
In-Reply-To: <20260607175912.2266215-5-praneesh.p@oss.qualcomm.com>
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
	 <20260607175912.2266215-5-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_004247_493323_F42429E9 
X-CRM114-Status: GOOD (  23.19  )
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

On Sun, 2026-06-07 at 23:29 +0530, P Praneesh wrote:
>=20
> =20
> +static int nl80211_fill_link_station(struct sk_buff *msg,
> +				     struct cfg80211_registered_device *rdev,
> +				     struct link_station_info *link_sinfo)
> +{
> +	struct nlattr *bss_param, *link_sinfoattr;
> +
> +#define PUT_LINK_SINFO(attr, memb, type) do {				\
> +	BUILD_BUG_ON(sizeof(type) =3D=3D sizeof(u64));			\
> +	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_ ## attr) &&	\
> +	    nla_put_ ## type(msg, NL80211_STA_INFO_ ## attr,		\
> +			     link_sinfo->memb))				\
> +		goto nla_put_failure;					\
> +	} while (0)
> +#define PUT_LINK_SINFO_U64(attr, memb) do {				\
> +	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_ ## attr) &&	\
> +	    nla_put_u64_64bit(msg, NL80211_STA_INFO_ ## attr,		\
> +			      link_sinfo->memb, NL80211_STA_INFO_PAD))	\
> +		goto nla_put_failure;					\
> +	} while (0)
> +
> +	link_sinfoattr =3D nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);

See previous note about _noflag() in all of this code - that shouldn't
be there.

> +static int nl80211_send_link_station(struct sk_buff *msg,
> +				     struct netlink_callback *cb,
> +				     struct cfg80211_registered_device *rdev,
> +				     struct wireless_dev *wdev,
> +				     const u8 *mac_addr,
> +				     struct station_info *sinfo,
> +				     int link_idx)
> +{
> +	void *hdr;
> +	struct nlattr *links, *link;
> +	struct link_station_info *link_sinfo;
> +	struct nlattr *sinfoattr;
> +	int err;
> +
> +	hdr =3D nl80211hdr_put(msg, NETLINK_CB(cb->skb).portid,
> +			     cb->nlh->nlmsg_seq, NLM_F_MULTI,
> +			     NL80211_CMD_NEW_STATION);
> +	if (!hdr)
> +		return -EMSGSIZE;
> +
> +	if ((wdev->netdev &&
> +	     nla_put_u32(msg, NL80211_ATTR_IFINDEX, wdev->netdev->ifindex)) ||
> +	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
> +			      NL80211_ATTR_PAD) ||
> +	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, mac_addr) ||
> +	    nla_put_u32(msg, NL80211_ATTR_GENERATION, sinfo->generation)) {
> +		err =3D -EMSGSIZE;
> +		goto err_cancel;
> +	}
> +
> +	sinfoattr =3D nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);
> +	if (!sinfoattr) {
> +		err =3D -EMSGSIZE;
> +		goto err_cancel;
> +	}
> +
> +	link_sinfo =3D sinfo->links[link_idx];
> +	if (!link_sinfo) {
> +		err =3D -ENOENT;
> +		goto err_cancel;
> +	}
> +
> +	nla_nest_end(msg, sinfoattr);
> +	if (!is_valid_ether_addr(link_sinfo->addr)) {
> +		err =3D -EADDRNOTAVAIL;
> +		goto err_cancel;

That seems really odd? why even bother going into the whole thing if
it's invalid? Also, doesn't that ENOENT get propagated all the way and
it aborts? I guess it does but it should never happen because of
valid_links? Still seems a bit odd.

>=20
> @@ -8354,13 +8616,22 @@ static int nl80211_dump_station(struct sk_buff *s=
kb,
>  	struct wireless_dev *wdev;
>  	struct nl80211_dump_station_cb *cb_data =3D (void *)cb->ctx;
>  	struct nl80211_dump_station_ctx *ctx =3D cb_data->ctx;
> +	struct nlattr **attrbuf =3D NULL;
>  	int err, ret;
> =20
>  	NL_ASSERT_CTX_FITS(struct nl80211_dump_station_cb);
> =20
> -	err =3D nl80211_prepare_wdev_dump(cb, &rdev, &wdev, NULL);
> -	if (err)
> +	if (!ctx) {
> +		attrbuf =3D kzalloc_objs(*attrbuf, NUM_NL80211_ATTR);
> +		if (!attrbuf)
> +			return -ENOMEM;
> +	}
> +
> +	err =3D nl80211_prepare_wdev_dump(cb, &rdev, &wdev, attrbuf);
> +	if (err) {
> +		kfree(attrbuf);
>  		return err;
> +	}
> =20
>  	/* nl80211_prepare_wdev_dump acquired it in the successful case */
>  	__acquire(&rdev->wiphy.mtx);
> @@ -8369,15 +8640,22 @@ static int nl80211_dump_station(struct sk_buff *s=
kb,
>  	if (!ctx) {
>  		ctx =3D kzalloc_obj(*ctx);
>  		if (!ctx) {
> +			kfree(attrbuf);

perhaps better to __free(kfree) instead of doing all these kfree()
calls?

> -	/* Phase 0: dump aggregated station info */
> -	if (ctx->phase =3D=3D NL80211_DUMP_STA_PHASE_AGGREGATED) {
> -		while (true) {
> +	while (true) {
> +		/* Phase 0: dump aggregated station info */
> +		if (ctx->phase =3D=3D NL80211_DUMP_STA_PHASE_AGGREGATED) {

changing it now also kind of argues for not having it in the first patch
in the first place ;-)

>  			memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
>  			for (int i =3D 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
>  				ctx->sinfo.links[i] =3D
> @@ -8428,15 +8706,45 @@ static int nl80211_dump_station(struct sk_buff *s=
kb,
>  				goto out_err_release;
>  			}
> =20
> -			/* Reset ctx for next station */
> -			cfg80211_sinfo_release_content(&ctx->sinfo);
> -			ctx->sta_idx++;
> +			ctx->phase =3D NL80211_DUMP_STA_PHASE_PER_LINK;
>  		}
> -	}
> =20
> -	ctx->phase =3D NL80211_DUMP_STA_PHASE_AGGREGATED;
> -	err =3D skb->len;
> -	goto out_err;
> +		/* Phase 1: dump per-link station info */
> +		if (ctx->phase =3D=3D NL80211_DUMP_STA_PHASE_PER_LINK &&
> +		    ctx->dump_link_stats && ctx->sinfo.valid_links) {
> +			while (ctx->link_idx < IEEE80211_MLD_MAX_NUM_LINKS) {
> +				if (!(ctx->sinfo.valid_links &
> +				      BIT(ctx->link_idx))) {
> +					ctx->link_idx++;
> +					continue;
> +				}
> +
> +				ret =3D nl80211_send_link_station(skb, cb, rdev,
> +								wdev,
> +								ctx->mac_addr,
> +								&ctx->sinfo,
> +								ctx->link_idx);
>=20

I think conceptually this code is structured a bit strangely. It would
seem a lot simpler to me to do something like


	// not literally such a macro, just the while (true) loop
	for_each_station_starting_from_idx(...) {
		if (ctx->phase =3D=3D 0) {
			// fill sinfo etc.
		}

		// common stuff
		nl80211hdr_put()
		nla_put_u32(msg, NL80211_ATTR_IFINDEX...)
		nla_put_u64_64bit(msg, NL80211_ATTR_WDEV..)
		nla_put(msg, NL80211_ATTR_MAC...)
		nla_put_u32(msg, NL80211_ATTR_GENERATION...)

		switch (phase) {
		case 0:
			nl80211_put_sta_info_common(...);
			phase++;
			ctx->link_id =3D 0;
			break;
		case 1:
			if (!multi-phase-requested)
				break;
			nl80211_put_link_station(..., ctx->link_id);
			ctx->link_id++;
			if (link_id =3D=3D NUM_LINKS)
				ctx->phase =3D 0; // next sta
			break;
		}
	}


or something like that, more like we handle wiphy dump with all the
messages, for example?

I think it'd be better to have just one place that creates the header
and all the common info.

But maybe it's just my brain pathways being trained for that scheme.

johannes


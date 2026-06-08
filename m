Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AF7CD8C8E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 07:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGAs3kf3DqIJWdQ39BL7xCjyKdgupdA/VtxFLplKKMU=; b=V8Ubq1SQ7e8oMj8+8vBbNKOhwg
	JHCLomXlhaBdMhIEIsgDSnjrUAs/IiYPpfbqyCDksWZGAChBT7t/P23zXYPDRQ7yrbvZ2h9bg9XEZ
	CZvgpQBYCMwf7Bf4ASFcs1NG9CmJdcocR6m9zohzY4La8iStxLUqCWWB4KcJinE279fs4W4ywVo49
	i/++XS223t6YtWN55t0UqV7B2VWskGS8VCroCBF7I9Zsneq4sg5GySRj4rPcL18r3SCuWeUaiYCPL
	4BgFVywUTFihJECMUOZDDboGmJBZPhYBXtX4BzcEa5oxOrx7Wl13CdGeJpIzCJr7VPwFpN2W8c/lK
	0pw2xoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWURf-00000002ypd-09GY;
	Mon, 08 Jun 2026 07:30:51 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWURc-00000002ypE-3OM0
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 07:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=IGAs3kf3DqIJWdQ39BL7xCjyKdgupdA/VtxFLplKKMU=;
	t=1780903848; x=1782113448; b=WLxUD0YCY1L0JN1P1yv9jSpGElHhgn0NG6cr0fQyvmaaSkm
	c+umr9k5mxCTCVtLJt/q1PSdeRrkltojRWwQUWjXpQMaCMe+HEQPdJQjbW5XMGBLSv2GL51wm6lIG
	SzVqxxLtXanQ1ECD0pUDzbzNFeuWqtvonG7/fJGUa807bqr/3pe+f8mIo0//OYuoJ1R4pTHIF+Ufr
	NA+3pBLpPvM7feCPYggRJZu8zdjUwICdisG4rWxJhfwXR8ggz5l5NDBs9hdx043+sJNOUboPXivzz
	tMGr42le2pIbsUkuTS00CObeydyGn89bDgDiA+dIqsfRSRTV6jr6JxVfclus44Ow==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wWURZ-00000005ZMS-1EVx;
	Mon, 08 Jun 2026 09:30:45 +0200
Message-ID: <39d12d9ae3b18495ed634715c93ede2f68c5bbf0.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next 3/5] wifi: cfg80211: Refactor
 nl80211_dump_station() to prepare for per-link stats
From: Johannes Berg <johannes@sipsolutions.net>
To: P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Mon, 08 Jun 2026 09:30:44 +0200
In-Reply-To: <20260607175912.2266215-4-praneesh.p@oss.qualcomm.com>
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
	 <20260607175912.2266215-4-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_003048_871499_5957F412 
X-CRM114-Status: GOOD (  19.24  )
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
> +++ b/net/wireless/nl80211.c
> @@ -39,6 +39,39 @@ static int nl80211_crypto_settings(struct cfg80211_reg=
istered_device *rdev,
> =20
>  /* the netlink family */
>  static struct genl_family nl80211_fam;
> +/**
> + * enum nl80211_dump_station_phase - station dump fragmentation phases
> + * @NL80211_DUMP_STA_PHASE_AGGREGATED: send aggregated (MLO-combined) st=
ation
> + *	statistics for the station entry
> + * @NL80211_DUMP_STA_PHASE_PER_LINK: send per-link statistics for each a=
ctive
> + *	MLO link of the station; only used when dump_link_stats is set
> + */
> +enum nl80211_dump_station_phase {
> +	NL80211_DUMP_STA_PHASE_AGGREGATED =3D 0,
> +	NL80211_DUMP_STA_PHASE_PER_LINK   =3D 1,
> +};

[snip]

probably nicer to move this stuff to closer to the dump code that needs
it; at the very least it's missing a blank line.

Also I think the whole 'phase' introduction etc. seems to more belong to
patch 4 instead of this one? We can still do the structure allocation
etc. here.

> +struct nl80211_dump_station_ctx {
> +	int sta_idx;
> +	enum nl80211_dump_station_phase phase;
> +	u8 mac_addr[ETH_ALEN];
> +	struct station_info sinfo;
> +};
> +
> +/**
> + * struct nl80211_dump_station_cb - state stored in netlink_callback::ct=
x
> + * @wiphy_idx: args[0] - wiphy index from nl80211_prepare_wdev_dump
> + * @wdev_id: args[1] - wdev identifier from nl80211_prepare_wdev_dump
> + * @ctx: args[2] - dump station context pointer
> + *
> + * args[0] and args[1] are reserved by nl80211_prepare_wdev_dump().
> + * The ctx pointer must live at args[2] to avoid corrupting those fields=
.
> + */
> +struct nl80211_dump_station_cb {
> +	long wiphy_idx;
> +	long wdev_id;
> +	struct nl80211_dump_station_ctx *ctx;
> +};

I'm not sure I'm happy with this - better to just use args[2] directly
for a pointer to struct nl80211_dump_station_ctx?

>  static int nl80211_dump_station(struct sk_buff *skb,
>  				struct netlink_callback *cb)
>  {
> -	struct station_info sinfo;
>  	struct cfg80211_registered_device *rdev;
>  	struct wireless_dev *wdev;
> -	u8 mac_addr[ETH_ALEN];
> -	int sta_idx =3D cb->args[2];
> -	bool sinfo_alloc =3D false;
> -	int err, i;
> +	struct nl80211_dump_station_cb *cb_data =3D (void *)cb->ctx;
> +	struct nl80211_dump_station_ctx *ctx =3D cb_data->ctx;

This doesn't really seem better than just doing

	struct nl80211_dump_station_ctx *ctx =3D cb->args[2];

given the overlay with generic code.

Alternatively we could change the _whole_ nl80211 code (as a separate
commit, perhaps even converting other things later) to have

struct nl80211_dump_cb {
	long wiphy_idx;
	long wdev_id;
	union {
		long wiphy_filter;
		int mpath_idx;
		int reg_idx;
		int bss_idx;
		int survey_idx;
		//...

		// and later add
		struct nl80211_dump_station_ctx *sta_ctx;
	};
};

or so, and then we don't have the args[0]/... problem at all.

But I'm not convinced mixing the structs with "must have this type at
this offset" etc. is a good idea if it's going to stay this way.

> +	/* Phase 0: dump aggregated station info */
> +	if (ctx->phase =3D=3D NL80211_DUMP_STA_PHASE_AGGREGATED) {
> +		while (true) {
> +			memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
>=20

if you have this memset, why do you need this one:

> +out_err_release:
> +	cfg80211_sinfo_release_content(&ctx->sinfo);
> +	memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));

Seems a bit odd?

johannes


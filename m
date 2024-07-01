Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C284C2BD09
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lv/xWp67jD+3LKhR3cr2e3EDo3WK450xk+C/um+LvvM=; b=0B7m9mYoWWdB4mnwMwcqN/beTs
	2W3+X14MdF409Q60TE7eoIUg1FJKfI4lfhy8AUCzuiXVHZmAOZl1C/9YPzMHbwwO/t8MgWDdPxw2g
	v54JZgNVunVPRnfADk3rq50ZXHmSB9qPUM2CvIWsV8mL+r37V+8DV5xD6v+0JcvQCO675y+ONpq2m
	QaH3Hhd/+HedDHgNQx3aUwwqo/rZMJ43vjE3ngdsH92d1QNy5OPXRy1a5SjvXfe6zhv/Ssq5EZHSr
	ploQItjUt2WRp0vxGlyqTNgbv+GKmuf0NiNv5WVpUNJTi0VHHyvbmr+sSqCxbKvy7YykWxBXTrf2c
	TYi27TEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHFx-00000003WzS-2mzK
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 13:39:45 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHFv-00000003WyD-0eiw
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 13:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=lv/xWp67jD+3LKhR3cr2e3EDo3WK450xk+C/um+LvvM=;
	t=1719841182; x=1721050782; b=TTLgGGDLfwcXGpote3Mi13ndcSJbKS3pi78k4gm89gJ1wwo
	0N8lnJ47P6+L3bXrgmFyrWD3YYoL1EeHJ7fkMmiMcQ+tQFiKAhWg5oAYRFTHJNyPn7CUCb3A/MbO1
	o+0Yq1uVFhGCikQDtS8vWqsTCM90p9Z8XwVCz+G78Tqfg8ilh/b5gu4dmo25S2ra1xeFdVV+uBu1+
	cPR/USI4/nC3tMfYyZzMFGI1/dJF3ekjb0KlH/aAzQIJ1V02kskafs7iGhwlmnoHs0M9N2CMWSApI
	GmEZJYzA2oP0dfzFFKk9xCAWEDnqtCk7eEpGilx14L+bOb0eNlLmIYe2gkpvlAbw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sOHFq-00000002HCB-30iR;
	Mon, 01 Jul 2024 15:39:39 +0200
Message-ID: <5912f046e25d33ca429904483d95c2a648db5962.camel@sipsolutions.net>
Subject: Re: [PATCH v2 07/10] wifi: mac80211: extend ifcomb check functions
 for multi-radio
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Mon, 01 Jul 2024 15:39:37 +0200
In-Reply-To: <b136fe952d4a202da8831b18f3b17012354372c6.1719733819.git-series.nbd@nbd.name>
References: <cover.692a4cf1c6bce46eadecbcbf0f3e9e599099f8c4.1719733819.git-series.nbd@nbd.name>
	 <b136fe952d4a202da8831b18f3b17012354372c6.1719733819.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_063943_220384_17A18038 
X-CRM114-Status: GOOD (  18.15  )
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

On Sun, 2024-06-30 at 09:50 +0200, Felix Fietkau wrote:
>=20
> +++ b/net/mac80211/ieee80211_i.h
> @@ -2043,6 +2043,7 @@ static inline bool ieee80211_sdata_running(struct i=
eee80211_sub_if_data *sdata)
>  {
>  	return test_bit(SDATA_STATE_RUNNING, &sdata->state);
>  }
> +u32 ieee80211_get_radio_mask(struct wiphy *wiphy, struct net_device *dev=
);

nit: I feel like maybe there's a better place, and even if not there
should be a blank line? :)

> =20
>  /* link handling */
>  void ieee80211_link_setup(struct ieee80211_link_data *link);
> @@ -2640,8 +2641,8 @@ void ieee80211_recalc_dtim(struct ieee80211_local *=
local,
>  int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
>  				 const struct cfg80211_chan_def *chandef,
>  				 enum ieee80211_chanctx_mode chanmode,
> -				 u8 radar_detect);
> -int ieee80211_max_num_channels(struct ieee80211_local *local);
> +				 u8 radar_detect, int radio_idx);
> +int ieee80211_max_num_channels(struct ieee80211_local *local, int radio_=
idx);
>  void ieee80211_recalc_chanctx_chantype(struct ieee80211_local *local,
>  				       struct ieee80211_chanctx *ctx);

but maybe just put it next to ieee80211_max_num_channels()?

> +static u32
> +__ieee80211_get_radio_mask(struct ieee80211_sub_if_data *sdata)
> +{
> +	struct ieee80211_bss_conf *link_conf;
> +	struct ieee80211_chanctx_conf *conf;
> +	unsigned int link_id;
> +	u32 mask =3D 0;
> +
> +	for_each_vif_active_link(&sdata->vif, link_conf, link_id) {
> +		conf =3D rcu_dereference(link_conf->chanctx_conf);
> +		if (!conf || conf->radio_idx < 0)
> +			continue;
> +
> +		mask |=3D BIT(conf->radio_idx);
> +	}
> +
> +	return mask;
> +}
> +
> +u32 ieee80211_get_radio_mask(struct wiphy *wiphy, struct net_device *dev=
)
> +{
> +	struct ieee80211_sub_if_data *sdata =3D IEEE80211_DEV_TO_SUB_IF(dev);
> +
> +	return __ieee80211_get_radio_mask(sdata);

Here's the context stuff I was talking about - you're using
rcu_dereference() when it almost seems it should be sdata_dereference()
(or so, it's all equivalent now with wiphy dereference)?

I'm not sure how this even gets to be in an RCU critical section, e.g.
when called via

> +static bool
> +ieee80211_sdata_uses_radio(struct ieee80211_sub_if_data *sdata, int radi=
o_idx)
> +{
> +	if (radio_idx < 0)
> +		return true;
> +
> +	return __ieee80211_get_radio_mask(sdata) & BIT(radio_idx);
> +}

...

> +static void
> +ieee80211_fill_ifcomb_params(struct ieee80211_local *local,
> +			     struct iface_combination_params *params,
> +			     const struct cfg80211_chan_def *chandef,
> +			     struct ieee80211_sub_if_data *sdata)
> +{

...

> +	list_for_each_entry_rcu(sdata_iter, &local->interfaces, list) {
> +		struct wireless_dev *wdev_iter;
> +
> +		wdev_iter =3D &sdata_iter->wdev;
> +
> +		if (sdata_iter =3D=3D sdata ||
> +		    !ieee80211_sdata_running(sdata_iter) ||
> +		    cfg80211_iftype_allowed(local->hw.wiphy,
> +					    wdev_iter->iftype, 0, 1))
> +			continue;
> +
> +		if (!ieee80211_sdata_uses_radio(sdata_iter, params->radio_idx))
> +			continue;


here?

Also the list_for_each_entry_rcu() seems weird (although I see that we
even have pre-existing code like that now), because e.g.

 ieee80211_open()
-> ieee80211_check_concurrent_iface()
-> ieee80211_check_combinations()

is called outside RCU critical section? There's an existing
list_for_each_entry_rcu() inside of it which seems like it should be a
problem, so maybe I'm missing something?

... investigates a bit ...

yeah I can't get even CONFIG_PROVE_RCU_LIST to spit out warnings, but
checking manually, we (generally) aren't in RCU critical section here,
at least not unconditionally.

johannes



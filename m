Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1FDD5CC8C
	for <ath12k@archiver.kernel.org>; Wed, 30 Oct 2024 10:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjgMZp/MvoYIiuvXXF2zmjIunDCfVbEMvg0oRxBn7Gs=; b=AALJIv7rdD/SXK+8LUYi/SX5rD
	nIAUrfi0Ez8AWSkWbc1dQvSdNKjApNKXjMJB8xvlES3srv4NB9QKYX/B88tfM68dDx2OJRI42caOB
	cObKGptUf2k5jWt3ewBdiPND3oHhA2p/H4r6H0vfNPDTDY7pvEcOWhSaK9GoFoALTsh6i7SpprZGn
	G54GBW/ke4jpvYJuRkb46bvfrw3sJ9hX8uGWYYoXtv1oHufBnBF7Wedr9BtNeiYd1KhsGFQ2jh0yJ
	v8dyeYFl2K7otKC3sPT6G3oL0TiLeZ37MNzbseptoPubZW389aoo/ojItVZI5bu3Krepe8Bc56XSf
	WGseyCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t662k-0000000HZRd-2nQo
	for ath12k@archiver.kernel.org;
	Wed, 30 Oct 2024 10:35:14 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65rU-0000000HXVE-2MUO
	for ath12k@lists.infradead.org;
	Wed, 30 Oct 2024 10:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=fjgMZp/MvoYIiuvXXF2zmjIunDCfVbEMvg0oRxBn7Gs=;
	t=1730283814; x=1731493414; b=wCSpfneHiSwLWdkL9e5/6vfebOugEqgPPOVvTvVHUsbrGy9
	/0QNtYNapbPVFmCLhHdre6+W8QYNB/plH6TLxaNq68z9Z+D7mh/KkyPkhRUxzDKZjUzF/nR1ZqS4V
	nKVhT/yT6Rk0D6EPfsoXify4FgrriHKcsMtlLYAA51pmA7ol+jdgHDxaFwkK01BGHVEq++SCxszBP
	xpyUKOnck/LK+a40XdmK/pSgKCs3QYoUssSfg8LIJOqFw75oz/dQu+1RRjSKT5F6ZRPoVKWS+1e1u
	BdHhM+gd72nBERaVy1UL042P1iRV+AhCJehYTpQTqukeGwEcRcWgWj/N5u77vI5g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1t65rP-00000009K9J-08lg;
	Wed, 30 Oct 2024 11:23:31 +0100
Message-ID: <e56621b7a8b229f726d644ffde7b98ba0c11b06b.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: cfg80211: Correctly handle Medium Synchronization
 Delay
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 30 Oct 2024 11:23:28 +0100
In-Reply-To: <20241030025515.16004-1-quic_lingbok@quicinc.com>
References: <20241030025515.16004-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_032336_782696_5DB95DC9 
X-CRM114-Status: GOOD (  33.23  )
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

Hi,

On Wed, 2024-10-30 at 10:55 +0800, Lingbo Kong wrote:
> Currently, when the driver attempts to connect to an AP MLD with multiple
> APs, the cfg80211_mlme_check_mlo_compat() function requires the Medium
> Synchronization Delay values from different APs of the same AP MLD to be
> equal, which may result in connection failures.
>=20
> This is because when the driver receives a multi-link probe response from
> an AP MLD with multiple APs, cfg80211 updates the Elements for each AP
> based on the multi-link probe response. If the Medium Synchronization Del=
ay
> is set in the multi-link probe response, the Elements for each AP belongi=
ng
> to the same AP MLD will have the Medium Synchronization Delay set
> simultaneously. If non-multi-link probe responses are received from
> different APs of the same MLD AP, cfg80211 will still update the Elements
> based on the non-multi-link probe response. Since the non-multi-link prob=
e
> response does not set the Medium Synchronization Delay
> (IEEE 802.11be-2024-35.3.4.4), if the Elements from a non-multi-link prob=
e
> response overwrite those from a multi-link probe response that has set th=
e
> Medium Synchronization Delay, the Medium Synchronization Delay values for
> APs belonging to the same AP MLD will not be equal. This discrepancy caus=
es
> the cfg80211_mlme_check_mlo_compat() function to fail, leading to
> connection failures. Commit ccb964b4ab16
> ("wifi: cfg80211: validate MLO connections better") did not take this int=
o
> account.

The specification confuses me a bit and I am probably missing
something.

> To address this issue, add a u16 type member to the struct cfg80211_bss t=
o
> store the Medium Synchronization Delay. When the driver receives a probe
> response with the Medium Synchronization Delay set, update this member=E2=
=80=99s
> value; otherwise, do not update it. Additionally, modify the parameter li=
st
> of cfg80211_mlme_check_mlo_compat() so that this member variable can be
> directly accessed within the cfg80211_mlme_check_mlo_compat() function vi=
aq
> a pointer to the struct cfg80211_bss. This will allow checking whether th=
e
> Medium Synchronization Delay values from different APs of the same AP MLD
> are equal.

This feels like a recipe for failures. Whether or not an ML-Probe
Response is seen should not generally affect the validity of a BSS.
Which means that the validity check itself may be incorrect.

Maybe we should only compare the values if the subfield has been
included?


That said, do you understand when exactly the subfield should be
included? It seems that it may be carried in the "(Re)Association
Response", in which case it would be consistent anyway.

The ML probe response part seems a bit specific. Could it be that this
is intended to be used by NSTR APs only, in which case there would not
be a beacon on the secondary AP. If that is the case, then there
wouldn't be much of an inconsistency (though we would still need to be
a bit careful).

Benjamin

>=20
> Fixes: ccb964b4ab16 ("wifi: cfg80211: validate MLO connections better")
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> ---
> =C2=A0include/net/cfg80211.h |=C2=A0 4 ++++
> =C2=A0net/wireless/mlme.c=C2=A0=C2=A0=C2=A0 | 11 +++++++----
> =C2=A0net/wireless/scan.c=C2=A0=C2=A0=C2=A0 | 15 +++++++++++++++
> =C2=A03 files changed, 26 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index 27acf1292a5c..ebeb305c1d0c 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -2956,6 +2956,8 @@ struct cfg80211_bss_ies {
> =C2=A0 * @cannot_use_reasons: the reasons (bitmap) for not being able to =
connect,
> =C2=A0 *	if @restrict_use is set and @use_for is zero (empty); may be 0 f=
or
> =C2=A0 *	unspecified reasons; see &enum nl80211_bss_cannot_use_reasons
> + * @med_sync_delay: Medium Synchronization delay as described in
> + *	IEEE 802.11be-2024 Figure 9-1074q.
> =C2=A0 * @priv: private area for driver use, has at least wiphy->bss_priv=
_size bytes
> =C2=A0 */
> =C2=A0struct cfg80211_bss {
> @@ -2986,6 +2988,8 @@ struct cfg80211_bss {
> =C2=A0	u8 use_for;
> =C2=A0	u8 cannot_use_reasons;
> =C2=A0
> +	u16 med_sync_delay;
> +
> =C2=A0	u8 priv[] __aligned(sizeof(void *));
> =C2=A0};
> =C2=A0
> diff --git a/net/wireless/mlme.c b/net/wireless/mlme.c
> index 4dac81854721..ae00c36779d2 100644
> --- a/net/wireless/mlme.c
> +++ b/net/wireless/mlme.c
> @@ -326,7 +326,9 @@ void cfg80211_oper_and_vht_capa(struct ieee80211_vht_=
cap *vht_capa,
> =C2=A0}
> =C2=A0
> =C2=A0static int
> -cfg80211_mlme_check_mlo_compat(const struct ieee80211_multi_link_elem *m=
le_a,
> +cfg80211_mlme_check_mlo_compat(const struct cfg80211_bss *bss_a,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct cfg80211_bss *bss_b=
,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ieee80211_multi_lin=
k_elem *mle_a,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ieee80211_mult=
i_link_elem *mle_b,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct netlink_ext_ack *ext=
ack)
> =C2=A0{
> @@ -340,8 +342,7 @@ cfg80211_mlme_check_mlo_compat(const struct ieee80211=
_multi_link_elem *mle_a,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	if (ieee80211_mle_get_eml_med_sync_delay((const u8 *)mle_a) !=3D
> -	=C2=A0=C2=A0=C2=A0 ieee80211_mle_get_eml_med_sync_delay((const u8 *)mle=
_b)) {
> +	if (bss_a->med_sync_delay !=3D bss_b->med_sync_delay) {
> =C2=A0		NL_SET_ERR_MSG(extack, "link EML medium sync delay mismatch");
> =C2=A0		return -EINVAL;
> =C2=A0	}
> @@ -426,7 +427,9 @@ static int cfg80211_mlme_check_mlo(struct net_device =
*dev,
> =C2=A0		if (WARN_ON(!mles[i]))
> =C2=A0			goto error;
> =C2=A0
> -		if (cfg80211_mlme_check_mlo_compat(mles[req->link_id], mles[i],
> +		if (cfg80211_mlme_check_mlo_compat(req->links[req->link_id].bss,
> +						=C2=A0=C2=A0 req->links[i].bss,
> +						=C2=A0=C2=A0 mles[req->link_id], mles[i],
> =C2=A0						=C2=A0=C2=A0 extack)) {
> =C2=A0			req->links[i].error =3D -EINVAL;
> =C2=A0			goto error;
> diff --git a/net/wireless/scan.c b/net/wireless/scan.c
> index 1c6fd45aa809..6ad935475484 100644
> --- a/net/wireless/scan.c
> +++ b/net/wireless/scan.c
> @@ -1899,6 +1899,13 @@ cfg80211_update_known_bss(struct cfg80211_register=
ed_device *rdev,
> =C2=A0	 */
> =C2=A0	if (signal_valid)
> =C2=A0		known->pub.signal =3D new->pub.signal;
> +
> +	/* update medium synchronization delay when its value is not
> +	 * the default.
> +	 */
> +	if (new->pub.med_sync_delay !=3D IEEE80211_MED_SYNC_DELAY_DEFAULT)
> +		known->pub.med_sync_delay =3D new->pub.med_sync_delay;
> +
> =C2=A0	known->pub.capability =3D new->pub.capability;
> =C2=A0	known->ts =3D new->ts;
> =C2=A0	known->ts_boottime =3D new->ts_boottime;
> @@ -2224,6 +2231,7 @@ cfg80211_inform_single_bss_data(struct wiphy *wiphy=
,
> =C2=A0	int bss_type;
> =C2=A0	bool signal_valid;
> =C2=A0	unsigned long ts;
> +	const struct element *ml;
> =C2=A0
> =C2=A0	if (WARN_ON(!wiphy))
> =C2=A0		return NULL;
> @@ -2267,6 +2275,7 @@ cfg80211_inform_single_bss_data(struct wiphy *wiphy=
,
> =C2=A0	tmp.pub.use_for =3D data->use_for;
> =C2=A0	tmp.pub.cannot_use_reasons =3D data->cannot_use_reasons;
> =C2=A0	tmp.bss_source =3D data->bss_source;
> +	tmp.pub.med_sync_delay =3D IEEE80211_MED_SYNC_DELAY_DEFAULT;
> =C2=A0
> =C2=A0	switch (data->bss_source) {
> =C2=A0	case BSS_SOURCE_MBSSID:
> @@ -2321,6 +2330,12 @@ cfg80211_inform_single_bss_data(struct wiphy *wiph=
y,
> =C2=A0		break;
> =C2=A0	case CFG80211_BSS_FTYPE_PRESP:
> =C2=A0		rcu_assign_pointer(tmp.pub.proberesp_ies, ies);
> +		ml =3D cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_MULTI_LINK,
> +					=C2=A0=C2=A0=C2=A0 ies->data, ies->len);
> +		if (ml)
> +			tmp.pub.med_sync_delay =3D
> +				ieee80211_mle_get_eml_med_sync_delay(ml->data + 1);
> +
> =C2=A0		break;
> =C2=A0	}
> =C2=A0	rcu_assign_pointer(tmp.pub.ies, ies);
>=20
> base-commit: e7e2957f403ba4655199f2ba9920c1a015a7be44



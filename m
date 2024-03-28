Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D84FC54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 13:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBJJ0NlroRwEUwROKMDVanfjub6GNe9fdXa0RuT5jrE=; b=fyd/Ys60nDSjGRldu38lbuO+iE
	Z/iXwmxWwkh4J7rLwtF78N/KSBn/k7kMDyovwHePYb+5Qu3/HOqAJtYGhvDMyVaw2jQAYeGs4bg1v
	zdqVv8w6MMlkhTp5UA8Xo1ywfrY/hOGvARe1AhcGZqAcvbCusNtd+XdDH8aW6BZxw5OLFR4tqPNJU
	EIHyK7qvxfRN4gRJ3e+POMHAPXvDV+6OUXtlH7M6aw67fHkctoHOt2fwjDXwE77b3OW/wOb4V4I31
	YpgNxs7qVGbdsX06NCflQnBSwMLVtSUzvrdWHxFQtW8A+NlP7T24Bje3LDCKr3xGljp7MvZ+MhaSC
	MgtbXVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppiU-0000000E5mR-1TAI
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 13:22:50 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppiR-0000000E5lU-0cIM
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 13:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=hBJJ0NlroRwEUwROKMDVanfjub6GNe9fdXa0RuT5jrE=;
	t=1711632166; x=1712841766; b=DPycQSNN9vGIcaeSVHuRTU9V5I3rzTAGUstomwwpxl6Wzc9
	P0fFs+R9V0V/KnWUFKPKo465ixShXU+7+sBGNiZT4QHFF4XG2fkZ+l+1L6yeCIqvCeYZFiP6mU8s6
	NWc00KA6AsfPLjq3NPqcmv9daou5dewcNvDfarrNKUKAAuWbwqr0/J/3wgYAIJRAO9amJAqoOfHue
	OsuOMSHyQSLaTUlWUUdRMKP80EtWf0ZNHdc8zejEQDfk1j3OwjDVpv64qipvoMQ8koKzbAtVp460T
	LPCGafxZem6I54CpdtBwFp/FqU8DdrtZ72siEEO1z+kGuoGE22W2oYb5RJvmIMYw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rppiO-00000000zsp-22tR;
	Thu, 28 Mar 2024 14:22:44 +0100
Message-ID: <8e1d403251a8c8e5c9fe34d9dea51b8ea60b6b6b.camel@sipsolutions.net>
Subject: Re: [PATCH 04/13] wifi: cfg80211/mac80211: extend iface comb
 advertisement for multi-hardware dev
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>
Date: Thu, 28 Mar 2024 14:22:43 +0100
In-Reply-To: <20240328072916.1164195-5-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-5-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_062247_207855_356077E9 
X-CRM114-Status: GOOD (  16.80  )
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

Not sure why this is a combined cfg/mac patch, there doesn't seem to be
all that much need for that? I'd probably rather see this and patch 6
squashed, but cfg/mac kept separate.


On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:

>=20
> +static int
> +ieee80211_check_per_hw_iface_comb(struct ieee80211_local *local,
> +				  const struct ieee80211_iface_combination *c)
> +{
> +	int hw_idx, lmt_idx;
> +	u32 hw_idx_bm =3D 0;

lmt_idx? (also that's only needed in the loop)
bm?

> +	if (!local->hw.wiphy->num_hw)
> +		return -EINVAL;
> +
> +	if (local->emulate_chanctx)
> +		return -EINVAL;
> +
> +	for (hw_idx =3D 0; hw_idx < c->n_hw_list; hw_idx++) {
> +		const struct ieee80211_iface_per_hw *hl;

hl?

Could have a bit more evocative names :)

I'd rather see 'i' for some iteration thingie  than "lmt_idx" which
means nothing on first reading either, but you start thinking it should
mean something ...

> +static bool
> +cfg80211_hw_chans_includes_dfs(const struct ieee80211_chans_per_hw *chan=
s)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < chans->n_chans; i++) {
> +		if (chans->chans[i].band =3D=3D NL80211_BAND_5GHZ &&
> +		    ((chans->chans[i].center_freq >=3D 5250 &&
> +		     chans->chans[i].center_freq <=3D 5340) ||
> +		    (chans->chans[i].center_freq >=3D 5480 &&
> +		     chans->chans[i].center_freq <=3D 5720)))

???

That's not how this works upstream.

> +		if (WARN_ON(hl->max_interfaces < 2 &&
> +			    (!comb->radar_detect_widths ||
> +			     !(cfg80211_hw_chans_includes_dfs(chans)))))

No need for extra parentheses.

> @@ -701,6 +786,13 @@ static int wiphy_verify_combinations(struct wiphy *w=
iphy)
>  		/* You can't even choose that many! */
>  		if (WARN_ON(cnt < c->max_interfaces))
>  			return -EINVAL;
> +
> +		/* Do similar validations on the freq range specific interface
> +		 * combinations when advertised.
> +		 */
> +		if (WARN_ON(c->n_hw_list &&
> +			    wiphy_verify_comb_per_hw(wiphy, c)))

Don't need the n_hw_list check here, the function just does nothing if
it's 0 anyway.

johannes


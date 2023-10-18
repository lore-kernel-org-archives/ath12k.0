Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F3ECDB482
	for <ath12k@archiver.kernel.org>; Wed, 18 Oct 2023 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyFGMYIsTO180rJTl8u9j+8AdI4MjgUb0PBRBe5wjOk=; b=SWchcqA1CJ+U2t
	yc6+4JKqy31tQrbjE9eW/vyBr078j/YscG7xsHLkp+JRTDvbp/dkUdyIUoBQ0EaHujAWqXQDpH+V9
	UsFEjB88dIdXpmYICHmKXnVEa/iSwvRMp9FZht/WE3ZYoNnTZj79PMhbna1iz1bHC3iFz0l8VXRZp
	Z8atF4YxRBbpB7wMWdCxD9G+Yb5HHih40o19CoSoitv5FZb3dMR4ZdFf71pU5bR+czEW/TYFbbrDx
	xcPtWIRkPRHmkBkauLobp0jNKzPf4VAOAw1EhZ6InWvkYm/QLAVz+qrs+hsTjvGJ26RMVHDxXvoxB
	l6kLhDl16Ls1Qbw8hnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4tw-00EaGd-02
	for ath12k@archiver.kernel.org;
	Wed, 18 Oct 2023 11:39:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4ts-00EaDX-34
	for ath12k@lists.infradead.org;
	Wed, 18 Oct 2023 11:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bCy8dKQpQ9iG+rcaw3GhkrRi3vhdBx1LFm1P6vdeUMg=;
	t=1697629181; x=1698838781; b=mBREfynix1xIdOUPcGItiRvWugesxKn2euXOyVeaYOuPTfz
	L25HXgLQVa66ExgdaeXa/LspbDmISaUwFU/f2JjoIgSxJ38mO6WLu8fKJ1bs6piJWHpOGu+nZ4llK
	gJhLucDVsSGKQDDUOM2CJGFGImwZKkdsAGEhZDZI97wu7eFU+cSXmoGdYG04H7rVCIVgkXd9f5wI9
	5RLRyjNNj4qkkweN7leq2PKnD1Nfjslcm4SQUQS9oBE1gVtX6djbdz6YI/MN1fLw/+m9GYtUVAxw3
	41W9JJfTDcDbo3WXcguvIsDhHmgl3/OjBtK8hXrSxO7x36eAGWgZoUcTWKLLHddA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qt4tm-0000000Blvt-1ctA;
	Wed, 18 Oct 2023 13:39:38 +0200
Message-ID: <08ff36664eb34bce8e7beb425233b1e8d4a4971c.camel@sipsolutions.net>
Subject: Re: [PATCH 1/4] wifi: mac80211: mlme: fix verification of
 puncturing bitmap obtained from AP
From: Johannes Berg <johannes@sipsolutions.net>
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 18 Oct 2023 13:39:37 +0200
In-Reply-To: <20230928055022.9670-2-quic_kangyang@quicinc.com>
References: <20230928055022.9670-1-quic_kangyang@quicinc.com>
	 <20230928055022.9670-2-quic_kangyang@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_043944_991499_BC9AFD96 
X-CRM114-Status: GOOD (  16.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Thu, 2023-09-28 at 13:50 +0800, Kang Yang wrote:
> 
> +static enum nl80211_chan_width
> +ieee80211_rx_bw_to_nlwidth(enum ieee80211_sta_rx_bandwidth bw)
> +{
> +	switch (bw) {
> +	case IEEE80211_STA_RX_BW_20:
> +		return NL80211_CHAN_WIDTH_20;

So for a while now I was actually not responding to this because I was
scratching my head over how this function ever could be needed or make
sense ...


>  static bool ieee80211_config_puncturing(struct ieee80211_link_data *link,
>  					const struct ieee80211_eht_operation *eht_oper,
>  					u64 *changed)
>  {
> +	struct cfg80211_chan_def rx_chandef = link->conf->chandef;
>  	u16 bitmap = 0, extracted;
> +	u8 bw = 0;
>  
>  	if ((eht_oper->params & IEEE80211_EHT_OPER_INFO_PRESENT) &&
>  	    (eht_oper->params &
> @@ -5684,6 +5706,28 @@ static bool ieee80211_config_puncturing(struct ieee80211_link_data *link,
>  		const u8 *disable_subchannel_bitmap = info->optional;
>  
>  		bitmap = get_unaligned_le16(disable_subchannel_bitmap);
> +		bw = u8_get_bits(info->control, IEEE80211_EHT_OPER_CHAN_WIDTH);
> +		rx_chandef.width = ieee80211_rx_bw_to_nlwidth(bw);

But looking here, it clearly _doesn't_ make sense. IEEE80211_STA_RX_BW_*
is a purely internal API, has nothing to do with the spec.

All this might even be "accidentally correct", but it really isn't right
at all - the values in IEEE80211_EHT_OPER_CHAN_WIDTH are
IEEE80211_EHT_OPER_CHAN_WIDTH_*, not IEEE80211_STA_RX_BW_*.



More generally though, I don't even understand the change.

> +		if (rx_chandef.width == NL80211_CHAN_WIDTH_80)
> +			rx_chandef.center_freq1 =
> +				ieee80211_channel_to_frequency(info->ccfs0,
> +							       rx_chandef.chan->band);
> +		else if (rx_chandef.width == NL80211_CHAN_WIDTH_160 ||
> +			 rx_chandef.width == NL80211_CHAN_WIDTH_320)
> +			rx_chandef.center_freq1 =
> +				ieee80211_channel_to_frequency(info->ccfs1,
> +							       rx_chandef.chan->band);
> +	}
> +
> +	if (!cfg80211_valid_disable_subchannel_bitmap(&bitmap,
> +						      &rx_chandef)) {
> +		link_info(link,
> +			  "Got an invalid disable subchannel bitmap from AP %pM: bitmap = 0x%x, bw = 0x%x. disconnect\n",
> +			  link->u.mgd.bssid,
> +			  bitmap,
> +			  rx_chandef.width);
> +		return false;
>  	}
>  
>  	extracted = ieee80211_extract_dis_subch_bmap(eht_oper,
// I've filled in the context here in the patch
>                                                      &link->conf->chandef,
>                                                      bitmap);
> 
>         /* accept if there are no changes */
>         if (!(*changed & BSS_CHANGED_BANDWIDTH) &&
>             extracted == link->conf->eht_puncturing)
>                 return true;

but ... ieee80211_extract_dis_subch_bmap actually already takes the
bandwidth from eht_oper into account!
 
> -	if (!cfg80211_valid_disable_subchannel_bitmap(&bitmap,
> -						      &link->conf->chandef)) {

So are you saying that the real bug is that we're missing to update the
link->conf->chandef with the EHT operation from the assoc response?

But you didn't fix that issue ... so not sure?

johannes


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

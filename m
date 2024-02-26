Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB26C5478C
	for <ath12k@archiver.kernel.org>; Mon, 26 Feb 2024 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCpnNpLwejRpU5OmeOL/3TCjZkV2GbN6Fzks4A2Q+Bo=; b=tu0q/cpHEG0LLbwdl3ZjdpP97I
	z3C+EVy/qpmrh21UiIttVrfoPZrbXrG9b9KScMHjZQgrkNlAOkH/gPOhwgnMgkl8Bax7yDsPI3lem
	ms6asEsm2qN9+32x/Ipdeao3wm2TrsbsU6bzedv7QQEBz1OdiJbenB0uQ4NURNGEkWJwblDj5rix0
	M3sHdQCA3fcKdjf8ttl192RW8ueHwn/tM0vPMealVLv4ze3FOOylTQxb5gwieoauopoEsIw/Z3/lL
	MXDdahNOHGRjaCVDQqAq1u5oYHQJQAMUvVoCFEjcRul/KVjUOBr51OXLf/ucMWP4Ekl9F5k4TMYNy
	xrmXbImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1red34-00000001SnL-43Df
	for ath12k@archiver.kernel.org;
	Mon, 26 Feb 2024 15:37:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1red31-00000001SmP-2vjK
	for ath12k@lists.infradead.org;
	Mon, 26 Feb 2024 15:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5551CE094A;
	Mon, 26 Feb 2024 15:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF362C433C7;
	Mon, 26 Feb 2024 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708961856;
	bh=0MVQ1e5YE1HriPbs73wxOSeKfpnZvODfNtvaDBGiygs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SQiBRBNmBDyRDBSextLiSZ4OCZ98T1IiyrCL9iykG8RJPamuFQ75fshBlTfq5Zia8
	 f/GN2MvyfGFMNGiI3AlozsYEOV1S/PnyeQq3qUyo4fBOs3V5JPJB/Uye7kFz8r/2i2
	 V2rfRNe9CtVmO5sOiRmtnpwyZ4/TRGuFHi9jQFR8Nxkj49bBKHigfKpBRJH8qwIa76
	 HdPhq/81g/lf/2/clf71ohDny0pITKXiKdpHZh7piV0qri9WsTAVoNqf+lJHQYb0vE
	 dB2LccgYm2779u5M02NSIOMxcPCcK1qlXjGSzNbjvfmkweUVwmzgidAyrY6bpo1EY+
	 v9QZtuQBxlskg==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4] wifi: ath12k: report tx bitrate for iw dev xxx
 station dump
References: <20240219095802.1147-1-quic_lingbok@quicinc.com>
Date: Mon, 26 Feb 2024 17:37:33 +0200
In-Reply-To: <20240219095802.1147-1-quic_lingbok@quicinc.com> (Lingbo Kong's
	message of "Mon, 19 Feb 2024 17:58:02 +0800")
Message-ID: <87y1b7jkxu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_073744_127232_D61E774E 
X-CRM114-Status: GOOD (  24.37  )
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

Lingbo Kong <quic_lingbok@quicinc.com> writes:

> The tx bitrate of "iw dev xxx station dump" always show an invalid value
> "tx bitrate: 6.0MBit/s".
>
> To address this issue, parse the tx complete report from firmware and
> indicate the tx rate to mac80211.
>
> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
> tx bitrate: 104.0 MBit/s MCS 13
> tx bitrate: 144.4 MBit/s MCS 15 short GI
> tx bitrate: 626.9 MBit/s 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
> tx bitrate: 1921.5 MBit/s 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI QCN9274 hw2.0 PCI
> WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

Please use full englist words like transmit instead of tx. Also the
title could be simplified to:

wifi: ath12k: report station mode transmit rate to user space

Here I assumed this only works in station mode. Or does this also
support AP and P2P mode? The commit message should explain that.

> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> @@ -290,7 +290,7 @@ static void ath12k_dp_mon_parse_he_sig_b1_mu(u8 *tlv_data,
>  
>  	ru_tones = u32_get_bits(info0,
>  				HAL_RX_HE_SIG_B1_MU_INFO_INFO0_RU_ALLOCATION);
> -	ppdu_info->ru_alloc = ath12k_he_ru_tones_to_nl80211_he_ru_alloc(ru_tones);
> +	ppdu_info->ru_alloc = ath12k_mac_phy_he_ru_to_nl80211_he_ru_alloc(ru_tones);

Now there would be two very similar functions:

ath12k_mac_he_gi_to_nl80211_he_gi() vs ath12k_he_gi_to_nl80211_he_gi()

ath12k_he_ru_tones_to_nl80211_he_ru_alloc() vs ath12k_mac_phy_he_ru_to_nl80211_he_ru_alloc()

Why do we need those?

> +static void ath12k_dp_tx_update_txcompl(struct ath12k *ar, struct hal_tx_status *ts)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	struct ath12k_peer *peer;
> +	struct ath12k_sta *arsta;
> +	struct ieee80211_sta *sta;
> +	u16 rate;
> +	u8 rate_idx = 0;
> +	int ret;
> +
> +	spin_lock_bh(&ab->base_lock);

Empty line after spin_lock_bh(), please.


> +	peer = ath12k_peer_find_by_id(ab, ts->peer_id);
> +	if (!peer || !peer->sta) {
> +		ath12k_dbg(ab, ATH12K_DBG_DP_TX,
> +			   "failed to find the peer by id %u\n", ts->peer_id);
> +		goto err_out;
> +	}
> +
> +	sta = peer->sta;
> +	arsta = ath12k_sta_to_arsta(sta);
> +
> +	memset(&arsta->txrate, 0, sizeof(arsta->txrate));
> +
> +	/* This is to prefer choose the real NSS value arsta->last_txrate.nss,
> +	 * if it is invalid, then choose the NSS value while assoc.
> +	 */
> +	if (arsta->last_txrate.nss)
> +		arsta->txrate.nss = arsta->last_txrate.nss;
> +	else
> +		arsta->txrate.nss = arsta->peer_nss;
> +
> +	if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11A ||
> +	    ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11B) {
> +		ret = ath12k_mac_hw_ratecode_to_legacy_rate(ts->mcs,
> +							    ts->pkt_type,
> +							    &rate_idx,
> +							    &rate);
> +		if (ret < 0)
> +			goto err_out;

Should we print a warning here? Otherwise we might miss something.

> +
> +		arsta->txrate.legacy = rate;
> +	} else if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11N) {
> +		if (ts->mcs > ATH12K_HT_MCS_MAX)
> +			goto err_out;

Warning?

> +
> +		if (arsta->txrate.nss != 0)
> +			arsta->txrate.mcs = ts->mcs + 8 * (arsta->txrate.nss - 1);

Empty line here, please.

> +		arsta->txrate.flags = RATE_INFO_FLAGS_MCS;

And here.

> +		if (ts->sgi)
> +			arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
> +	} else if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11AC) {
> +		if (ts->mcs > ATH12K_VHT_MCS_MAX)
> +			goto err_out;

Warning?

> +		arsta->txrate.mcs = ts->mcs;
> +		arsta->txrate.flags = RATE_INFO_FLAGS_VHT_MCS;

Empty line.

> +		if (ts->sgi)
> +			arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
> +	} else if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11AX) {
> +		if (ts->mcs > ATH12K_HE_MCS_MAX)
> +			goto err_out;
> +
> +		arsta->txrate.mcs = ts->mcs;
> +		arsta->txrate.flags = RATE_INFO_FLAGS_HE_MCS;
> +		arsta->txrate.he_gi = ath12k_mac_he_gi_to_nl80211_he_gi(ts->sgi);
> +	}
> +
> +	arsta->txrate.bw = ath12k_mac_bw_to_mac80211_bw(ts->bw);

Empty line.

> +	if (ts->ofdma && ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11AX) {
> +		arsta->txrate.bw = RATE_INFO_BW_HE_RU;
> +		arsta->txrate.he_ru_alloc =
> +			ath12k_mac_he_ru_tones_to_nl80211_he_ru_alloc(ts->ru_tones);
> +	}
> +
> +err_out:
> +	spin_unlock_bh(&ab->base_lock);
> +}
> +
> +static void ath12k_dp_tx_update(struct ath12k *ar, struct hal_tx_status *ts)
> +{
> +	if (ar->last_ppdu_id == 0)
> +		goto update_last_ppdu_id;
> +
> +	if (ar->last_ppdu_id == ts->ppdu_id ||
> +	    ar->cached_ppdu_id == ar->last_ppdu_id)
> +		ar->cached_ppdu_id = ar->last_ppdu_id;
> +
> +	ath12k_dp_tx_update_txcompl(ar, ts);
> +
> +update_last_ppdu_id:
> +	ar->last_ppdu_id = ts->ppdu_id;
> +}

I think like this you could avoid the goto:

	if (ar->last_ppdu_id != 0) {
        	if (ar->last_ppdu_id == ts->ppdu_id ||
                    ar->cached_ppdu_id == ar->last_ppdu_id)
                        ar->cached_ppdu_id = ar->last_ppdu_id;

        	ath12k_dp_tx_update_txcompl(ar, ts);
        }

	ar->last_ppdu_id = ts->ppdu_id;

> @@ -2383,6 +2387,7 @@ static void ath12k_peer_assoc_prepare(struct ath12k *ar,
>  	ath12k_peer_assoc_h_phymode(ar, vif, sta, arg);
>  	ath12k_peer_assoc_h_smps(sta, arg);
>  
> +	arsta->peer_nss = arg->peer_nss;
>  	/* TODO: amsdu_disable req? */
>  }

Empty line before TODO comment, please.

> @@ -8324,3 +8329,90 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
>  
>  	return ret;
>  }
> +
> +enum nl80211_he_ru_alloc ath12k_mac_phy_he_ru_to_nl80211_he_ru_alloc(u16 ru_phy)
> +{
> +	enum nl80211_he_ru_alloc ret;
> +
> +	switch (ru_phy) {
> +	case RU_26:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_26;
> +		break;
> +	case RU_52:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_52;
> +		break;
> +	case RU_106:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_106;
> +		break;
> +	case RU_242:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_242;
> +		break;
> +	case RU_484:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_484;
> +		break;
> +	case RU_996:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_996;
> +		break;
> +	default:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_26;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +enum nl80211_he_ru_alloc ath12k_mac_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones)
> +{
> +	enum nl80211_he_ru_alloc ret;
> +
> +	switch (ru_tones) {
> +	case 26:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_26;
> +		break;
> +	case 52:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_52;
> +		break;
> +	case 106:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_106;
> +		break;
> +	case 242:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_242;
> +		break;
> +	case 484:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_484;
> +		break;
> +	case 996:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_996;
> +		break;
> +	case (996 * 2):
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_2x996;
> +		break;
> +	default:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_26;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +enum nl80211_he_gi ath12k_mac_he_gi_to_nl80211_he_gi(u8 sgi)
> +{
> +	enum nl80211_he_gi ret;
> +
> +	switch (sgi) {
> +	case RX_MSDU_START_SGI_0_8_US:
> +		ret = NL80211_RATE_INFO_HE_GI_0_8;
> +		break;
> +	case RX_MSDU_START_SGI_1_6_US:
> +		ret = NL80211_RATE_INFO_HE_GI_1_6;
> +		break;
> +	case RX_MSDU_START_SGI_3_2_US:
> +		ret = NL80211_RATE_INFO_HE_GI_3_2;
> +		break;
> +	default:
> +		ret = NL80211_RATE_INFO_HE_GI_0_8;
> +		break;
> +	}
> +
> +	return ret;
> +}

Please don't add new function to the end of file, rather to the
beginning or the middle. But like I mentioned earlier, do we really need
these new functions?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


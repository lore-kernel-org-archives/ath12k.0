Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C58DC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYyjelWP1+JFRZHtLLbMi/iEYJH3eyb1XWD7pWLvq6k=; b=htmt5GoO3BCwbB+HGeC3Nds5uz
	eVtf3vh3WILMWY0l1f8hevc4eikuaunXTXwneOALWwgV/JFjGYhWvD+WoKthatvRCnU7RoAw1GW5I
	KlVi2p9CXBn3tccVd5NvsXj8+MxcLOOUQpvN0gMpIeC9K/DB4qaIpshUoI9f4y/T4kwInj2ijBHr1
	ZpPUPyveXjYhHib35ZfCaCjz58xNDU3tAmxwKQw8Dsh7u+LkiBSLfyZaULWETcLQ+UrRtsQFcrXLy
	Sq3CSNKAbZfjtvqwSWZc2oLJ3m/m+oXy2d7GvjRXcT2evYcWbvl2Rz0QftH1rJi9rCmS/Gz4ev4X9
	IIvhCJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02NF-00000009Sop-0HnP
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 16:55:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02NB-00000009SnY-2ng0
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 16:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5EB38CE13BB;
	Thu, 25 Apr 2024 16:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6759AC113CC;
	Thu, 25 Apr 2024 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714064098;
	bh=rkOZ4/fb0cF/1NwGsfEm1tXuUuMdCb3rueuQ7I6yJHc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tcXX04eoaV3NwAjZwtnP6XY8/IQA281DXZqJ8i8eHqGjcAFN5YmTbe8uM5vBLjiZH
	 9W0fgXqeOxmQWTc+tg2Kne60Gm3ZcK0hyQM52eji2wgIM9mrZb+K6Kg2SSte7v1XcG
	 MkFll+VLdg5DkIGtYsElEGR2rKuFiOWSLeLVqzyyZTpF362tN9M/NoNDHrj76uuXP/
	 IRfxii9LInAzY046Q2WxQzqPUCo4/+cyGczd2E5doy8U8AMZFFuwLtul/ukMyRWWl2
	 8uDM/yiKXdUlpoV5jUIAsPOaKQGyX0xNtBgUJHs6W8BzgePr3vl0s9g5TCM4Um0Xmt
	 HZZMUCcRf7jnA==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] wifi: ath12k: report station mode transmit rate
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
	<20240419032122.7009-2-quic_lingbok@quicinc.com>
Date: Thu, 25 Apr 2024 19:54:44 +0300
In-Reply-To: <20240419032122.7009-2-quic_lingbok@quicinc.com> (Lingbo Kong's
	message of "Fri, 19 Apr 2024 11:21:20 +0800")
Message-ID: <87bk5xs7qj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_095502_185409_D68AC34F 
X-CRM114-Status: GOOD (  14.47  )
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

> Currently, the transmit rate of "iw dev xxx station dump" command
> always show an invalid value.
>
> To address this issue, ath12k parse the info of transmit complete
> report from firmware and indicate the transmit rate to mac80211.
>
> This patch affects the station mode of WCN7850 and QCN9274.
>
> After that, "iw dev xxx station dump" show the correct transmit rate.
> Such as:
>
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  872 ms
>         rx bytes:       219111
>         rx packets:     1133
>         tx bytes:       53767
>         tx packets:     462
>         tx retries:     51
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      403
>         rx drop misc:   74
>         signal:         -95 dBm
>         beacon signal avg:      -18 dBm
>         tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

I'm still going throught the patchset, please don't send a new version
yet. Few quick comments:

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

Did you analyse how this function, and especially taking the base_lock,
affects performance?

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

How does this function compare to ath12k_he_ru_tones_to_nl80211_he_ru_alloc()?

> +enum nl80211_eht_gi ath12k_mac_eht_gi_to_nl80211_eht_gi(u8 sgi)
> +{
> +	enum nl80211_eht_gi ret;
> +
> +	switch (sgi) {
> +	case RX_MSDU_START_SGI_0_8_US:
> +		ret = NL80211_RATE_INFO_EHT_GI_0_8;
> +		break;
> +	case RX_MSDU_START_SGI_1_6_US:
> +		ret = NL80211_RATE_INFO_EHT_GI_1_6;
> +		break;
> +	case RX_MSDU_START_SGI_3_2_US:
> +		ret = NL80211_RATE_INFO_EHT_GI_3_2;
> +		break;
> +	default:
> +		ret = NL80211_RATE_INFO_EHT_GI_0_8;
> +		break;
> +	}
> +
> +	return ret;
> +}

BTW the ret variable is unnessary, this could be simplified to:

switch (foo) {
case FOO1:
        return BAR1;
case FOO2:
        return BAR2;
default:
        return BAR3;
}

> +enum nl80211_eht_ru_alloc ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(u16 ru_tones)
> +{
> +	enum nl80211_eht_ru_alloc ret;
> +
> +	switch (ru_tones) {
> +	case 26:
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_26;
> +		break;
> +	case 52:
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_52;
> +		break;
> +	case (52 + 26):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_52P26;
> +		break;
> +	case 106:
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_106;
> +		break;
> +	case (106 + 26):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_106P26;
> +		break;
> +	case 242:
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_242;
> +		break;
> +	case 484:
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_484;
> +		break;
> +	case (484 + 242):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_484P242;
> +		break;
> +	case 996:
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_996;
> +		break;
> +	case (996 + 484):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_996P484;
> +		break;
> +	case (996 + 484 + 242):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_996P484P242;
> +		break;
> +	case (2 * 996):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_2x996;
> +		break;
> +	case (2 * 996 + 484):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_2x996P484;
> +		break;
> +	case (3 * 996):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_3x996;
> +		break;
> +	case (3 * 996 + 484):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_3x996P484;
> +		break;
> +	case (4 * 996):
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_4x996;
> +		break;
> +	default:
> +		ret = NL80211_RATE_INFO_EHT_RU_ALLOC_26;
> +	}
> +
> +	return ret;
> +}

Same here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8298FC54E58
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUtkz+PUbm0KIRPdSySl58fbSxHslMdnrvw0EZ6JXgg=; b=ZeGya/5YwUqW8USyNlvSkB3sok
	fgguiNfBEYux76gDgzMFM2SiANi0wuPFpvPPVpnn657QVLuJDYYkZCb06jENb632isbJMUPcKnhgG
	ZSJXgRNvdeKyYrxjNb7XVYHGSb6AIQpmX3I1qQDXbh8o9CZSnFAGTzt3m/Wc9htZQX83fePjeKqH/
	gnmWdgw/cEWmZrW+Tf0uBM6GpHkB3rvmhvdtziwQS9FoQH3/GZT90cY+nmcbkxym2nSy64olbaGYG
	UjgskAfnFJoeWaYvPh39n5YN6iAappXIgKXCD3a3ESuOVxRPuRxSVOJEucDjih/iCZFjd+GsUfqe9
	WiMyeHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyyv-00000000LpS-407f
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 16:40:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyys-00000000Lo8-1GJw
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 16:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B4A9CE1030;
	Wed, 20 Mar 2024 16:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C6FC43399;
	Wed, 20 Mar 2024 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710952795;
	bh=pdueHAqME/RXgy8B9mFyZ15nNoudCV+XV4ekjt1t7PU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FVc19hfPlD2Pe6iXcWwRKFQRVVTIBwSeK81M7Ns2vV4MoygQSFn9S7DkIGNqU/wfe
	 dd+qCyPc078egc4X5E2JCEsh3R5ohsY1zvRGUhcReCzm8POz2JWc4EXjj4cNtfTGjj
	 ettr+m+vnRaZGi31BZPdWVL00f0siVr6Hk8LzcBl/1tl6JYfDod+aYQeTt6ALg3tjo
	 zzwx8j585+To2OE+ca5IJHVmR+Qzdy8OAav3k3CRM6w7P456VzP7N6NsXkr/B5SDyv
	 BSBIykRtw7GTM9A3EXuzv0VTfwNreM3GDNkT2pAyjwQUk54iiKc38sHeLYpXETiFgY
	 15FIDX5s5ezpg==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: report signal for iw dev xxx station dump
References: <20240219111417.1185-1-quic_lingbok@quicinc.com>
Date: Wed, 20 Mar 2024 18:39:52 +0200
In-Reply-To: <20240219111417.1185-1-quic_lingbok@quicinc.com> (Lingbo Kong's
	message of "Mon, 19 Feb 2024 19:14:17 +0800")
Message-ID: <87o7b8amcn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_093958_889608_826B649F 
X-CRM114-Status: GOOD (  19.18  )
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

> The signal of "iw dev xxx station dump" always show 0 dBm. This is because
> currently signal is only set in ath12k_mgmt_rx_event function, and not set
> for rx data packet. So, change to get signal from firmware and report to
> mac80211.
>
> After that, "iw dev xxx station dump" show the correct signal such as:
> signal: -50 dBm
> signal: -49 dBm
>
> Tested-on: WCN7850 hw2.0 PCI
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

I'll omit the cosmetics for now and focus on the big picture.

First of all, no mention of WCN7850 and QCN9274 in the commit message.
Not good.

> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@ -920,6 +920,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>  		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
>  
>  		.supports_sta_ps = false,
> +
> +		.supports_rssi_stats = false,
>  	},
>  	{
>  		.name = "wcn7850 hw2.0",
> @@ -993,6 +995,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>  		.otp_board_id_register = 0,
>  
>  		.supports_sta_ps = true,
> +
> +		.supports_rssi_stats = true,
>  	},
>  	{
>  		.name = "qcn9274 hw2.0",
> @@ -1061,6 +1065,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>  		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
>  
>  		.supports_sta_ps = false,
> +
> +		.supports_rssi_stats = false,
>  	},
>  };

Ok, based on this you enable this only for WCN7850 hw2.0. Why is that?

We really should get rid of "I work only on WCN7850 and not care about
QCN9274" mindset. And of course the other team says "I work only on
QCN9274 and not care about WCN7850", sigh. If you work on ath12k you
need to consider *BOTH* WCN7850 and QCN9274 families!

>  static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  					 struct ieee80211_vif *vif,
>  					 struct ieee80211_sta *sta,
>  					 struct station_info *sinfo)
>  {
>  	struct ath12k_sta *arsta = ath12k_sta_to_arsta(sta);
> +	struct ath12k *ar = arsta->arvif->ar;
> +	s8 signal;
>  
>  	sinfo->rx_duration = arsta->rx_duration;
>  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
> @@ -7473,8 +7503,19 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
>  
>  	/* TODO: Use real NF instead of default one. */
> -	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
> -	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
> +	signal = arsta->rssi_comb;
> +
> +	if (!signal &&
> +	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
> +	    ar->ab->hw_params->supports_rssi_stats &&
> +	    !(ath12k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
> +				      WMI_REQUEST_VDEV_STAT)))
> +		signal = arsta->rssi_beacon;
> +
> +	if (signal) {
> +		sinfo->signal = signal;
> +		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
> +	}
>  }

If I'm reading the patch correctly this is the sequence:

1. ath12k_mac_op_sta_statistics() is called

2. WMI_REQUEST_STATS_CMDID is sent to the firmware

3. ath12k_mac_op_sta_statistics() returns

4. firmware sends WMI_UPDATE_STATS_EVENTID to host

5. ath12k_wmi_tlv_fw_stats_data_parse() stores signal to arsta->rssi_beacon

So doesn't this mean that ath12k_mac_op_sta_statistics() actually uses
the previous value? And if ath12k_mac_op_sta_statistics() is called very
seldom, like once an hour, the signal value can be one hour wrong?

Also I don't see any protection when accessing arsta->rssi_beacon.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


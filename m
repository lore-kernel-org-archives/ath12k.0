Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F4FD42BA2
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5w7YSW4BS/IKGlSa18JeFdiVGYz+IowOG+WB242Hvw=; b=WNr+iMaHpDHGhwmO9z/DSObNQA
	PEcWCjiup684bHTrYAHcPoy3KfZGb9+OAC8qlzxTYi1d/LxtKpFHaqT0BGyAH3wgrzTjNJvh6ph3T
	q+UP0N0VAxKTAggEnDx7Dh8b82VAZBm03kn9mdGu4ovF5r4HB31nud7zweXN3OJOrnvr085KGeg08
	GllwRxd03uBW1I2ssTWshRZGdzMPPfvj0HyrutEz6N+oGWWwNC/gLW2dRZ4H4GdR6j8fm2f8eW/Qj
	7w+TyToDlOf/KVaR0A3zXdU7Q4yHKj2UwiTgksbGx7WKXOYzQiydfP/AT9xnip/xVeiJnyePTCLns
	us5OhuJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtCC-0000000419G-1twC
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 15:52:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtC8-0000000417t-2mB5
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 15:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD7095C57E7;
	Tue, 12 Nov 2024 15:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F8CC4CED8;
	Tue, 12 Nov 2024 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731426763;
	bh=SJsZQYVXU3ARBv4CchRXa9P05OcKPCJKPiyWbmToLcw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=XvVRnM+tjABRUYPrahMQPK521snvmNYuQb+c6N6bogT0g/RLDNVC0oba+3cr5FFuV
	 IHd9547YOmSzegfyRCJnhe+ldcthPsCWyzaJDN1DHbisVaNdv6dmfaSLiyEgJGRt0+
	 WH8lS/EeI/aAUx/DZV5Z+jy92tTrQaY3RztuZIlpSGb6rYkAoZHTdRmveWFetcX2Lf
	 E0+gXf02vkOXu4b0/gzQcJLDHmJmwV41v7JuJgq5icIF/hIigAWCLVkJgPYuAygCO/
	 QC4aiwAT6kn7fPnVsYIDXE6Z2QXk3ENNjxb34PoiFgFNqImecJ+dDnfpZgRnNPDe/P
	 HwYTeeu0rrNww==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH v4 2/4] wifi: ath12k: Support phy counter and TPC stats
References: <20241106044548.3530128-1-quic_rdevanat@quicinc.com>
	<20241106044548.3530128-3-quic_rdevanat@quicinc.com>
Date: Tue, 12 Nov 2024 17:52:41 +0200
In-Reply-To: <20241106044548.3530128-3-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Wed, 6 Nov 2024 10:15:46 +0530")
Message-ID: <87bjyk4fg6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_075244_807863_011B151C 
X-CRM114-Status: GOOD (  14.77  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>
> Add support to request counters and Transmission Power Control
> (TPC) stats through HTT stats type 37. These stats give
> information about counters like received packet count, CRC pass
> count, error count, transmit abort count, etc., about counter reset
> like reset cause, channel frequency, number and mode, channel flags,
> etc., about TPC like transmit power scale, maximum transmit power,
> gain cap, EIRP, etc.
>
> Note: MCC firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
> support HTT stats type 37, i.e., the firmware does not respond to the
> command requesting stats.
>
> Sample output:
> -------------
> echo 37 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_PHY_STATS_TLV:
> bdf_nf_chain[0] = -92
> bdf_nf_chain[1] = -94
> bdf_nf_chain[2] = -94
> bdf_nf_chain[3] = -93
> .....
>
> HTT_PHY_COUNTERS_TLV:
> rx_ofdma_timing_err_cnt = 18068
> rx_cck_fail_cnt = 0
> mactx_abort_cnt = 2612
> macrx_abort_cnt = 0
> .....
>
> HTT_PHY_RESET_STATS_TLV:
> pdev_id = 0
> chan_mhz = 0
> chan_band_center_freq1 = 0
> chan_band_center_freq2 = 0
> .....
>
> HTT_PHY_RESET_COUNTERS_TLV:
> pdev_id = 0
> cf_active_low_fail_cnt = 0
> cf_active_low_pass_cnt = 0
> phy_off_through_vreg_cnt = 0
> .....
>
> HTT_PHY_TPC_STATS_TLV:
> pdev_id = 0
> tx_power_scale = 0
> tx_power_scale_db = 0
> min_negative_tx_power = 0
> .....
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> ---
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 249 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   |  98 +++++++
>  2 files changed, 347 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index 8a4fe3cbb8dd..912fef503982 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -2625,6 +2625,240 @@ ath12k_htt_print_dlpager_stats_tlv(const void *tag_buf, u16 tag_len,
>  	stats_req->buf_len = len;
>  }
>  
> +static void
> +ath12k_htt_print_phy_stats_tlv(const void *tag_buf, u16 tag_len,
> +			       struct debug_htt_stats_req *stats_req)
> +{
> +	const struct ath12k_htt_phy_stats_tlv *htt_stats_buf = tag_buf;
> +	u8 *buf = stats_req->buf;
> +	u32 len = stats_req->buf_len;
> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
> +	u8 i;

Reverse xmas. I'll stop commenting about that now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


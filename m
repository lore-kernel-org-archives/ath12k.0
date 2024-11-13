Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018DBD41C06
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsbIxVjWAE3GXRr0o0Ggb0U1w6bmH4zpWs0c9rpuOUo=; b=W9PuvCj4wXYvGkXkhxZloxzOkg
	ZkaIDUF7DZIBatZw0j6g0oWd/VRnEw6NKMV7BVuzklduKgIsjoNYRcUtagucKi7h7Pfdl7Cv5bd/p
	bIqfE8QoMc/xzntT9kenS2SzMLKF6cmTZxcTxieNXaPkjaBYBBcfGsLN0GdthdhNB3xUJGmkP5HzU
	oYihXVzalcw/xEWXOaae+OQMdqj//hwgfSRWJCLk8wPy33/4fZjsm2eAS1XbT/LVqS5I5Ut2PmOPl
	qUCQWxC3x2RL0Zh8gLvklqlNszhrqpWaD/bB78dJLtLSay+g77Tg9fSG15ulnCUtW+V24PZBasjVB
	Ahy13C0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCIJ-00000006jVk-2gz0
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 12:16:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBAS-00000006XCm-3GnA
	for ath12k@bombadil.infradead.org;
	Wed, 13 Nov 2024 11:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RsbIxVjWAE3GXRr0o0Ggb0U1w6bmH4zpWs0c9rpuOUo=; b=B+LFn8p/8Jgzl1t/dNj4aX8VjH
	BaaHacP5xpHsQHckkX72l3cFKj1QI6/NlKLGqWBMPzhJmKxJP+rwAGAlG6Eutugp5nfPkgjn1VEED
	A2xvrPZVIvowaKTPuP6tdCkSvVRkLyYL34AJ/DiwCljzk98Z4XDwWuHThGU3364iW+uKt3qHsqAnv
	EbLV5XsnQeFf3VNpJLB0zzVHmJHOlYKfxWQ/lO6yPkRCgDld/HKP8mngVabspzaT3IEedubdlFMUy
	AVASp7jgiLcuEDmpfwi2sEhx2sUkL7mU8cUtAF7gxhCuFXxGmZkqdg7HUgxJ7elTUmSzcsoLocX0f
	3mpcVgGA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBAP-0000000DFxm-1uR3
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 11:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BF125C58EB;
	Wed, 13 Nov 2024 11:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E61C4CECD;
	Wed, 13 Nov 2024 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731495847;
	bh=py+b2Nhz+BY4MAu1VQH3cX7boqg4sylhQMNX+cuwUC8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=hp/IzrBmj1YcS36HSM9Map1rILWv1W6zL3STmg+bmj6m4HPHx+e9zNKu6GjhA8h55
	 N7l2V2edZ56jaRhyvNRxRtrH/iI6RwqfhUCABU+Ic414atZmqnNUwborVrULx0Ri9f
	 fvpdSphZ8JmDn6cJq29LiDJGh/6H/uMpV0BvgOk5VNcvmDkPBL8oM9FBUewj3vtAsk
	 ZBJc+1Fk2u/ZRH/OWmqKx/VWyOmTnryCR+5cXPtElDnwBbhyJdqxjtek7watmd6MQ3
	 mH/MHMmQHx0fSTx5D5H8GGjML4xXOFGNJtzQcN8RLx5sTVeNb1dAU01o3GVzqsIDJ7
	 v6x3NClukO56w==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH v5 2/4] wifi: ath12k: Support phy counter and TPC stats
References: <20241113072707.3377341-1-quic_rdevanat@quicinc.com>
	<20241113072707.3377341-3-quic_rdevanat@quicinc.com>
Date: Wed, 13 Nov 2024 13:04:04 +0200
In-Reply-To: <20241113072707.3377341-3-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Wed, 13 Nov 2024 12:57:05 +0530")
Message-ID: <87h68b2y57.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_110409_882499_05F61429 
X-CRM114-Status: GOOD (  14.81  )
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
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 248 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   |  98 +++++++
>  2 files changed, 346 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index bde3644a7c21..575a03137e9f 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -2628,6 +2628,239 @@ ath12k_htt_print_dlpager_stats_tlv(const void *tag_buf, u16 tag_len,
>  	stats_req->buf_len = len;
>  }
>  
> +static void
> +ath12k_htt_print_phy_stats_tlv(const void *tag_buf, u16 tag_len,
> +			       struct debug_htt_stats_req *stats_req)
> +{
> +	const struct ath12k_htt_phy_stats_tlv *htt_stats_buf = tag_buf;
> +	u32 len = stats_req->buf_len;
> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
> +	u8 *buf = stats_req->buf, i;

I see several cases where reverse xmas is not used still. No need to
resend because of this but please remember this in the future.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


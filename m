Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8E6E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZkuE4GritsSORql/FXp+fJW37ochxcIPocZgzkin4k=; b=5CvDDrEfyuxw30i//X5dwT3KaB
	aC/nugjkxMGqgsLzf7mPkr4ap2PMWZNFkjCNIkVQCh2l8NJbYLQht+mEnlpjHP02FjV0GmSxr72nK
	FXZxBXzPy0CMRxH2tBf1+ypUX2JydfE2rwqyTADt+qowQOhSGfD1tQcs3iGLL7MeEzrLvTsaMzKS7
	U7CwKoMW2KJpSoWibLuQzSoVw9eQtNVZtZpqXNHt0sWBxGOZMp611o1fn+7HXcSLbyVikBsM7Yd8P
	VYzsXcXMZuGuZar1t/P0P4pHthFHsbI0srV1ly5kN8Hf0AtRxuNrePr/CcyRJqN2ALnEzYAajjuSs
	aQOLx7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEze-00000001hX0-1QRg
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:47:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEyu-00000001hQd-3xcF
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79B13A42154;
	Thu, 19 Dec 2024 11:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70B7C4CECE;
	Thu, 19 Dec 2024 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734608775;
	bh=n3HMUDrXAKQ0ZHThIwTcbqyp/9E14hjGqx7tT5uN5gM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ClZirRkGA6SwR2F2O7PSVZQ+QtQsJNqjQDRrgd/71otCvJpGEsyPTTuUT9VGSeNut
	 aLRs7R3g9PDw82V0ttsT6p3RLBZ6c4GM3NLNctTCYymrvCsjz1izNyuUpFO6qPGY0i
	 30vSgBwvA92LH1Md962Pg94s8iTvvgLMI68CrXj5+wPI+hs5F+uFLh8SAqT9ePZx7A
	 kma8iLNjgf+A03ijKcAqWJHt+k4q3NJTaQA9Pk72lhdI5/kY1PBC7drrZ14YB2DmcV
	 wDI8uY45uEJdzfgq8hL/IBdjQTLv32pF9Rc7kdVI8F6kmdcKYibxZ6uWdVms6JDajo
	 SYtNupId2rm1g==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH 3/6] wifi: ath12k: Support Uplink OFDMA Trigger Stats
References: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
	<20241217095216.1543923-4-quic_rdevanat@quicinc.com>
Date: Thu, 19 Dec 2024 13:46:12 +0200
In-Reply-To: <20241217095216.1543923-4-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Tue, 17 Dec 2024 15:22:13 +0530")
Message-ID: <874j2zj3p7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_034617_044537_D97C2975 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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
> Add support to request uplink trigger stats from firmware through
> HTT stats type 26. These stats give information about uplink
> OFDMA bandwidth, received RSSI, power headroom, QoS, data size,
> PPDU info and pass/fail info for each user.
>
> Note: MCC firmware version
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> does not support tags HTT_STATS_RX_PDEV_UL_TRIG_STATS_TAG(94) and
> HTT_STATS_RX_PDEV_UL_OFDMA_USER_STATS_TAG(95), currently.
>
> Sample output:
> -------------
> echo 26 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_RX_PDEV_UL_TRIGGER_STATS_TLV:
> mac_id = 0
> rx_11ax_ul_ofdma = 0
> ul_ofdma_rx_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_gi[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_gi[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_gi[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_gi[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_nss =  1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0
> ul_ofdma_rx_bw =  0:0, 1:0, 2:0, 3:0
> half_ul_ofdma_rx_bw =  0:0, 1:0, 2:0, 3:0
> quarter_ul_ofdma_rx_bw =  0:0, 1:0, 2:0, 3:0
> .....
>
> HTT_RX_PDEV_UL_OFDMA_USER_STAS_TLV:
> rx_ulofdma_non_data_ppdu_0 = 0
> rx_ulofdma_data_ppdu_0 = 0
> rx_ulofdma_mpdu_ok_0 = 0
> rx_ulofdma_mpdu_fail_0 = 0
> rx_ulofdma_non_data_nusers_0 = 0
> rx_ulofdma_data_nusers_0 = 0
> .....
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


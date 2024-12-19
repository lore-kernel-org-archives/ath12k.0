Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA71E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfg5liVMd89yIH+qbrbXQtDUlFz2kaulQbeH493vkQY=; b=zEAv+JxgFzlFxXuLSFO1SeoBXN
	CuKtyIvHGZkqpAMNoHSY6uzQQnrXyAl//DcnCIetwRPLgZPlMcAkLK2HZ0LuAaRBL1tYa8sT5boPq
	HhdhmdkT/ds+OUX38/6264xJPE4HXr5J4eGh5+8zMQ2w2NfNCwMsTOQS70RHQ7m6skBczxoRM3+Bi
	TUKzHR3QUP3cHZoRwkavaSrobunK90qhZKjJ53/IJ9IQ949Jka4cU6MHdmi7qtmHuIi32+1dHiWrW
	55q1q2YqGvSiO2rF9zFkX3NW2yVu5GC3e9y3WpXZfWnDwc9x0hDEYVCpclkYwWyolWbMrGwIWZt/c
	90DCFfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGX3-00000001vsR-3h0N
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 13:25:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGX0-00000001vs2-3x9Z
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 13:25:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8FC33A41EBF;
	Thu, 19 Dec 2024 13:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE037C4CED0;
	Thu, 19 Dec 2024 13:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734614733;
	bh=InZEF5fvhkas5+2L+LvUzEfyVNN2wyINtQNf6/v4tyY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WbHgG9n0De1iKwY1yII5OFBIpgsY5NtE9yYb4qC9fd0hfXNe9rM4H4gsqGsGaZTGj
	 cBcFivzbJtV6X3Ftyml9HHkz+lEcf5AyinbOA2653DEV+Ps9KBk46pAqmPFfsCUpGW
	 dd/FxiQCZbJGinR1ZBL6aJVHIcCj0ZSAyUpjNfiO/S0LSP9VVzWCYgWOkg4gfEXVpR
	 8lA4ZMVVuvXQivfy56UbhNkJO67eWpPUCKHYAw6C5rzCObzkhzwMG3bpat2kYII5qN
	 Q/2GaTPOAsref5FeSIP/iflwENbHQ3RcIZme1ALgAGLPLI4oVS5UkzPDiJgSsQT4ZE
	 8pRdsIWdfXNtA==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Rajat
 Soni <quic_rajson@quicinc.com>
Subject: Re: [PATCH v5 2/2] wifi: ath12k: Support pdev Puncture Stats
References: <20241218035711.2573584-1-quic_rdevanat@quicinc.com>
	<20241218035711.2573584-3-quic_rdevanat@quicinc.com>
Date: Thu, 19 Dec 2024 15:25:31 +0200
In-Reply-To: <20241218035711.2573584-3-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Wed, 18 Dec 2024 09:27:11 +0530")
Message-ID: <87ikrfhkj8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_052535_047991_B2F19C71 
X-CRM114-Status: UNSURE (   7.39  )
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

> From: Rajat Soni <quic_rajson@quicinc.com>
>
> Add support to request pdev puncture stats from firmware through
> HTT stats type 46. These stats give the count of number of
> subbands used in different wifi standards.
>
> Sample output:
> -------------
> echo 46 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_PDEV_PUNCTURE_STATS_TLV:
> mac_id = 0
> tx_ofdm_su_last_used_pattern_mask = 0x00000001
> tx_ofdm_su_num_subbands_used_cnt_01 = 217
> tx_ofdm_su_num_subbands_used_cnt_02 = 0
> tx_ofdm_su_num_subbands_used_cnt_03 = 0
> .....
>
> HTT_PDEV_PUNCTURE_STATS_TLV:
> mac_id = 0
> tx_ax_dl_mu_ofdma_last_used_pattern_mask = 0x00000000
> tx_ax_dl_mu_ofdma_num_subbands_used_cnt_01 = 0
> tx_ax_dl_mu_ofdma_num_subbands_used_cnt_02 = 0
> tx_ax_dl_mu_ofdma_num_subbands_used_cnt_03 = 0
> .....
>
> HTT_PDEV_PUNCTURE_STATS_TLV:
> mac_id = 0
> tx_be_dl_mu_ofdma_last_used_pattern_mask = 0x00000000
> tx_be_dl_mu_ofdma_num_subbands_used_cnt_01 = 0
> tx_be_dl_mu_ofdma_num_subbands_used_cnt_02 = 0
> tx_be_dl_mu_ofdma_num_subbands_used_cnt_03 = 0
> .....
>
> HTT_PDEV_PUNCTURE_STATS_TLV:
> mac_id = 0
> rx_ax_ul_mu_ofdma_last_used_pattern_mask = 0x00000000
> rx_ax_ul_mu_ofdma_num_subbands_used_cnt_01 = 0
> rx_ax_ul_mu_ofdma_num_subbands_used_cnt_02 = 0
> rx_ax_ul_mu_ofdma_num_subbands_used_cnt_03 = 0
> .....
>
> HTT_PDEV_PUNCTURE_STATS_TLV:
> mac_id = 0
> rx_be_ul_mu_ofdma_last_used_pattern_mask = 0x00000000
> rx_be_ul_mu_ofdma_num_subbands_used_cnt_01 = 0
> rx_be_ul_mu_ofdma_num_subbands_used_cnt_02 = 0
> rx_be_ul_mu_ofdma_num_subbands_used_cnt_03 = 0
> .....
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


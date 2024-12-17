Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C317E77184
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gP0W0h39KvXNMUjAFdqKdrzoD7qiwgo+axFUvLdLKUg=; b=xG6aaeRe3jdL1ya5tNlnNYmOdu
	2penkO4++rIKx5Q7mAFvMcI2rl4Q+DLROtAgSwIzVqEG3LCie+wBet6/Ou2+vrcTZwdKjnj3sNpiD
	ZNzSK/NkiwcArLBnt6jJcM+Qpws/vkN7tMw5yeQmaLw15QGDiJg8pcBFimtQak7cAhomKKNzenaGL
	1wKnwBj+5mMlsjti1jgmIlN18Zz9nd7pxl9BIJnyFKjs71wweUhEhuPaBVdn8w/NZCq+A6Qv7q3xR
	F3cm/UoXtDjHIXebHrbluMeL+Go94dr9HZXsGvUjOq83sSM5QNXgUv4zK51MIUY41XpVJufPbwRpG
	xo5qMZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZcA-0000000Dykp-2rza
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 15:36:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZTA-0000000DxBT-3npt
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 15:26:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C2385C5EAA;
	Tue, 17 Dec 2024 15:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8447C4CED3;
	Tue, 17 Dec 2024 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734449203;
	bh=XI6WlXJy7+nA87hZkua9BKN48HVzS6jDxkY/GJOikNk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=C85RbokoKSqVSac6qK5mSE52TLo4LGcN30H3L49gWdyr3E8WEARKD2nsIEUQIPxeS
	 YekjBrafEgs/S4uG/emVfpRx7YryX51t03i8uHuGVj4B0ayQE38vyKBXDg1Ru1Sa3x
	 DrluZ56weqbXIpSDhNQnGZ7jPoM+POo+ZCMN/ZmUm9fpBsxYv9TkNWNfH0S7q0KDhR
	 fXZa9/sCZFPQxqz/lfzD5oVPjQ/j6sQkkgLI5dtiP4NIFvSfrJTIpPV6jT9SoweEGC
	 KXfQXMfnvoAaDuMqrzqOkwN7XB6MCPQuIlBojJMvNzYAQRfEnoZHIzz6SenhNbI0sl
	 fg/kKoR2oUshw==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Rajat
 Soni <quic_rajson@quicinc.com>
Subject: Re: [PATCH v4 2/2] wifi: ath12k: Support pdev Puncture Stats
References: <20241217055408.1293764-1-quic_rdevanat@quicinc.com>
	<20241217055408.1293764-3-quic_rdevanat@quicinc.com>
Date: Tue, 17 Dec 2024 17:26:41 +0200
In-Reply-To: <20241217055408.1293764-3-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Tue, 17 Dec 2024 11:24:08 +0530")
Message-ID: <87ttb2l49a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_072645_029607_2F46397B 
X-CRM114-Status: GOOD (  10.98  )
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

[...]

> +static const char*
> +ath12k_htt_get_punct_ppdu_type_str(enum ath12k_htt_stats_ppdu_type ppdu_type,
> +				   struct debug_htt_stats_req *stats_req)
> +{
> +	const char *ppdu_type_str = "unknown";
> +	u32 len = stats_req->buf_len;
> +
> +	switch (ppdu_type) {
> +	case ATH12K_HTT_STATS_PPDU_TYPE_MODE_SU:
> +		ppdu_type_str = "su";
> +		break;
> +	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_MIMO:
> +		ppdu_type_str = "dl_mu_mimo";
> +		break;
> +	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_MIMO:
> +		ppdu_type_str = "ul_mu_mimo";
> +		break;
> +	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_OFDMA:
> +		ppdu_type_str = "dl_mu_ofdma";
> +		break;
> +	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_OFDMA:
> +		ppdu_type_str = "ul_mu_ofdma";
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	stats_req->buf_len = len;
> +	return ppdu_type_str;
> +}

Also here I don't get why the len variable is needed. I would just
simplify this and the previous function to:

static const char*
ath12k_htt_get_punct_ppdu_type_str(enum ath12k_htt_stats_ppdu_type ppdu_type,
				   struct debug_htt_stats_req *stats_req)
{
	switch (ppdu_type) {
	case ATH12K_HTT_STATS_PPDU_TYPE_MODE_SU:
		return "su";
	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_MIMO:
		return "dl_mu_mimo";
	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_MIMO:
		return "ul_mu_mimo";
	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_OFDMA:
		return "dl_mu_ofdma";
	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_OFDMA:
		return "ul_mu_ofdma";
	default:
		return "unknown";
	}

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


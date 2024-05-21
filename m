Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCE4C25B74
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AT7t7LURZWkcB+BQE9a53WvKbAVPHetNLj2iualUXc=; b=AadAkcC8IBmrVr9+Dz4cp4sz96
	RR7WgyUfQmsyxov+JTiboR0Jft3Phu/D6NUo6rnPT2l9Vhh9dQRaK8h9Njh5fkY1XGXoyOGJqlOmM
	6+8dBpPJwGnrRqFRFSiGPSU+lX2MnaWHFfEJVxpKhbnwXIbOKb/dt6mWdk9IMQZAm0J1w1Jtkbnht
	eD4PxAXyAQ4wA74Omj/X9LTK0EJUwAQ7DNj7kG+HE4jxPTgBHASbKCF5Ft+vDv9iVwczcHH1Kd4xC
	U4S+KJk8JM82inE1EZH6ocXXc220DOWbJKiJRydU8jxAkzgjxaeJcsoKPlrOCnlCRqt172Ru3ugsJ
	lrQRK6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KQV-0000000GhT5-2k15
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 08:00:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KQS-0000000GhSK-2RaO
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 08:00:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3313162045;
	Tue, 21 May 2024 08:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5B7C2BD11;
	Tue, 21 May 2024 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716278443;
	bh=OFGokqz3ADKTizuCIWhcKw3hIa9Kg9nWRnUd34o2hHU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LKOKV/u5wsZVOaPoytUYbO9mB4UKj21WtYUvZVsafG5ZAk63Anxtvu7d1dxm2r4jd
	 qKXwWo49iN9v2vLHFH6Wg0PtmCP5eI9oRCdmo6imlT3fh2KqrIWTxWWfuXWab/RI1o
	 awLAsjy/BR9XdIkZXoxjmORgrhnUGqsfwiS1oyOY//e7HjbppJbaR2BkVERAx5E+fN
	 i+FwjCD2zzUh9zKT2YkGSQb2WhGdSohC//xhiB+GhMj1k2wEI8UYK/G0mA5CAPMNhD
	 USu66fprpKRPwc8eqgI+kV9F1DBXxl2Qc5a5FdiXjGk5TQr6vJfENmklnl4pEOquEO
	 Sv6Q0jV0UY0TA==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 5/5] wifi: ath12k: Dump additional Tx PDEV HTT stats
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
	<20240510050806.514126-6-quic_rgnanase@quicinc.com>
Date: Tue, 21 May 2024 11:00:41 +0300
In-Reply-To: <20240510050806.514126-6-quic_rgnanase@quicinc.com> (Ramya
	Gnanasekar's message of "Fri, 10 May 2024 10:38:06 +0530")
Message-ID: <87le43d26u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_010048_783590_47ACCF66 
X-CRM114-Status: UNSURE (   9.38  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:

> Support to dump additional Tx PDEV stats through HTT stats debugfs.
> Following stats dump are supported:
>         1. PDEV control path stat to dump Tx management frame count
>         2. Tx PDEV SIFS histogram stats
>         3. Tx MU MIMO PPDU stats for 802.11ac, 802.11ax and 802.11be
>
> Sample Output:
> --------------
> echo 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_PDEV_STATS_CMN_TLV:
> mac_id = 0
> comp_delivered = 0
> self_triggers = 13
> ......
> ......
> HTT_TX_PDEV_STATS_CTRL_PATH_TX_STATS:
> fw_tx_mgmt_subtype =  0:1, 1:0, 2:0, 3:0, 4:38, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:1, 12:0, 13:7, 14:0, 15:0,
>
> HTT_TX_PDEV_STATS_SIFS_HIST_TLV:
> sifs_hist_status =  0:237, 1:185, 2:1, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
>
> HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:
> ac_mu_mimo_num_seq_posted_nr4 = 0
> ac_mu_mimo_num_ppdu_posted_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ac_mu_mimo_num_ppdu_completed_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ac_mu_mimo_num_seq_term_status_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
>
> ac_mu_mimo_num_seq_posted_nr8 = 0
> ac_mu_mimo_num_ppdu_posted_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ac_mu_mimo_num_ppdu_completed_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ac_mu_mimo_num_seq_term_status_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
>
> ax_mu_mimo_num_seq_posted_nr4 = 0
> ax_mu_mimo_num_ppdu_posted_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ax_mu_mimo_num_ppdu_completed_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ax_mu_mimo_num_seq_term_status_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
>
> ax_mu_mimo_num_seq_posted_nr8 = 0
> ax_mu_mimo_num_ppdu_posted_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ax_mu_mimo_num_ppdu_completed_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ax_mu_mimo_num_seq_term_status_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
>
> be_mu_mimo_num_seq_posted_nr4 = 0
> be_mu_mimo_num_ppdu_posted_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> be_mu_mimo_num_ppdu_completed_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> be_mu_mimo_num_seq_term_status_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
>
> be_mu_mimo_num_seq_posted_nr8 = 0
> be_mu_mimo_num_ppdu_posted_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> be_mu_mimo_num_ppdu_completed_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> be_mu_mimo_num_seq_term_status_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

[...]

> +static inline void
> +ath12k_htt_print_tx_pdev_mu_ppdu_dist_stats_tlv(const void *tag_buf,
> +						struct debug_htt_stats_req *stats_req)
> +{
> +	const struct ath12k_htt_tx_pdev_mu_ppdu_dist_stats_tlv *htt_stats_buf = tag_buf;
> +	char *mode;
> +	u8 j, hw_mode, i, str_buf_len;
> +	u8 *buf = stats_req->buf;
> +	u32 len = stats_req->buf_len;
> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
> +	u32 stats_value;
> +	u8 max_ppdu = ATH12K_HTT_STATS_MAX_NUM_MU_PPDU_PER_BURST;
> +	u8 max_sched = ATH12K_HTT_STATS_MAX_NUM_SCHED_STATUS;
> +	char str_buf[ATH12K_HTT_MAX_STRING_LEN];
> +
> +	hw_mode = le32_to_cpu(htt_stats_buf->hw_mode);
> +
> +	switch (hw_mode) {
> +	case ATH12K_HTT_STATS_HWMODE_AC:
> +		len += scnprintf(buf + len, buf_len - len,
> +				 "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n");
> +		mode = "ac";
> +		break;
> +	case ATH12K_HTT_STATS_HWMODE_AX:
> +		mode = "ax";
> +		break;
> +	case ATH12K_HTT_STATS_HWMODE_BE:
> +		mode = "be";
> +		break;
> +	default:
> +		return;
> +	}

Why are we not adding "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n" with
ax and be modes?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


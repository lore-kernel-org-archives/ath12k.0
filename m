Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B655FE77197
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 19:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oww9DlvcE47Yrel+r5DJySB3f1b7ochf1xCrp4iOxrs=; b=s4GbBp6vKEQNzj+7vOGKtmyZhU
	I7EmduklVYbhwW06bGwbKL8ckwVWloOOi76OUSGid3f3RR5XSMLX5k3F0UtThxTvOIRZvbsVclvy6
	XmyHaPYvdhNOkJNp77R9Nz1vuPJVIX544vxR1pusFLpKVmJjK1495gRCLKLw0Ne/zecvNIavwtZnX
	O2n5iYOEXPZJil6q+AocWcC/ziCFKPm3rUyvUJx+GzCQ/aaK+6i4A1GQ0+5+pAbn0gMcXjjV74ajh
	sgleA0I65wG6WE7byS+e6UpMZeGQl7GbbGDkSb1PjGdaO3HdZR5kw3GKRujQNqoIrrI/ZAs+fAOYO
	r2rR9tkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFVy-00000006A9D-2AUx
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 19:45:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFVw-00000006A8d-0ovj
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 19:45:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B83B7A41C73;
	Tue,  7 Jan 2025 19:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107A8C4CED6;
	Tue,  7 Jan 2025 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736279119;
	bh=RD22hk1daK1JvYQmqzUMipy+wpFHrhVOOLxHdLDCat4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Hez8ws1iQOkuGzCzv/pd107HlI827Ne2jj6TF68CAjNNFnZMlRFtWvFURgD4ke1np
	 NJTGhA5K9QE5nb3ewhRVCu+qlI7++8gpRb9tTVR1XyCpJkksodlFWG0otAqTHrvahv
	 gsCP+f292A+WbOfUKTNLU4Wg0MffISZklfS3F/A5KBkENnSnpYuHleT1mF0WDqq/Ru
	 5UGe+3YgduAq7yYVjF+V6TaYqjC0fhe5Tmq4tECfwzK3CZ6rno33xeFFp/XMqb5KDh
	 8smLDce6V6hHKoHC6zcWu8EvhTJYR1Ohmtb6L32ZnHI/BnTPjvIVRsOg9JdJtkiJ/r
	 mP2tMEsHMQ7Ig==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: Re: [PATCH 2/2] wifi: ath12k: Support Transmit Buffer OFDMA Stats
References: <20241128110949.3672364-1-quic_rdevanat@quicinc.com>
	<20241128110949.3672364-3-quic_rdevanat@quicinc.com>
Date: Tue, 07 Jan 2025 21:45:16 +0200
In-Reply-To: <20241128110949.3672364-3-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Thu, 28 Nov 2024 16:39:49 +0530")
Message-ID: <87jzb6flwz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_114520_368132_B965E91A 
X-CRM114-Status: GOOD (  12.80  )
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

> From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>
> Add support to request OFDMA stats of transmit buffers from firmware through
> HTT stats type 32. These stats give information about NDPA, NDP, BRP and
> steering mechanisms.
>
> Note: WCN7850 firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
> support HTT stats type 32.
>
> Sample output:
> -------------
> echo 32 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TXBF_OFDMA_AX_NDPA_STATS_TLV:
> ax_ofdma_ndpa_queued = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0,
> 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0,
> 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0
> ax_ofdma_ndpa_tried = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0,
> 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0,
> 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0
> .....
>
> HTT_TXBF_OFDMA_AX_NDP_STATS_TLV:
> ax_ofdma_ndp_queued = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0,
> 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0,
> 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0
> ax_ofdma_ndp_tried = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0,
> 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0,
> 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0
> .....
>
> HTT_TXBF_OFDMA_AX_BRP_STATS_TLV:
> ax_ofdma_brpoll_queued = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0,
> 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0,
> 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0
> ax_ofdma_brpoll_tied = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0,
> 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0,
> 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0
> .....
>
> HTT_TXBF_OFDMA_AX_STEER_STATS_TLV:
> ax_ofdma_num_ppdu_steer = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0,
> 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0,
> 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0
> ax_ofdma_num_usrs_prefetch = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0,
> 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0,
> 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0
> .....
>
> HTT_TXBF_OFDMA_AX_STEER_MPDU_STATS_TLV:
> rbo_steer_mpdus_tried = 0
> rbo_steer_mpdus_failed = 0
> sifs_steer_mpdus_tried = 0
> sifs_steer_mpdus_failed = 0
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

[...]

> +static void
> +ath12k_htt_print_txbf_ofdma_ax_ndpa_stats_tlv(const void *tag_buf, u16 tag_len,
> +					      struct debug_htt_stats_req *stats_req)
> +{
> +	const struct ath12k_htt_txbf_ofdma_ax_ndpa_stats_tlv *stats_buf = tag_buf;
> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
> +	u32 len = stats_req->buf_len;
> +	u8 *buf = stats_req->buf;
> +	u32 num_elements;
> +	u8 i;
> +
> +	if (tag_len < sizeof(*stats_buf))
> +		return;
> +
> +	num_elements = le32_to_cpu(stats_buf->num_elems_ax_ndpa_arr);
> +
> +	len += scnprintf(buf + len, buf_len - len, "HTT_TXBF_OFDMA_AX_NDPA_STATS_TLV:\n");
> +	len += scnprintf(buf + len, buf_len - len, "ax_ofdma_ndpa_queued =");
> +	for (i = 0; i < num_elements; i++)
> +		len += scnprintf(buf + len, buf_len - len, " %u:%u,", i + 1,
> +				 le32_to_cpu(stats_buf->ax_ndpa[i].ax_ofdma_ndpa_queued));
> +	len--;
> +	*(buf + len) = '\0';

Please avoid pointer arithmetic, this is simpler:

buf[len] = '\0';

Or should it be just 0 instead of '\0'? Don't know which one is
preferred.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


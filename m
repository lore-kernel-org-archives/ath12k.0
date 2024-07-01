Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C52C3065A
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 19:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQj2DbFOqgoTtwwpfYkGvPfWLME53INff5zYJX5TvkA=; b=ituJbEK4Nb6dCVgnaHEtUi8EKC
	CtKq+/FqBIDirOJ/+ZdYjKzft1CzcKI0wZGNTgK46TqEr17M2OXFf+Gfwhw7HZO+OvjMXTZT8g3YI
	BCpnlNKgfmoaZhpUl5X9xIfiNvBD9ctzr/fZgfF1inO+0jSWE8Szysps1CZnqRkAFYmvAbaWSz1t+
	3XuVlqADjl/rQF1yU6Asnx9M5dEJgjll6EiXMS54hMipLfNF+mYZqxS4D3TWDkLVTFHCC7DJwr+dN
	da7BIFt+esQ7cxZCMEyO9UcDf8sqE3tZrwo2jK5CU+eM0MNSJxbRqZdo7isJzR+aapRvGeT+mCfNb
	h8hfqgZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMec-00000004d2v-4B67
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 19:25:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMeZ-00000004d2G-1WVP
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 19:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82CBA61701;
	Mon,  1 Jul 2024 19:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A27C116B1;
	Mon,  1 Jul 2024 19:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719861930;
	bh=CuuO2HOqnBwxeM0TOUK/GsPm1OxlPPVBOb/1Q853tGc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=EDQ7k4fRpNib3zFMJIbLH4IfZNvYTiOx6t+Tg/xdsPxCbUOdwJFiIIIJS59WGqwMw
	 b2y59EQC7DpzrdN9zliuKLRtoZt3biuvHR7XGqpeGt59Dz6kddzkH9JpBmZfd2Xgy7
	 eEB/j/1LggdBlCUD3YmiCxNhqOUzw2SLXdoW9Hn+I/3O60dFg3YFVvzwJ1ZpCxmqr0
	 5h3d4va+soCXNMnOcL+DURnAYJLuqSznfRpK2/RbELesq3ApQXDIPCuS3gZxnDpaj5
	 8k2aIMEGnkrRu6ZtlzIudvBIGMMEYTc7DV8aGBOg/wKG6TvZxyYxD6cXvFE+YIyZa+
	 SzYnLOAXV1U3Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Support Transmit DE stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240626042221.3090812-1-quic_rdevanat@quicinc.com>
References: <20240626042221.3090812-1-quic_rdevanat@quicinc.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Dinesh Karthikeyan
	<quic_dinek@quicinc.com>, Roopni Devanathan <quic_rdevanat@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171986192703.3074425.2338122973158538260.kvalo@kernel.org>
Date: Mon,  1 Jul 2024 19:25:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_122531_509427_46BC457C 
X-CRM114-Status: UNSURE (   6.44  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> wrote:

> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request transmit DE stats from firmware through HTT stats
> type 8. These stats give information about enqueued packets, discarded
> packets, failed packets and other information such as power, bandwidth
> information, number of retries, etc.
> 
> Sample output:
> -------------
> echo 8 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_DE_CMN_STATS_TLV:
> mac_id = 0
> tcl2fw_entry_count = 0
> not_to_fw = 0
> .....
> 
> HTT_TX_DE_EAPOL_PACKETS_STATS_TLV:
> m1_packets = 0
> m2_packets = 0
> m3_packets = 0
> .....
> 
> HTT_TX_DE_CLASSIFY_STATS_TLV:
> arp_packets = 0
> igmp_packets = 0
> dhcp_packets = 0
> .....
> 
> HTT_TX_DE_CLASSIFY_FAILED_STATS_TLV:
> ap_bss_peer_not_found = 0
> ap_bcast_mcast_no_peer = 0
> sta_delete_in_progress = 0
> .....
> 
> HTT_TX_DE_CLASSIFY_STATUS_STATS_TLV:
> eok = 0
> classify_done = 0
> lookup_failed = 0
> .....
> 
> HTT_TX_DE_ENQUEUE_PACKETS_STATS_TLV:
> enqueued_pkts = 0
> to_tqm = 0
> to_tqm_bypass = 0
> 
> HTT_TX_DE_ENQUEUE_DISCARD_STATS_TLV:
> discarded_pkts = 0
> local_frames = 0
> is_ext_msdu = 0
> 
> HTT_TX_DE_COMPL_STATS_TLV:
> tcl_dummy_frame = 0
> tqm_dummy_frame = 0
> tqm_notify_frame = 0
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Doesn't apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:410
error: drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h:125
error: drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240626042221.3090812-1-quic_rdevanat@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



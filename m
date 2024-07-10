Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F955C3DA41
	for <ath12k@archiver.kernel.org>; Wed, 10 Jul 2024 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPDAhHwnIGHF+OqRUn1d97N0QJzPsxKjNmfENi5T4Dc=; b=qF/RzeguEpUostyY1FBe0JlvrJ
	BV3T+S2XGK2mRN1uZqH1vbFRQ9C+2SzT7+weZXdTU5x8pYeoQkbSmD/ZK2QBDo2h5WvfkLVk7khkG
	zxxwgy2g3QZcFO707S5J91O93tfjQZL7UQWuzZXt/zMbWwY9TDsEmczSZsr2ss3IkPIAmc58ChAuA
	7NUd4y4czVnx+1u//JoCSV2MGyRnamNoVnRV3vXI+ipNhMm33p8fI1ifEXsEBehdu4h9sI73Hkx42
	14OuoMOuOCS5ifil6VMbAtGGoevjqqAP33Cklqh2KmysCSIrJmWUG7N0MTnJp+ggj0zp0BoWDKnvu
	4SErLVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRbNq-0000000BLaE-3sXU
	for ath12k@archiver.kernel.org;
	Wed, 10 Jul 2024 17:45:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRaEw-0000000BAs7-2zeM
	for ath12k@bombadil.infradead.org;
	Wed, 10 Jul 2024 16:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IPDAhHwnIGHF+OqRUn1d97N0QJzPsxKjNmfENi5T4Dc=; b=LLXR/7rmSD85KKxEyBa1o+sf37
	k9vnUzy+V5Oib7F/QQ8gO1txWPvzUidyPUn4IFTgbUOVhQtRNSVTHGIV+lOoCKK/pQQSuSinwYKWK
	KUI0ePWAEGBg42tteL0TX+v0TrerrucuOK6AIBqvTIV89QehefavFClg4USpWI6DXxJBcVznL0o0o
	/sgNzIT+ddTuMtN/8fPCT7sSGCD6IzARXahfmdHGgWUhh7EgsMFL3rQwvSjLwYIWj/82d1CetLovk
	gU7onxYtPcemH4Ee0B4VFT0c7FtnDtzg+a6GdzmOAxdKUyL9LXsOZawoVPY8RCNOLEunu+37Czbo6
	3L3uDwtw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRaEt-00000000veb-1pUI
	for ath12k@lists.infradead.org;
	Wed, 10 Jul 2024 16:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13FBE61B54;
	Wed, 10 Jul 2024 16:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA39AC4AF09;
	Wed, 10 Jul 2024 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720629135;
	bh=hnFP08ghhmLsCPktOQYbAMkrQPAkxrxRGDxqtFHLWac=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=H/z9ozLaJnE23FtzBCAXlGJ5lif8GD9qsSc3lu+FnjV/xmskjTy+S0xpOH40adZPJ
	 kHonytW6QO0KljhbZequgS3jb3zNszoiSlG8IXcBcUTG6ize6w8ZK3AipWW17IF6qa
	 9UZoVkT2WLW5En2ngA2RFuC6Vy+0J/+Knte7LaZBOJ2Z8AZJNO4u92VXkEyLKL9HoV
	 W1Igv+Yky9awZAMZUIjjDfxRS+yat220cSKMXU294aijVHYAFtA15YwmqMMank9iq1
	 61KI94qNZGvEqrDyMhjK9B10e+t1Xz7ulFW9M1w4V+Y1/KpTBi2ohkYlrG6xN74TDD
	 unXQOERVoCLEg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: Support Transmit DE stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240704090535.827680-1-quic_rdevanat@quicinc.com>
References: <20240704090535.827680-1-quic_rdevanat@quicinc.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Dinesh Karthikeyan
	<quic_dinek@quicinc.com>, Roopni Devanathan <quic_rdevanat@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172062913268.1204645.7974155470467589425.kvalo@kernel.org>
Date: Wed, 10 Jul 2024 16:32:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_173219_686941_E6C3C6E7 
X-CRM114-Status: UNSURE (   6.81  )
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

In the future, please include Acked-by from v1 unless there are major changes:

https://patchwork.kernel.org/project/linux-wireless/patch/20240626042221.3090812-1-quic_rdevanat@quicinc.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240704090535.827680-1-quic_rdevanat@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



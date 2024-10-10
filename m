Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199F8CFC5E9
	for <ath12k@archiver.kernel.org>; Thu, 10 Oct 2024 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUwkPzApTD7NhHibkGSsv7YC+83MOmdVz2KjAeVYO1o=; b=o4gd/nRWczVZ2kzsgLB32XtDxB
	0tjI6jq6pNwFpI7ZBYryeFiMrsEnEsLYbcBmSjCqbiUcwp7UiWMTcucIpkUPiqcqjlfFOZQsXqN7b
	IAW+OfeRZS52WjA8LEKyxF76e2/3bJ8iGUIudWU1EeC6RZvd76L6SXWjWIdd0Cka91NoLkBqIvP4o
	XUzq5rhJovb72YsIJIIjmLmpMmMOPYCrL4FnkI8kNPeKOkyqaBOtM1EOh/9Bz/Gd4QPpyRgdghfLT
	6cBHPVIKP47d6s05C4h7kB051hWoKip/QlSX8u/SHT2Qsavz36xbQJo441/ozFdRKTaLSMMd6D+ct
	TPJVQrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syxLV-0000000DkTA-3RFl
	for ath12k@archiver.kernel.org;
	Thu, 10 Oct 2024 17:53:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxLS-0000000DkS4-2OOJ
	for ath12k@lists.infradead.org;
	Thu, 10 Oct 2024 17:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728582780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fUwkPzApTD7NhHibkGSsv7YC+83MOmdVz2KjAeVYO1o=;
	b=M0voyumPAGWTxkPIRrBC23iBx3QL+22zepOzBVS6aWWM/pAnMCUvrUi701MK/z4rxBb0n4
	sjDjW/Aow9HaGF9r2J5uhcaTPRuH2qCK3NOyNAyuTTWFAVy9+8wopqJRpQpvMAmiS5YSWk
	bXQDoeZq2dYIvX/xB3V9dIq4LgfanU0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-OWOItd8oNAiTynnGMLP7ow-1; Thu,
 10 Oct 2024 13:51:34 -0400
X-MC-Unique: OWOItd8oNAiTynnGMLP7ow-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD3581955BE1;
	Thu, 10 Oct 2024 17:51:32 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.239])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E65E519560A2;
	Thu, 10 Oct 2024 17:51:29 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jtornosm@redhat.com,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath12k: fix warning when unbinding
Date: Thu, 10 Oct 2024 19:48:59 +0200
Message-ID: <20241010175102.207324-3-jtornosm@redhat.com>
In-Reply-To: <20241010175102.207324-1-jtornosm@redhat.com>
References: <20241010175102.207324-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_105302_762384_EFD76A47 
X-CRM114-Status: GOOD (  16.39  )
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

If there is an error during some initialization realated to firmware,
the buffers dp->tx_ring[i].tx_status are released.
However this is released again when the device is unbinded (ath12k_pci),
and we get:
[   41.271233] WARNING: CPU: 0 PID: 2098 at mm/slub.c:4689 free_large_kmalloc+0x4d/0x80
[   41.271246] Modules linked in: uinput snd_seq_dummy snd_hrtimer nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink sunrpc qrtr_mhi intel_rapl_msr intel_rapl_common intel_uncore_frequency_common intel_pmc_core intel_vsec pmt_telemetry pmt_class kvm_intel kvm rapl qrtr snd_hda_codec_generic ath12k qmi_helpers snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi iTCO_wdt intel_pmc_bxt mac80211 snd_hda_codec iTCO_vendor_support libarc4 snd_hda_core snd_hwdep snd_seq snd_seq_device cfg80211 snd_pcm pcspkr i2c_i801 snd_timer i2c_smbus snd rfkill soundcore lpc_ich mhi virtio_balloon joydev xfs crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 virtio_net virtio_blk virtio_console virtio_gpu net_failover failover virtio_dma_buf serio_raw fuse qemu_fw_cfg
[   41.271284] CPU: 0 UID: 0 PID: 2098 Comm: bash Kdump: loaded Not tainted 6.12.0-rc1+ #29
[   41.271286] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
[   41.271287] RIP: 0010:free_large_kmalloc+0x4d/0x80
[   41.271289] Code: 00 10 00 00 48 d3 e0 f7 d8 81 e2 c0 00 00 00 75 2f 89 c6 48 89 df e8 82 ff ff ff f0 ff 4b 34 0f 85 59 0e ce 00 e9 5b 0e ce 00 <0f> 0b 80 3d c8 29 3c 02 00 0f 84 2d 0e ce 00 b8 00 f0 ff ff eb d1
[   41.271290] RSP: 0018:ffffa40881a33c50 EFLAGS: 00010246
[   41.271292] RAX: 000fffffc0000000 RBX: ffffe697c0278000 RCX: 0000000000000000
[   41.271293] RDX: ffffe697c0b60008 RSI: ffff8d00c9e00000 RDI: ffffe697c0278000
[   41.271294] RBP: ffff8d00c3af0000 R08: ffff8d00f215d0c0 R09: 0000000080400038
[   41.271294] R10: 0000000080400038 R11: 0000000000000000 R12: 0000000000000001
[   41.271295] R13: ffffffffc0ef8948 R14: ffffffffc0ef8948 R15: ffff8d00c1277560
[   41.271296] FS:  00007fd31e556740(0000) GS:ffff8d011e400000(0000) knlGS:0000000000000000
[   41.271297] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.271298] CR2: 00007f778d3ffb38 CR3: 00000000065dc000 CR4: 0000000000752ef0
[   41.271301] PKRU: 55555554
[   41.271302] Call Trace:
[   41.271304]  <TASK>
[   41.271304]  ? free_large_kmalloc+0x4d/0x80
[   41.271306]  ? __warn.cold+0x93/0xfa
[   41.271308]  ? free_large_kmalloc+0x4d/0x80
[   41.271311]  ? report_bug+0xff/0x140
[   41.271314]  ? handle_bug+0x58/0x90
[   41.271316]  ? exc_invalid_op+0x17/0x70
[   41.271317]  ? asm_exc_invalid_op+0x1a/0x20
[   41.271321]  ? free_large_kmalloc+0x4d/0x80
[   41.271323]  ath12k_dp_free+0xdc/0x110 [ath12k]
[   41.271337]  ath12k_core_deinit+0x8d/0xb0 [ath12k]
[   41.271345]  ath12k_pci_remove+0x50/0xf0 [ath12k]
[   41.271354]  pci_device_remove+0x3f/0xb0
[   41.271356]  device_release_driver_internal+0x19c/0x200
[   41.271359]  unbind_store+0xa1/0xb0
...

The issue is always reproducible from a VM because the MSI addressing
initialization is failing.

In order to fix the issue, just check if the buffers were already released
and if they need to be released, in addition set to NULL for the checking.

cc: stable@vger.kernel.org
Fixes: d889913205cf7 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 789d430e4455..9d878d815f3c 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1277,8 +1277,12 @@ void ath12k_dp_free(struct ath12k_base *ab)
 
 	ath12k_dp_rx_reo_cmd_list_cleanup(ab);
 
-	for (i = 0; i < ab->hw_params->max_tx_ring; i++)
-		kfree(dp->tx_ring[i].tx_status);
+	for (i = 0; i < ab->hw_params->max_tx_ring; i++) {
+		if (dp->tx_ring[i].tx_status) {
+			kfree(dp->tx_ring[i].tx_status);
+			dp->tx_ring[i].tx_status = NULL;
+		}
+	}
 
 	ath12k_dp_rx_free(ab);
 	/* Deinit any SOC level resource */
-- 
2.46.2



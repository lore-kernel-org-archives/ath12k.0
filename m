Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55E6E77182
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DPK21BLSHEghOmtUcGCK6RQWUX3zkjG4m/Upd8dsSM=; b=Kgqo26xq87T9eJqqMWFLhCbPcf
	LNvXwQkamSoqr4ZMRrJQywg/9yYUIx9Smg0wSIWtHOPTwfRGcQ+2CULaddyDJOQqxNxSY4AjRrvtU
	KUK6JvDfrJxhKDWcN/JM4Fu10iYN04DVa2pFmZaYhyMEIG2h/I6Zj2hALl3rs38NkRL8ulKpKgEjT
	wB4OEYhTYifvHehQDuW+w8wVQnWSWY5finQDgSrc7ecnomO/J8u8cH3IXcj9X8oKPNfPwPXAm0sPj
	PQ2nhKcd2hxqf+Q9/Y0YUMarekcQqo3ENSWVwglNGVpeumxV/vihESRYgJn4LQqQyFwzBSLLJES/F
	Lo9Pk3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsj-0000000FJ1i-2P87
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:44:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsg-0000000FIxo-0ys0
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:44:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29994A40BB8
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965A1C4CED7;
	Wed, 11 Dec 2024 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931845;
	bh=I4xxAW21GFTuI4CUQmeQKcvHy+yndUU+jz/ZTGh9zCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxAMv7Pf79YYiBU/4FFjsbBK4YSBwKxzLYBX8GTC3tN3d0ZsIQctk51IL+5jSoD+6
	 7MBhTz+U1KwGGzV53AiC6Pp8oXMG8EsYJj9npc7lApiyVtdDyMNssLaNLIAz/TgXT5
	 MeL646+rvB6biFOvt7t7K5P5xNtuv3WRzURUnVHCPieK1Q37wGc4QtDnbD6Bz6Z4NW
	 HKq3CE20ywpBDpjCd7qj0PDZrX40JRPK5kFsRRht0WhpZBrmQ3BAipUS0OR2eicyxc
	 RfJ2jI9IkS7OSViC5m0CE0Mv/V3nsg5/0cfeXJOTPYNBiMBOzlSxQpNy0fs2bRSBT+
	 EBm3pxEL4TrZA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 4/7] wifi: ath12k: remove warning print in htt mlo offset event message
Date: Wed, 11 Dec 2024 17:43:55 +0200
Message-Id: <20241211154358.776279-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211154358.776279-1-kvalo@kernel.org>
References: <20241211154358.776279-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074406_342587_716283DB 
X-CRM114-Status: GOOD (  10.12  )
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

From: Aditya Kumar Singh <quic_adisi@quicinc.com>

In the function ath12k_htt_mlo_offset_event_handler(), it is possible that
the ar is not yet active (started). The function
ath12k_mac_get_ar_by_pdev_id() only searches for active pdev, so a NULL
return is possible. Therefore, there is no need to print a warning,
instead, just silently discard the message.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 1cc7f6ce55b9..a05384288b5a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1697,7 +1697,11 @@ static void ath12k_htt_mlo_offset_event_handler(struct ath12k_base *ab,
 	rcu_read_lock();
 	ar = ath12k_mac_get_ar_by_pdev_id(ab, pdev_id);
 	if (!ar) {
-		ath12k_warn(ab, "invalid pdev id %d on htt mlo offset\n", pdev_id);
+		/* It is possible that the ar is not yet active (started).
+		 * The above function will only look for the active pdev
+		 * and hence %NULL return is possible. Just silently
+		 * discard this message
+		 */
 		goto exit;
 	}
 
-- 
2.39.5



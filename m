Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB7ED78783
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YPr8zzValvrcqA/b5W2EckHt9y3tt/QaMBkPn3FH8I=; b=d7YVcTyn+LKD5sg0Hix0UMfS5j
	BbJueOlHuz0+7fsMH77mvQBckh7piVepLtx9ZuPQ+ngFwAbqMzPRMepy4P6FHNAPGZPBVYwfUppt/
	+Jf3bejxpXGY+8julLQOUfQaCivDFiAheRHega/UGIkOVzZuWL/T+yfZZk1qp7V81WF+B1wyokhRH
	0JH7E0l0ssZ/QxQXMQEuMelvBQ41LeQ9wT+z7DPx49mPrbS3reLOKHY0P1Zvn3Djty0H7TZlz9Rnv
	Y3ZkQ3QcfiGwQEXH+5VASecJMyF/qGKgktHyxLGNZvxh+8PIWPnm5PyKOfvHyAQ/R+BOoUIAoOHl+
	g9lRfXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9ZS-00000000OOM-0GsF
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 15:58:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9ZO-00000000OKw-33OF
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 15:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE663A40ADC
	for <ath12k@lists.infradead.org>; Thu, 21 Nov 2024 15:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24956C4CECC;
	Thu, 21 Nov 2024 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732204693;
	bh=YBHUZ421odpWi0aVXgDV5WLSpvfLYQdPAjzx0CzCx/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MNDkdjm9X/vj60aZnfelNu5BbrO3U+P5ITrmU4RzxXJ2bY/tF8tzGjibQJexX8oIh
	 CPcsZfOp36yoDpWEm/dv3JmCIBMUn9dwT0t4g8IQd4/emJdgEG3B/coIdbRtI3ZR3d
	 y7q0B+WrkApNO0XC4K20qYEwwniMJ/vGDu8NPKaWrJz7RKEseuHV06/vWBkKNkN89A
	 FfEOyRbwzY7MiRCgFSRr/F/HSiToE0IgSzt8S1p8qgzHnWLPFIO7WupejJWdfO0amm
	 /4CpYijARGgl0imtsxBSho1OZn2+BBhpbS9s0AcmK4KM+iPq9f6AfCbe7ykHkh2UmO
	 60Trv+BteCTSw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 5/8] wifi: ath12k: add reo queue lookup table for ML peers
Date: Thu, 21 Nov 2024 17:58:03 +0200
Message-Id: <20241121155806.1862733-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121155806.1862733-1-kvalo@kernel.org>
References: <20241121155806.1862733-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_075814_940351_EC2F32FF 
X-CRM114-Status: GOOD (  18.56  )
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

From: Rameshkumar Sundaram <quic_ramess@quicinc.com>

Currently reoqueue tid setup uses lookup table (LUT) during peer association,
but for ML peer there will be multiple link peers (belonging to different
underlying firmware) affiliated to each other. Hence the reo queue should be
setup only on one of the links which is the primary link.

Add changes to create separate ML reo queue lookup table for ML peers and use
the same while setting up rx tid for ML peer's primary link. For ML peers use
ml_peer_id instead of peer_id to setup/lookup the reo queue entry in the LUT.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c    | 39 +++++++++++++++-----
 drivers/net/wireless/ath/ath12k/dp.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c | 48 ++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/peer.c  |  2 ++
 drivers/net/wireless/ath/ath12k/peer.h  |  2 +-
 5 files changed, 70 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 23326e2dfe8d..328be2c635d6 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1265,15 +1265,23 @@ static void ath12k_dp_reoq_lut_cleanup(struct ath12k_base *ab)
 	if (!ab->hw_params->reoq_lut_support)
 		return;
 
-	if (!dp->reoq_lut.vaddr)
-		return;
+	if (dp->reoq_lut.vaddr) {
+		ath12k_hif_write32(ab,
+				   HAL_SEQ_WCSS_UMAC_REO_REG +
+				   HAL_REO1_QDESC_LUT_BASE0(ab), 0);
+		dma_free_coherent(ab->dev, DP_REOQ_LUT_SIZE,
+				  dp->reoq_lut.vaddr, dp->reoq_lut.paddr);
+		dp->reoq_lut.vaddr = NULL;
+	}
 
-	dma_free_coherent(ab->dev, DP_REOQ_LUT_SIZE,
-			  dp->reoq_lut.vaddr, dp->reoq_lut.paddr);
-	dp->reoq_lut.vaddr = NULL;
-
-	ath12k_hif_write32(ab,
-			   HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_LUT_BASE0(ab), 0);
+	if (dp->ml_reoq_lut.vaddr) {
+		ath12k_hif_write32(ab,
+				   HAL_SEQ_WCSS_UMAC_REO_REG +
+				   HAL_REO1_QDESC_LUT_BASE1(ab), 0);
+		dma_free_coherent(ab->dev, DP_REOQ_LUT_SIZE,
+				  dp->ml_reoq_lut.vaddr, dp->ml_reoq_lut.paddr);
+		dp->ml_reoq_lut.vaddr = NULL;
+	}
 }
 
 void ath12k_dp_free(struct ath12k_base *ab)
@@ -1599,8 +1607,23 @@ static int ath12k_dp_reoq_lut_setup(struct ath12k_base *ab)
 		return -ENOMEM;
 	}
 
+	dp->ml_reoq_lut.vaddr = dma_alloc_coherent(ab->dev,
+						   DP_REOQ_LUT_SIZE,
+						   &dp->ml_reoq_lut.paddr,
+						   GFP_KERNEL | __GFP_ZERO);
+	if (!dp->ml_reoq_lut.vaddr) {
+		ath12k_warn(ab, "failed to allocate memory for ML reoq table");
+		dma_free_coherent(ab->dev, DP_REOQ_LUT_SIZE,
+				  dp->reoq_lut.vaddr, dp->reoq_lut.paddr);
+		dp->reoq_lut.vaddr = NULL;
+		return -ENOMEM;
+	}
+
 	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_LUT_BASE0(ab),
 			   dp->reoq_lut.paddr);
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_LUT_BASE1(ab),
+			   dp->ml_reoq_lut.paddr >> 8);
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 2e05fc19410e..a120b7a8477d 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -368,6 +368,7 @@ struct ath12k_dp {
 	struct dp_rxdma_mon_ring rxdma_mon_buf_ring;
 	struct dp_rxdma_mon_ring tx_mon_buf_ring;
 	struct ath12k_reo_q_addr_lut reoq_lut;
+	struct ath12k_reo_q_addr_lut ml_reoq_lut;
 };
 
 /* HTT definitions */
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 048edb79e993..1b1297c105ae 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -740,15 +740,22 @@ static void ath12k_peer_rx_tid_qref_setup(struct ath12k_base *ab, u16 peer_id, u
 {
 	struct ath12k_reo_queue_ref *qref;
 	struct ath12k_dp *dp = &ab->dp;
+	bool ml_peer = false;
 
 	if (!ab->hw_params->reoq_lut_support)
 		return;
 
-	/* TODO: based on ML peer or not, select the LUT. below assumes non
-	 * ML peer
-	 */
-	qref = (struct ath12k_reo_queue_ref *)dp->reoq_lut.vaddr +
-			(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
+	if (peer_id & ATH12K_PEER_ML_ID_VALID) {
+		peer_id &= ~ATH12K_PEER_ML_ID_VALID;
+		ml_peer = true;
+	}
+
+	if (ml_peer)
+		qref = (struct ath12k_reo_queue_ref *)dp->ml_reoq_lut.vaddr +
+				(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
+	else
+		qref = (struct ath12k_reo_queue_ref *)dp->reoq_lut.vaddr +
+				(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
 
 	qref->info0 = u32_encode_bits(lower_32_bits(paddr),
 				      BUFFER_ADDR_INFO0_ADDR);
@@ -761,15 +768,22 @@ static void ath12k_peer_rx_tid_qref_reset(struct ath12k_base *ab, u16 peer_id, u
 {
 	struct ath12k_reo_queue_ref *qref;
 	struct ath12k_dp *dp = &ab->dp;
+	bool ml_peer = false;
 
 	if (!ab->hw_params->reoq_lut_support)
 		return;
 
-	/* TODO: based on ML peer or not, select the LUT. below assumes non
-	 * ML peer
-	 */
-	qref = (struct ath12k_reo_queue_ref *)dp->reoq_lut.vaddr +
-			(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
+	if (peer_id & ATH12K_PEER_ML_ID_VALID) {
+		peer_id &= ~ATH12K_PEER_ML_ID_VALID;
+		ml_peer = true;
+	}
+
+	if (ml_peer)
+		qref = (struct ath12k_reo_queue_ref *)dp->ml_reoq_lut.vaddr +
+				(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
+	else
+		qref = (struct ath12k_reo_queue_ref *)dp->reoq_lut.vaddr +
+				(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
 
 	qref->info0 = u32_encode_bits(0, BUFFER_ADDR_INFO0_ADDR);
 	qref->info1 = u32_encode_bits(0, BUFFER_ADDR_INFO1_ADDR) |
@@ -802,7 +816,10 @@ void ath12k_dp_rx_peer_tid_delete(struct ath12k *ar,
 		rx_tid->vaddr = NULL;
 	}
 
-	ath12k_peer_rx_tid_qref_reset(ar->ab, peer->peer_id, tid);
+	if (peer->mlo)
+		ath12k_peer_rx_tid_qref_reset(ar->ab, peer->ml_id, tid);
+	else
+		ath12k_peer_rx_tid_qref_reset(ar->ab, peer->peer_id, tid);
 
 	rx_tid->active = false;
 }
@@ -945,7 +962,8 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 		return 0;
 	}
 
-	if (ab->hw_params->reoq_lut_support && !dp->reoq_lut.vaddr) {
+	if (ab->hw_params->reoq_lut_support &&
+	    (!dp->reoq_lut.vaddr || !dp->ml_reoq_lut.vaddr)) {
 		spin_unlock_bh(&ab->base_lock);
 		ath12k_warn(ab, "reo qref table is not setup\n");
 		return -EINVAL;
@@ -1026,7 +1044,11 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 		/* Update the REO queue LUT at the corresponding peer id
 		 * and tid with qaddr.
 		 */
-		ath12k_peer_rx_tid_qref_setup(ab, peer->peer_id, tid, paddr);
+		if (peer->mlo)
+			ath12k_peer_rx_tid_qref_setup(ab, peer->ml_id, tid, paddr);
+		else
+			ath12k_peer_rx_tid_qref_setup(ab, peer->peer_id, tid, paddr);
+
 		spin_unlock_bh(&ab->base_lock);
 	} else {
 		spin_unlock_bh(&ab->base_lock);
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 25905498e8fb..5763c5a40cfc 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -396,9 +396,11 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 
 			/* the assoc link is considered primary for now */
 			peer->primary_link = arsta->is_assoc_link;
+			peer->mlo = true;
 		} else {
 			peer->ml_id = ATH12K_MLO_PEER_ID_INVALID;
 			peer->primary_link = true;
+			peer->mlo = false;
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index a39e943bd66b..7e6231cb2b52 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -46,7 +46,7 @@ struct ath12k_peer {
 	struct ppdu_user_delayba ppdu_stats_delayba;
 	bool delayba_flag;
 	bool is_authorized;
-
+	bool mlo;
 	/* protected by ab->data_lock */
 	bool dp_setup_done;
 
-- 
2.39.5



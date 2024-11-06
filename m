Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7CCD44D7D
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tbv9haf6k49kvgdMo5zvV2/cKbNdjYNIvdaWG5bwYg0=; b=kjXSrNQJiKRGZ2JpF36x31NcH6
	M//BAGedVRSztdMTAIH9LMgRiBR8srgq5eMoz7XOdsy9MUvr/cGSVYnkOiHB5y6wbfmTtHFz5wrLY
	018D3DW4kH7zoxIXnN2yLl8klgsBq8Xx9i9KadAdU3SFk/8F24y2g/hlcgWfTDn1yPkh54hLEB0M7
	F6oEcX05XIOKQtjiF9UN/xYUOKI2hy/DUOXANu4fV2X7kT7hG4J8aHiD704yKUIR9RsUm9vhudRQR
	hPxMbeUk+LGSbGY4geCeMEfqPUFgNXRCs6Mih3v2jFLXfNZGJPMR8bXeRp2/dkLdgSsXKeVdRi5DP
	4vo7zocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h1D-00000003bRj-3Ee2
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 14:28:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gzK-00000003azA-45wO
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 14:26:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 597F0A43D63
	for <ath12k@lists.infradead.org>; Wed,  6 Nov 2024 14:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600EDC4CEC6;
	Wed,  6 Nov 2024 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730903186;
	bh=+IDLNu/QmFHC+/83NOmNp6l2NcysXwuR3uc/y8Q8nvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lfW4C4vCVNHD7mlL4FSSwr57uqyhRb/SRf5DvDFVMm+JaiX4zDBZ73hn6fbKfzZQK
	 YAUgWmbIytGQO7gUIatCIHpsvo5h5tsdSezhpEzC36SIAzQ/Q3EcZ4p4pAwZvS1N0P
	 ZNHInaOip/7ROAKs68olzsgjjhCPWvo8jUDPaANJ3TK6kp6rtjTqw80C5xSu8PNecJ
	 sG8v+l6QWmh+Ov3F/K63e7tW/8PYJ1eN6qTGyTneNkAvs5//t1xcBXvlxzWe3twRJW
	 jWlX9irzamGerQjbSHMKwBfcFZy5tbAtqabhXln8UcShpqLsxzoBkUtlIYUO1pPndn
	 Q6+pz6VMuP7TQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 5/8] wifi: ath12k: add reo queue lookup table for ML peers
Date: Wed,  6 Nov 2024 16:26:14 +0200
Message-Id: <20241106142617.660901-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106142617.660901-1-kvalo@kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_062627_173705_AD66D2EE 
X-CRM114-Status: GOOD (  18.92  )
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
index b6d6a2983d09..ad633d4ec39b 100644
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



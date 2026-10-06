Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56140CA5FF0
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKZMczwgWcdJJIgzlUEuriqeYRN99r4Avg0hTCaOGbs=; b=O3PDYc0IFYVSdKro0OfqBHCaA9
	Eu4ABWcLdsUVooy/KT7oTsX4jUzqVjFHQDT/GKM5g8x2j8jSIVepOXl4scAPrwT3rjFbQRLmXFhzB
	su7DeJiwQy1ScnqsRvA6jYYuw095ZB8McRqqfIY2ai1j0t+bUYF3CN/Tw9EyDf43+rENBFzyhQrR7
	R+984FVeawCyW2VwFTKM7d6VX9Y34VfGMiBxYPW7wnHBxjfs7aBWxikvc7KDQGGPEKVwXyY711fFM
	nIFIz/bs8WKYykG32WK8ccFLGB9+PCH7Tqdtk7SPmAzFXQi8Z7z+jrzQx+cTgzNfcaMvE1f7i5+T3
	E7n5Knhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1hg-00000000PcL-05dM;
	Tue, 06 Oct 2026 09:43:20 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1hb-00000000PZN-3z5P
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 09:43:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so386078266b.1
        for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279794; x=1791884594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKZMczwgWcdJJIgzlUEuriqeYRN99r4Avg0hTCaOGbs=;
        b=WKLQDhYwRNM7rdv7EBep1GLpbr9VFJnTnFV0k71rPVjibYNrCgccDV1FE4sFbThzri
         9QZvMyYsu+55QevBtIc2RtXpJ7N12dC4WSLWCxwxgwPoicr0M+bPY07i1yTsqjeJKdIs
         7eHEZfZfRJqN79FXTtjoNrJSRkdMiYwhXsfirh3vYLcZsQ6Z1QuHkutcZkVjnToN9aQQ
         sePf7ihLTm3PO7I8iICoSRWau4/Zn3FQw1JrNp/2nHZPdgvNM8Tisz/F7MLw11nIfo3E
         aACkanu92BNR8wJlfvV2i3ZS8KK1J9LWkYzDyOhytIDukrflSBPpgUKp4LDkKdGvH+WN
         eMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279794; x=1791884594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKZMczwgWcdJJIgzlUEuriqeYRN99r4Avg0hTCaOGbs=;
        b=XCcsurEuhZDaCWQifz28gXgILZC+wNlurYhEjL3QpGYOfCIWDyfFxdT25Z5AhixSqH
         pDi3x5zPv559wXhf6bFQ7AnHQA9CrdVb2x0ehEpSzmd3fGnh0tECw4XlOQzGOWa8e65l
         UCsZyOB/fOdUZQT5mO5w1ihxN2hUTXfzr6pwAiN62Z5PFljV3F1+R7v3rlAjlp1/GHBG
         oHHVxV8TWsEKJnk0CSFQ6IZiAQXco4BzsP1/5wu9UYmqSXYKRQgbV87QC18RJ/wCWeNW
         xEL6kyoX+rg5AdaEAPtmgJhProRgUiUSbbTcqQ3r3AIUeeXLONxwqGG/6fi47uk2VfSn
         3d9w==
X-Gm-Message-State: AFuF++mXUeWNjA1F2VbXNLzktos8JwJneYIzrE83hRmJtOB1a4Zjhto8
	oxgm2Yk1AaLjeeBOcU0BebnzaCiA1Znful4GcyfnWEXiO9/gPgfdoLOBkMXQZeIQbP8r+qo0acg
	=
X-Gm-Gg: AYBFou1WjkW8Mh78tdWA8QOz1CGd55bKyhaXBowsi6DweTT04pDhSKLjMUkoEH4XRJL
	oV1YZVd8U+sQrB1tDfRuEsxjMS1/MeBaHKhsHQJb4p+J3f0y2e7nmNI5nNn5Zbm4BPo92dv/ZVK
	yoA4yHvG0gBeg7TVxIo/TGvTT7a7s4VTiKtJiRpu3D+BGuRC2yOx20xLpmhezxCxn8rE21zqx5t
	t65/YYc6jTBEyVuGO8E/MKihG5wO/Zd0a3OCa+MUFuEkStvSP/EAxMKfAuxOgHqRxyZwSCFuGBM
	oe+PQYnKLUYnBQ/KvlEzhvcXBA0Viot4JASHfyKN+IgvOJWLYeqLew3x2KDBzLuwnTWEP+FULFL
	rBd1DG/7MYXqCYcN4hJYz4WsYy+500rvfrcA2G4TJLuFOWHGcZGs0/RFX6TkHCym/GXmWv3bIm4
	HKKIgjI7MR7X79zmvESSHYlsJSaMlY8fH8bjJ79hdGZa6kuvJn9LE8/oQtcFUMDVzrR1jOQ9UDD
	gUlnEOe8YegsQ==
X-Received: by 2002:a17:906:c107:b0:c2d:d27d:ef88 with SMTP id a640c23a62f3a-c316a0734f9mr105156866b.42.1791279793825;
        Tue, 06 Oct 2026 02:43:13 -0700 (PDT)
Received: from Quarx2k-PC.lan ([92.124.138.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31562da31esm183753966b.38.2026.10.06.02.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:43:13 -0700 (PDT)
From: Nikolai Semendiaev <agent00791@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	wabsie@gmail.com
Subject: [PATCH 2/2] wifi: ath12k: use private page-frag caches for RXDMA rings
Date: Tue,  6 Oct 2026 15:41:47 +0600
Message-ID: <7bb1b30324eea87b53a8c585566842a1a0ec7d06.1791279304.git.agent00791@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791233788.git.agent00791@gmail.com>
References: <cover.1791233788.git.agent00791@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_024317_173347_DAA6E7D9 
X-CRM114-Status: GOOD (  15.99  )
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

RXDMA buffers allocated with dev_alloc_skb() share per-CPU page-fragment
caches with other network users. Long-lived ring buffers can pin mostly
unused 32-KiB backing pages as short-lived network allocations cycle
through those caches. On QCN9274, OOM was observed during sustained WAN
downloads when Ethernet and ath12k processing shared a CPU.

Give regular and monitor RXDMA rings private page-fragment caches. The
existing refill SRNG locks serialize cache access. Preserve NET_SKB_PAD,
allocation flags and the DMA mapping and unmapping operations.

Drain each monitor cache after releasing its IDR-owned buffers, and the
regular RX cache after releasing its cookie-conversion descriptors.
Disable external IRQ/NAPI processing before non-reset crash teardown;
the reset worker already does so.

Use skb_reserve() for DMA alignment because skb_pull() cannot advance
an empty skb. Allocate extra alignment space for monitor status buffers
to preserve at least RX_MON_STATUS_BUF_SIZE of DMA capacity.

Based on Mark Ruvald Pedersen's ath11k per-ring page-fragment isolation.

Link: https://lore.kernel.org/linux-wireless/20260719215817.2468580-4-wabsie@gmail.com/
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nikolai Semendiaev <agent00791@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c   |  3 ++
 drivers/net/wireless/ath/ath12k/dp.c     |  3 ++
 drivers/net/wireless/ath/ath12k/dp.h     |  3 ++
 drivers/net/wireless/ath/ath12k/dp_mon.c | 29 +++++++++------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 45 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/dp_rx.h  |  2 ++
 6 files changed, 69 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c72948f3..8216f344e 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1390,6 +1390,9 @@ static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
 {
 	int ret, total_vdev;
 
+	if (!ab->is_reset)
+		ath12k_hif_irq_disable(ab);
+
 	mutex_lock(&ab->core_lock);
 	ath12k_link_sta_rhash_tbl_destroy(ab);
 	ath12k_thermal_unregister(ab);
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfab..7c097c506 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -4,6 +4,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/page_frag_cache.h>
 #include "core.h"
 #include "dp_tx.h"
 #include "hif.h"
@@ -1020,6 +1021,8 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 
 	spin_unlock_bh(&dp->rx_desc_lock);
 
+	page_frag_cache_drain(&dp->rx_refill_buf_ring.frag_cache);
+
 	/* TX Descriptor cleanup */
 	for (i = 0; i < ATH12K_HW_MAX_QUEUES; i++) {
 		spin_lock_bh(&dp->tx_desc_lock[i]);
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index c53eac20b..0b68bd8ba 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -11,6 +11,7 @@
 #include "hw.h"
 #include "dp_htt.h"
 #include "dp_cmn.h"
+#include <linux/mm_types.h>
 #include <linux/rhashtable.h>
 
 #define MAX_RXDMA_PER_PDEV     2
@@ -51,6 +52,7 @@ struct dp_srng {
 
 struct dp_rxdma_mon_ring {
 	struct dp_srng refill_buf_ring;
+	struct page_frag_cache frag_cache;
 	struct idr bufs_idr;
 	/* Protects bufs_idr */
 	spinlock_t idr_lock;
@@ -59,6 +61,7 @@ struct dp_rxdma_mon_ring {
 
 struct dp_rxdma_ring {
 	struct dp_srng refill_buf_ring;
+	struct page_frag_cache frag_cache;
 	int bufs_max;
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 709507d44..8b2b81b46 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -5,6 +5,7 @@
  */
 
 #include "dp_mon.h"
+#include "dp_rx.h"
 #include "debug.h"
 #include "dp_tx.h"
 #include "peer.h"
@@ -44,15 +45,17 @@ struct sk_buff
 	struct sk_buff *skb;
 	dma_addr_t paddr;
 
-	skb = dev_alloc_skb(RX_MON_STATUS_BUF_SIZE);
+	skb = ath12k_dp_rx_alloc_skb(&rx_ring->frag_cache,
+				     RX_MON_STATUS_BUF_SIZE +
+				     RX_MON_STATUS_BUF_ALIGN);
 
 	if (!skb)
 		goto fail_alloc_skb;
 
 	if (!IS_ALIGNED((unsigned long)skb->data,
 			RX_MON_STATUS_BUF_ALIGN)) {
-		skb_pull(skb, PTR_ALIGN(skb->data, RX_MON_STATUS_BUF_ALIGN) -
-			 skb->data);
+		skb_reserve(skb, PTR_ALIGN(skb->data, RX_MON_STATUS_BUF_ALIGN) -
+			    skb->data);
 	}
 
 	paddr = dma_map_single(ab->dev, skb->data,
@@ -598,14 +601,16 @@ int ath12k_dp_mon_buf_replenish(struct ath12k_base *ab,
 	ath12k_hal_srng_access_begin(ab, srng);
 
 	while (req_entries > 0) {
-		skb = dev_alloc_skb(DP_RX_BUFFER_SIZE + DP_RX_BUFFER_ALIGN_SIZE);
+		skb = ath12k_dp_rx_alloc_skb(&buf_ring->frag_cache,
+					     DP_RX_BUFFER_SIZE +
+					     DP_RX_BUFFER_ALIGN_SIZE);
 		if (unlikely(!skb))
 			goto fail_alloc_skb;
 
 		if (!IS_ALIGNED((unsigned long)skb->data, DP_RX_BUFFER_ALIGN_SIZE)) {
-			skb_pull(skb,
-				 PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
-				 skb->data);
+			skb_reserve(skb,
+				    PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
+				    skb->data);
 		}
 
 		paddr = dma_map_single(ab->dev, skb->data,
@@ -687,15 +692,17 @@ int ath12k_dp_mon_status_bufs_replenish(struct ath12k_base *ab,
 	num_remain = req_entries;
 
 	while (num_remain > 0) {
-		skb = dev_alloc_skb(RX_MON_STATUS_BUF_SIZE);
+		skb = ath12k_dp_rx_alloc_skb(&rx_ring->frag_cache,
+					     RX_MON_STATUS_BUF_SIZE +
+					     RX_MON_STATUS_BUF_ALIGN);
 		if (!skb)
 			break;
 
 		if (!IS_ALIGNED((unsigned long)skb->data,
 				RX_MON_STATUS_BUF_ALIGN)) {
-			skb_pull(skb,
-				 PTR_ALIGN(skb->data, RX_MON_STATUS_BUF_ALIGN) -
-				 skb->data);
+			skb_reserve(skb,
+				    PTR_ALIGN(skb->data, RX_MON_STATUS_BUF_ALIGN) -
+				    skb->data);
 		}
 
 		paddr = dma_map_single(ab->dev, skb->data,
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index cfaf26ae2..a0ea0d51e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -5,9 +5,12 @@
  */
 
 #include <linux/fips.h>
+#include <linux/gfp.h>
 #include <linux/ieee80211.h>
 #include <linux/kernel.h>
+#include <linux/page_frag_cache.h>
 #include <linux/skbuff.h>
+#include <net/sock.h>
 #include "core.h"
 #include "debug.h"
 #include "hw.h"
@@ -68,6 +71,35 @@ static void ath12k_dp_rx_enqueue_free(struct ath12k_dp *dp,
 	spin_unlock_bh(&dp->rx_desc_lock);
 }
 
+struct sk_buff *ath12k_dp_rx_alloc_skb(struct page_frag_cache *cache,
+				       unsigned int len)
+{
+	gfp_t gfp_mask = GFP_ATOMIC | __GFP_NOWARN;
+	struct sk_buff *skb;
+	void *data;
+
+	len += NET_SKB_PAD;
+	len = SKB_HEAD_ALIGN(len);
+
+	if (sk_memalloc_socks())
+		gfp_mask |= __GFP_MEMALLOC;
+
+	/* Refill paths serialize the per-ring cache with the SRNG lock. */
+	data = page_frag_alloc(cache, len, gfp_mask);
+	if (!data)
+		return NULL;
+
+	skb = build_skb(data, len);
+	if (!skb) {
+		page_frag_free(data);
+		return NULL;
+	}
+
+	skb_reserve(skb, NET_SKB_PAD);
+
+	return skb;
+}
+
 /* Returns number of Rx buffers replenished */
 int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
 				struct dp_rxdma_ring *rx_ring,
@@ -114,16 +146,17 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
 	}
 
 	while (num_remain > 0) {
-		skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
-				    DP_RX_BUFFER_ALIGN_SIZE);
+		skb = ath12k_dp_rx_alloc_skb(&rx_ring->frag_cache,
+					     DP_RX_BUFFER_SIZE +
+					     DP_RX_BUFFER_ALIGN_SIZE);
 		if (!skb)
 			break;
 
 		if (!IS_ALIGNED((unsigned long)skb->data,
 				DP_RX_BUFFER_ALIGN_SIZE)) {
-			skb_pull(skb,
-				 PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
-				 skb->data);
+			skb_reserve(skb,
+				    PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
+				    skb->data);
 		}
 
 		paddr = dma_map_single(dp->dev, skb->data,
@@ -193,6 +226,8 @@ static int ath12k_dp_rxdma_mon_buf_ring_free(struct ath12k_base *ab,
 	idr_destroy(&rx_ring->bufs_idr);
 	spin_unlock_bh(&rx_ring->idr_lock);
 
+	page_frag_cache_drain(&rx_ring->frag_cache);
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 827004745..99b989b69 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -232,6 +232,8 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
 				struct dp_rxdma_ring *rx_ring,
 				struct list_head *used_list,
 				int req_entries);
+struct sk_buff *ath12k_dp_rx_alloc_skb(struct page_frag_cache *cache,
+				       unsigned int len);
 int ath12k_dp_rx_pdev_mon_attach(struct ath12k *ar);
 int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id);
 
-- 
2.43.0



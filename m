Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138E4CA5FFF
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 21:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbFKDiOR41JSs82+WBXfytOmE7iZvhjEFmB4K0h8AvM=; b=K4tGmMOth+gG93l4CfP3ibMbwt
	u6RKiqnCJuKGVpQIaOXFk1AU+RbyK/lblTreZrgjfm5sB6YDFD6N1ehvJ5b3ocgaMivR4JH0xOZ8s
	Y8psyrU7R8QaBqyhW+n9ZdsrzwqbsaVYiMyJr1SR0RuDQ3IompziqpcAPcjqrm1qJn1SvLuSgrdJV
	NNu8WBzfYpISdhaVgjoQhw9qMlQA/Lyw+yiZN9JrRM17BLTBaU0gHfN9MWSaHhDeW+KnWV84rsKQf
	GET3cMcl4UgOy4yrVoF+FyKlvJsxeDatGO0cbPId0L65+YU/Fzy3GROCzJNvydwW03lRIehoi0ZmH
	YVLcB5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZMI-00000003CpN-2NnI;
	Wed, 07 Oct 2026 21:39:30 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZMG-00000003Cng-10zD
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 21:39:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3a777d4f321so20422751fa.0
        for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 14:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791409166; x=1792013966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbFKDiOR41JSs82+WBXfytOmE7iZvhjEFmB4K0h8AvM=;
        b=LqHCLkjzJxyP5m1UBznsepTiauVtihRoMB/gjoic6dNJwD5hF2P/2aa9WY3wIualM5
         GMeCoZe92O04EICi/rN/f8aAL4xBtvqb/JJotDilKrj+/1wO6/G4Q4ZaFKBnoaqHfDw9
         hyEJUI7yEcNe8QDXXLFrKOOpgmnaL1JsU3z4HSyFNrQoAgEAMwNi62mIiI4WKJYwW3Og
         uqv8U/Ayt1r8IpKUuzEvSkj0pBXUei9Y0/gEyD+ARdi3LgUKr2TBSFTnEUPdrz7kNeFO
         d2N0FGaj1KehtMDTjgRQwkvlt44rIdLBrbj7Sdo/T4Lf5jvjI8N4WeAUFFcJN85ScY61
         CuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409166; x=1792013966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbFKDiOR41JSs82+WBXfytOmE7iZvhjEFmB4K0h8AvM=;
        b=b8fAyIR0mpt2NvpDshUCIm1q0Pial6QRCGgbswrF38hXoeTJNW0w0FhIre+RiXqqKS
         PUVCUMqppL1tml6hTX44DsbEMQjGkatpYm8eyWWgcAzE8756MXU3EBmvHPXQMJIUtZri
         JHlx1ai6xNuLoKD6n2EDOqyn3GEP+uaiGCiNV9YA35bP/bKLihYMakZSiq3mkEHLCAkq
         oFOL7Oa+5EyjQtyFhtEkcR95T1TgLLllc5w+I4gydIf4NFdxEHd3L29LOx7N2g2qr6im
         J0KV1JW9aX9dcyl/DDW+SSbRX2bfD4ZODQlvGGJglex3h7EQJ3m2dtN2mr5RcuH+NVMc
         wIZw==
X-Gm-Message-State: AFq9FYLJcdpcLmm8d8rwfirqhkQ0G0BpW56iNRjg16qGW67wXI2vBNS6
	ZYJQ+/VLIP45mjPAgnJIo6HAr6IHN741wh11paMvfMlYvY5hlNtW/uwJotYKcV3REWqmL3ejrJQ
	=
X-Gm-Gg: AYBFou3jtQ2LWW0pcVrZOkcN8a8nMm6wE+pICSzWQVReGmHeAncjt1U/HaL2YlQikBC
	IbMMWVzh4IFZ7Xb4mrL2pWXiBnNmGBTX9kiLWrRx9rH8eifJ6C4jGJMb3gMHxERZ2FXCtAHJL8w
	ii59D0FkimDWD1b9pb+GKjV5+OEi1UK2kCBSJrrvGs0eSaJNT38aFE4gs0FVjcYKKC1hxe/KBr4
	wAWUiweVf23BMi3eSBCkCHoycJ4g9wazI5xtpNnz+4kQX8Waj4kBpZHiqHoLCDSDP0gkvIdUATU
	YxBIhl9yP51vu5Zr/j/nUEAHczKPqLymi6s+4yCIjRuhzG38LyHgGyKvvrvEojmLgGXhOfx6i70
	tvrk4Pp/7IKRZ01WcxpwntWimAUySaWgFFrLYF33Ww9AcO6YjElDa6kPF71lo2Wdt+S+2wPZPTQ
	OlKHb55k9HvWYZpBIQ5fpKUPNF0/P1Ccf3POEwz0non8938IRbVget7TzphlOxrX6Xk/Qt2q99e
	QE=
X-Received: by 2002:a2e:bc2a:0:b0:3a3:74b7:fc03 with SMTP id 38308e7fff4ca-3a9ac61053cmr3436821fa.15.1791409165827;
        Wed, 07 Oct 2026 14:39:25 -0700 (PDT)
Received: from Quarx2k-PC.lan ([92.124.138.168])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm1241411fa.30.2026.10.07.14.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:39:24 -0700 (PDT)
From: Nikolai Semendiaev <agent00791@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	wabsie@gmail.com
Subject: [PATCH v2 2/2] wifi: ath12k: use private page-frag caches for RXDMA rings
Date: Thu,  8 Oct 2026 03:38:29 +0600
Message-ID: <bd52182ca4916b55632a710be2f5c9cfd25f07a2.1791408913.git.agent00791@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791408913.git.agent00791@gmail.com>
References: <cover.1791408913.git.agent00791@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_143928_372350_56319135 
X-CRM114-Status: GOOD (  16.09  )
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
 drivers/net/wireless/ath/ath12k/dp.c     |  4 +++
 drivers/net/wireless/ath/ath12k/dp.h     |  3 ++
 drivers/net/wireless/ath/ath12k/dp_mon.c | 29 +++++++++------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 45 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/dp_rx.h  |  2 ++
 6 files changed, 70 insertions(+), 16 deletions(-)

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
index 83f9edfab..2f45ade5a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -4,6 +4,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/bug.h>
+#include <linux/page_frag_cache.h>
 #include "core.h"
 #include "dp_tx.h"
 #include "hif.h"
@@ -1020,6 +1022,8 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 
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



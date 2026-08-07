Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2991CC5AC80
	for <ath12k@archiver.kernel.org>; Fri,  7 Aug 2026 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h624A5/94jmYmyb4rOQloSQukomiSZ4fEGLPOaw4W+M=; b=pRwlrPDaGlbZ2LRCNmMD66QKnn
	TXESarxrzjXnrkI7EbgyupuSZs6rQ4Bo08fIhhjE9xD2aNpdoy5w2oXee/tG1VZj4ANVZ3dY4fl2Y
	HpG35omKm3NEwqM7MATC9GwuQqkasI3Kr1RaiMrwH9k1KNHS5e8yK7AvEnkSE8ccDTMb1XU3iqgmu
	XM08JXk8vnRGBth7gG2PVOKCSnIV75Ih1HivBkGHdvOMZxNNaULqOSJbZYZWJkwOsgbPLJn+75sT4
	Gvu9jAbs79mlnzomcQAShHSbxKl9cmpSZyCceHrvh1CzyqN6tl0RqusPKtxpRd3pjHi0lJgmhwjBH
	3gyoLD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIIL-00000007mgF-3YRD;
	Fri, 07 Aug 2026 10:59:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIIJ-00000007md0-0plF
	for ath12k@lists.infradead.org;
	Fri, 07 Aug 2026 10:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786100358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h624A5/94jmYmyb4rOQloSQukomiSZ4fEGLPOaw4W+M=;
	b=TvvqNRV5spkQet5Ts54o6+wOh++8p2bnloCy3aHDxyMIUppr89J0qlukkMLAeGWWXQwwgd
	Jyu7Q15J6yCTyBHnMmmRv4Y0JlZ6lvWk7Jyz4cNQdzPDiwGVpkYRtvVw70drlayNUhkDqQ
	yjMvAU9yom7czxwtdY+AnhWNVbYv5Fs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-oegGF-T5ORWjMuiHhfDeNw-1; Fri,
 07 Aug 2026 06:59:13 -0400
X-MC-Unique: oegGF-T5ORWjMuiHhfDeNw-1
X-Mimecast-MFC-AGG-ID: oegGF-T5ORWjMuiHhfDeNw_1786100352
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1578A19560AA;
	Fri,  7 Aug 2026 10:59:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0749F1800347;
	Fri,  7 Aug 2026 10:59:09 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v5 3/4] wifi: ath11k: implement custom wake_tx_queue with flow control
Date: Fri,  7 Aug 2026 12:58:42 +0200
Message-ID: <20260807105843.20203-4-jtornosm@redhat.com>
In-Reply-To: <20260807105843.20203-1-jtornosm@redhat.com>
References: <20260807105843.20203-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: SSIK7-U3b-kDuK6joJQfDwXkWYX4Bm9ESv6i49BX6SY_1786100352
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_035919_308104_319B2316 
X-CRM114-Status: GOOD (  16.20  )
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

Under heavy traffic, ath11k experiences frequent -ENOMEM errors
("failed to transmit frame -12") when the hardware TCL ring fills up.
This issue is more commonly observed in VMs with PCIe passthrough but
also occurs on bare metal systems. It is particularly problematic on
devices with a single shared TCL ring where all traffic classes
compete for the same 512 descriptor slots.

Implement a custom wake_tx_queue operation that:

1. Checks hardware ring space before dequeuing packets from mac80211
2. Uses per-ring locking (wake_tx_lock with spin_lock_bh) to serialize
   concurrent wake_tx_queue calls targeting the same ring and to ensure
   bottom halves are disabled as required by ieee80211_tx_dequeue()
3. Syncs with hardware state to get accurate free slot count
4. Resolves the target TCL ring using get_ring_selector(txq->ac),
   which selects the ring based on the access category
5. Returns early during firmware crash in the same way as other
   tx paths

This approach follows the pattern used in the iwlwifi driver, adapted
for ath11k's hardware ring architecture.

This eliminates -ENOMEM errors and improves throughput by optimizing
resource usage and preventing unnecessary packet drops.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v5: no modification
v4: https://lore.kernel.org/all/20260724053121.15759-4-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath11k/dp.c  |  1 +
 drivers/net/wireless/ath/ath11k/dp.h  |  2 ++
 drivers/net/wireless/ath/ath11k/mac.c | 52 ++++++++++++++++++++++++++-
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index f389b97acbdd..2e5978ec2b05 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1087,6 +1087,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		idr_init(&dp->tx_ring[i].txbuf_idr);
 		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
+		spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
 		dp->tx_ring[i].tcl_data_ring_id = i;
 
 		dp->tx_ring[i].tx_status_head = 0;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6..6d99501aa269 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -87,6 +87,8 @@ struct dp_tx_ring {
 	struct idr txbuf_idr;
 	/* Protects txbuf_idr and num_pending */
 	spinlock_t tx_idr_lock;
+	/* Serializes wake_tx_queue operations for this ring */
+	spinlock_t wake_tx_lock;
 	struct hal_wbm_release_ring *tx_status;
 	int tx_status_head;
 	int tx_status_tail;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2d55cdc4d165..9813f7923c34 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10065,9 +10065,59 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
+static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
+					struct ieee80211_txq *txq)
+{
+	struct ieee80211_tx_control control = {
+		.sta = txq->sta,
+	};
+	struct ath11k *ar = hw->priv;
+	struct dp_tx_ring *tx_ring;
+	struct hal_srng *tcl_ring;
+	struct sk_buff *skb;
+	u32 ring_selector;
+	int num_free;
+	u8 ring_id;
+
+	if (!ar)
+		return;
+
+	ring_selector = ar->ab->hw_params.hw_ops->get_ring_selector(txq->ac);
+	ring_id = ring_selector % ar->ab->hw_params.hal_params->num_tx_rings;
+	tx_ring = &ar->ab->dp.tx_ring[ring_id];
+	tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
+
+	while (1) {
+		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
+				      &ar->ab->dev_flags)))
+			break;
+
+		spin_lock_bh(&tx_ring->wake_tx_lock);
+
+		spin_lock(&tcl_ring->lock);
+		num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
+		spin_unlock(&tcl_ring->lock);
+
+		if (num_free == 0) {
+			spin_unlock_bh(&tx_ring->wake_tx_lock);
+			break;
+		}
+
+		skb = ieee80211_tx_dequeue(hw, txq);
+		if (!skb) {
+			spin_unlock_bh(&tx_ring->wake_tx_lock);
+			break;
+		}
+
+		ath11k_mac_op_tx(hw, &control, skb);
+
+		spin_unlock_bh(&tx_ring->wake_tx_lock);
+	}
+}
+
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
-	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
 	.start                          = ath11k_mac_op_start,
 	.stop                           = ath11k_mac_op_stop,
 	.reconfig_complete              = ath11k_mac_op_reconfig_complete,
-- 
2.54.0



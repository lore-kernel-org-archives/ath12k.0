Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8BCC982C1
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BvwKJBaZPPO+BAHRJAuAJtP1LgIydgRzkhLQXlvDas=; b=ix37HNp6X99pLx8U2nF0wU8DX4
	hxCVPK0f9c7IomsNt3TgMj0UlIL41PwSKwhia7nMY1X9IIJilyPcvWhMTVBJiQMH6J5iAIQcdWlEs
	9OitKNwwfp5jWgqPHJ3SUOQ3oQ44jDB6duXge+2j0BbOQsj+i0ZiDXxr06oKom6uo2gcivAOYrZbY
	poRL7H2lnHxImZKBQ2bSxVn2bVexVjqKdYuR5lMRA9l3rotOJIO4WgHORbsH3zqficboi+0DVbZ9M
	7e4dKumLZ5Y3tcXBUt2eSpju84kaFqXSqyM+fS5VKai50bZY1Bg//gIpiI7AyPTRgoXvbFaSHRl4/
	e/PTdBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75vP-0000000AhLC-3pHo;
	Thu, 17 Sep 2026 06:48:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75vN-0000000AhII-0K2D
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 06:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789627728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BvwKJBaZPPO+BAHRJAuAJtP1LgIydgRzkhLQXlvDas=;
	b=OXszY5reKHMMs4Zh07aGe+2lw+ktQxlm3MYILHPkCh4xks8wOu9aZV3v+Z9RbT7U5Pv8Wa
	uT+lYdICZoIAWwwjgkS2bl/BjcnDYomKJ1A4wx+7Cjg6Iq1pakzbD/Z9gzBanfyyR9wscV
	ZMiAEVzYpi65EiyntNBI2Pc7w0PVqN0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-6o80voZUPnqTsx571nw4Cg-1; Thu,
 17 Sep 2026 02:48:45 -0400
X-MC-Unique: 6o80voZUPnqTsx571nw4Cg-1
X-Mimecast-MFC-AGG-ID: 6o80voZUPnqTsx571nw4Cg_1789627723
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA3451954237;
	Thu, 17 Sep 2026 06:48:43 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1BA2C3003EED;
	Thu, 17 Sep 2026 06:48:41 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v7 2/4] wifi: ath11k/ath12k: remove skb parameter from get_ring_selector
Date: Thu, 17 Sep 2026 08:48:23 +0200
Message-ID: <20260917064825.12747-3-jtornosm@redhat.com>
In-Reply-To: <20260917064825.12747-1-jtornosm@redhat.com>
References: <20260917064825.12747-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: THAkWicXIlu3KfqEWoIXzIDM_N2ceq81fS-8idMq3MI_1789627723
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_234849_206898_0B541600 
X-CRM114-Status: GOOD (  16.00  )
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

Change the get_ring_selector hw_ops callback signature from
get_ring_selector(struct sk_buff *skb) to get_ring_selector(u8 ac),
removing the dependency on the skb.

After the previous patch switched WCN6750 from skb_get_hash() to
skb_get_queue_mapping(), all get_ring_selector implementations fall
into two categories:
 - smp_processor_id(): ignores the skb entirely
 - skb_get_queue_mapping(): only reads the AC value from the skb

Since the AC is the only information extracted from the skb, pass it
directly as a u8 parameter instead. Callers in the dp_tx path now
pass skb_get_queue_mapping(skb), which preserves the exact same
behavior.

This change enables a subsequent patch to call get_ring_selector()
from wake_tx_queue using txq->ac, without needing access to the skb.
mac80211 guarantees that skb_get_queue_mapping(skb) == txq->ac
for any skb dequeued from a given txq, since both values are
derived from the same skb->priority through the same AC mapping.

No functional change.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v7: no modification
v6: https://lore.kernel.org/all/20260811172435.616200-3-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath11k/dp_tx.c       |  2 +-
 drivers/net/wireless/ath/ath11k/hw.c          | 16 ++++------------
 drivers/net/wireless/ath/ath11k/hw.h          |  2 +-
 drivers/net/wireless/ath/ath12k/hw.h          |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  6 +++---
 6 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806..083aca8ff355 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -108,7 +108,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	pool_id = skb_get_queue_mapping(skb) & (ATH11K_HW_MAX_QUEUES - 1);
 
-	ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb);
+	ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb_get_queue_mapping(skb));
 
 tcl_ring_sel:
 	tcl_ring_retry = false;
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index d679e39dce03..8a28c1d4c17b 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -876,22 +876,14 @@ static bool ath11k_hw_wcn6855_rx_desc_get_ldpc_support(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.wcn6855.msdu_start.info2));
 }
 
-static u32 ath11k_hw_ipq8074_get_tcl_ring_selector(struct sk_buff *skb)
-{
-	/* Let the default ring selection be based on current processor
-	 * number, where one of the 3 tcl rings are selected based on
-	 * the smp_processor_id(). In case that ring
-	 * is full/busy, we resort to other available rings.
-	 * If all rings are full, we drop the packet.
-	 *
-	 * TODO: Add throttling logic when all rings are full
-	 */
+static u32 ath11k_hw_ipq8074_get_tcl_ring_selector(u8 ac)
+{
 	return smp_processor_id();
 }
 
-static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(struct sk_buff *skb)
+static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(u8 ac)
 {
-	return skb_get_queue_mapping(skb);
+	return ac;
 }
 
 const struct ath11k_hw_ops ipq8074_ops = {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..b6bc8b72d812 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -273,7 +273,7 @@ struct ath11k_hw_ops {
 	u16 (*mpdu_info_get_peerid)(struct hal_rx_mpdu_info *mpdu_info);
 	bool (*rx_desc_mac_addr2_valid)(struct hal_rx_desc *desc);
 	u8* (*rx_desc_mpdu_start_addr2)(struct hal_rx_desc *desc);
-	u32 (*get_ring_selector)(struct sk_buff *skb);
+	u32 (*get_ring_selector)(u8 ac);
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 86fb8b719613..65caa7a2349f 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -243,7 +243,7 @@ struct ath12k_hw_ops {
 	int (*mac_id_to_pdev_id)(const struct ath12k_hw_params *hw, int mac_id);
 	int (*mac_id_to_srng_id)(const struct ath12k_hw_params *hw, int mac_id);
 	int (*rxdma_ring_sel_config)(struct ath12k_base *ab);
-	u8 (*get_ring_selector)(struct sk_buff *skb);
+	u8 (*get_ring_selector)(u8 ac);
 	bool (*dp_srng_is_tx_comp_ring)(int ring_num);
 	bool (*is_frame_link_agnostic)(struct ath12k_link_vif *arvif,
 				       struct ieee80211_mgmt *mgmt);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index d2749de44553..74359e8eea47 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -111,7 +111,7 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
 	 * If all rings are full, we drop the packet.
 	 * TODO: Add throttling logic when all rings are full
 	 */
-	ring_selector = dp->hw_params->hw_ops->get_ring_selector(skb);
+	ring_selector = dp->hw_params->hw_ops->get_ring_selector(skb_get_queue_mapping(skb));
 
 tcl_ring_sel:
 	tcl_ring_retry = false;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index d9fdd2fc8298..7436cf70925a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -49,7 +49,7 @@ ath12k_wifi7_hw_mac_id_to_srng_id_qcn9274(const struct ath12k_hw_params *hw,
 	return 0;
 }
 
-static u8 ath12k_wifi7_hw_get_ring_selector_qcn9274(struct sk_buff *skb)
+static u8 ath12k_wifi7_hw_get_ring_selector_qcn9274(u8 ac)
 {
 	return smp_processor_id();
 }
@@ -83,9 +83,9 @@ ath12k_wifi7_hw_mac_id_to_srng_id_wcn7850(const struct ath12k_hw_params *hw,
 	return mac_id;
 }
 
-static u8 ath12k_wifi7_hw_get_ring_selector_wcn7850(struct sk_buff *skb)
+static u8 ath12k_wifi7_hw_get_ring_selector_wcn7850(u8 ac)
 {
-	return skb_get_queue_mapping(skb);
+	return ac;
 }
 
 static bool ath12k_wifi7_dp_srng_is_comp_ring_wcn7850(int ring_num)
-- 
2.54.0



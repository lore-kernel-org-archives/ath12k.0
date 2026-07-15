Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143E1C44508
	for <ath12k@archiver.kernel.org>; Wed, 15 Jul 2026 12:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtfzWGFBtflnyedcTL2bNv4P5mVxZBab52qWUKk3QRA=; b=mbTKJ5SklOsbsNS2Wbi/3pa7SI
	wuOXLgjfjdFy8ec9Qx3euyScf8DrJDhBKmjSqtUXuDqYyzTCmO2x3TjfdtPk31C25op/0HFmDFDHp
	Ym1XuEcRHc3ZzH/FCKsXHZAtPI75SUHYL9MobfdV28rr6dXOe+qfGG/AUiylJAecMVn5kAXkbkmAO
	BgDHmLGoIWM1uOwCMG0aFhM8uKp03lQr2SgONIkl4lA/UGhAhKl7p+HYvtouE9nDiQkLKNKtjzmvK
	nB+DEjRKKo+IVxTNwYPTFs628gAqp01FlC70MH7qWGH/jj9hixoZJzFKbliSXBQkILzT0QqCI5Lmu
	mkFq/QxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz5x-0000000ErFu-37si;
	Wed, 15 Jul 2026 12:52:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz5n-0000000ErD6-0SBU
	for ath12k@lists.infradead.org;
	Wed, 15 Jul 2026 12:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784119922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KtfzWGFBtflnyedcTL2bNv4P5mVxZBab52qWUKk3QRA=;
	b=UzeQyTKn8sDBVYMv2avO6p7a9C7dauZuU8BrYhYQi4FOAbkPzQhEGHShmc93AwZ+GLIkO/
	ba40VjU8DvoGcrX7F+amnjgF7bQBa52XN/ZKHX954k8wPgZ9fwQUPuTMG+yheWiA+19uHm
	cFspz3t0q6265xn4pWzRh8+ccSoKFjo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-WcQPVKSEOLCfklTIe-z3vw-1; Wed,
 15 Jul 2026 08:50:31 -0400
X-MC-Unique: WcQPVKSEOLCfklTIe-z3vw-1
X-Mimecast-MFC-AGG-ID: WcQPVKSEOLCfklTIe-z3vw_1784119830
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCF0E180064D;
	Wed, 15 Jul 2026 12:50:29 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2DBD218004D4;
	Wed, 15 Jul 2026 12:50:26 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v2 1/3] mac80211: add ieee80211_tx_peek API
Date: Wed, 15 Jul 2026 14:50:14 +0200
Message-ID: <20260715125017.277242-2-jtornosm@redhat.com>
In-Reply-To: <20260715125017.277242-1-jtornosm@redhat.com>
References: <20260715125017.277242-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: e-F9qIZEV0OieDo0WLntI7kTTvZR-c6y5hZJFSHnU7g_1784119830
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055203_227884_8D83F501 
X-CRM114-Status: GOOD (  14.81  )
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

Add ieee80211_tx_peek() to allow drivers to inspect the next frame
in a TXQ without removing it.

Drivers implementing custom wake_tx_queue operations may need to
determine which hardware TX ring to use before dequeuing a packet,
using properties like the skb hash or queue mapping that are only
available from the skb itself.

The function checks pending fragments first, then iterates through
all fair-queue flows (new_flows and old_flows) to find the first
queued frame, matching the iteration behavior of fq_tin_dequeue.
It also pre-caches the skb hash via skb_get_hash() so that
hash-based ring selectors see a stable value through the subsequent
dequeue and TX path.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
New in v2

 include/net/mac80211.h | 20 ++++++++++++++++++++
 net/mac80211/tx.c      | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 4f95da023746..9289b8dca972 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -7742,6 +7742,26 @@ void ieee80211_unreserve_tid(struct ieee80211_sta *sta, u8 tid);
 struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
 				     struct ieee80211_txq *txq);
 
+/**
+ * ieee80211_tx_peek - peek at the next packet in a software tx queue
+ *
+ * @hw: pointer as obtained from ieee80211_alloc_hw()
+ * @txq: pointer obtained from station or virtual interface, or from
+ *	ieee80211_next_txq()
+ *
+ * Return: the next skb without dequeuing it, or %NULL if the queue is empty.
+ * The returned pointer is const — the caller must not modify or free the skb.
+ * The skb remains queued and will be returned by a subsequent
+ * ieee80211_tx_dequeue() call.
+ *
+ * This is useful for drivers that need to inspect the next frame (e.g. to
+ * determine the target TX ring) before deciding whether to dequeue.
+ *
+ * Must be called in the same context as ieee80211_tx_dequeue().
+ */
+const struct sk_buff *ieee80211_tx_peek(struct ieee80211_hw *hw,
+					struct ieee80211_txq *txq);
+
 /**
  * ieee80211_tx_dequeue_ni - dequeue a packet from a software tx queue
  * (in process context)
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index c13b209fad47..91bfd8ef9428 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -3857,6 +3857,45 @@ static bool ieee80211_xmit_fast(struct ieee80211_sub_if_data *sdata,
 	return true;
 }
 
+const struct sk_buff *ieee80211_tx_peek(struct ieee80211_hw *hw,
+					struct ieee80211_txq *txq)
+{
+	struct txq_info *txqi = container_of(txq, struct txq_info, txq);
+	struct ieee80211_local *local = hw_to_local(hw);
+	struct fq_tin *tin = &txqi->tin;
+	struct fq *fq = &local->fq;
+	struct sk_buff *skb = NULL;
+	struct fq_flow *flow;
+
+	WARN_ON_ONCE(softirq_count() == 0);
+
+	spin_lock_bh(&fq->lock);
+
+	skb = skb_peek(&txqi->frags);
+	if (skb)
+		goto out;
+
+	list_for_each_entry(flow, &tin->new_flows, flowchain) {
+		skb = skb_peek(&flow->queue);
+		if (skb)
+			goto out;
+	}
+
+	list_for_each_entry(flow, &tin->old_flows, flowchain) {
+		skb = skb_peek(&flow->queue);
+		if (skb)
+			goto out;
+	}
+
+out:
+	if (skb)
+		skb_get_hash(skb);
+
+	spin_unlock_bh(&fq->lock);
+	return skb;
+}
+EXPORT_SYMBOL_GPL(ieee80211_tx_peek);
+
 struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
 				     struct ieee80211_txq *txq)
 {
-- 
2.54.0



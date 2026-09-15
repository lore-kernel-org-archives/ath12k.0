Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1883AC88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oycz5u0f3lz1AvS7cGHa543haJ+L6aX2mdafdbJn/A4=; b=o8ka4Qhjbfn2yg1fvkCBE+/hjB
	wJ2YsVcMWw6z41YbnrC9MX3GSc+MeArXuK3MCPM603pL47LM6dKJ+2Ckq2BQh+IriQI7Wb0AUwNsr
	PaRhKdPj1lLXJLKNBdPxSLP2hfdpQri3iYB9Wdb19IJ13zhlISSw7a+TOTMUsId8w/DSlXw7IudzH
	Lo8YEvyV/HDoHVPAn2Hx/B6zevYMCcjwuQCG+fuo6eikKaUYUhFsUV06DbHRUlHADgTwwTQkrE6ZK
	jjsq2FEJzcKAK4a8aoHTRHa2p0zn2vFYYVDVhlrT0T2x9LSDKbnbI2UgZLGnnhvn64WCBXs1MeEsq
	vlILWTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LxF-00000005GSJ-3EEZ;
	Tue, 15 Sep 2026 05:43:41 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LxD-00000005GOz-0lT8;
	Tue, 15 Sep 2026 05:43:40 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkWCS1qznz49Q32;
	Tue, 15 Sep 2026 08:43:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789451012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oycz5u0f3lz1AvS7cGHa543haJ+L6aX2mdafdbJn/A4=;
	b=V+7MW2kmntrh+EwEjzM95lAazznluGZ2f9AsFI2q2Xju3zHOdo0icpxSqDc+i00WiDeOHT
	czWM1CDrp6A+31l80ajryW7B3A46YlClUU7jPAe3sSuJcLQ6OGt7RGOWaxvTR7W9cu7oJG
	RpGKt/vtVj5KK8EuRjTYs5KcL6lN1WuTtV3IlwYM6hXcmktf+DcKpy4fqaZ4MdS+Zdcj3R
	a3YdyCenEUHCepAVxnubpYNcxdpHaryEZ+cLUGHaLoKJ4q5Iwpqn+BxijHQ1vTL394p/36
	4+CY3WGVz0UkQPOO6XN8MmzwcVflO6/BjH351d5wgPfpG+RD3QUHaYEEHoiqEg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789451012;
	b=wdGVXNTHyAJUzKyV0bzerU/RIJZz/NZiIgUjUEDggCcyDeN45dF1iTrccXgBRsapHpZ9F9
	BGXIHk3uOz0Vqsj+YFHJEgt5xeRAqRPZaHy9jRnN4f6A+G84tCFO8dYxVK+1DELvTeUvcE
	vwuH/TZ8RRUPckP77e9ceIXJpNfWvq4Lxgg/VXAXvEDWcT3/0tRRbZE8buC7Wcn97NvDOx
	sOMyf0ym2it9dba7Xpkmust3Xabs7ps4z2zzR/KfuOtsDTiylsfR3f1h9ebnnguJ3DjU72
	0XO/cjH1BGLZaOr6O0VHjbG7E+m9cLwESXp2IWx+xFoNFUxkstLcjcejZKJfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789451012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oycz5u0f3lz1AvS7cGHa543haJ+L6aX2mdafdbJn/A4=;
	b=qiYSnK5kHvRPvRq9cTrMgBuFSHITBXk134xPwU2F+GSzJD8kuzgvErUvvKrrjFQEB1Clcd
	YU45wga6lR+c0nYR42YJcW2CqilhR1LQrOAw0FicWS4S1qEma4F+tuLZbcuO4ke5m96eAt
	oy2NDdYAqGcUZm40KUMiYDMNGQbcSIcmFQ0okHCzlFBu8/WwhslrPBDD3lMcMO15h8uWPV
	mrWWuCIo7o1bCneJ1HcP+mZle0ax9/61rf3DG9B0qCDj3rbyHqJVlnkUxM5QrmFIm1Gl9M
	y5s4FYEjMUSeWYAbr7NkzqdG719fB/Cv4q6JOGzQQaAAzdB+0DY19iTUO8d8ag==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
From: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
To: Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Mihai Moldovan <ionic@ionic.de>,
	Denis Kenzior <denkenz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>,
	linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH v7 03/15] net: qrtr: fit node ID + port number combination into unsigned long
Date: Tue, 15 Sep 2026 08:41:55 +0300
Message-Id: <20260915054207.2513877-4-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224339_390595_A8D999AB 
X-CRM114-Status: GOOD (  24.45  )
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

From: Mihai Moldovan <ionic@ionic.de>

The flow control implementation uses a radix tree to store node ID and
port number combinations and the key length is hardcoded to unsigned
long.

The original implementation shifted the node ID up by 32 bits and added
the port number to the lower 32 bits of the unsigned long value to
create a key.

Unfortunately, since both node IDs and port numbers are defined as u32,
this will overflow on platforms where sizeof(unsigned long) < 8 (which
are most 32 bit platforms) and essentially just drop the node ID part.

To fix this, build the key in a generic way, using half of the unsigned
long space for the node ID and the other half for the port number.

This will be transparent to platforms where sizeof(unsigned long) >= 8
and fix overflow issues otherwise.

The caveat, of course, is that, for platforms where
sizeof(unsigned long) < 8, the supported amount of node IDs and port
numbers will be severely limited - to half of sizeof(unsigned long),
which typically will be 16 bits. Needless to say, we have to check if
both values fit into this limit.

This limitation is probably not going to be an issue in real-world
scenarios, but if it turns out to be one after all, we could switch from
a radix tree implementation to an XArray implementation.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/af_qrtr.c | 74 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 10 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 38b6def7c5272..f2edbd2e9dea9 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -117,6 +117,26 @@ static u32 next_endpoint_id;
 /* local port allocation management */
 static DEFINE_XARRAY_ALLOC(qrtr_ports);
 
+/* The xarray API uses fixed unsigned long keys and we will have to make
+ * do with that.
+ * These keys are often a combination of node IDs (currently u32) and
+ * port numbers (also currently u32).
+ * Using the high 32 bits for the node ID and the low 32 bits for the
+ * port number will work fine to create keys on platforms where unsigned long
+ * is 64 bits wide, but obviously is not be possible on platforms where
+ * unsigned long is smaller.
+ * Virtually split up unsigned long in half and assign the upper bits to
+ * node IDs and the lower bits to the port number, however big that may be.
+ */
+#define QRTR_XARRAY_INDEX_BITS  (8 /* CHAR_BIT */ * sizeof(unsigned long))
+#define QRTR_INDEX_HALF_BITS (QRTR_XARRAY_INDEX_BITS >> 1)
+
+#define QRTR_INDEX_HALF_UNSIGNED_MAX ((~(unsigned long)(0)) >> QRTR_INDEX_HALF_BITS)
+#define QRTR_INDEX_HALF_UNSIGNED_MIN ((unsigned long)(0))
+
+#define QRTR_INDEX_HALF_SIGNED_MAX ((long)(QRTR_INDEX_HALF_UNSIGNED_MAX) >> 1)
+#define QRTR_INDEX_HALF_SIGNED_MIN ((long)(-1) - QRTR_INDEX_HALF_SIGNED_MAX)
+
 /**
  * struct qrtr_node - endpoint node
  * @ep_lock: lock for endpoint management and callbacks
@@ -221,16 +241,23 @@ static void qrtr_node_release(struct qrtr_node *node)
  * qrtr_tx_resume() - reset flow control counter
  * @node:	qrtr_node that the QRTR_TYPE_RESUME_TX packet arrived on
  * @skb:	resume_tx packet
+ *
+ * Return: 0 on success; negative error code on failure
  */
-static void qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
+static int qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
 {
 	struct qrtr_ctrl_pkt *pkt = (struct qrtr_ctrl_pkt *)skb->data;
 	u64 remote_node = le32_to_cpu(pkt->client.node);
 	u32 remote_port = le32_to_cpu(pkt->client.port);
 	struct qrtr_tx_flow *flow;
-	unsigned long key;
+	unsigned long key = 0;
 
-	key = remote_node << 32 | remote_port;
+	if (remote_node > QRTR_INDEX_HALF_UNSIGNED_MAX ||
+	    remote_port > QRTR_INDEX_HALF_UNSIGNED_MAX)
+		return -EINVAL;
+
+	key = ((unsigned long)(remote_node) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(remote_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
 
 	flow = xa_load(&node->qrtr_tx_flow, key);
 	if (flow) {
@@ -241,6 +268,8 @@ static void qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
 	}
 
 	consume_skb(skb);
+
+	return 0;
 }
 
 /**
@@ -261,11 +290,20 @@ static void qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
 static int qrtr_tx_wait(struct qrtr_node *node, int dest_node, int dest_port,
 			int type)
 {
-	unsigned long key = (u64)dest_node << 32 | dest_port;
+	unsigned long key = 0;
 	struct qrtr_tx_flow *flow;
 	int confirm_rx = 0;
 	int ret;
 
+	if (dest_node < QRTR_INDEX_HALF_SIGNED_MIN ||
+	    dest_node > QRTR_INDEX_HALF_SIGNED_MAX ||
+	    dest_port < QRTR_INDEX_HALF_SIGNED_MIN ||
+	    dest_port > QRTR_INDEX_HALF_SIGNED_MAX)
+		return -EINVAL;
+
+	key = ((unsigned long)(dest_node) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(dest_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
+
 	/* Never set confirm_rx on non-data packets */
 	if (type != QRTR_TYPE_DATA)
 		return 0;
@@ -322,19 +360,32 @@ static int qrtr_tx_wait(struct qrtr_node *node, int dest_node, int dest_port,
  * message associated with the dropped confirm_rx message.
  * Work around this by marking the flow as having a failed transmission and
  * cause the next transmission attempt to be sent with the confirm_rx.
+ *
+ * Return: 0 on success; negative error code on failure
  */
-static void qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
-				int dest_port)
+static int qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
+			       int dest_port)
 {
-	unsigned long key = (u64)dest_node << 32 | dest_port;
+	unsigned long key = 0;
 	struct qrtr_tx_flow *flow;
 
+	if (dest_node < QRTR_INDEX_HALF_SIGNED_MIN ||
+	    dest_node > QRTR_INDEX_HALF_SIGNED_MAX ||
+	    dest_port < QRTR_INDEX_HALF_SIGNED_MIN ||
+	    dest_port > QRTR_INDEX_HALF_SIGNED_MAX)
+		return -EINVAL;
+
+	key = ((unsigned long)(dest_node) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(dest_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
+
 	flow = xa_load(&node->qrtr_tx_flow, key);
 	if (flow) {
 		spin_lock_irq(&flow->resume_tx.lock);
 		flow->tx_failed = 1;
 		spin_unlock_irq(&flow->resume_tx.lock);
 	}
+
+	return 0;
 }
 
 /* Pass an outgoing packet socket buffer to the endpoint driver. */
@@ -382,7 +433,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	/* Need to ensure that a subsequent message carries the otherwise lost
 	 * confirm_rx flag if we dropped this one */
 	if (rc && confirm_rx)
-		qrtr_tx_flow_failed(node, to->sq_node, to->sq_port);
+		rc = qrtr_tx_flow_failed(node, to->sq_node, to->sq_port);
 
 	return rc;
 }
@@ -444,6 +495,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	size_t size;
 	unsigned int ver;
 	size_t hdrlen;
+	int ret = -EINVAL;
 
 	if (len == 0 || len & 3)
 		return -EINVAL;
@@ -526,7 +578,9 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	}
 
 	if (cb->type == QRTR_TYPE_RESUME_TX) {
-		qrtr_tx_resume(node, skb);
+		ret = qrtr_tx_resume(node, skb);
+		if (ret)
+			goto err;
 	} else {
 		ipc = qrtr_port_lookup(cb->dst_port);
 		if (!ipc)
@@ -544,7 +598,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 
 err:
 	kfree_skb(skb);
-	return -EINVAL;
+	return ret;
 
 }
 EXPORT_SYMBOL_GPL(qrtr_endpoint_post);
-- 
2.34.1



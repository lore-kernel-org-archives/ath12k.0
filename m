Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56019C88E7D
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQQNkGqsz0DxTiGoA57xy08XjvAtpAjYEEPkpcv0BrA=; b=KRSeFeAC3fIkG9CCdlZ/nuIUcw
	vDbTk7J3mTC8ja/t4aDZAkGeCa4fqxW7XoFKyxBmBhbrgkg6mHCOG63VaLcrbLdjn5YW5jYldRmeQ
	Ell9PbBDN4qY+GsNx2ZhOeAUy9elo/vSiQmpeCRWC7WsNTMYhg2wlVUHtBPaDz7hwE7k+EkY/K1LW
	W4F5jmgTkKBDOeo+iOoDJnWioDwNR/i5Re9AkSoQRkm4zkBEOHMSBkNFL2YXcl8gfq4NXWPjC3/up
	qEKa1KgEu9KLn/m237KNN0oTDa7VIeDpUlnX5a1aIkpi7SiUoGIAQepH9a2EAcTP7RNCO+11mX9oX
	+PH0nVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LyJ-00000005Gto-01qT;
	Tue, 15 Sep 2026 05:44:47 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LyF-00000005Grr-0B3O;
	Tue, 15 Sep 2026 05:44:45 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hkWDh1q0JzySb;
	Tue, 15 Sep 2026 08:44:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1789451076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eQQNkGqsz0DxTiGoA57xy08XjvAtpAjYEEPkpcv0BrA=;
	b=R8gSoob4pGF7nLjvNYw4Udy8mn3rAs0+w/EvzE5zK4fVn5Jhzcjs3rs4G+kfItBpX261s7
	RV+aAezK+CITzQRUy10Ft+71Bfccrzqg/9wAUH77WFBwX/PqEqbVbZnQUyPrDOxUP2R+bV
	79HasSxENmEo42+NlfeyszOhn53REd8=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1789451076;
	b=yKLNcBI+XHm97q7qhO1w1Oyr4hQTi7tdGEHAllbI10tfp1GqvpTpWiG1KtPcsoc/lcfq+J
	fJjaNmRFWeL8TjBRc0LuazJiLjGykG3gNWhHmCW80PKBb/xL5gtgFB/r53CVYTnk664vte
	sywcsD8xlmbuSYgXp4T3mVR+wWb7Qe8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1789451076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eQQNkGqsz0DxTiGoA57xy08XjvAtpAjYEEPkpcv0BrA=;
	b=AbOFhUfIqAZvG6+0LxGUV0akK8VbyQK1rH110JkKT1QSrQcJK5A4FkNmgDPRWb/bwOekcD
	Csw2DaZ40g/FXqYPbNHnn1LqgRnfxHIksZc5uy87HBTacejfUUw24pTHfWcNg9Y5oXeBWX
	6vwjyS3XOvK4mDFzcFQrQGTF8xsCeWM=
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
Subject: [PATCH v7 05/15] net: qrtr: support identical node ids
Date: Tue, 15 Sep 2026 08:41:57 +0300
Message-Id: <20260915054207.2513877-6-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224443_310695_2DC7DB57 
X-CRM114-Status: GOOD (  18.71  )
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

From: Denis Kenzior <denkenz@gmail.com>

Add support for tracking multiple endpoints that may have conflicting
node identifiers. This is achieved by using both the node and endpoint
identifiers as the key inside the radix_tree data structure.

For backward compatibility with existing clients, the previous key
schema (node identifier only) is preserved. However, this schema will
only support the first endpoint/node combination.  This is acceptable
for legacy clients as support for multiple endpoints with conflicting
node identifiers was not previously possible.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/af_qrtr.c | 57 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index b2cb05f2480e0..43e48b89b5cb6 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -119,14 +119,15 @@ static DEFINE_XARRAY_ALLOC(qrtr_ports);
 
 /* The xarray API uses fixed unsigned long keys and we will have to make
  * do with that.
- * These keys are often a combination of node IDs (currently u32) and
- * port numbers (also currently u32).
- * Using the high 32 bits for the node ID and the low 32 bits for the
- * port number will work fine to create keys on platforms where unsigned long
- * is 64 bits wide, but obviously is not be possible on platforms where
- * unsigned long is smaller.
+ * These keys are often a combination of node IDs and port numbers or
+ * endpoint IDs and node IDs (all currently u32).
+ * Using the high 32 bits for the node/endpoint ID and the low 32 bits for the
+ * port number/node ID will work fine to create keys on platforms where
+ * unsigned long is 64 bits wide, but obviously is not be possible on
+ * platforms where unsigned long is smaller.
  * Virtually split up unsigned long in half and assign the upper bits to
- * node IDs and the lower bits to the port number, however big that may be.
+ * node/endpoint IDs and the lower bits to the port number/node ID, however
+ * big that may be.
  */
 #define QRTR_XARRAY_INDEX_BITS  (8 /* CHAR_BIT */ * sizeof(unsigned long))
 #define QRTR_INDEX_HALF_BITS (QRTR_XARRAY_INDEX_BITS >> 1)
@@ -457,19 +458,36 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
  *
  * This is mostly useful for automatic node id assignment, based on
  * the source id in the incoming packet.
+ *
+ * Return: 0 on success; negative error code on failure
  */
-static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
+static int qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
 {
 	unsigned long flags;
+	unsigned long key;
 
 	if (nid == QRTR_EP_NID_AUTO)
-		return;
+		return 0;
+
+	if (node->ep->id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
+	    nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
+		return -EINVAL;
 
 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
-	radix_tree_insert(&qrtr_nodes, nid, node);
+
+	/* Always insert with the endpoint_id + node_id */
+	key = ((unsigned long)(node->ep->id) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(nid) & QRTR_INDEX_HALF_UNSIGNED_MAX);
+	radix_tree_insert(&qrtr_nodes, key, node);
+
+	if (!radix_tree_lookup(&qrtr_nodes, nid))
+		radix_tree_insert(&qrtr_nodes, nid, node);
+
 	if (node->nid == QRTR_EP_NID_AUTO)
 		node->nid = nid;
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
+
+	return 0;
 }
 
 /**
@@ -563,14 +581,18 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 
 	skb_put_data(skb, data + hdrlen, size);
 
-	qrtr_node_assign(node, cb->src_node);
+	ret = qrtr_node_assign(node, cb->src_node);
+	if (ret)
+		goto err;
 
 	if (cb->type == QRTR_TYPE_NEW_SERVER) {
 		/* Remote node endpoint can bridge other distant nodes */
 		const struct qrtr_ctrl_pkt *pkt;
 
 		pkt = data + hdrlen;
-		qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
+		ret = qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
+		if (ret)
+			goto err;
 	}
 
 	if (cb->type == QRTR_TYPE_RESUME_TX) {
@@ -579,10 +601,13 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 			goto err;
 	} else {
 		ipc = qrtr_port_lookup(cb->dst_port);
-		if (!ipc)
+		if (!ipc) {
+			ret = -EINVAL;
 			goto err;
+		}
 
-		if (sock_queue_rcv_skb(&ipc->sk, skb)) {
+		ret = sock_queue_rcv_skb(&ipc->sk, skb);
+		if (ret) {
 			qrtr_port_put(ipc);
 			goto err;
 		}
@@ -662,7 +687,9 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	xa_init(&node->qrtr_tx_flow);
 	mutex_init(&node->qrtr_tx_lock);
 
-	qrtr_node_assign(node, nid);
+	rc = qrtr_node_assign(node, nid);
+	if (rc < 0)
+		goto free_node;
 
 	mutex_lock(&qrtr_node_lock);
 	list_add(&node->item, &qrtr_all_nodes);
-- 
2.34.1



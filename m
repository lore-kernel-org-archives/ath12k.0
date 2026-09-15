Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E56C88E7D
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWGOLefIcCK3uanL/TxDzRS8ZuMg1qk19zGuow0Q++k=; b=WXZ2Z4zA0l/5HjYntoR5HdRWAh
	gBbMkv80vu2vnvJ6pOBkjJoOUTdQJxHyawDp/HktGK+RktfdzRNLLcPwUxRcdVH1eRK4E/8Hd2cMs
	e3w8MzOPOLt6WX04Jd1pw8py41AMVDtPvWsshJGu+6lDJCq3KE3xp3rCVDvCAFTL0lFP7/67tC4RF
	L/5YpG9y6S65lGHNgd0TIq+6STTJrokFLgM5cX01RnhlkbVOpExlDNA5IMfxIDKGL2ZM/a7HEQbU+
	aOJqHEp/qTxvs5hT6A3N2uVNl6tJtKRmG6iOhEOxb0cBBz0axN0Vs6R9U2Dm8G7Iw1G5A7ctqPONe
	1KZv7oow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lyt-00000005HE5-219t;
	Tue, 15 Sep 2026 05:45:23 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lyp-00000005HAn-2dtH;
	Tue, 15 Sep 2026 05:45:22 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hkWFP2tHhzyQw;
	Tue, 15 Sep 2026 08:45:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1789451113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWGOLefIcCK3uanL/TxDzRS8ZuMg1qk19zGuow0Q++k=;
	b=qPmWK/pe1sMTxA1ekKFeoPpguqIQrcUZi0BQPLf2HL2+25Eul1z0d44eBQ1FWgawSaDYiP
	v0Q7TLJksanRJwzPB8L3D+fcliLwke81WhCqI8kJ8stk23YBQ89lz7V1xksRbhznlSaVI6
	XniqeqMZ/KfjkzdGERz6blDy7c8l7tQ=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1789451113;
	b=my6pJt7M5RhMc/NTnvSd7VFe0t8mxgU0Q70G4o0iqFqtKqMDDEUS52di99126syoc+dnfb
	oPDKFNwAJecB1QJNrk1nzXHVFJ+YcSmmD6+z22B/3XB5LJutof1Cj/ioJfE3nBiu0k4Xsn
	PeZGh8g8wQ95I2wld4bfc1U4ix1641w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1789451113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWGOLefIcCK3uanL/TxDzRS8ZuMg1qk19zGuow0Q++k=;
	b=e1kHr/q9ql9rQ2kvdjdEhcXJ715w5YvSSs5mutNpE9hkdBx9E2PdxLJwOe13Nilb1D/aoo
	X1g6AO0GDPArcSoxLGCRgFzMHdcWZd3H4S+ibvOsqBccd48pzdnLYqolI2TVsDafQvyj2g
	9/CGTfSiPGtzsnMrBa/z2JDs0D33LzQ=
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
Subject: [PATCH v7 07/15] net: qrtr: Report endpoint for locally generated messages
Date: Tue, 15 Sep 2026 08:41:59 +0300
Message-Id: <20260915054207.2513877-8-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224519_840329_885DF980 
X-CRM114-Status: GOOD (  12.41  )
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

For messages generated by the local endpoint destined
to the local endpoint, report the local endpoint identifier.  Same
QRTR_ENDPOINT auxiliary data and QRTR_REPORT_ENDPOINT socket option
semantics apply as for messages generated by remote endpoints.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/af_qrtr.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 897ecc8dc304d..da7ccf19c6851 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -184,9 +184,11 @@ struct qrtr_tx_flow {
 #define QRTR_TX_FLOW_LOW	5
 
 static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			      u32 endpoint_id,
 			      int type, struct sockaddr_qrtr *from,
 			      struct sockaddr_qrtr *to);
 static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			      u32 endpoint_id,
 			      int type, struct sockaddr_qrtr *from,
 			      struct sockaddr_qrtr *to);
 static struct qrtr_sock *qrtr_port_lookup(int port);
@@ -393,6 +395,7 @@ static int qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
 
 /* Pass an outgoing packet socket buffer to the endpoint driver. */
 static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			     u32 endpoint_id,
 			     int type, struct sockaddr_qrtr *from,
 			     struct sockaddr_qrtr *to)
 {
@@ -744,7 +747,8 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep)
 		skb = qrtr_alloc_ctrl_packet(&pkt, GFP_ATOMIC);
 		if (skb) {
 			pkt->cmd = cpu_to_le32(QRTR_TYPE_BYE);
-			qrtr_local_enqueue(NULL, skb, QRTR_TYPE_BYE, &src, &dst);
+			qrtr_local_enqueue(NULL, skb, endpoint_id,
+					   QRTR_TYPE_BYE, &src, &dst);
 		}
 	}
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
@@ -809,8 +813,8 @@ static void qrtr_port_remove(struct qrtr_sock *ipc)
 		pkt->client.port = cpu_to_le32(ipc->us.sq_port);
 
 		skb_set_owner_w(skb, &ipc->sk);
-		qrtr_bcast_enqueue(NULL, skb, QRTR_TYPE_DEL_CLIENT, &ipc->us,
-				   &to);
+		qrtr_bcast_enqueue(NULL, skb, qrtr_local_nid,
+				   QRTR_TYPE_DEL_CLIENT, &ipc->us, &to);
 	}
 
 	if (port == QRTR_PORT_CTRL)
@@ -950,6 +954,7 @@ static int qrtr_bind(struct socket *sock, struct sockaddr_unsized *saddr, int le
 
 /* Queue packet to local peer socket. */
 static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			      u32 endpoint_id,
 			      int type, struct sockaddr_qrtr *from,
 			      struct sockaddr_qrtr *to)
 {
@@ -967,6 +972,7 @@ static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	cb = (struct qrtr_cb *)skb->cb;
 	cb->src_node = from->sq_node;
 	cb->src_port = from->sq_port;
+	cb->endpoint_id = endpoint_id;
 
 	if (sock_queue_rcv_skb(&ipc->sk, skb)) {
 		qrtr_port_put(ipc);
@@ -981,6 +987,7 @@ static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 
 /* Queue packet for broadcast. */
 static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
+			      u32 endpoint_id,
 			      int type, struct sockaddr_qrtr *from,
 			      struct sockaddr_qrtr *to)
 {
@@ -992,11 +999,11 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 		if (!skbn)
 			break;
 		skb_set_owner_w(skbn, skb->sk);
-		qrtr_node_enqueue(node, skbn, type, from, to);
+		qrtr_node_enqueue(node, skbn, endpoint_id, type, from, to);
 	}
 	mutex_unlock(&qrtr_node_lock);
 
-	qrtr_local_enqueue(NULL, skb, type, from, to);
+	qrtr_local_enqueue(NULL, skb, endpoint_id, type, from, to);
 
 	return 0;
 }
@@ -1004,12 +1011,15 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 {
 	DECLARE_SOCKADDR(struct sockaddr_qrtr *, addr, msg->msg_name);
-	int (*enqueue_fn)(struct qrtr_node *, struct sk_buff *, int,
-			  struct sockaddr_qrtr *, struct sockaddr_qrtr *);
+	int (*enqueue_fn)(struct qrtr_node *node, struct sk_buff *skb,
+			  u32 endpoint_id, int type,
+			  struct sockaddr_qrtr *from,
+			  struct sockaddr_qrtr *to);
 	__le32 qrtr_type = cpu_to_le32(QRTR_TYPE_DATA);
 	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
 	struct sock *sk = sock->sk;
 	struct qrtr_node *node;
+	u32 endpoint_id = qrtr_local_nid;
 	struct sk_buff *skb;
 	size_t plen;
 	u32 type;
@@ -1093,7 +1103,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	}
 
 	type = le32_to_cpu(qrtr_type);
-	rc = enqueue_fn(node, skb, type, &ipc->us, addr);
+	rc = enqueue_fn(node, skb, endpoint_id, type, &ipc->us, addr);
 	if (rc >= 0)
 		rc = len;
 
@@ -1127,7 +1137,8 @@ static int qrtr_send_resume_tx(struct qrtr_cb *cb)
 	pkt->client.node = cpu_to_le32(cb->dst_node);
 	pkt->client.port = cpu_to_le32(cb->dst_port);
 
-	ret = qrtr_node_enqueue(node, skb, QRTR_TYPE_RESUME_TX, &local, &remote);
+	ret = qrtr_node_enqueue(node, skb, cb->endpoint_id,
+				QRTR_TYPE_RESUME_TX, &local, &remote);
 
 	qrtr_node_release(node);
 
-- 
2.34.1



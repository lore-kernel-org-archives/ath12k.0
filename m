Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9FAC88E53
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAv/+3HXe4Wk5FPqWwSHvR9+eMlqhJUTF/4hhmmGEYo=; b=CLHldgchKWwV6JXEw6KMe3JhX7
	ebxHN3zzXKbhnojC0i2vOK9FcD9V3/0rM/peWDlqr9tWapzjCNwh5GowTBlGAFPxgByjpgzphot+e
	Xe4pvcHkjOnEzQV4jz3xMgDhX58oGRsCtgl4tEyB9obsSKBZ31el4RaQdlpuKhZVCZMuo0ktb2gMU
	j2slhZU7FkfsD0WSuuvkqegf5jH9RHhDEt+zkppw9NhteYt5ARMTwGNsMGfBJrC5co9ztehfzFezb
	s3GiKZ+fbkL9M0eaQXp7jEHl3/t9sVHKADN6CWdOTQ5socDxyaUUHc5obAnoohtazGPSu8MQDOaLP
	6ktTOskg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LzV-00000005HWr-3RUL;
	Tue, 15 Sep 2026 05:46:01 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LzT-00000005HVB-0zrC;
	Tue, 15 Sep 2026 05:46:00 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkWG90c8wz49Q32;
	Tue, 15 Sep 2026 08:45:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789451153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAv/+3HXe4Wk5FPqWwSHvR9+eMlqhJUTF/4hhmmGEYo=;
	b=TENYGJ3upWSpSuJzOKgE6XvJ06GwccwSS/cLNQ5UTwFVCUtrtThSq8YsR9yXQFIfwZZ43I
	bPUYzoYWDIkpeszdu770rNY0W8Vzg71iPKCN8L00NgHxILhOfHx9Sn4Fjju9af3ArK0Mf+
	J9Z8O+G0xszCD5bIhWC5Inxbi/YdFC4fcPtnraDoT9bKkhmssNWrJNa5xnPJe7CaK3csnE
	2ynWsQIuF1sJs5FcYr0Mc9vQ3uTBSbQOZXP9OemNsVTvLq9sbIQzVurT9H0KRpVFlP9utw
	Z4L5c6UCniG4E8ciRfr1jZN+XL1N8dfRw1hF9kaacR3XZ08fl/2tXsyLSofhkQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789451153;
	b=pbtYuHiIu19kuwcFgoM9HfmEpFEw8FuZ5iqGwXZ15ELFRraKuQb3e8ZdbBJuHveKbGaloA
	sokP7GUItL/hTRTN5YmK4Q1a0PnMpA8WUP2EVtp/zp9mswHOnv6InnnPhnMs4gG+7clTMA
	gGx2+3Ou6BJklyl9LwfbfyWZKBytQkPT52cLj4NByjM8VLHrJ8kX+CWKfgRrDoaeLaCEGc
	lu23LvnCMnRKU9D+hM+oo5YKdjTymhmMeIWjgIK6upwTKKmtx99GEI0et/FX2a/NLLMuuF
	cqiqGz3Xy8ul1vA0ld8o39UQRm3Na0Lzkh15fgzU+aZB4yNjDrQMvykHlgA30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789451153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAv/+3HXe4Wk5FPqWwSHvR9+eMlqhJUTF/4hhmmGEYo=;
	b=O5mksl54sbHk91U0BVUvqA1xxzTfz9+BSeovfQ6iIC2SzeC5oArMGeKcSle436+3cl8doO
	x7TFq14wUEdYagF8w3a2RT3rPYRslL/hcCtrhyCvIL5dYsCjN/EhPIrkZPBPWsPzy2AjVv
	z5p1dFJP79IcyVsMRWOEIRIpMBMh2SSLgjt3OWyVNmi9AeB8ThsK0Dhvfq+GmOdT4DZhJu
	BNWZaNBkwgcpUztx3neKvoHyVU/vDUEHOmpSJvBf7liALLcLYX7BKh16mTSGKX5VkEb8tb
	jXpzaMxMOuJ/HOqre2qRl1sFyxx4Nojnm4KNF7mIMpNluce+arLVsh84erJ1oQ==
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
Subject: [PATCH v7 08/15] net: qrtr: Allow sendmsg to target an endpoint
Date: Tue, 15 Sep 2026 08:42:00 +0300
Message-Id: <20260915054207.2513877-9-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224559_440979_6DD0D407 
X-CRM114-Status: GOOD (  17.97  )
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

Allow QIPCRTR family sockets to include QRTR_ENDPOINT auxiliary data
as part of the sendmsg system call.  By including this parameter, the
client can ask the kernel to route the message to a given endpoint, in
situations where multiple endpoints with conflicting node identifier
sets exist in the system.

For legacy clients, or clients that do not include QRTR_ENDPOINT data,
the endpoint is looked up, as before, by only using the node identifier
of the destination qrtr socket address.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/af_qrtr.c | 89 ++++++++++++++++++++++++++++++++++------------
 net/qrtr/qrtr.h    |  2 ++
 2 files changed, 68 insertions(+), 23 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index da7ccf19c6851..d4a472f0ac4d1 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -106,6 +106,36 @@ static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
 	return container_of(sk, struct qrtr_sock, sk);
 }
 
+int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id)
+{
+	struct cmsghdr *cmsg;
+	u32 endpoint_id = 0;
+
+	for_each_cmsghdr(cmsg, msg) {
+		if (!CMSG_OK(msg, cmsg))
+			return -EINVAL;
+
+		if (cmsg->cmsg_level != SOL_QRTR)
+			continue;
+
+		if (cmsg->cmsg_type != QRTR_ENDPOINT)
+			return -EINVAL;
+
+		if (cmsg->cmsg_len < CMSG_LEN(sizeof(u32)))
+			return -EINVAL;
+
+		/* Endpoint ids start at 1 */
+		endpoint_id = *(u32 *)CMSG_DATA(cmsg);
+		if (!endpoint_id)
+			return -EINVAL;
+	}
+
+	if (out_endpoint_id)
+		*out_endpoint_id = endpoint_id;
+
+	return 0;
+}
+
 static unsigned int qrtr_local_nid = 1;
 
 /* for node ids */
@@ -448,14 +478,23 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
  *
  * callers must release with qrtr_node_release()
  */
-static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
+static struct qrtr_node *qrtr_node_lookup(unsigned int endpoint_id,
+					  unsigned int nid)
 {
-	struct qrtr_node *node;
+	struct qrtr_node *node = NULL;
 	unsigned long flags;
+	unsigned long key = 0;
+
+	if (endpoint_id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
+	    nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
+		return node;
+
+	key = ((unsigned long)(endpoint_id) << QRTR_INDEX_HALF_BITS) |
+	      ((unsigned long)(nid) & QRTR_INDEX_HALF_UNSIGNED_MAX);
 
 	mutex_lock(&qrtr_node_lock);
 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
-	node = radix_tree_lookup(&qrtr_nodes, nid);
+	node = radix_tree_lookup(&qrtr_nodes, key);
 	node = qrtr_node_acquire(node);
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
 	mutex_unlock(&qrtr_node_lock);
@@ -1019,6 +1058,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
 	struct sock *sk = sock->sk;
 	struct qrtr_node *node;
+	u32 msg_endpoint_id;
 	u32 endpoint_id = qrtr_local_nid;
 	struct sk_buff *skb;
 	size_t plen;
@@ -1031,46 +1071,48 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	if (len > 65535)
 		return -EMSGSIZE;
 
+	rc = qrtr_msg_get_endpoint(msg, &msg_endpoint_id);
+	if (rc < 0)
+		return rc;
+
 	lock_sock(sk);
 
 	if (addr) {
-		if (msg->msg_namelen < sizeof(*addr)) {
-			release_sock(sk);
-			return -EINVAL;
-		}
+		rc = -EINVAL;
 
-		if (addr->sq_family != AF_QIPCRTR) {
-			release_sock(sk);
-			return -EINVAL;
-		}
+		if (msg->msg_namelen < sizeof(*addr))
+			goto release_sock;
+
+		if (addr->sq_family != AF_QIPCRTR)
+			goto release_sock;
 
 		rc = qrtr_autobind(sock);
-		if (rc) {
-			release_sock(sk);
-			return rc;
-		}
+		if (rc)
+			goto release_sock;
 	} else if (sk->sk_state == TCP_ESTABLISHED) {
 		addr = &ipc->peer;
 	} else {
-		release_sock(sk);
-		return -ENOTCONN;
+		rc = -ENOTCONN;
+		goto release_sock;
 	}
 
 	node = NULL;
 	if (addr->sq_node == QRTR_NODE_BCAST) {
 		if (addr->sq_port != QRTR_PORT_CTRL &&
 		    qrtr_local_nid != QRTR_NODE_BCAST) {
-			release_sock(sk);
-			return -ENOTCONN;
+			rc = -ENOTCONN;
+			goto release_sock;
 		}
 		enqueue_fn = qrtr_bcast_enqueue;
 	} else if (addr->sq_node == ipc->us.sq_node) {
 		enqueue_fn = qrtr_local_enqueue;
 	} else {
-		node = qrtr_node_lookup(addr->sq_node);
+		endpoint_id = msg_endpoint_id;
+
+		node = qrtr_node_lookup(endpoint_id, addr->sq_node);
 		if (!node) {
-			release_sock(sk);
-			return -ECONNRESET;
+			rc = endpoint_id ? -ENXIO : -ECONNRESET;
+			goto release_sock;
 		}
 		enqueue_fn = qrtr_node_enqueue;
 	}
@@ -1109,6 +1151,7 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 
 out_node:
 	qrtr_node_release(node);
+release_sock:
 	release_sock(sk);
 
 	return rc;
@@ -1123,7 +1166,7 @@ static int qrtr_send_resume_tx(struct qrtr_cb *cb)
 	struct sk_buff *skb;
 	int ret;
 
-	node = qrtr_node_lookup(remote.sq_node);
+	node = qrtr_node_lookup(cb->endpoint_id, remote.sq_node);
 	if (!node)
 		return -EINVAL;
 
diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
index 11b897af05e67..22fcecbf8de23 100644
--- a/net/qrtr/qrtr.h
+++ b/net/qrtr/qrtr.h
@@ -34,4 +34,6 @@ int qrtr_ns_init(void);
 
 void qrtr_ns_remove(void);
 
+int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id);
+
 #endif
-- 
2.34.1



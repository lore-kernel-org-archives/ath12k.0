Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B96C88E7D
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1zGVynj9H5SONi5WNNQRZuKnULVYkGJU/Lsk8iTgW0=; b=fEu/bMsctROrowJdd18AbqLAVT
	BGab+jLLCGyntoe3tc6Whtby1djGQxcXcy8WcpCpb5X73Rs6H//+ypEfWCipqp+oQRiQPTUmvUpta
	TqVueSALxbLub/ycHXQwFRWRrAOVVORuDvk9IgmdlRgnXKSlEf3E3jr2Ae4wGPHzgUCtqFZf5HWwR
	CdROPPqcZ4BPkXA4snBdOOFCWtR8nzUfSbTkOYgO3J4BymmlriKSXVsQmxNTZ9JhNHeEuRmKxa6uh
	N8+lpa+GMvbhbrvE8Y2w+ssFg04bIqB1K6mHFdSm70TUHATknwpGXgYd8YzmaTqN1ejoe3nszvqHN
	pXLxr3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lzn-00000005HgE-0l8e;
	Tue, 15 Sep 2026 05:46:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lzl-00000005Hf2-43Vv;
	Tue, 15 Sep 2026 05:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+1zGVynj9H5SONi5WNNQRZuKnULVYkGJU/Lsk8iTgW0=; b=ZLzShn+cGolYqVLD5XfE9ZccT5
	R6gFfdzXlQfPmtVHR372kUISw4UfT2dkvtI+3SYWUXkrHUML5g9Xn0G9FrOY1xCsWMND/LSC5GldH
	CbQ51Hi+LjIkIzmfcb+51SnuWDy/oYwam5SyCyjTu0Fy3DPCpCjug5XFoSdOhfJxqiRKq8l4u85Zj
	RaSdOMlG02Pkq4wfo6VOnhSxANcrvYWUD/OxPm8hzPKCYR4LIoAwuIHvZEbPyzzRj+Y0BQSTtZEfa
	K6QWi6Hu8rV43hvhZQUhAsV1919f6R19YSNPJWPY5Yzk/SY2D4U1+sKX9e4VzJToKxAGRKT33M3St
	fUPjHjVw==;
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lzi-0000000Egb6-44R2;
	Tue, 15 Sep 2026 05:46:16 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkWGT1NHWz49Q32;
	Tue, 15 Sep 2026 08:46:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789451169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1zGVynj9H5SONi5WNNQRZuKnULVYkGJU/Lsk8iTgW0=;
	b=LIhAK7gUndGZcf4Yu+z3n6SHullxJtH1x/VxeLjY2AIYXB+MtqUcJBSoT0BJlV0fr3AyX+
	YBW+nhgG7TL+aZwNOBmhkyNlDQ8WQIlHcebIDqR6DBbExvEmDQmY4SzfYD0xQ/bb3XH04m
	/iVPCVo9EBZBua+lNam+AREsp3wxa/Ghr8q8WVRIjdDPn2LnmchStyF3FhB5CYbZ7H2LcW
	oJUjNKupL44SWz/em8tYrJvvfkhwRD6bOXkZ/7t1CQdSANPQqA5ZCTyG0v/Hi6UktaWEuU
	rXis+bRlzj1OYpb6bAzvYE0+vb2MCWgTSYSb71ICekctjeJPLfAZFZdrbWfXbA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789451169;
	b=LHeP2tcneM0Dhi/1cZfiw9chfzytpozj9UnF7wS2cB2oAIvQExK8EYdCvyXSh7wftRcS4Y
	3Db06UtIhAVhB7tJ6CFkE9AEkLux4e4WAvfr8zHvCePy89xtOUqHkXcV2b/QRTcSF51FDl
	ctO7rBfyM82NlTUOUjtz9DMjK2IfvSAY/hnNPj8bnCgFWh6B/a78TobUF9M6oFZifiQymA
	Q51ocfJlpy+UEeAIAxmYTDp1Kt641+qOH1/M1wfAJ3oL690OOcIpMVHRLd/r68K+LEV0Om
	4wm4qWahTJ7o9ij/7yCBjG3sffpASdXwAx/kXzyy5xdze3kSMbo7cKMprH4J3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789451169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1zGVynj9H5SONi5WNNQRZuKnULVYkGJU/Lsk8iTgW0=;
	b=NWwWzXYbDbtaVPdCSzsVXqcOea/p41so3KB9GoikBkfacSm5GTrDX9iQFxPMkxAy5i1RwZ
	EVnrl1hpPs38vfZ+j5BXrL/Bd1wyl7whExVVkFq8v0I+F82kYPRhdNoFaEnwWFdBX6xTfE
	MAT/gtl5RCh1WiJFRcNfVmH1D4Q/zq+kLOfBH8hS03qKegp8KGn96uNYn11HgIjIjqVHNG
	MUNeC6H5jlvyKSfKAxOqTZOksHdUIcYS4s4CyQwonYOWfnhCt9FV7W9QzyZ5o0aa/NCfIP
	p5SrrJnphsjIbW7yTPuMKRfDtdMn3Zh7kWfDSIdJqqBy4+DNM7jejOEag5B1qg==
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
Subject: [PATCH v7 09/15] net: qrtr: allow socket endpoint binding
Date: Tue, 15 Sep 2026 08:42:01 +0300
Message-Id: <20260915054207.2513877-10-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_064615_097559_13635439 
X-CRM114-Status: GOOD (  19.79  )
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

Introduce the ability to bind a QIPCRTR family socket to a specific
endpoint.  When a socket is bound, only messages from the bound
endpoint can be received, and any messages sent from the socket are
by default directed to the bound endpoint.  Clients can bind a socket
by using the setsockopt system call with the QRTR_BIND_ENDPOINT option
set to the desired endpoint binding.

A previously set binding can be reset by setting QRTR_BIND_ENDPOINT
option to zero.  This behavior matches that of SO_BINDTOIFINDEX.

This functionality is useful for clients that need to communicate
with a specific device (i.e. endpoint), such as a PCIe-based 5G modem,
and are not interested in messages from other endpoints / nodes.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 include/uapi/linux/qrtr.h |  1 +
 net/qrtr/af_qrtr.c        | 56 ++++++++++++++++++++++++++++-----------
 2 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/include/uapi/linux/qrtr.h b/include/uapi/linux/qrtr.h
index 6d0911984a050..0a8667b049c3d 100644
--- a/include/uapi/linux/qrtr.h
+++ b/include/uapi/linux/qrtr.h
@@ -48,6 +48,7 @@ struct qrtr_ctrl_pkt {
 
 /* setsockopt / getsockopt */
 #define QRTR_REPORT_ENDPOINT 1
+#define QRTR_BIND_ENDPOINT 2
 
 /* CMSG */
 #define QRTR_ENDPOINT 1
diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index d4a472f0ac4d1..ccfa3ed33a996 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -98,6 +98,7 @@ struct qrtr_sock {
 	struct sockaddr_qrtr us;
 	struct sockaddr_qrtr peer;
 	unsigned long flags;
+	u32 bound_endpoint;
 };
 
 static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
@@ -656,10 +657,14 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 			goto err;
 		}
 
-		ret = sock_queue_rcv_skb(&ipc->sk, skb);
-		if (ret) {
-			qrtr_port_put(ipc);
-			goto err;
+		/* Sockets bound to an endpoint only rx from that endpoint */
+		if (!ipc->bound_endpoint ||
+		    ipc->bound_endpoint == cb->endpoint_id) {
+			ret = sock_queue_rcv_skb(&ipc->sk, skb);
+			if (ret) {
+				qrtr_port_put(ipc);
+				goto err;
+			}
 		}
 
 		qrtr_port_put(ipc);
@@ -999,29 +1004,41 @@ static int qrtr_local_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 {
 	struct qrtr_sock *ipc;
 	struct qrtr_cb *cb;
+	int ret = -ENODEV;
 
 	ipc = qrtr_port_lookup(to->sq_port);
-	if (!ipc || &ipc->sk == skb->sk) { /* do not send to self */
-		if (ipc)
-			qrtr_port_put(ipc);
-		kfree_skb(skb);
-		return -ENODEV;
-	}
+	if (!ipc)
+		goto done;
+
+	if (&ipc->sk == skb->sk) /* do not send to self */
+		goto done;
+
+	/*
+	 * Filter out unwanted packets that are not on behalf of the bound
+	 * endpoint.  Certain special packets (such as an empty NEW_SERVER
+	 * packet that serves as a sentinel value) always go through.
+	 */
+	if (endpoint_id && ipc->bound_endpoint &&
+	    ipc->bound_endpoint != endpoint_id)
+		goto done;
 
 	cb = (struct qrtr_cb *)skb->cb;
 	cb->src_node = from->sq_node;
 	cb->src_port = from->sq_port;
 	cb->endpoint_id = endpoint_id;
 
-	if (sock_queue_rcv_skb(&ipc->sk, skb)) {
-		qrtr_port_put(ipc);
-		kfree_skb(skb);
-		return -ENOSPC;
-	}
+	ret = -ENOSPC;
+	if (sock_queue_rcv_skb(&ipc->sk, skb))
+		goto done;
 
 	qrtr_port_put(ipc);
 
 	return 0;
+done:
+	if (ipc)
+		qrtr_port_put(ipc);
+	kfree_skb(skb);
+	return ret;
 }
 
 /* Queue packet for broadcast. */
@@ -1107,7 +1124,8 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	} else if (addr->sq_node == ipc->us.sq_node) {
 		enqueue_fn = qrtr_local_enqueue;
 	} else {
-		endpoint_id = msg_endpoint_id;
+		endpoint_id = msg_endpoint_id ?
+			      msg_endpoint_id : ipc->bound_endpoint;
 
 		node = qrtr_node_lookup(endpoint_id, addr->sq_node);
 		if (!node) {
@@ -1385,6 +1403,9 @@ static int qrtr_setsockopt(struct socket *sock, int level, int optname,
 	case QRTR_REPORT_ENDPOINT:
 		assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, val);
 		break;
+	case QRTR_BIND_ENDPOINT:
+		WRITE_ONCE(ipc->bound_endpoint, val);
+		break;
 	default:
 		rc = -ENOPROTOOPT;
 	}
@@ -1413,6 +1434,9 @@ static int qrtr_getsockopt(struct socket *sock, int level, int optname,
 	case QRTR_REPORT_ENDPOINT:
 		val = test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags);
 		break;
+	case QRTR_BIND_ENDPOINT:
+		val = READ_ONCE(ipc->bound_endpoint);
+		break;
 	default:
 		rc = -ENOPROTOOPT;
 	}
-- 
2.34.1



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6244AC88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6GkYk0HZBFKkX376VoqF+8xKuVMeoSo1m24bvpn9Wg=; b=OgHguh4qVCyiXsbLkwbqsc7YAO
	8XIFw6TneJzpzyJEGxTFS7Qi+MnW0BP0nXGFaPpVfGPanUE/smIBALgHBsxSFGVPckm99Jh/Nnz0Z
	iLjAl6aeBpZCNNoZQRZBipSp49l/N7YYQiigouLIpCHdhYiXSw6/WbtGjH4O4CyUYmVBnPIeP5T4w
	tEHtMZgX08IA6KqkTpfPALmur2AkaiSTFx0chkme6R8nTW2gL2Y6q+J1I2hr5srD6HonG4RLcxW+i
	J3Hcsijki9Bv7jSZJY/eEd6jH7+00mgSvOELZo4xqzeNoriXDI9V2dmZYOZLBRqsWclzH4kUY2D3B
	CiWKMEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ly3-00000005God-3RPY;
	Tue, 15 Sep 2026 05:44:31 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lxz-00000005Gnc-39lY;
	Tue, 15 Sep 2026 05:44:29 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hkWDK4krFzySb;
	Tue, 15 Sep 2026 08:44:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1789451059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6GkYk0HZBFKkX376VoqF+8xKuVMeoSo1m24bvpn9Wg=;
	b=ajsiIfNCO9hm2npmFbvhPirjGVcAczP0wbWRAS1dswu6oKlgl9rogZQ+Ryg9EiXtO86E5W
	mB1HiV8QXHvAx9q6ZzTfoMMJ5zBVgS6INmI1WcaK2DVoTwPJFImf56GD+5q0BS+KB+Ow3n
	S0nvyFBbDBDLOyUvdPtSDstiIy+OsgM=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1789451059;
	b=dLmSL19LgGognTGhdycfQ/y3+GiybIa6A1YSWFYVaH/fj/NK0tUUdYmZux4OozCZC36RXr
	rGAn1gxLgAmovx6SNRoxfk9h1U4KJ7MSH4+dNOl0nBjsww5iJ/MuURu7C/bdgg1qvTL8cW
	JxBSze+PknetOz8eMB0py0DeyAXt/IQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1789451059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6GkYk0HZBFKkX376VoqF+8xKuVMeoSo1m24bvpn9Wg=;
	b=v7iPlidOcOVDpHBsQTK+fn5WKR77Z+TyY81OXnhw13khm6VDXfe+1jsQdg5zadFV/QhY97
	l2HgqakrwzOtptFsm2YxdeyO5SMoTsLdyNjT5ZmQsUpBl2YqfslSLO4SloKJama67hYatA
	w53DSa4aBJhXH3pBrn+sMWjapHpjMTo=
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
Subject: [PATCH v7 04/15] net: qrtr: use only low 16 bits of node/port in 32-bit systems
Date: Tue, 15 Sep 2026 08:41:56 +0300
Message-Id: <20260915054207.2513877-5-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224427_974566_58C178A4 
X-CRM114-Status: GOOD (  12.52  )
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

The node id is generally a single fixed value hardcoded into device
firmware. If it happens to be larger than 16 bits on a 32-bit system,
using the value modulo 65536 is enough. It is not necessary to check it
for being in range. Evidence of this is a prior implementation that fit
node_id (u32) and port (u32) into unsigned long in 32-bit systems, in a
manner that completely discarded all bits of node_id. Do the same for
port: don't check for it being in range.

This arguably creates a bug where node_id could clash with a node_id
that has the same low-order 16 bits, or a port could clash with a port
that has the same low-order 16 bits. But it's probably better than
discarding all bits of node and using only bits from port. It's probably
also better than failing if either node or port is out-of-range.

Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/af_qrtr.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index f2edbd2e9dea9..b2cb05f2480e0 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -252,9 +252,9 @@ static int qrtr_tx_resume(struct qrtr_node *node, struct sk_buff *skb)
 	struct qrtr_tx_flow *flow;
 	unsigned long key = 0;
 
-	if (remote_node > QRTR_INDEX_HALF_UNSIGNED_MAX ||
-	    remote_port > QRTR_INDEX_HALF_UNSIGNED_MAX)
-		return -EINVAL;
+	/* Don't check node/port for the valid range, use only low
+	 * 16 bits on 32-bit architectures.
+	 */
 
 	key = ((unsigned long)(remote_node) << QRTR_INDEX_HALF_BITS) |
 	      ((unsigned long)(remote_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
@@ -295,11 +295,9 @@ static int qrtr_tx_wait(struct qrtr_node *node, int dest_node, int dest_port,
 	int confirm_rx = 0;
 	int ret;
 
-	if (dest_node < QRTR_INDEX_HALF_SIGNED_MIN ||
-	    dest_node > QRTR_INDEX_HALF_SIGNED_MAX ||
-	    dest_port < QRTR_INDEX_HALF_SIGNED_MIN ||
-	    dest_port > QRTR_INDEX_HALF_SIGNED_MAX)
-		return -EINVAL;
+	/* Don't check node/port for the valid range, use only low
+	 * 16 bits on 32-bit architectures.
+	 */
 
 	key = ((unsigned long)(dest_node) << QRTR_INDEX_HALF_BITS) |
 	      ((unsigned long)(dest_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
@@ -369,11 +367,9 @@ static int qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
 	unsigned long key = 0;
 	struct qrtr_tx_flow *flow;
 
-	if (dest_node < QRTR_INDEX_HALF_SIGNED_MIN ||
-	    dest_node > QRTR_INDEX_HALF_SIGNED_MAX ||
-	    dest_port < QRTR_INDEX_HALF_SIGNED_MIN ||
-	    dest_port > QRTR_INDEX_HALF_SIGNED_MAX)
-		return -EINVAL;
+	/* Don't check node/port for the valid range, use only low
+	 * 16 bits on 32-bit architectures.
+	 */
 
 	key = ((unsigned long)(dest_node) << QRTR_INDEX_HALF_BITS) |
 	      ((unsigned long)(dest_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
-- 
2.34.1



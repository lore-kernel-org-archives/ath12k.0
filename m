Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1870AC88E53
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DZArNhvvAzVfrl1dfODQGqES9F9P7LrpHsacGtJDNA=; b=IHUBvEmOttlSbx4LfAg8KITASn
	UC9hBCP4MU8zRIayceGZixDrZhWNmu7m28GkiPvOc0sY0doQoitZo4VinCHsquLpUi6q/J/BecE9L
	Gkze253Q+IL6E/Wx4Q+8Nl3clgj3D2NBCN43Tdnc28XTjSLe/PlHITlpjlKqctVDZKcQOSc088sXc
	3ViBoCx0HCnx9n8QCekL8Jzj9nDPMKYE+FnOy/0ff28bJozv2vaQJBXqpT9oo7a1ZYXC5meDnNfbC
	qtwdTfR1Dl8on3G5B+nkxW6jWRxkafNwkeNyOQ/i4wKz3jvn1u3BLJkh3kIbI5rJeE9FQY0MQd35i
	nc2tUzaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M1w-00000005IlC-36RZ;
	Tue, 15 Sep 2026 05:48:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M1v-00000005IkR-43iS;
	Tue, 15 Sep 2026 05:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9DZArNhvvAzVfrl1dfODQGqES9F9P7LrpHsacGtJDNA=; b=Dj2SPt2k68J8J8UgENu8mQUxCd
	hHJWqxWU0Lr0oYHaswucUHZx13wmbohccEzbWUtruBTDIzUJ9sMEBmiF0vI4F8MD1XS1aAytJr2Pw
	pThnZZ1jwGowykWuRvgMmIVlWTxZcqO4yUqmwLOZDVPO4Yy94J2epHHzHtEvpDntrAbXc85PwntKM
	NN0NVUVL3pYkUKvXbNegDuEqx3CSf37NeIlm5vLF9MuPt0Ib7A4w/b2AFaI6iGWIVdXSF+3vsv0hN
	rUqKgul0gu59C/M6JRKf6tseAJKxF1iD73IN228tqjnB0fXw2tZKXIQInXxK8VxbiB4caCdFQt0Y4
	uoOAZpVQ==;
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6M1q-00000006Im9-0TY9;
	Tue, 15 Sep 2026 05:48:29 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkWJx68B7z49Q32;
	Tue, 15 Sep 2026 08:48:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789451298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DZArNhvvAzVfrl1dfODQGqES9F9P7LrpHsacGtJDNA=;
	b=KytI+jpDm+VXWaQlWntDClP3mbKkyfu1BZqP5+8YViWP6GcQ+jEBiJYGWheGr7YSVU02uV
	2B+le+nK7RE1yv46v+ZVgAf6YZ3LVGt9qU1EG1In5hbh+6FPavx06oFfX5Y1TNFtsezMHy
	gLcFplWlo/zi8RL44aoBXePHjnflHp9Kw4PYifw78NpLwHC7JWV6583nU6JSMo4GSJsLzo
	Wq3EydeOW8l167pJDLweH8KG+EHfqZzH0o8WlDltqqjWtzpbbU/RdiUOTt4b1IgoEiazOG
	o2OZ0xAL3TQTvsKCF18t35NccQlma4OQYoAFpVI4GWozRX1DNVe0gEC9QCeX4Q==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789451298;
	b=llhd1Iwj/4wL6tuosk4gk5cMohP+ItEoAbTQ94C43a6NFJ46FeeXMVrMmkUIlfvT9cBWjr
	MUTlerohnrQj47ElH2yeoth8q7PZw9+EeLPJuQlH9o7Omxj/JKT2JtO7a2ZdL9JlI3EDkx
	zrFmsiUo3I6fMn8sfJOzL3LjfM0xLnEE7zjbSfySwqpEDx3iM8X1C7iv17nMO3IVdOBtnJ
	CsUtUz95/zVqdQVdZOrPO2nnUQRvRCWsJ/JQTiPle+jYtR2y1vrs6diAsG8JG/GO60REux
	YyKDeTFvssSm8kV8cne1eiuqmMNecnPRqi7Ed+WGQWKpAvcYen2caU+nhC3WDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789451298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DZArNhvvAzVfrl1dfODQGqES9F9P7LrpHsacGtJDNA=;
	b=a8WmTcRpsY9kpaR00zL9DxydUHYqNRde+lPVpjgQzZd7sFxDEpqhlrUvo8fpdM+xsL0KFb
	hh1I4daH4KXIfH8u4kb9TGXyHuPhyIdCKETV5csylmWECVuibwL/iC1MDP2i4+BpNxk0sR
	UwM+s60LGcV6d69Jmuk/gU3vpWUEHGCHpyztZCmfdilRfq0PGapizIcpQORagprJ2ndhlR
	lLTB1cAVZ72ALHt714L7zV2UVlbO6eRkdBUEpvRTQrGKWoEJt7Oz+yPuYRhxY+BoKXVMtm
	D9GznDgel530LlZmUKtfw157NTk3oykcRqHaWWe4AwGjA5h8OrVuhne0vpGgjA==
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
Subject: [PATCH v7 14/15] net: qrtr: use nid modulo 65536 in 32-bit lookups
Date: Tue, 15 Sep 2026 08:42:06 +0300
Message-Id: <20260915054207.2513877-15-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_064827_266298_5017939D 
X-CRM114-Status: GOOD (  12.79  )
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

The node id is chosen by the device firmware, and is generally a small
single number. However, there's nothing to prevent the device from
choosing a large node id. Use node id modulo 65536 in 32-bit systems to
allow it to work in cases where the node id is large.

NOTE: this commit is a candidate for squashing with the previous and
next commit, if we want to have the "radix tree of trees" approach. This
note should probably be removed before committing. If we don't want
"radix tree of trees", this commit needs careful decision of whether we
may want to drop it.

Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/af_qrtr.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 3c84da3059a80..87eb7363c4a9f 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -497,8 +497,11 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int endpoint_id,
 	unsigned long flags;
 	unsigned long key = 0;
 
-	if (endpoint_id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
-	    nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
+	/* nid is chosen by device firmware and is generally a single
+	 * and small number. If firmware chooses otherwise, use it
+	 * modulo 65536 in 32-bit systems.
+	 */
+	if (endpoint_id > QRTR_INDEX_HALF_UNSIGNED_MAX)
 		return node;
 
 	key = ((unsigned long)(endpoint_id) << QRTR_INDEX_HALF_BITS) |
@@ -529,8 +532,11 @@ static int qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
 	if (nid == QRTR_EP_NID_AUTO)
 		return 0;
 
-	if (node->ep->id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
-	    nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
+	/* nid is chosen by device firmware and is generally a single
+	 * and small number. If firmware chooses otherwise, use it
+	 * modulo 65536 in 32-bit systems.
+	 */
+	if (node->ep->id > QRTR_INDEX_HALF_UNSIGNED_MAX)
 		return -EINVAL;
 
 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
-- 
2.34.1



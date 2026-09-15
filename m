Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B6EC88E53
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3qERqGgzrD2T4aK1iBclz+AkDg1ZG2HnPrGpORQgtc=; b=EykYu8umXeb3DdMq7CgU8rCva/
	7ZETR5rnOio6eKRID/EX9oIC880GwnsLBdpUYAxxlEt84q3B3FYVZssf/W4m2/9Q2n8uq6xaqzhJT
	Or1RNvQ48QzDZQeZfwroil64NIqfIAIZCBBKGVqHpVl43KofOusnCHyPt9EnzjecJV+FeziOaJoh/
	5spy3/SLnT82Ri6+k+FLPx9JK//wHuo411aFL9j8y2UwRWmjeSpfqUBHmWEBeA19TJ9En4fBICZIS
	0gyxTDAvlc2ayWXxYNXaonMgv3aaMlfkNou64v56BHPl2S4kQWh4sc4PirWFQl4FWKo0vWPvALalc
	HvW0tRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M03-00000005Hpa-1vk2;
	Tue, 15 Sep 2026 05:46:35 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lzz-00000005Hmz-2QlN;
	Tue, 15 Sep 2026 05:46:33 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkWGn1X1Gz49Q32;
	Tue, 15 Sep 2026 08:46:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789451185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b3qERqGgzrD2T4aK1iBclz+AkDg1ZG2HnPrGpORQgtc=;
	b=L886c2TvMlIuMg7a7dmCHXKPWL5B5IEX+hfDzxJVKJwv+/LO37JPwb0PnTq3Vy5p+gXi9u
	ctx/1R72RoScgJZ2mkvfGXFTYtz5bqKLmxhekDC7mUxd7ikshyB6vYMoawAob16gM9l26e
	p0FfRHO41/j6RsGLYkFXlg0R/Ts9WNF26taxAoNpkAmY+9Rln3h8ioSLR2iUnTAX4v+LN5
	ytcQqDYLJzLlDg//39ntBtxLN3BiHfol7oUkfHXbX49g1UC0f+Wy11hr4FIq0DrAaHd59A
	YtiM6h7tRIAxElgNX1TWBn+5bmDM8X96SbKqs27yVvc6DSbITAy9lrlYRC1qZg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789451185;
	b=eJkRRfc2jdgz9gfZv3fKKtxGBolN4wY2oAswvrOgKGGh4R1ajbxfRR5GL6fOqGRURh1YwX
	sEFmq0Xme8unHOKHfoTmIxeQvxii2msQ6yEtjFqfykuwUePTSDmHYHDzMQIRVcRVAvMKUP
	OwRkmLlLasT/rJBVLGU9N/SNpeUuIhXGsZHoq5Qfbzo7vlBl6LLlnOnKj6LiGs4hRyAP6+
	dgo6/ZvDMgCz6GBvgyBHvLjunanGM/KxO1RN39e/Nz2VvktPRqqZl+2DIqvoYuCHesDXyy
	wGei7J6O2XWE9fhWfJuQXBCjVhKR3TTNwi0gVkTA5DM0+oYXWuA/GgYQg/BaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789451185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b3qERqGgzrD2T4aK1iBclz+AkDg1ZG2HnPrGpORQgtc=;
	b=UQv6m/WtJ2T0Fcb77OBZkn7GOJLESp/+1FzWbyJHxzltCa2wJcVKtKnaJamqzkVU57m+TR
	87TWlr0ETZHv8wDbxAYueD8sAvVz+1BsK9KCJjMxX6XKgz/j7UBj9NB9FCq8xZizNMll9U
	7aSl52sH78GCgxlcNyfUXo36uEH04WJrl0Mqc4I48RlNdjHbqMsKw4/5rNpo/atukRJyAX
	NeJL3Cz5i3XXqTP5ttYM50pxw1hg65Nw0twyXomUHPiHJ9msBb/d6otaj8kz1QiagipCuo
	IJaJZhhIrm5TmQm9t1XXJpj46QCfMJV/YXmFGEr3gdYEuWJr46//vFHPwmDLHw==
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
Subject: [PATCH v7 10/15] net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
Date: Tue, 15 Sep 2026 08:42:02 +0300
Message-Id: <20260915054207.2513877-11-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224631_779686_9FE66340 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

These messages are explicitly filtered out by the in-kernel name
service (ns.c).  Filter them out even earlier to save some CPU cycles.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/af_qrtr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index ccfa3ed33a996..c139786c56f39 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -621,6 +621,11 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	if (!size || size > len || len != ALIGN(size, 4) + hdrlen)
 		goto err;
 
+	/* Don't allow remote lookups */
+	if (cb->type == QRTR_TYPE_NEW_LOOKUP ||
+	    cb->type == QRTR_TYPE_DEL_LOOKUP)
+		goto err;
+
 	if ((cb->type == QRTR_TYPE_NEW_SERVER ||
 	     cb->type == QRTR_TYPE_RESUME_TX) &&
 	    size < sizeof(struct qrtr_ctrl_pkt))
-- 
2.34.1



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF04C88E53
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 07:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPA7RZq69BQzFDIgq2/jKxXiYvSrAjNW2sfY7vkWUj8=; b=ryR5BpZPjDVUHvkq5Mz0BnvTrJ
	de22DWQrfcsNDiA6nk2g7JhdAltDrcQSFmWU+26sgB2Cd+7Gr/Oml8lDj50jU98fPxdsSoefm9bKS
	9v9G7qC6yKr/f8MEU8tvm/Sijus5oX3gbpdR6I2rKQnXUm8zy/f+Z0w2iKjFST/gtMrvsuPQjCP6/
	b0GGyPBAWevb1ePdhpMJbffRM7NfieLcGnIx1KGt0DZcV1y6ZZOK2qQ7TJywX9pI1y1gdgY4v2ebM
	w/b4uISeXCyKp+MS7bDkKDrWDBADap1PBs86MhSTn0vXZAD3w/uLbpVs5dWUKUA3I5K5u686vKBbE
	s/FS9f9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NpI-00000005VLM-3ctk;
	Tue, 15 Sep 2026 07:43:36 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NpF-00000005VJJ-3PVL;
	Tue, 15 Sep 2026 07:43:35 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hkYsm0xH2z10gQ;
	Tue, 15 Sep 2026 10:43:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1789458205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bPA7RZq69BQzFDIgq2/jKxXiYvSrAjNW2sfY7vkWUj8=;
	b=sQZTsgijT5BJPzxeZO6a9ZD4L3yEQZfcJc+delxOjkxJtlJvP/ZaJVNl+U4yimEaa9scc+
	AlXqhZlE4t5Bc97/t4/F0D8Z9Uf+TIFtCqe45o7sdOPTpsrfjzQNXnNCjONqxSIXVsbTql
	BuCvONLnSnl/rDE7CehWZFKJG7QJSRM=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1789458205;
	b=Np7ktd9E+ATajFhlNmOegyVEOIRnF+yuzqOt7VjvpA4ON23pYgN8MjulJh9qcuZ94rSz47
	BK+RiFQ7f1CflCLZXg8xtQ9e9LxqiS1b3lslbYoJwxNMlvA4pwWMJROKCzTFu0SqSFknwn
	DmcvlTvnJoUH+t8XRwupXETtyZFFwaU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1789458205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bPA7RZq69BQzFDIgq2/jKxXiYvSrAjNW2sfY7vkWUj8=;
	b=bxUEYZTBusqXVe4YFqWSk95FDQRd8s+cctXMDt7lUJy5Xl1m2HPVF/sWn4AhitzBuPY3aj
	q1qyNZC+2R93bwJwS2/pdXjL1E6i6F55wnNarF6UUlP0jYhcNzokR4HTFlzT8JLYV9Y40T
	T4Ves6Q913O+2mDxm3cWC0QOCdwv35E=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
From: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
To: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	Mihai Moldovan <ionic@ionic.de>,
	Denis Kenzior <denkenz@gmail.com>
Subject: [PATCH v4 04/12] soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
Date: Tue, 15 Sep 2026 10:41:27 +0300
Message-Id: <20260915074135.2567411-5-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
References: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_004334_025201_87FBB96F 
X-CRM114-Status: UNSURE (   9.02  )
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

From: Mihai Moldovan <ionic@ionic.de>

Adding this allows us to easily supply an endpoint ID to bind on later
on when creating the socket.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 include/linux/soc/qcom/qmi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index b9dcb437a0be5..c675d095df778 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -224,6 +224,7 @@ struct qmi_msg_handler {
  * @txns:	outstanding transactions
  * @txn_lock:	lock for modifications of @txns
  * @handlers:	list of handlers for incoming messages
+ * @endpoint_id: QRTR endpoint ID to bind on
  */
 struct qmi_handle {
 	struct socket *sock;
@@ -247,6 +248,8 @@ struct qmi_handle {
 	struct mutex txn_lock;
 
 	const struct qmi_msg_handler *handlers;
+
+	u32 endpoint_id;
 };
 
 int qmi_add_lookup(struct qmi_handle *qmi, unsigned int service,
-- 
2.34.1



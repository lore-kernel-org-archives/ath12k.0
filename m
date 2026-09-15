Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D3C88E73
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UskWr+boRdHCKqvgiQhgiQCmhJi2c28VCTFGVe919rE=; b=KeefQpL1vo7+9qmxK2c9TzDoKm
	dSqUR07rJByah9Xg9T3r2S9Rgor/oCHQijjixqqMEcDjxRJnZDrSR69HdWtioUuS7lZHPMzORqdXZ
	WKSkSaQS1qw9uY/JxhHzHRkjhcd8MFUNWChGcl/V0E6WBPbAgNYVxuiwd+/Xz8OojK0BGqxBTxQ2z
	5oOOhPaX99oyuJGOnf/EtSlSnF4jNsN6Or8qJSlJtq0laoqSWy4fTGJGSm9yvE7yhnztjRyjzEzGF
	I4i0r5i67K3odrjCTN9LFlqayRKKvusdvIe9ft60zRQUXvAEmombRBZLSQUXkkA9/fb8N3x+DiSD3
	rXG2tO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Npj-00000005VUy-0KIC;
	Tue, 15 Sep 2026 07:44:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nph-00000005VTw-34OW;
	Tue, 15 Sep 2026 07:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UskWr+boRdHCKqvgiQhgiQCmhJi2c28VCTFGVe919rE=; b=i7uViAGuH1EbEJQp89UpjmJZ6I
	zI4PMRbjVkM6SKHtpZNIV9q27RkjEAeTX0C1eGUMc6hzioxH3S9k0yuYJwz0WdEf6vDU8Q8YBD9yH
	kzqrM4+qfzlGuKax6SOrPEjyI3bl9VAnnFnl6w3YNmL4zYQ5M1K8avlVgb9RrXVO3lWUElTzwnYsZ
	lHoiKzPBo8/v+XntQXBkPDEHVvlctO9Fu3/xxi+L8B3lnSiRT3q9+KQEdj+TU7YuCf/iZZ16KIDN5
	xvgK+JC+smJtjN772S+W9stqy6DMlt8+e1lyEF5voU8Y+bxakOKnseDJgx3nIiabapODCHZaXsVH0
	dDUuvOSA==;
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6NpV-00000006NwT-3ugR;
	Tue, 15 Sep 2026 07:43:56 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hkYt63SM6z10gQ;
	Tue, 15 Sep 2026 10:43:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1789458222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UskWr+boRdHCKqvgiQhgiQCmhJi2c28VCTFGVe919rE=;
	b=uF2UudJQi1HbWTVWqlG2rGygix9dZkMlXzhFxDVNOWn1GEO1CGNETZL/WFeh/y2rnEciQR
	09BjyeA8nmcs4NRAHgL+zNywuC54OHD8yGBf8QetE6MpRSlKwtdSkhwOFdRMEwwD8SuPJv
	wjs4RE034uc0kWuAhKaCWzpyH8mX4vo=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1789458222;
	b=py988pwZ3T9FKk43ST1Ebl7nq7c/K0VxGb3Cbu06lS7T5CmVcgiq9I4774d7ry3EzjBYWq
	pCtMn+WJCuOKhyjyVmE2YAysF42Yy/jP7y5Xq9fqhwlQVnysCNxz2k9969v7XUuMGDH02x
	Otw+D7Ybps9pU4U1sEP/dajRHI7fyfE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1789458222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UskWr+boRdHCKqvgiQhgiQCmhJi2c28VCTFGVe919rE=;
	b=BG/gyx31xY1cSmGwyq0CvB/kiH2sNTbQoOTr5eBZ6rrMlZ2vr7R5sdFm0JvTBy3CzaTBC1
	rKrIpaVl8zxdr2ypZin7K29K1L+jgbpQiIOQUveopa65i2WfWjbUsNoU2nF20ht7/V5jsn
	yEX99xQUr1irBsRn4DEXA4/rtA62giU=
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
Subject: [PATCH v4 05/12] soc: qcom: qmi_helpers: optionally bind to QRTR endpoint ID in qmi_sock_create
Date: Tue, 15 Sep 2026 10:41:28 +0300
Message-Id: <20260915074135.2567411-6-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
References: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084354_611064_B4C65F69 
X-CRM114-Status: GOOD (  12.43  )
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

For clients that already know the QRTR endpoint ID before actually
creating the QMI socket and set it in struct qmi_handle, optionally try
to bind to this QRTR endpoint ID when creating the socket.

This can fail, and qmi_sock_create will issue diagnostic messages, but
otherwise ignore the error.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 drivers/soc/qcom/qmi_interface.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 16e2e24b60968..1550138a938d2 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -586,6 +586,7 @@ static struct socket *qmi_sock_create(struct qmi_handle *qmi,
 				      struct sockaddr_qrtr *sq)
 {
 	struct socket *sock;
+	const struct proto_ops *ops = NULL;
 	int ret;
 
 	ret = sock_create_kern(&init_net, AF_QIPCRTR, SOCK_DGRAM,
@@ -593,6 +594,33 @@ static struct socket *qmi_sock_create(struct qmi_handle *qmi,
 	if (ret < 0)
 		return ERR_PTR(ret);
 
+	ops = READ_ONCE(sock->ops);
+
+	if (!ops) {
+		pr_warn("sock->ops not available for QMI socket\n");
+		pr_warn("will not be able to bind to endpoint ID.\n");
+		/* N.B.: this error value will not be passed out. */
+		ret = -ENXIO;
+	}
+
+	if (!ret && !ops->setsockopt) {
+		pr_warn("ops->setsockopt not available for QMI socket\n");
+		pr_warn("will not be able to bind to endpoint ID.\n");
+		/* N.B.: this error value will not be passed out. */
+		ret = -ENXIO;
+	}
+
+	/* Only bind to a specific endpoint if a valid one was provided. */
+	if (!ret && qmi->endpoint_id) {
+		ret = ops->setsockopt(sock, SOL_QRTR, QRTR_BIND_ENDPOINT,
+				      KERNEL_SOCKPTR(&qmi->endpoint_id),
+				      sizeof(qmi->endpoint_id));
+
+		if (ret < 0)
+			pr_warn("binding to QRTR endpoint ID failed: %d\n",
+				ret);
+	}
+
 	ret = kernel_getsockname(sock, (struct sockaddr *)sq);
 	if (ret < 0) {
 		sock_release(sock);
-- 
2.34.1



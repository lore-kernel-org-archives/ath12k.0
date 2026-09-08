Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1CDC79FA0
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 09:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UskWr+boRdHCKqvgiQhgiQCmhJi2c28VCTFGVe919rE=; b=3kiLrZRyojpB2K3tTgL/s32i/c
	Bij00ZnHwGh5qD+YNP3g1s3vqoSi90NnwxWqNoxieId1KsWyQjL5SJwR1oNUawjMFcKBb+qEFErlS
	X2f3gXQIfiljlCy0v/gjLyRD2qQ4vBPET2CXEqykdk4LmkJAhwy8djw1gzPTSYBu9lBc06oLje8JG
	bbZpWKV+/pZAnduuk1L0/muN6/Fbb2XiVRK/35kGY52aFcIHFiZzap4ZsTjSOXevbKUJ6de8so+G+
	MQhxzGIHO9CWtdFlNdMUSDOdsjEzeDg7bR7xI+LoBslWHdphbd/WRERt+m2d54Q1zb3911qqsMeWF
	cRefPmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sCP-00000008b3x-3aeG;
	Tue, 08 Sep 2026 09:33:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sCN-00000008b0x-1z6N;
	Tue, 08 Sep 2026 09:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UskWr+boRdHCKqvgiQhgiQCmhJi2c28VCTFGVe919rE=; b=iRLr+0/aKY60SoQwQByPi3NyUI
	yFp5ym5+Nh0A5YxWXYtTuB8qTwXqC4AxhmoolW5K/wBfOaph6vxwSsY5StDOa1leQleuGkBgwxxHj
	eeXhK5sAE5aiIo6C+oU+3E41gZcvdMwI3jotwgrC7z3bxjggzqVsCPoda76+2AQTUFtcsQa/9Wokj
	o7g+GK4Cbs/rxKORfZLVk27F8ktdvkMyrfErgKe3xUiTd3wAIkGa11vTgaML0wMvzYS+A+eZC3qRN
	gOtKPp/Hf9G29dvjg9w1jvDWIllQ5RYSA1Se1zTl8wSkSmYZ1rYfNXs98eiVMhoiNayI6YtCkFbkb
	DK7u0zAg==;
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3sCI-0000000HCaZ-3D6Y;
	Tue, 08 Sep 2026 09:33:02 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfJdF16ZKz49Q5T;
	Tue, 08 Sep 2026 12:32:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788859969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UskWr+boRdHCKqvgiQhgiQCmhJi2c28VCTFGVe919rE=;
	b=ljZX/e+gAy5wqtt2JXd92XUF51cPmrc8n43j2UYSe9JvsQ/0aYejmN6sTgFOb3qWi/oGnD
	4ojH4CjNah9Nf1Oj+bWbjVwBkLwwlrAkUqwha+MU3d5WxhFQASJNvI1lV6HphRagBJP38z
	2Acs7W4lUjARLJe1Ox3D3rhnr69PESYoXbr1EPGKGmhKFbpKavxjp9enhan2BVwLiRBkGs
	Na60Eqd7FZgAdXKVbUDeTuTY+sEcIV2MXfXdRGkTVMUMH/qZI3GAHMyXMxpwwzLoHfXfw6
	4cEMnmXpY696nvkEafCKU4WHQ8mQpHBQMWiRdoHpH7iKlrbMfeRjl3u8dAzGBQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788859969;
	b=YAxe8mc116ZAbijctVtRdisbycCjvTyKC4zoDBMgKa74VtggXJnyoOIx1Ytv5+UDZsu9Kf
	K187SQUTFw/PVBvEfnQiV/QAi4dlhAeDkBOAcmdKbW41nLLgLjY07RyBa2fWg9Lf5aTKI9
	XxsRph5FlLgNTbiP+vc473I+K+UDHP8Oj8Wcf3aou/W1og34hEjIQmI0IVz5lzsBd5bdmx
	guWaCrqMzHofLLHomvke8V7aeZjzWiqtHRL6sf9svJdC9eWubke3FlALIqWliW4IyHlmB0
	rXQ4fqka10aZulpck3Feu4+O0dMIJFJiiHIC+OFiJ6Qgp1wb9BRCbc14F/7PXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788859969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UskWr+boRdHCKqvgiQhgiQCmhJi2c28VCTFGVe919rE=;
	b=mCuMYCZVoyAxCIj24CVKELQe4WxjQ5Bjwu6akEhGPzNsa23TzvTHJOSb2B4U2wuuNovkWF
	bQ5G6Ir3rzvwB6ZKX9kaWq4RtdmsueeNDeqGrnF/ljKwvI8f+dhg0EZONBdSk5gCBm9MP1
	JDZ8hHImIPAPsBfpfJClSKYJ/QYBKLauMmNvCXDMQ2vXn03nC7Ui7AzKoR511sJbLr4AcY
	WGYJ12jDlYAhumQSaP+jqG/34bn838yxpJbu2X4I5TdBNVo3gxytM1jNJr+t0RSmwzZYTh
	4KtFO4GNQUYDyUuMiHmSCiJjDrhngoBVZ2417Pwi5hBOUVAvu/JHNy9LKSVaaQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
From: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
To: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mihai Moldovan <ionic@ionic.de>,
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/12] soc: qcom: qmi_helpers: optionally bind to QRTR endpoint ID in qmi_sock_create
Date: Tue,  8 Sep 2026 12:31:38 +0300
Message-Id: <20260908093145.2492666-6-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_103259_056729_B9AD2957 
X-CRM114-Status: GOOD (  12.38  )
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



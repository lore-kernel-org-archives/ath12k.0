Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73790C88E7D
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8dnLpIuawa/T5WKzmKQT35hCSn6pD7KsZ9UF2NkcKc=; b=T1EgZfKSsoqHF4uuSGsBHhSfy2
	vLCJagmyJ/cGU85bFl4ZDKzWWm2cNTDsYPFaHhf+03ddQ6BdV3BVaJVlNHz5j0j2GkBPl3rcI4oJn
	/a9in9XIGlygNa/dbkMUxYcCd9qZTUTk9fU5jiVcQAxI0uPC/Ntt8GrdaBSsZU5YGPeTW4rlKuiRH
	7CjrFnd+3CESd+yvZBZXAbQ5FAmWOgfA5M65H24+81HnzUI+nEkZniP4QveXSB1650sxuG0YH0cGy
	921HHQqw/Lq6e9gQhvC78xSztIvrC9arqJ3ufWlqyPswOSeahWf7CII/OrngNJvDKIo7gGZCkT59Y
	txCPQQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M0z-00000005IM0-0b8P;
	Tue, 15 Sep 2026 05:47:33 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M0w-00000005IKD-1gl0;
	Tue, 15 Sep 2026 05:47:31 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkWHv3QkMz49Q6x;
	Tue, 15 Sep 2026 08:47:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789451243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8dnLpIuawa/T5WKzmKQT35hCSn6pD7KsZ9UF2NkcKc=;
	b=BWRfjJU2Y1pi/YVWwpzyOTK4sAjECFATkJ51d8lxvHUftCGPXPk94J+hB2A5QY0v9ONrFo
	/GMVsrnydVc9q8Ci4Xu+TWTPxoHllx1DPnS8U4VyaKr0esBo6BQAmmJcQRuYUMTdYnV0Ov
	5M2gwnO27CB8P0UagBvD2LJQopfVc2uVVjm+RTSwkzHL2oJs/XqtTXtgDwszkRg/qLu5sb
	z8YHZEKOYmLADKyej1j9n1ZBiryUenCugC/UYHIC3sK7rH1M8zbgQFwPm6e82Fb4tDPG90
	cqBz9cSaR32DxtiqSIhH7agp90PpM7ORZVIlJtM4gTSPTubdEtJ1fCDFap9iHA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789451243;
	b=SsHBof+dIMMLHxAnF5KvFGo2Exe9Z4BYZUwq6kJks0+G+kjGpqy2xQHg1s8yO9cncDfHW2
	oyi4gSYtt1nWAGT3Sq/Vdn/7JLS18EvZX3EIgPqCzmf5pdHQptp4naivJ4YQhnxp31U+nr
	yVNNXSZyq8PryhhzhVZSSkaPQzVr32IRXWAK/3oX3oukHf/armce2jake+OHHjeAg6rTRG
	RAAhOJAgW4vZfilI365RKMoKA7yu+1MSVie6t+pBiJ2CXeNDR7mToErgjw6pl4h4MTgPxg
	bcSiQygjB6tGKJLNh8kNIq4B4Ev8pQDuIbknrK2/iyWmbWxAFtC5zxMbKJyK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789451243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8dnLpIuawa/T5WKzmKQT35hCSn6pD7KsZ9UF2NkcKc=;
	b=fNJkeDHqKc4dOdtUsnvq7Gp4t2WKpLJq+NYagZIi7oX2SuUNv1nyPZKQ9yapDSk6tru5+o
	Mst19EtwC8XIJaGXooKfxUxQyvN6gyCxX90GJQFc0kFzo2IeUX9yqYntMKEPNChF658cFa
	09qrwo7iWDFOD66ENwFtm0gdomX1p3zo2Wpahfl8+pzKpcJIWEnUNa9ZCwApGvzM7QP/vI
	ryEKW/IQ7vp3siWMob7Tkqu50OPd/grIvOp31MsenkKOn3ZuJHlXELJF1eJDWmh5sKU/we
	Tu3RhKEgNGcx8jvi/Ax72PNOJ/LFN3k2OVZS9RmLA0cRov+5n4ouEd+kegR6DQ==
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
Subject: [PATCH v7 12/15] net: qrtr: mhi: Report endpoint id in sysfs
Date: Tue, 15 Sep 2026 08:42:04 +0300
Message-Id: <20260915054207.2513877-13-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224730_606880_15854525 
X-CRM114-Status: UNSURE (   9.78  )
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

Add a read-only 'endpoint' sysfs entry that contains the qrtr endpoint
identifier assigned to this mhi device.  Can be used to direct / receive
qrtr traffic only from a particular MHI device.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/mhi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 3990da1a65dc4..630ce0da060e5 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -106,6 +106,16 @@ static int qcom_mhi_qrtr_queue_dl_buffers(struct mhi_device *mhi_dev)
 	return 0;
 }
 
+static ssize_t endpoint_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", qdev->ep.id);
+}
+
+static DEVICE_ATTR_RO(endpoint);
+
 static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 			       const struct mhi_device_id *id)
 {
@@ -135,6 +145,9 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	if (rc)
 		goto err_unregister;
 
+	if (device_create_file(&mhi_dev->dev, &dev_attr_endpoint) < 0)
+		dev_err(qdev->dev, "Failed to create endpoint attribute\n");
+
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
 	return 0;
@@ -151,6 +164,7 @@ static void qcom_mhi_qrtr_remove(struct mhi_device *mhi_dev)
 {
 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
 
+	device_remove_file(&mhi_dev->dev, &dev_attr_endpoint);
 	qrtr_endpoint_unregister(&qdev->ep);
 	mhi_unprepare_from_transfer(mhi_dev);
 	dev_set_drvdata(&mhi_dev->dev, NULL);
-- 
2.34.1



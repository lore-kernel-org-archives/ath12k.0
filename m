Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE73C79FAC
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 09:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+aZSiwdH5N1vZ7BksR/50oyXsfQFMsN7A1hoQYbSHs=; b=Dkh1bD0KsUOYa/6cjcPvkcJ3nP
	AWqKFP34PVd8NSO+9l7Q11VEBmeb6WaP002LvAD4o50YRgLvF8Aqx8OXUF8sVcDWcglGJybRfGyu8
	37cd5sXQlpGt+3neawMF0Dq5cpmMxaDFDCoDOT0ZKGSx4MK5IyjdRmZlVM/J40LCpwwWOiBoclx1F
	FxmR/ClXw/P4Rjf7QvDlAh2GR/AeviXwTLqZCYJpJp6M1O9g4ox5lLT7S0ILyltDtHCa4aXOrySZ5
	Cb+hYobzh2EPs1Ujxvrq4i9hMAlUCvmKoQtVR5CkA23ROMS1P3hsGq1cJ3D0dxTia8VYliLsXFZPP
	iI5xU68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sC5-00000008ahh-0j6p;
	Tue, 08 Sep 2026 09:32:45 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sC2-00000008adu-1Brz;
	Tue, 08 Sep 2026 09:32:43 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfJd02Bz0z49QLK;
	Tue, 08 Sep 2026 12:32:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788859956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+aZSiwdH5N1vZ7BksR/50oyXsfQFMsN7A1hoQYbSHs=;
	b=IOHk0PyxMbRa110ROyJG+jpxWrz6imAFItRZY7Ws/ISGnw90PgCxNAmdunl/Iwky/R0x/q
	5erbDh/W2fL9QwC1QgoZ6YdfuDxYqF8wpmGA85OjAYLLqw19l2/C5p5wVk021/BH+Xrz9I
	GpdWsNMm3Z0rQqw1HPqHxPfcA7Pk+XqtanjEZ0JeqZoto2sJjG9jjHFG6VEqIjwMSp+uZE
	R/5xiWBa6PNJPUeMucmt+uc+/zP/oj7a6RhBgl2fK97xOcoE0PyXwJIIGBYVL03+lW2czN
	5tQMbTjNJDMq4RqvUHXtsYmTN/tjyjcgxwuHgRP5dtgfIDVHnM0ejt6MOpshzA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788859956;
	b=S0Qdm1I33KvJDZdEFzvKrvsI1FR/L6oD09Z5Rz4Pb58lFKyduuN3RuNG6gcaJJJVJJk3DT
	KI/bIND2nAS6G8lzRpKazMk6STy+BpNo/5U2p6hRflKnaJHGNRtPb7/pEMustKICSFQyZ0
	wvQFvt1bGthETT/AyitE1SODp/s7pjmjrvexo/RTpNkdE4L9NjAcoxwcfN9tEqP1C4rTwL
	gwSTbipm+wDN2UjG5G5yhG4rTHnonxMXe5P7CdPpMQXOgbq7V8uj+Q3LtToSOPuGe9W38f
	fUyGnTr1jxZC3bls3HbKNfvLkWRVX8qEu627xCyUUhU4dp8N82eC8zYmM8meeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788859956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+aZSiwdH5N1vZ7BksR/50oyXsfQFMsN7A1hoQYbSHs=;
	b=h8B95emPsI0cqOacxnRJxFm968kwJhkpiRRufQIET2PxV7nvRvftNWvyihd7M1Rqqlu/DZ
	TWd922cFJJkbuDW9aRUA4QLEc0UDly7WKmEXMZGq7vOqJQCNSemX1MRfVKRI5/HjVPQrRt
	To8LY7cyeXSCdDS6ME8/wNYqTo+Z6YELqhd224tM7dW0vORgHx7eOdTD+7AkchNLj7bjS0
	nZBH5hTJiVljL4XBgo1eiiJSnRzzJl0/ZhDFSL95GA5695XH8uOLAwuSCeeQ0e/EjaYJl0
	heo27wKkdSveYo2YS3HjcMKuXskpYHcsLUEmE8LSe5ylx0kIZpsiK50tuQkCCA==
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
Subject: [PATCH v3 03/12] net: qrtr: mhi: register new qrtr endpoint id for mhi
Date: Tue,  8 Sep 2026 12:31:36 +0300
Message-Id: <20260908093145.2492666-4-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_023242_476818_35EAFA8C 
X-CRM114-Status: GOOD (  10.27  )
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

MHI will use the mhi_controller data structure to store the QRTR
endpoint id, as explained previously.

Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/mhi.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 630ce0da060e5..60d85f126bca5 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -116,6 +116,17 @@ static ssize_t endpoint_show(struct device *dev,
 
 static DEVICE_ATTR_RO(endpoint);
 
+static void qcom_mhi_qrtr_free_mhi_id(void *mhi_cntrl_void)
+{
+	struct mhi_controller *mhi_cntrl = mhi_cntrl_void;
+	u32 id = mhi_cntrl->qrtr_endpoint_id;
+
+	if (id != 0)
+		qrtr_endpoint_free_data_id(id);
+	mhi_cntrl->qrtr_endpoint_id = 0;
+	mhi_cntrl->free_qrtr_endpoint_id = NULL;
+}
+
 static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 			       const struct mhi_device_id *id)
 {
@@ -130,6 +141,23 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	qdev->dev = &mhi_dev->dev;
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
 
+	spin_lock(&mhi_dev->mhi_cntrl->qrtr_endpoint_lock);
+	if (mhi_dev->mhi_cntrl->qrtr_endpoint_id) {
+		qdev->ep.endpoint_data_id =
+			mhi_dev->mhi_cntrl->qrtr_endpoint_id;
+	} else {
+		rc = qrtr_endpoint_get_data_id(&qdev->ep.endpoint_data_id);
+		if (rc) {
+			spin_unlock(&mhi_dev->mhi_cntrl->qrtr_endpoint_lock);
+			return -ENOMEM;
+		}
+		mhi_dev->mhi_cntrl->qrtr_endpoint_id =
+			qdev->ep.endpoint_data_id;
+		mhi_dev->mhi_cntrl->free_qrtr_endpoint_id =
+			qcom_mhi_qrtr_free_mhi_id;
+	}
+	spin_unlock(&mhi_dev->mhi_cntrl->qrtr_endpoint_lock);
+
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 
 	/* start channels */
@@ -150,6 +178,9 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
+	mhi_dev->mhi_cntrl->qrtr_endpoint_id = qdev->ep.id;
+	mhi_dev->mhi_cntrl->free_qrtr_endpoint_id = qcom_mhi_qrtr_free_mhi_id;
+
 	return 0;
 
 err_unregister:
-- 
2.34.1



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000DAD3B7CD
	for <ath12k@archiver.kernel.org>; Mon, 25 Nov 2024 03:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3NEXNbfVKJFi6dxYVC+J13HvVDzdkGdYWsgbEbK6jA=; b=lra4X6Fe/OYmMzQZFAQBmBtHZJ
	qpKGy1ZiD3G+nm5VNSuVBFOj9h0iBdlm0tpMHIozkc1riA6LvEzf0zpHuQARK8PBRZRwbKF2Hb2wc
	7k7IfNJzAq6gMLNagRj0zSvcvul6iebNKXr7kPj4VP6S/TqZibDfSVgGQISu0PjHVAoWKMxvj5i8k
	EY8CUqynAyIj+gR43sjQP1RkBWc/IjeEdK+LgJZc8MYpyHz0DcKwX+Kn4A5ZOOG4GaG/Bt29rFvOV
	BlQF/rg4xOwcPj99LU9zgq1ethXEbdty1/w5Ry6JC7hLP1fWLbAw8zh1KWJVB8J6+DN31658NmiCh
	/3xXdU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8l-00000006zDv-30UP
	for ath12k@archiver.kernel.org;
	Mon, 25 Nov 2024 03:51:59 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8e-00000006z6M-1gEk;
	Mon, 25 Nov 2024 03:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732506708; bh=CcApLCzMROUQU/RunBcPJFusQCj4QXpyFrT2DKnQP7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z6iKAJH5JsYjx4sr75/4g+0kGMhiOlbPLMXkjy/593ut3Vv9MlfrTHweTGOyyKuVx
	 a7l3hJfWA+3Vu3SQvc1L2CDnRxjAcWmHMe06c6vMEicH+eItRog4Dq2fJCuW9V7s5+
	 qxFIbLzWWVxmZLKUUJPYoQXvbwcOJYueiNdmGegA=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 28705148839C;
	Mon, 25 Nov 2024 04:51:48 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
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
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFC] [PATCH v2 03/13] net: qrtr: smd: register rpmsg_device as endpoint-specific data
Date: Mon, 25 Nov 2024 04:50:18 +0100
Message-ID: <aa1aa32b42c0d052c907b53e8dae4877e63b2b2f.1732506261.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1732506261.git.ionic@ionic.de>
References: <cover.1732506261.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_195152_810761_001EF508 
X-CRM114-Status: UNSURE (   6.57  )
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

For the SMD backend, we will use the rpmsg_device pointer as the
endpoint-specific data.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 net/qrtr/smd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/qrtr/smd.c b/net/qrtr/smd.c
index c91bf030fbc7..cb3eeb6835ca 100644
--- a/net/qrtr/smd.c
+++ b/net/qrtr/smd.c
@@ -68,6 +68,7 @@ static int qcom_smd_qrtr_probe(struct rpmsg_device *rpdev)
 	qdev->channel = rpdev->ept;
 	qdev->dev = &rpdev->dev;
 	qdev->ep.xmit = qcom_smd_qrtr_send;
+	qdev->ep.endpoint_data = rpdev;
 
 	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
 	if (rc)
-- 
2.45.2



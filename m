Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E88C88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Angl7vosthCmbDal4tBWwtsxKy9LKqnIGYA36AA3r48=; b=X0Z6P0w/3LvDt449qUde1kmKLp
	U+P6pAVqrhF5dhnitF6AIDr1TRnmJUK5rKFoJH0Fyr7otbs0IOXLfwqvUtKnOUOYELsZ+/AaBJjfQ
	VEOl59Mv9e6sN1SpPyz+hqn8m5TfXXlWnDitbILGBGwKsjAquGeXbQx+eZAekxPV5QEulKMGPs3Oq
	oxASunnXnOFyn2ULP+YavAyK3FwyRLwpgUNLSpPAgLTmcS/dd9QV8Qkec3M8/rt7N7eJ5EEqOrXFK
	tWPIZ0gcYLer5/1SVXyCGdXsTLiRrbVOL4/AIoyk6zd3o0mImxS3OcB3IEQHrdSvxOWvwyqTRU7y2
	G8Xf6kNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nor-00000005V9S-2sqP;
	Tue, 15 Sep 2026 07:43:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nop-00000005V7z-1r90;
	Tue, 15 Sep 2026 07:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Angl7vosthCmbDal4tBWwtsxKy9LKqnIGYA36AA3r48=; b=iRWNaZk5O+A/SULwQjJ/LJqWf3
	193N991K4rvE4Pc9dZJzjHuifoxpIEnEoJmXyQUwoqfZPIQVC64qFWY2jK02AoXQlR9OJ2eonP3sI
	hX2HbHCfEQgRCKd17eLHzRybW5uMTFvNy0istonoPma2mlOqH14HUq/EnaM8Xr7iQ94KCtHSx+i5Z
	W8LevRwV2CjQjseAfduzOkwWgMeKcFHz/2giIT15fcpUWrgr7vWWp/laGqM0DQApda4Ex5ylk5zyj
	bKdodEl/otctDzuldydHx8Y6X09WXJ7nJJXdSspfebAeVt6IXFzVxVBnIiHHfCuR+7gO5Cxty4VQY
	+Tl6/bTQ==;
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Noa-00000006Nne-28VZ;
	Tue, 15 Sep 2026 07:43:01 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkYs14CQrz49Q6x;
	Tue, 15 Sep 2026 10:42:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789458165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Angl7vosthCmbDal4tBWwtsxKy9LKqnIGYA36AA3r48=;
	b=AuaAdn8QybOKuXFMOM/VlqmJAQl0rjaUuLhJdMz8qmaIY1HPGmxldld4a8eaVKArjRD/Xu
	v8L8QxplrxY0s/GxWEyIUyUQ8xmnkogGJP34ekzJQwEiXC/f1yvtwGnErnNbw5G4tTRwBP
	EZTCYHOET0h9C0IepiwJ6JYDSYxGMGbsd3OeCtHNvWOWfK/t6MKtgITfGEHe8BJ3PI1O8r
	t2LrcaknHwghjY35WODghaWkKz6aJ2wku6kgyTKJULJY6Kgl6Igov/wlT7YK1mafdEZ8fY
	ovv78PzXqihiQ02ImEfZqJHMxLO+unGvzvLJve0gTRR9/NwZqf/TMZ2gKadPYg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789458165;
	b=PI21Vk+wZ8LkVQLq2V/9DSFWzUxKDoFE6euN+9TlhVDEUgEVcMIRakCFP0F5UKWIPKDOLj
	sGlh7o3+XcxLOk7KVNaFdDVoCUaS0uc58W2NnNWZ7WMXSqKdOG1Kkpmm81Ak1lbs/Ii3KF
	A8ff+K6ScVueQdtHg2j4nv7UURQ0mpBEk1PPk+MCH5qzJHMDQWRfDXhKnKddgNHgCSd6Ka
	Tu+gX1a+wSicLQmwsH4/JH5TSh0uhZBDq1Eo0By2izgd2eW4KO3QOLaLpM6U7WSqPLw9sF
	iTLtRGgu1Yq+kmj9j+HyqythxIPoiMSG7UIHLd3EdhHZTaPRhPt44rsebULYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789458165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Angl7vosthCmbDal4tBWwtsxKy9LKqnIGYA36AA3r48=;
	b=Jmr8WyOQa1eaf0rWN5jxieyYjlaqymiojPz24wbUkvtpsvuOaciiSdQ+eeNd/Efo0a7ffm
	veFW9+YUzD73BHfL6vavVoePX8dioUSgAooGYjg6D9TWo3h44x55sUODMuggzsOw8E5JBi
	ne1mDX+/e24ZJsWZd3/E4DPM/kUaoN8TTLQaGNHsGdoFKHJbUV5J7b/ZW4YrGXw61lFnRO
	zoI4mSuhySwnyd9EY0bCxoS2IdA7duWMiVcvpsZkQrMLuYxTy3YkSAvJAACQTkpfwTRZd3
	mx7T8b673kiZo1qCy6MZ4BKSFKXdEkJ2m0SH1BHb6Bwz8KmuyyO/Em7wHfhfQA==
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
Subject: [PATCH v4 03/12] net: qrtr: mhi: register new qrtr endpoint id for mhi
Date: Tue, 15 Sep 2026 10:41:26 +0300
Message-Id: <20260915074135.2567411-4-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
References: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084257_583999_79B61E5E 
X-CRM114-Status: GOOD (  11.15  )
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
 net/qrtr/mhi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 630ce0da060e5..41b58ab854725 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/skbuff.h>
 #include <net/sock.h>
+#include <net/qrtr.h>
 
 #include "qrtr.h"
 
@@ -116,6 +117,17 @@ static ssize_t endpoint_show(struct device *dev,
 
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
@@ -130,6 +142,23 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
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
@@ -150,6 +179,9 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
+	mhi_dev->mhi_cntrl->qrtr_endpoint_id = qdev->ep.id;
+	mhi_dev->mhi_cntrl->free_qrtr_endpoint_id = qcom_mhi_qrtr_free_mhi_id;
+
 	return 0;
 
 err_unregister:
-- 
2.34.1



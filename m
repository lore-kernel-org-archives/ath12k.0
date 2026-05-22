Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E70CD5BB1
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 12:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKsgbpUVkZO9zW0In0sWJicjFDTgo4Mlcppw/kDfVs0=; b=f3djncxXRZ9NjCkoHT7yVbgJZn
	PaoDsgt1TPuCjVH/anGVqmbXy/Rt/HsEooMk3YxedoDFQcdFr4aoziOdC8gyOF2y91GqrAXtROZaw
	QbbRHw2MiXJV9omR1VpeJWkv16ZKXKe5ptZF9ScDwX/XXUYFlZSFoJlUOxzAdVaqY+jqJLVkSVCe5
	ZP2K/OQw4lhi9Dy8ohpIeiauiIavInTybeRSMWoSOZc1WDAr9PHrvfeVb+HMWwxcrVN2PAnvEw1sf
	bv84sajdCXfFtvuAhIq+cYVBet2TMLgEffXi4yeiThI92pqf7WKOl74LIaz6CXS9X066Iwk1h4F6w
	G3IR2rDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOZi-0000000Ahgt-2TFi;
	Fri, 22 May 2026 12:01:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOZh-0000000Ahft-0qly
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 12:01:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A7E760138;
	Fri, 22 May 2026 12:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B829D1F00A3D;
	Fri, 22 May 2026 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779451316;
	bh=wKsgbpUVkZO9zW0In0sWJicjFDTgo4Mlcppw/kDfVs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aTlfXNtjIaj9o47TEuehFmkjsImumavGXNOVarCCDwfW1zckYzwFtay1Pr9xTRIaY
	 r/mUIKCevJ2zP5F82g5QMArBC7/4raoHLtFBKXxnI9iULe8/KQH/bWv1ixFbGiPnP/
	 KtbDZzolQcg+JvqiH7coA7VGk4G+hOdlyIuRzujaVZmHy8yG02bv7VxhweBvPKzQsE
	 5yYqTzOLTt0PVrNva+KIxrcz87+KvVwvw/oPMqXBN+Nr7aYS9LblbJfAIrRDQ43iLU
	 YMGeU/o6llXpPT36P3IUA5538wBBVv5l+ioAOa0Z46WTTc7CdUW4mQWFv++P6WoFM0
	 nfJlxrsE34Ufw==
From: Sumit Garg <sumit.garg@kernel.org>
To: andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	akhilpo@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org,
	elder@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jjohnson@kernel.org,
	mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com,
	jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org,
	apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v7 07/15] remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
Date: Fri, 22 May 2026 17:29:28 +0530
Message-ID: <20260522115936.201208-8-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260522115936.201208-1-sumit.garg@kernel.org>
References: <20260522115936.201208-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Switch qcom_wcnss client driver over to generic PAS TZ APIs. Generic PAS
TZ service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 4add9037dbd5..0dbdd18ab3dd 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -19,7 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
-#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -257,7 +257,7 @@ static int wcnss_start(struct rproc *rproc)
 	wcnss_indicate_nv_download(wcnss);
 	wcnss_configure_iris(wcnss);
 
-	ret = qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
+	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
 	if (ret) {
 		dev_err(wcnss->dev,
 			"failed to authenticate image and release reset\n");
@@ -269,7 +269,7 @@ static int wcnss_start(struct rproc *rproc)
 	if (wcnss->ready_irq > 0 && ret == 0) {
 		/* We have a ready_irq, but it didn't fire in time. */
 		dev_err(wcnss->dev, "start timed out\n");
-		qcom_scm_pas_shutdown(WCNSS_PAS_ID);
+		qcom_pas_shutdown(WCNSS_PAS_ID);
 		ret = -ETIMEDOUT;
 		goto disable_iris;
 	}
@@ -311,7 +311,7 @@ static int wcnss_stop(struct rproc *rproc)
 					    0);
 	}
 
-	ret = qcom_scm_pas_shutdown(WCNSS_PAS_ID);
+	ret = qcom_pas_shutdown(WCNSS_PAS_ID);
 	if (ret)
 		dev_err(wcnss->dev, "failed to shutdown: %d\n", ret);
 
@@ -557,10 +557,10 @@ static int wcnss_probe(struct platform_device *pdev)
 
 	data = of_device_get_match_data(&pdev->dev);
 
-	if (!qcom_scm_is_available())
+	if (!qcom_pas_is_available())
 		return -EPROBE_DEFER;
 
-	if (!qcom_scm_pas_supported(WCNSS_PAS_ID)) {
+	if (!qcom_pas_supported(WCNSS_PAS_ID)) {
 		dev_err(&pdev->dev, "PAS is not available for WCNSS\n");
 		return -ENXIO;
 	}
-- 
2.51.0



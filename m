Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3D5FF885A
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 13:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKsgbpUVkZO9zW0In0sWJicjFDTgo4Mlcppw/kDfVs0=; b=agKuEoCi1z41GP7HubnkXbxCXE
	xxEUq0LrSQ3csC/lKcuVydG4OlmFVRqSfkWt1ojDXQMT9J6pRBTtgHIwnF8Yx5fjnqHzHmYEwUrWO
	ozTpXYpJ9mhs8jP05eQBtUhfR+QqaioR20WAqCQ1g4oMweDqUlNBDLRL8Un7aemt6A5lrEoEA9Was
	lnb5zhhuWw0yHXiMBZ8ivYn2kZjWu+rodY/rgHX0LfzniblKvhN6dcBlVszTdD+6zBiMsAagpZ/RC
	+oqU5CEJG4YcI2711Esz0KPPla/kHvuwQe7BUSKE7PXLeuXvLY4aUR9CtItsLs8OiC8azHFjd8FaH
	NCaIQ9QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJt2i-0000000DFYb-3wvK;
	Mon, 04 May 2026 13:09:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJt2f-0000000DFWq-32JI
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 13:08:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28C7B60132;
	Mon,  4 May 2026 13:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71066C2BCB8;
	Mon,  4 May 2026 13:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777900136;
	bh=2y1dLYSN9I5MyCre0kGkJeNgpsjPOlU7guTiFjyNhvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qok6HxFC1mSy1yUTq44DgK6AYhHD/JMtOBsXZMRSNIFNyvp9RItluh8avLgCmP1iP
	 ghAkUz9lBR1F2OJxpsTN2QAcQguQZQUmq0WHxeZxDOatPfpBqodHdAu5dR3BUAJT60
	 bcBhdQjy7HsSrJdgj/2GSa1hBfshB6oiLC8WNdnPoaYtg99IdkZpySVnzlN+c4EEmV
	 m+BzMDYA1JBOvaHVmcPfohk0hVOTLoSU5WAjk2l8hkSxPNa3pGSCo6offajf7XjPTD
	 lehFjPB4sQ1BsE5EJ8VG4uzVJ9FtgcArkem84h1mH0QPf1faVBr2uioLIAeXGGshHk
	 j9QBSzkjWPbPA==
From: Sumit Garg <sumit.garg@kernel.org>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
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
Subject: [PATCH v5 08/16] remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
Date: Mon,  4 May 2026 18:35:55 +0530
Message-ID: <20260504130603.1474043-9-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504130603.1474043-1-sumit.garg@kernel.org>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
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



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D38B10ED674
	for <ath12k@archiver.kernel.org>; Fri, 27 Mar 2026 13:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rmatk1kAD5zmrrhesWVgw1IRyDTn+LUSTFh1pcJATDM=; b=Oh6dVEvKPXocofN0Cr6hzjxxvH
	Y8YtektxE0IHms+CP5avf3s13L5OipIp+svrnPikoH9IbQnQ9DcF5ABpljA8S5xbQtABpM8pPWOk/
	a/Pw7lJwP2aS1CTsUI9itqEBi58Gg28WE8RO7DCbCJVyxe6Qb3uipRy1LwZBPVWQVpS7GWWVzVUkv
	YZUvMSaG5pqc2JzemvihWgWHd6XOPfuyGNNmM9JPm0EcOPmLCv7BxL/17eF00mNAR8Ifaiq/9NmDl
	YiU7BCvaJPSsi+sTOK6+fG0Bsu4mxNWWUM1zt3WTC07zwLW5P03dwbN9W532Zyfe4y1lUEO5P/a1W
	8LO5Alkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w671J-00000007QGN-3gKp;
	Fri, 27 Mar 2026 13:14:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w671G-00000007QE9-1mGT
	for ath12k@lists.infradead.org;
	Fri, 27 Mar 2026 13:14:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04E9743B64;
	Fri, 27 Mar 2026 13:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FA3C19423;
	Fri, 27 Mar 2026 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774617273;
	bh=PORzigzNzARQEhp1SDYRDkBvlWdX2APPwjAd2bLyF00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J9juw8yyFJ/Ut/V0zjyL/q3zX/15Xs9Z0qPeuN2V7bMoOSM7SfMejk+/iAM92YBBy
	 8/I9Hr8kmeeza3gLvvcuXj1Fxcr65brcsgMx/RzkAIjqs9u58+5HrE8+v7QKeBCyY8
	 SXmUvmaD+7jZUmSdoZGtb38nrHlvi/vmbmRMYEg0KkVHJP+WcR6QE7nGVStdGBzHB3
	 4S93RAHXM7hiGnj0H5aNHvkFm8nX010FjvgcggswvBGscY7AH95/+ivc9sPccI+o4H
	 WsxSQF3DUDkSaFzJJArQoXcPiwLnNUEtKyukCNYn2GnnbJ8AnMCuGWsjktA3l74xhz
	 AV2ABpl/LXzjA==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org,
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
	harshal.dev@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v3 13/15] wifi: ath12k: Switch to generic PAS TZ APIs
Date: Fri, 27 Mar 2026 18:40:41 +0530
Message-ID: <20260327131043.627120-14-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260327131043.627120-1-sumit.garg@kernel.org>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_061434_502311_CBBDB27A 
X-CRM114-Status: GOOD (  11.39  )
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

Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

Acked-by: Jeff Johnson <jjohnson@kernel.org>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Kconfig | 2 +-
 drivers/net/wireless/ath/ath12k/ahb.c   | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 1ea1af1b8f6c..549d0bd77f07 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -19,7 +19,7 @@ config ATH12K_AHB
 	bool "QTI ath12k AHB support"
 	depends on ATH12K && REMOTEPROC
 	select QCOM_MDT_LOADER
-	select QCOM_SCM
+	select QCOM_PAS
 	help
 	  Enable support for Ath12k AHB bus chipsets, example IPQ5332.
 
diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 9a4d34e49104..935f893d04ef 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -5,7 +5,7 @@
  */
 
 #include <linux/dma-mapping.h>
-#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -415,7 +415,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	}
 
 	/* Authenticate FW image using peripheral ID */
-	ret = qcom_scm_pas_auth_and_reset(pasid);
+	ret = qcom_pas_auth_and_reset(pasid);
 	if (ret) {
 		ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 		goto err_fw2;
@@ -478,9 +478,9 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 	pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
 		ATH12K_AHB_UPD_SWID;
 	/* Release the firmware */
-	ret = qcom_scm_pas_shutdown(pasid);
+	ret = qcom_pas_shutdown(pasid);
 	if (ret)
-		ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
+		ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
 			   ab_ahb->userpd_id, ret);
 }
 
-- 
2.51.0



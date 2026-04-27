Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E86FF885E
	for <ath12k@archiver.kernel.org>; Mon, 27 Apr 2026 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFiI1oXY9OhWBFkjmghNjXBQOR6mfmJcSRB9A+OJT+c=; b=sCBuiMHoY3LDhn+ykurN0Z5keI
	vuOQHOdAmErYSnO4CFX1oz1HYxbrLIxBRi/3Rr1ew2Xl1/adyb5zeKEn95Q+9rcjlyKUcbji6ruGF
	slSvi5MTyWJ8yjZRzJ3dbLrii9ScDUdUVto9h/LwLuX5l7yY+2Ox+0dnwtSxhmhYJfAczYIpOm1Zk
	MVjLFReBoDgnmfERk3aDxqn9nO8SnWpNV04uAz/vEok6Kg2QqMV5IFnX20a9ZvO14FL/i9RyGxU/v
	4cqZYsoeHSkhrHvOeqa88biaoxiGhHFSmgS9sCFPAJByID0cFzfWnEcMwLrjANPZBrAaE4z+XMFrX
	M0lIt4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIka-0000000Gdq6-2y3f;
	Mon, 27 Apr 2026 09:59:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIkX-0000000Gdnu-1ta7
	for ath12k@lists.infradead.org;
	Mon, 27 Apr 2026 09:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B04D40BFC;
	Mon, 27 Apr 2026 09:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5753DC2BCB6;
	Mon, 27 Apr 2026 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777283972;
	bh=hXxx+4QUgMOw3htf/QGDwyguBASyu2uqZ06knOuCGaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QVDKeuunL76HM1861au4fRPSLOyaDFWyKt4ECY432CoPxvvp0x4XVh2Tpuv+CYTEK
	 vcx4tgtwsm2mSL1EePtBXXBl5vXCPAU+XvsSF0GO2Mn7wWDBT8C6vekkVrsbDVkImj
	 B2VWX7AqTfEvbl/VlP5LZwvHsTcSLsE/EEPEz5sJFFCuLA4vJ3fsoGfWsqBmjnOHFI
	 wy2UyLTcDIDKsCmdPud8yfCvcUYbJWNnqRZtni3f7w97FvXi8/IOruHhF/uPcqvG5k
	 OAgpCeXdq1qC/8h1oI04a/S3VEf9/7duELX0Q00AfqmHjcZuMxCquCijDU75ch78hP
	 xJB6V3R9Czn9Q==
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
Subject: [PATCH v4 13/15] wifi: ath12k: Switch to generic PAS TZ APIs
Date: Mon, 27 Apr 2026 15:26:01 +0530
Message-ID: <20260427095603.1157963-14-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427095603.1157963-1-sumit.garg@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_025933_531153_0358B928 
X-CRM114-Status: GOOD (  11.92  )
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
index d39c075758bd..2b8b87931330 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -18,7 +18,7 @@ config ATH12K_AHB
 	bool "QTI ath12k AHB support"
 	depends on ATH12K && REMOTEPROC
 	select QCOM_MDT_LOADER
-	select QCOM_SCM
+	select QCOM_PAS
 	help
 	  Enable support for Ath12k AHB bus chipsets, example IPQ5332.
 
diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 2dcf0a52e4c1..c5ba91e6f95e 100644
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
@@ -420,7 +420,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	if (ab_ahb->scm_auth_enabled) {
 		/* Authenticate FW image using peripheral ID */
-		ret = qcom_scm_pas_auth_and_reset(pasid);
+		ret = qcom_pas_auth_and_reset(pasid);
 		if (ret) {
 			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 			goto err_fw2;
@@ -485,9 +485,9 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
 			 ATH12K_AHB_UPD_SWID;
 		/* Release the firmware */
-		ret = qcom_scm_pas_shutdown(pasid);
+		ret = qcom_pas_shutdown(pasid);
 		if (ret)
-			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
+			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
 				   ab_ahb->userpd_id);
 	}
 }
-- 
2.51.0



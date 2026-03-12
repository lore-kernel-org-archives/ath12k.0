Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F4CFED2D8
	for <ath12k@archiver.kernel.org>; Thu, 12 Mar 2026 06:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sglTOmIgxqiSg2pa4S19UricgNSYnZS6CWDzr4Dt4Y=; b=mbCSZX/2jNYEHKI9ORm7+cw4dM
	3wFhJaslVMa/LVrPivWAT3hpJFpDVNmuGKzUL84VkKUrETUQHHIZ7lthAb8dSGBd5i7rcA+FwFO7t
	2IoiwildohioRc0g3xi6Ps0fqOOA1s6RPgRFGS+40AFsSQDjErpKmSUt8W9QnHr+yljENhUNITNY5
	3zhILYCjf03Kaeuj6/FF1Nhscczg2wKQka45adB0XTJQOl/AADouTWnluyrVj7ldP18wtyhdCO7n2
	T6tvsDmoL4kwbHufw7GwtvqIkrUhgjGb9XfCs06JEsLKp9AImm9TQi9NijOg/03zjAPQK6ApZiuem
	xpn6kusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZZr-0000000DTKJ-0vC8;
	Thu, 12 Mar 2026 06:31:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZZo-0000000DTJ9-1wRg
	for ath12k@lists.infradead.org;
	Thu, 12 Mar 2026 06:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B3C343444;
	Thu, 12 Mar 2026 06:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA66C4CEF7;
	Thu, 12 Mar 2026 06:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773297079;
	bh=D/Vhw6leBBqAFpkgVNj90UXMmK8u4Tind9kuebFv7yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wtyi/+kjypF2TTn6+FB0hU2PCBr+u+59PsgP65OEtzu0Tw2zcVV9J/dDjgFR0YJ3O
	 VXQdkf0pP17JcZ/e93DShfgy9vyiZCyt0pm1CwCmSPLRFRaLFzsOxRKX8SSIJvwAKb
	 OmY1ieFCLTHPW2KuruU/lEtE4Cxn56I3CwwBKh0a2G2IBmA0GJh/FhTxu/KYCp7Mvn
	 Rs4vSgT7wXB27Mlqv4NCfj9Lhf3+ZChhLN4i2NWNJLhqjbDmnKt7vBR0IapclcpV8t
	 AR2GnmWsAcMRxonOXcsSSNOo8bRazpM0JKpLCR4Q4xZVOXpXOTiYnR27lgZDHrREZF
	 TGhDLcpzLuo0w==
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
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2 11/15] media: qcom: Switch to generic PAS TZ APIs
Date: Thu, 12 Mar 2026 11:57:52 +0530
Message-ID: <20260312062756.694390-12-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260312062756.694390-1-sumit.garg@kernel.org>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_233120_575390_12CEB7C5 
X-CRM114-Status: GOOD (  11.13  )
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

Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
TZ service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

Along with that pass proper PAS ID to set_remote_state API. As per testing
the SCM backend just ignores it while OP-TEE makes use of it to for proper
book keeping purpose.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c |  9 +++++----
 drivers/media/platform/qcom/venus/firmware.c     | 11 ++++++-----
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..856fa6a79064 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/firmware.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
@@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
@@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+			qcom_pas_shutdown(core->iris_platform_data->pas_id);
 			return ret;
 		}
 	}
@@ -103,10 +104,10 @@ int iris_fw_load(struct iris_core *core)
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	return qcom_pas_shutdown(core->iris_platform_data->pas_id);
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
 {
-	return qcom_scm_set_remote_state(resume, 0);
+	return qcom_pas_set_remote_state(resume, core->iris_platform_data->pas_id);
 }
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 1de7436713ed..3c0727ea137d 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -12,6 +12,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/of_device.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/sizes.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 	int ret;
 
 	if (core->use_tz) {
-		ret = qcom_scm_set_remote_state(resume, 0);
+		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
 		if (resume && ret == -EINVAL)
 			ret = 0;
 		return ret;
@@ -218,7 +219,7 @@ int venus_boot(struct venus_core *core)
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
-	    (core->use_tz && !qcom_scm_is_available()))
+	    (core->use_tz && !qcom_pas_is_available()))
 		return -EPROBE_DEFER;
 
 	ret = of_property_read_string_index(dev->of_node, "firmware-name", 0,
@@ -236,7 +237,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_scm_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
@@ -259,7 +260,7 @@ int venus_boot(struct venus_core *core)
 						     res->cp_nonpixel_start,
 						     res->cp_nonpixel_size);
 		if (ret) {
-			qcom_scm_pas_shutdown(VENUS_PAS_ID);
+			qcom_pas_shutdown(VENUS_PAS_ID);
 			dev_err(dev, "set virtual address ranges fail (%d)\n",
 				ret);
 			return ret;
@@ -274,7 +275,7 @@ int venus_shutdown(struct venus_core *core)
 	int ret;
 
 	if (core->use_tz)
-		ret = qcom_scm_pas_shutdown(VENUS_PAS_ID);
+		ret = qcom_pas_shutdown(VENUS_PAS_ID);
 	else
 		ret = venus_shutdown_no_tz(core);
 
-- 
2.51.0



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6ACCD4F48
	for <ath12k@archiver.kernel.org>; Mon, 18 May 2026 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Koe4TJzWg2asXmLy5XOOuG7fprfyoVUWn3Q6LyVcPvs=; b=gB/VfXZaz3nl5UFQ6maS8ltDU6
	C6m2xDN4XohfnuTvAdQzyuUtmPcETjwncRin7Ddvn8l+NwZoa4NMHQIKdwY1s5ohmqQpDoCQ1Mvnf
	Nykf5ZteXPKXg3uIHZMU+2HDPhWcqeaN4q575sZpcQ6U4YMT1+ckfPivHLhX/1YKe8vPV1Z85Qk1i
	X7GwT0QPKZNHBIOgnGt1cP4qQpyaveizQN8sHyRMjSAFJ4deBn+3pCJeH9SrY/S00Fgk4qxc8c4Ux
	561aRJxzx6T8I2gaV00dmwHmkFiWZa8gCIKSh7K8lzroCUWmopxSU3vZd1CzRyzDqcNmea0o8NarZ
	XKKY1c4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsSM-0000000Ec1l-22HO;
	Mon, 18 May 2026 07:32:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsSL-0000000Ec0r-0IFq
	for ath12k@lists.infradead.org;
	Mon, 18 May 2026 07:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 827226001A;
	Mon, 18 May 2026 07:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085DCC2BCC6;
	Mon, 18 May 2026 07:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779089524;
	bh=fecL5eQtvB+C6kWZlwxXPlCU+nCBTK4EF4T+n32bA0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OTEQ4v8YXtex+T6KGBC/jMcuEjdVMwny0tZiPCbR1b/S3pwwmEGlwQegLuTBTHDr6
	 mwXWbVi8Ww7dOEDbYGRNAWJDIT9+ieFhNr+atzpXnqdKatfjIBm3xZ/azXI1LLk3y2
	 6ST3YrpYtPJxKzCk37Vwz6rMv3NlOAImFGNM4Htz/81NGi6N33Wyi+ziuasrKELNS4
	 0C8JjhtXqnVab1E6TqI/DWbjF0D4mCfn3JsmygBHV4qo9sejRQ8ZiLqOF4Mo3sVmSl
	 /7YbOd1DloiMHXROZGKBl9vOl5bS/z32MLf6F8hP/tFEHw2VJIFrXm9Av3rvu11u7C
	 HWA1jXps0OJeA==
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
Subject: [PATCH v6 11/16] media: qcom: Switch to generic PAS TZ APIs
Date: Mon, 18 May 2026 12:58:51 +0530
Message-ID: <20260518072856.22790-12-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260518072856.22790-1-sumit.garg@kernel.org>
References: <20260518072856.22790-1-sumit.garg@kernel.org>
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

Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
TZ service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig      | 25 ++++++++++---------
 .../media/platform/qcom/iris/iris_firmware.c  |  9 ++++---
 drivers/media/platform/qcom/venus/Kconfig     |  1 +
 drivers/media/platform/qcom/venus/firmware.c  | 11 ++++----
 4 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 5498f48362d1..a3873bb6710b 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -1,13 +1,14 @@
 config VIDEO_QCOM_IRIS
-        tristate "Qualcomm iris V4L2 decoder driver"
-        depends on VIDEO_DEV
-        depends on ARCH_QCOM || COMPILE_TEST
-        select V4L2_MEM2MEM_DEV
-        select QCOM_MDT_LOADER
-        select QCOM_SCM
-        select VIDEOBUF2_DMA_CONTIG
-        help
-          This is a V4L2 driver for Qualcomm iris video accelerator
-          hardware. It accelerates decoding operations on various
-          Qualcomm SoCs.
-          To compile this driver as a module choose m here.
+	tristate "Qualcomm iris V4L2 decoder driver"
+	depends on VIDEO_DEV
+	depends on ARCH_QCOM || COMPILE_TEST
+	select V4L2_MEM2MEM_DEV
+	select QCOM_MDT_LOADER
+	select QCOM_SCM
+	select QCOM_PAS
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  This is a V4L2 driver for Qualcomm iris video accelerator
+	  hardware. It accelerates decoding operations on various
+	  Qualcomm SoCs.
+	  To compile this driver as a module choose m here.
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..b3c5281aea91 100644
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
+	return qcom_pas_set_remote_state(resume, 0);
 }
diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
index 63ee8c78dc6d..7997b8aa427a 100644
--- a/drivers/media/platform/qcom/venus/Kconfig
+++ b/drivers/media/platform/qcom/venus/Kconfig
@@ -6,6 +6,7 @@ config VIDEO_QCOM_VENUS
 	select OF_DYNAMIC if ARCH_QCOM
 	select QCOM_MDT_LOADER
 	select QCOM_SCM
+	select QCOM_PAS
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	help
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 1de7436713ed..3a38ff985822 100644
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
+		ret = qcom_pas_set_remote_state(resume, 0);
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



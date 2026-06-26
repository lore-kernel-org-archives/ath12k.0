Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA472C43458
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRhsHmDSC+nUyHjBqwLvQnddRKtRccBKFkCZ7EBUMK4=; b=sUok5kFQfy7kn5hZMsh7RmLvss
	RAyP5Xk+tampTI7NJRupPF8/VToO2C3Ro5Amn2GORFGqcneVlBF5rZLVAp6P9483GhjV5KTDfLwvZ
	jv+VAJzbRe51rR22Hw0RRTWXuY05vsOHF9ZnXsu5/v+/3KY833FKoh0fVwHYN82jnVcVhnIzebT8i
	WyhvJm5TqH5FECHAS1bdi+8MHAcSfjK3T9p+yuyu4Nl6AHwyb5qMME8kR16ffn7yM5PWPNmfEBS7T
	iFE9HjInTuL/gcut8InIUGmBWcjLA6ei4gxAxpBjtywN/aVNtg4uQNp8ZwkDvsifoaloZPi6MIQUk
	Evl0qB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6kO-0000000BOQL-2xx4;
	Fri, 26 Jun 2026 13:37:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6kN-0000000BOQ3-0adG
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 13:37:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83772600D8;
	Fri, 26 Jun 2026 13:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4691F000E9;
	Fri, 26 Jun 2026 13:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782481050;
	bh=tRhsHmDSC+nUyHjBqwLvQnddRKtRccBKFkCZ7EBUMK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M70+lvzrteuYso3nYNP3YM0NiHPZo8WNwO7GyzdAZ244v3SGjdklVIoqeVO7GSg6g
	 xps5obAABpdVZrPdejPX6KoT4Ik5WpE24G9zYn5e/12lSPmugSwwsH03yQ+R8apQIr
	 SpC+VDEaddihPlqeiIbCG/ApRzkTxLe6CsDpiKRG+NNw1gAgcw7PiMFxsh7Q+nKUhK
	 jNcBWWgx0crxtFbgy3xd30vt7nycPqe7MQ2CdwU44ZLNLIhvFRqP85sIv8iFp90fQq
	 6StKBfJ+VP/87w/YPVuRrUBpyVjm+7Ee8jot73ihTD5RBgfTkE/gSvs/iHEkYaE9Af
	 TXRd/2RrVcFIA==
From: Sumit Garg <sumit.garg@kernel.org>
To: andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 04/14] remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
Date: Fri, 26 Jun 2026 19:04:24 +0530
Message-ID: <20260626133440.692849-5-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626133440.692849-1-sumit.garg@kernel.org>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
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

Switch qcom_q6v5_pas client driver over to generic PAS TZ APIs. Generic PAS
TZ service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

Since qcom_q6v5_pas depends on MDT loader for PAS firmware loading, it
has to be switched over to generic PAS APIs in this commit to avoid any
build issues.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c  | 51 +++++++++++++++--------------
 drivers/soc/qcom/mdt_loader.c       | 12 +++----
 include/linux/soc/qcom/mdt_loader.h |  6 ++--
 3 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 808e9609988d..9eb1c4f6c2ab 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
@@ -115,8 +116,8 @@ struct qcom_pas {
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 
-	struct qcom_scm_pas_context *pas_ctx;
-	struct qcom_scm_pas_context *dtb_pas_ctx;
+	struct qcom_pas_context *pas_ctx;
+	struct qcom_pas_context *dtb_pas_ctx;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -193,7 +194,7 @@ static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
 
 	do {
 		msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
-		ret = qcom_scm_pas_shutdown(pas->pas_id);
+		ret = qcom_pas_shutdown(pas->pas_id);
 	} while (ret == -EINVAL && --retry_num);
 
 	return ret;
@@ -209,9 +210,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	 * auth_and_reset() was successful, but in other cases clean it up
 	 * here.
 	 */
-	qcom_scm_pas_metadata_release(pas->pas_ctx);
+	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+		qcom_pas_metadata_release(pas->dtb_pas_ctx);
 
 	return 0;
 }
@@ -225,9 +226,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	pas->firmware = fw;
 
 	if (pas->lite_pas_id)
-		qcom_scm_pas_shutdown(pas->lite_pas_id);
+		qcom_pas_shutdown(pas->lite_pas_id);
 	if (pas->lite_dtb_pas_id)
-		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
+		qcom_pas_shutdown(pas->lite_dtb_pas_id);
 
 	if (pas->dtb_pas_id) {
 		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
@@ -247,7 +248,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+	qcom_pas_metadata_release(pas->dtb_pas_ctx);
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
@@ -307,7 +308,7 @@ static int qcom_pas_start(struct rproc *rproc)
 		if (ret)
 			goto disable_px_supply;
 
-		ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
+		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
 		if (ret) {
 			dev_err(pas->dev,
 				"failed to authenticate dtb image and release reset\n");
@@ -326,7 +327,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	if (ret)
 		goto release_pas_metadata;
 
-	ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
+	ret = qcom_pas_prepare_and_auth_reset(pas->pas_ctx);
 	if (ret) {
 		dev_err(pas->dev,
 			"failed to authenticate image and release reset\n");
@@ -336,13 +337,13 @@ static int qcom_pas_start(struct rproc *rproc)
 	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
 		dev_err(pas->dev, "start timed out\n");
-		qcom_scm_pas_shutdown(pas->pas_id);
+		qcom_pas_shutdown(pas->pas_id);
 		goto unmap_carveout;
 	}
 
-	qcom_scm_pas_metadata_release(pas->pas_ctx);
+	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+		qcom_pas_metadata_release(pas->dtb_pas_ctx);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -352,9 +353,9 @@ static int qcom_pas_start(struct rproc *rproc)
 unmap_carveout:
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
-	qcom_scm_pas_metadata_release(pas->pas_ctx);
+	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+		qcom_pas_metadata_release(pas->dtb_pas_ctx);
 
 unmap_dtb_carveout:
 	if (pas->dtb_pas_id)
@@ -403,7 +404,7 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (ret == -ETIMEDOUT)
 		dev_err(pas->dev, "timed out on wait\n");
 
-	ret = qcom_scm_pas_shutdown(pas->pas_id);
+	ret = qcom_pas_shutdown(pas->pas_id);
 	if (ret && pas->decrypt_shutdown)
 		ret = qcom_pas_shutdown_poll_decrypt(pas);
 
@@ -411,7 +412,7 @@ static int qcom_pas_stop(struct rproc *rproc)
 		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
 
 	if (pas->dtb_pas_id) {
-		ret = qcom_scm_pas_shutdown(pas->dtb_pas_id);
+		ret = qcom_pas_shutdown(pas->dtb_pas_id);
 		if (ret)
 			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
 
@@ -481,11 +482,11 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	 *
 	 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
 	 * or not and if it is not having then we pass NULL and zero as input resource
-	 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
+	 * table pointer and size respectively to the argument of qcom_pas_get_rsc_table()
 	 * and this is even true for Qualcomm remote processor who does follow remoteproc
 	 * framework.
 	 */
-	output_rt = qcom_scm_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt_size);
+	output_rt = qcom_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt_size);
 	ret = IS_ERR(output_rt) ? PTR_ERR(output_rt) : 0;
 	if (ret) {
 		dev_err(pas->dev, "Error in getting resource table: %d\n", ret);
@@ -743,7 +744,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
-	if (!qcom_scm_is_available())
+	if (!qcom_pas_is_available())
 		return -EPROBE_DEFER;
 
 	fw_name = desc->firmware_name;
@@ -835,16 +836,16 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
 
-	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
-						       pas->mem_phys, pas->mem_size);
+	pas->pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->pas_id,
+						   pas->mem_phys, pas->mem_size);
 	if (IS_ERR(pas->pas_ctx)) {
 		ret = PTR_ERR(pas->pas_ctx);
 		goto remove_ssr_sysmon;
 	}
 
-	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
-							   pas->dtb_mem_phys,
-							   pas->dtb_mem_size);
+	pas->dtb_pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->dtb_pas_id,
+						       pas->dtb_mem_phys,
+						       pas->dtb_mem_size);
 	if (IS_ERR(pas->dtb_pas_ctx)) {
 		ret = PTR_ERR(pas->dtb_pas_ctx);
 		goto remove_ssr_sysmon;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c004d444d698..137992456b71 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -13,7 +13,7 @@
 #include <linux/firmware.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -229,7 +229,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
 
 static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
-			       struct qcom_scm_pas_context *ctx)
+			       struct qcom_pas_context *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -271,7 +271,7 @@ static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		goto out;
 	}
 
-	ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len, ctx);
+	ret = qcom_pas_init_image(pas_id, metadata, metadata_len, ctx);
 	kfree(metadata);
 	if (ret) {
 		/* Invalid firmware metadata */
@@ -280,7 +280,7 @@ static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	}
 
 	if (relocate) {
-		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
+		ret = qcom_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
 		if (ret) {
 			/* Unable to set up relocation */
 			dev_err(dev, "error %d setting up firmware %s\n", ret, fw_name);
@@ -472,7 +472,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * firmware segments (e.g., .bXX files). Authentication of the segments done
  * by a separate call.
  *
- * The PAS context must be initialized using qcom_scm_pas_context_init()
+ * The PAS context must be initialized using devm_qcom_pas_context_alloc()
  * prior to invoking this function.
  *
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
@@ -483,7 +483,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
+int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
 {
 	int ret;
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 82372e0db0a1..142409555425 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -10,7 +10,7 @@
 
 struct device;
 struct firmware;
-struct qcom_scm_pas_context;
+struct qcom_pas_context;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
@@ -20,7 +20,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base);
 
-int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
+int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
 
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
@@ -45,7 +45,7 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
+static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
 				    void *mem_region, phys_addr_t *reloc_base)
 {
-- 
2.53.0



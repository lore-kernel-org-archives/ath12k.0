Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B095CD5BB1
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 12:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjXwJqwWyv3Rk5OaDq24BXThTX1dvi6g0LZf0i73ehs=; b=w5/e/bzQpbFepxRZYX3Wn4UOh2
	DoqO9l/OmARq90E4JeUXkUZyPugVUa23wM8CZgJwlk07YljtqkqgGrQsjPwj/x0a5ou4rwUyiA68X
	fEvS0Wj+3Ttiw5Cx7x+8aU7m8xHy0vFHNvAHwlIEkRCBHBL01W9PHP/zMz4uKkXKbJz0fSQaYlXJy
	pAIGV3QtYWV2BY2qfiTr24dPpTOIaJ0AXUQT6EgaWg/5KioF145eNc+b4DHtBWNLVHDU9ueH+pnTX
	1LGW4ooJ6TVWy+QuWfxASYGIzReFpf2+IQHSV7oKQHta8H1Ab/L+1NO8w1gaXfZztkA0zLp1j4JaV
	B+BP6k1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOaG-0000000Ai0Y-3aAb;
	Fri, 22 May 2026 12:02:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOaD-0000000Ahyf-2T0i
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 12:02:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ED6743F67;
	Fri, 22 May 2026 12:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA2A1F000E9;
	Fri, 22 May 2026 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779451349;
	bh=zjXwJqwWyv3Rk5OaDq24BXThTX1dvi6g0LZf0i73ehs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jlaA9RLg2KXb1lnRiobJ881MP8Y2UNeRCWFUX0gwy4AnrNaD/nz2R6KKoz/cRa4b4
	 sfMDPMztQzWar2GvNGrzLSwudmXUIiqSPSeJRSbcinG3ApNpGbjPU9r7CpdKjg+Qbx
	 Wx/NgbEEmmqS4MMF2QZ93tkYMxQ3LOu0uVzpAAl8R72SYg5Hq/mkWRiaYh8eXHWDzn
	 qq4H2TuzUS/C0CGq0FMg7n5BZmBwD2us082jEeJbPHBcEcd22BXpfKUrhhw67Oi7R1
	 iLdfL0e+V+BeGWOQwwk4ufhTnk4rSULL/2whMOgt29ba8TpHQB54uDLNtCBQsc341s
	 Nuc5k8pdUvIxw==
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
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 09/15] drm/msm: Switch to generic PAS TZ APIs
Date: Fri, 22 May 2026 17:29:30 +0530
Message-ID: <20260522115936.201208-10-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260522115936.201208-1-sumit.garg@kernel.org>
References: <20260522115936.201208-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_050229_669515_7ECCAB05 
X-CRM114-Status: GOOD (  13.62  )
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

Switch drm/msm client drivers over to generic PAS TZ APIs. Generic PAS
TZ service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig             |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++-----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 250246f81ea9..09469d56513b 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -21,6 +21,7 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
+	select QCOM_PAS
 	select QCOM_UBWC_CONFIG
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 79acae11154a..b556da823897 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -5,7 +5,7 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/cpumask.h>
-#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/pm_opp.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/slab.h>
@@ -653,7 +653,7 @@ static int a5xx_zap_shader_resume(struct msm_gpu *gpu)
 	if (adreno_is_a506(adreno_gpu))
 		return 0;
 
-	ret = qcom_scm_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
+	ret = qcom_pas_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
 	if (ret)
 		DRM_ERROR("%s: zap-shader resume failed: %d\n",
 			gpu->name, ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 66f80f2d12f9..6d68edf0578c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -8,6 +8,7 @@
 
 #include <linux/ascii85.h>
 #include <linux/interconnect.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
 #include <linux/of_reserved_mem.h>
@@ -146,10 +147,10 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		goto out;
 
 	/* Send the image to the secure world */
-	ret = qcom_scm_pas_auth_and_reset(pasid);
+	ret = qcom_pas_auth_and_reset(pasid);
 
 	/*
-	 * If the scm call returns -EOPNOTSUPP we assume that this target
+	 * If the pas call returns -EOPNOTSUPP we assume that this target
 	 * doesn't need/support the zap shader so quietly fail
 	 */
 	if (ret == -EOPNOTSUPP)
@@ -175,9 +176,9 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	if (!zap_available)
 		return -ENODEV;
 
-	/* We need SCM to be able to load the firmware */
-	if (!qcom_scm_is_available()) {
-		DRM_DEV_ERROR(&pdev->dev, "SCM is not available\n");
+	/* We need PAS to be able to load the firmware */
+	if (!qcom_pas_is_available()) {
+		DRM_DEV_ERROR(&pdev->dev, "Qcom PAS is not available\n");
 		return -EPROBE_DEFER;
 	}
 
-- 
2.51.0



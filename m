Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B6EC43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCejPFH6P1HmrWkN4qRLjhA4j8pbccgUzz87LFYWmyw=; b=Ux1VeJ7Patq3BNKhmZhyNCdI6x
	rcywNHONomRdrWLbB1Ga0IFAlQpt2Ycj4cN3OPmaMe7xa6KGOHzLWl9qaQl3JDBvCK1GaUpnsO4Yg
	KpGUm65oZ9YbxwZD5aOpze8KslhiMBQ1wGM6RoyX301hqaV80qPfKwwfL0NUgy3HWsff4tSm44TLJ
	PcLsau7TmUte3NoAG6Xh7BGb+6gQRoI2mgWRHs1aVhARj64X0fYMsDZJpwObkiK/zivvHzm4/L2GY
	s+jiFd5nIFqYar/qFQ6OkwdLxJ0ezcnok3FcIg9aYb80t6bxbX+i9Qj/u916LgiWn0GwHCZgXp+bF
	hDlYTSVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG6q-00000004OET-0Cfa;
	Thu, 02 Jul 2026 12:01:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG6l-00000004OBY-2zDt
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 12:01:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7738F433A4;
	Thu,  2 Jul 2026 12:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDB11F000E9;
	Thu,  2 Jul 2026 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782993691;
	bh=iCejPFH6P1HmrWkN4qRLjhA4j8pbccgUzz87LFYWmyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MwqJOzWxUJMb62WIz9iuaSTYadDOy10ZOpkQP4erRwvh4V9Iw2azlVnHy8tCnM/mT
	 TelUShcP7tI22DP30G4q1U9nG9VPAe2BlCNVIJTADF0tZVNDArgq3RscbLLSW/cxAR
	 jHfrRlqicLJlzbSCEABekeZtNmjd9H42I/rTsjBZ9vhX0+/42HTCFaATBKsELuBPp3
	 IFkRM89BDnB8M6kSwz0OTPNejsJCGfpz/kscw9qyAEhrthtLnP7kPLPjccW/vwHqjy
	 eLnd7KZzVXZZfVpqZm7sHNvSru5hbwKlreZoNO75zvA5TGgPQl/bPaoXVc4D7rOFkg
	 9wPCpRvGop7JA==
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
	jenswi@kernel.org,
	op-tee@lists.trustedfirmware.org,
	apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v9 10/14] media: qcom: Pass proper PAS ID to set_remote_state API
Date: Thu,  2 Jul 2026 17:28:26 +0530
Message-ID: <20260702115835.167602-11-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702115835.167602-1-sumit.garg@kernel.org>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
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

As per testing the SCM backend just ignores it while OP-TEE makes
use of it to for proper book keeping purpose.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
 drivers/media/platform/qcom/venus/firmware.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index ea9654dd679e..d2e7ba4f37e3 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -110,5 +110,5 @@ int iris_fw_unload(struct iris_core *core)
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
 {
-	return qcom_pas_set_remote_state(resume, 0);
+	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
 }
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..3c0727ea137d 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 	int ret;
 
 	if (core->use_tz) {
-		ret = qcom_pas_set_remote_state(resume, 0);
+		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
 		if (resume && ret == -EINVAL)
 			ret = 0;
 		return ret;
-- 
2.53.0



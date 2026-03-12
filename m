Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85195FED2D1
	for <ath12k@archiver.kernel.org>; Thu, 12 Mar 2026 06:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXfc9HWM/sCs2RO3Mk/sz8M+uzaG5PLzmSU82LE87Og=; b=uEkRVZLMO0/25Dh7dQ8d5Hr2ZZ
	YnFsLA1bCUHdcA9PDwiP0rX571ViSfYmAwVCKeprhzIbYXEy+BYwN3DYusaTyukPia2NtS2mrMysq
	8/Alpo6paLpwmkFLCs30fODfLvggenv0iO/uDsPQvKGV2AUIAH/tTBpA5hQMXbAsA47Q/7p2BrPtN
	j9xnla/IiEiEY4vpC4Xny7mdUtkR0ViZ8XEMLf3PSwryPZugyz9BlbATqZo/SMPkUPdrazcgvlYRB
	aE8Sz0CuDoWOgOWXGAYtGpCqmRTOlxvBt8hcDsnAH3miO5x8RojMKlwz22UzVM1hx0igVcO4g2u7y
	7UPy8u3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZZK-0000000DT2g-0sJa;
	Thu, 12 Mar 2026 06:30:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZZI-0000000DT1h-2QV7
	for ath12k@lists.infradead.org;
	Thu, 12 Mar 2026 06:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E22F160054;
	Thu, 12 Mar 2026 06:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCF7C4AF09;
	Thu, 12 Mar 2026 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773297047;
	bh=+WPauxWCOutLzKrZffBXMMITweY/oTZZzgDQTHSVJK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2PZMDy1DnDnL/cFxTNim4OOAk8ACgOblXvZM0g5M9szw/8ayW73FfUnEUo2UQYKW
	 s5Dq1lAm7nPY1OpQHbb7+yTzr2hlkTaIyw03YQfgekSTDfXQlM6vS8Cfc0tH4mIx5o
	 1ka+BQ+B0+qMU3an4ZCsVtqC9Kd22D6I+QxpZmSyXyGP14siteCguaa01Y5TUbgb5D
	 2jrBdFpZ/AWwvCx1Cji0DY0q1KKhkr9YSRkqDdiUoBl4ZLEWCeeOhuIv4TetsspBZm
	 4kdgfbiE7rQLLabzwB7suAodPKcIOFVSZ5Et/RAEkBPXa2XGKALC+0OvHdAAdJOueZ
	 yOLmefPL7PoNg==
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
Subject: [PATCH v2 09/15] remoteproc: qcom: Select QCOM_PAS_TEE service backend
Date: Thu, 12 Mar 2026 11:57:50 +0530
Message-ID: <20260312062756.694390-10-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260312062756.694390-1-sumit.garg@kernel.org>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
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

Select PAS TEE service backend driver for the generic PAS service to
enable support for OP-TEE based PAS service.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/remoteproc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index ee54436fea5a..0411a38530d8 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -230,6 +230,7 @@ config QCOM_Q6V5_PAS
 	select QCOM_Q6V5_COMMON
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
+	select QCOM_PAS_TEE
 	help
 	  Say y here to support the TrustZone based Peripheral Image Loader for
 	  the Qualcomm remote processors. This is commonly used to control
-- 
2.51.0



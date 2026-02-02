Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF2EE7DEF4
	for <ath12k@archiver.kernel.org>; Mon,  2 Feb 2026 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VUARgzGPJhRK4HrRb+3HfBCK/Wz2+3KoUtSkwanfWJY=; b=qacCKX/czJc62dnHnLodJd89/g
	N21i0ntRcPXHUH928lxjWtwHk74LksS1lfQOq3fy5TQl9715eSaBcxC2yGlB74VTcDpsVMOfkb0VQ
	YGRonlilEyik74dPxsStLPgKIfyganCC3ggmPJubj3Lvim3KRKCNcOtLNqvi5KXUTVqufDiLS943w
	xwEnTLh9bZ89QvHdDHvUxEHadSY8+a/lVI6PgKFelOkQGF4dqVtpxOxRNqQF40FNs0V/16JF8TgTq
	SQkj+2y/R8Pzoq9KBUdILLTTU9UInMlNnozP8hElr7lyw5/peMcmSAQZSQmDrAiFtDy+x1RBWnr/w
	B4hLLGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvgA-00000005AxD-2dtY;
	Mon, 02 Feb 2026 15:17:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvg8-00000005Awq-2ysm
	for ath12k@lists.infradead.org;
	Mon, 02 Feb 2026 15:17:29 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-823210d1d8eso2297740b3a.1
        for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 07:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770045447; x=1770650247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUARgzGPJhRK4HrRb+3HfBCK/Wz2+3KoUtSkwanfWJY=;
        b=dD0TTKXNHYKBtHQ/NziFtZxhL7/QmaDnNMWbS5j2TiMI9I0pLgjXcXp1bHus4OoiH0
         19JrDzEewe8ZC4aWNyhhQkfIE9BX/BvDo+JMuIN+2Mkj+nDDsxrbunEmQelDJBUQcv3L
         Xe+8I3R+LEqeBD3AM2pwEA2huSg5OreLk7/xyRIvywNL6rgScWCIRO+ylC9YunNEen68
         7+wFGcw1He/8Af3upzh3mq20if/sMkRFskQS7cEqkooqGJGhrlgx8ocg0NA0LWRWHw9H
         pTjeIxZIToWW0Q3CKSWs+OR/uYclKg7Z/Yj6harVVGTD0GxYt7CEWeVbKz0A09vq3WB4
         ohbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045447; x=1770650247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUARgzGPJhRK4HrRb+3HfBCK/Wz2+3KoUtSkwanfWJY=;
        b=wG16VJyibkRL+tvY7oi15hKxFFyofBpRC/HiRMIMH2Tui8bdY0O4JibrDV6lMPRKl9
         P1wMPizZ2ydm/0A98gKj++qTqzxFCojiQWAeIIVVsXm41cwYZEuC3oldi7u2XfxNcHFi
         5FCFe/4b04a6xi/u690HcbtL+4M2v5jUQBLbHGAPR9LrvC5Zl6EA75KkJCSwYf8LFU1r
         lhUZmaXyYJX32jsQF1uyGgef56Vvx2TsnUp+p2Z63IhfG3ifqAuk6n35T5yilNaahuaG
         8co7s25znhm3x5yOHh7ix+5rGjZnZPOlCnMJyBq2wG/J+ZY0VdBopsLjdY9+WxFqOnOL
         CfBg==
X-Forwarded-Encrypted: i=1; AJvYcCV5adNKJwFvIWbRJFRJ2MgTqeYx291FFfwGSIwUnN5s2iItBSXehoLvzX4nOnExJ+w//tRPSc0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAD4EcW0b2zwD/PW1UE4GuFCJsdlt90DI9ABwYcCLg2gf+hjx1
	FUj5mgDUEozuliGT8H7Anb/zqkvO2Yud9AbsH/IPksV3x9jTXSVUrcPT
X-Gm-Gg: AZuq6aJTRjr6xfzAjILkljuSwdi0HYQEfNVGLqpfCN9oKXsqzuHwZhEEkAu6p8Cjgyh
	v/Br1vWUvn3sVWqIBUcQfaxUPmVGqTjkIN6bG8xPHtjMZ2ixdHKPA20MTiDpBkBiSDmOm3oQaGr
	kohOHSxUK09YouEF1CoN528eGX+3paSPAw3rP0fqk8JVt6m8dCZecdLfINGwfm3FMqZrGZqg5op
	mjNTfNQTbHU+zuvKE4p17o2kb00ktGoKrsWaADiA1nh74hNvJ2W/0f07ZQazY0udzZWLsZfPTSF
	Kg0swJtXvGLq3KqAdru/pLySxhSREDfpWtAmTD9dXgKhzOKzNqKyixEPEQBJNltXcGrnzP95N/K
	UhXxzijUw8GAVDfxZdK9KEc6FaQkrkuDSP6M5Ao44fmANrVXIyD0icZLM57ujAeanouR1lKZU17
	Kj3aQsihGSOpr5pLApNHxqGRLazJbT+HQf4A==
X-Received: by 2002:a05:6a00:3026:b0:7e8:4471:ae6d with SMTP id d2e1a72fcca58-823aa7376d1mr11367711b3a.57.1770045447289;
        Mon, 02 Feb 2026 07:17:27 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:6b:a50d:4972:6cd4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b58f38sm16843432b3a.24.2026.02.02.07.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:17:26 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: jjohnson@kernel.org,
	kvalo@kernel.org
Cc: quic_bqiang@quicinc.com,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] wifi: ath12k: fix CMA error and MHI state mismatch during resume
Date: Mon,  2 Feb 2026 20:47:20 +0530
Message-ID: <20260202151720.49904-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_071728_748427_3E01E060 
X-CRM114-Status: GOOD (  14.04  )
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

Commit 8d5f4da8d70b ("wifi: ath12k: support suspend/resume") introduced
system suspend/resume support but caused a critical regression where
CMA pages are corrupted during resume.

1. CMA page corruption:
   Calling mhi_unprepare_after_power_down() during suspend (via
   ATH12K_MHI_DEINIT) prematurely frees the fbc_image and rddm_image
   DMA buffers. When these pages are accessed during resume, the kernel
   detects corruption (Bad page state).

To fix this corruption, the driver must skip ATH12K_MHI_DEINIT during
suspend, preserving the DMA buffers. However, implementing this fix
exposes a second issue in the state machine:

2. Resume failure due to MHI state mismatch:
   When DEINIT is skipped during suspend to protect the memory, the
   ATH12K_MHI_INIT bit remains set. On resume, ath12k_mhi_start()
   blindly attempts to set INIT again, but the state machine rejects
   the transition:

   ath12k_wifi7_pci ...: failed to set mhi state INIT(0) in current
   mhi state (0x1)

Fix the corruption and enable the correct suspend flow by:

1. In ath12k_mhi_stop(), skipping ATH12K_MHI_DEINIT if suspending.
   This prevents the memory corruption by keeping the device context
   valid (MHI_POWER_OFF_KEEP_DEV).

2. In ath12k_mhi_start(), checking if MHI_INIT is already set.
   This accommodates the new suspend flow where the device remains
   initialized, allowing the driver to proceed directly to POWER_ON.

Tested with suspend/resume cycles on Qualcomm Snapdragon X Elite
(SC8380XP) with WCN7850 WiFi. No CMA corruption observed, WiFi resumes
successfully, and deep sleep works correctly.

Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 45c0f66dcc5e..1a0b3bcc6bbf 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -485,9 +485,14 @@ int ath12k_mhi_start(struct ath12k_pci *ab_pci)
 
 	ab_pci->mhi_ctrl->timeout_ms = MHI_TIMEOUT_DEFAULT_MS;
 
-	ret = ath12k_mhi_set_state(ab_pci, ATH12K_MHI_INIT);
-	if (ret)
-		goto out;
+	/* In case of suspend/resume, MHI INIT is already done.
+	 * So check if MHI INIT is set or not.
+	 */
+	if (!test_bit(ATH12K_MHI_INIT, &ab_pci->mhi_state)) {
+		ret = ath12k_mhi_set_state(ab_pci, ATH12K_MHI_INIT);
+		if (ret)
+			goto out;
+	}
 
 	ret = ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_ON);
 	if (ret)
@@ -501,16 +506,21 @@ int ath12k_mhi_start(struct ath12k_pci *ab_pci)
 
 void ath12k_mhi_stop(struct ath12k_pci *ab_pci, bool is_suspend)
 {
-	/* During suspend we need to use mhi_power_down_keep_dev()
-	 * workaround, otherwise ath12k_core_resume() will timeout
-	 * during resume.
+	/* During suspend, we need to use mhi_power_down_keep_dev()
+	 * and avoid calling MHI_DEINIT. The deinit frees BHIE tables
+	 * which causes memory corruption when those pages are
+	 * accessed/freed again during resume. We want to keep the
+	 * device prepared for resume, otherwise ath12k_core_resume()
+	 * will timeout.
 	 */
 	if (is_suspend)
 		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_OFF_KEEP_DEV);
 	else
 		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_OFF);
 
-	ath12k_mhi_set_state(ab_pci, ATH12K_MHI_DEINIT);
+	/* Only deinit when doing full power down, not during suspend */
+	if (!is_suspend)
+		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_DEINIT);
 }
 
 void ath12k_mhi_suspend(struct ath12k_pci *ab_pci)
-- 
2.51.0



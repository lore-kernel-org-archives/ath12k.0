Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2BDE6F06A
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 15:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8n2T4DVYNzmd1QXnUwf1o1B+11zjT2gdE7BJ8tp1vE=; b=FBQq/AVwfjmDw/1JOfbH4hgN0s
	2BKxg6SYVnE9mSvSzvt840QGnPp0ApFqYzBzbK6dPE30EZkiPcVT2fdWCAb1PFCpkaN6dXQKF8enQ
	9uMHUY0lf71NOSu6tP3l1Lt7xVBFsWBHyal7Um859cTTh/BZeTdgKQfJr3ERMrLcnPDcXpeK7hTBn
	eeTpwRmg9WEXHhQ4VUiV5xTpbuzHPcwDqMCEyrxV+Pm1am2+F+QtajPHu3YJ0vsFPDon87HMqFqBA
	fes3dzc9B/3B0CiyaP4i7RQTEWmhqYfCB89w94mvEArnVSEvv9Q7SexHeebhnGbfrCKxbwSalESl0
	JfY6s36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOo-00000007TbY-1Rhe
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 15:17:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOn-00000007TaW-1mcd
	for ath12k@bombadil.infradead.org;
	Fri, 01 Nov 2024 15:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y8n2T4DVYNzmd1QXnUwf1o1B+11zjT2gdE7BJ8tp1vE=; b=f+0DiAJikSmy5nUNF1w6RtDtjQ
	lSHPBdxd5jVymi9waW3ANRmSp/y+HFb4GVq5Prj1OFaBTC671f+dyPYtYpLC1djofLwcGVkvDijcr
	IO27BzADhEJp1F46siTSYf+zZRsFufJh39cwe1ZYgJCBS2quL5oA/2o87sjQfa77dMbsboG76Tpgf
	ob96qz/zhZqO22eQsBe0mcdwYGVOYli+urUlXcIp9XPt68LuZup+RNpBLPPyDF9xBYk6QDiQ10RSR
	wFtNUC3dixq3BT8P+vXG9y1h9K6sXwSpbelSNiyh6xcOgmntV3qFkmrP4n1TvPB2BFBfRWI3nrn0N
	uy9Ta2Qg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOk-0000000AkwJ-2B6v
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 15:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7BCCA443C4
	for <ath12k@lists.infradead.org>; Fri,  1 Nov 2024 15:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDB0C4CED2;
	Fri,  1 Nov 2024 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730474231;
	bh=xVqvdvjXVgNemJbHrDvtyzm+RRAz1gCC2ul25/KLpPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P7gFKhgff9b4ItzHa/qm8qESyanuFlDj6o35kXHmFuvmsGc17HSShBSZje0U/PI1/
	 F+4se/cUiUazznBdaz4PUpsOwNudRICoBIyEuunm7T/udpvN0wPc8U+LhOeMFC98Xc
	 Atco4vR/bgHFZrAM+J/TvEmu3ntv923uBmHTsFk+rHEflra6vvqu4bS4uog8PfqrxJ
	 FV/jXrwYRwIvmYDrMWuOZVrokXILACYFKBPV/93pG75qn8Pw511HIPZZnv99XgcpDL
	 92BgkgzjPX2QlDHPDacb8I495XdYRHJQ8JFL7PwaFFfJ7u0WbEns3ezleHZLrkGHcp
	 e2xqgGmtSZFxw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 4/8] wifi: ath12k: introduce ath12k_hw_warn()
Date: Fri,  1 Nov 2024 17:17:01 +0200
Message-Id: <20241101151705.165987-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101151705.165987-1-kvalo@kernel.org>
References: <20241101151705.165987-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_151714_822807_3BB78B22 
X-CRM114-Status: GOOD (  15.57  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

In the following patch we need to use ath12k_warn() but don't easily have
access to struct ath12k_base (ab) but do have access to struct ath12k_hw (ah).
So add a new warning helper ath12_hw_warn() which takes the latter but the log
output is still identical but uses the struct device pointer stored to struct
ath12k_hw.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h  | 2 ++
 drivers/net/wireless/ath/ath12k/debug.c | 6 +++---
 drivers/net/wireless/ath/ath12k/debug.h | 5 ++++-
 drivers/net/wireless/ath/ath12k/mac.c   | 2 ++
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 6faa46b9adc9..9c4e5fae8930 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -684,6 +684,8 @@ struct ath12k {
 
 struct ath12k_hw {
 	struct ieee80211_hw *hw;
+	struct device *dev;
+
 	/* Protect the write operation of the hardware state ath12k_hw::state
 	 * between hardware start<=>reconfigure<=>stop transitions.
 	 */
diff --git a/drivers/net/wireless/ath/ath12k/debug.c b/drivers/net/wireless/ath/ath12k/debug.c
index fe5a732ba9ec..ff6eaeafa092 100644
--- a/drivers/net/wireless/ath/ath12k/debug.c
+++ b/drivers/net/wireless/ath/ath12k/debug.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/vmalloc.h>
@@ -36,7 +36,7 @@ void ath12k_err(struct ath12k_base *ab, const char *fmt, ...)
 	va_end(args);
 }
 
-void ath12k_warn(struct ath12k_base *ab, const char *fmt, ...)
+void __ath12k_warn(struct device *dev, const char *fmt, ...)
 {
 	struct va_format vaf = {
 		.fmt = fmt,
@@ -45,7 +45,7 @@ void ath12k_warn(struct ath12k_base *ab, const char *fmt, ...)
 
 	va_start(args, fmt);
 	vaf.va = &args;
-	dev_warn_ratelimited(ab->dev, "%pV", &vaf);
+	dev_warn_ratelimited(dev, "%pV", &vaf);
 	/* TODO: Trace the log */
 	va_end(args);
 }
diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
index f7005917362c..90e801136bc6 100644
--- a/drivers/net/wireless/ath/ath12k/debug.h
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -31,7 +31,10 @@ enum ath12k_debug_mask {
 
 __printf(2, 3) void ath12k_info(struct ath12k_base *ab, const char *fmt, ...);
 __printf(2, 3) void ath12k_err(struct ath12k_base *ab, const char *fmt, ...);
-__printf(2, 3) void ath12k_warn(struct ath12k_base *ab, const char *fmt, ...);
+__printf(2, 3) void __ath12k_warn(struct device *dev, const char *fmt, ...);
+
+#define ath12k_warn(ab, fmt, ...) __ath12k_warn((ab)->dev, fmt, ##__VA_ARGS__)
+#define ath12k_hw_warn(ah, fmt, ...) __ath12k_warn((ah)->dev, fmt, ##__VA_ARGS__)
 
 extern unsigned int ath12k_debug_mask;
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 354fc21f2af2..9552a9495276 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10192,6 +10192,8 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 			goto err;
 		}
 
+		ah->dev = ab->dev;
+
 		ab->ah[i] = ah;
 	}
 
-- 
2.39.5



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3229CCF538A
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 13:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6OlmaEwmM6yfL/o8IotMFEwhGt40b2LgHfp9GcOms8=; b=D1BweMgUIxdlnM2jgawzdMsI7c
	IgnCzhsdaVxb1VljxId0yQ4E9Ek4KXpeYv2xsrd5YxsjMToXIgwmMH2Q8sl8m08KwxcQxGLMmmEeS
	vYNnVVEkK40PURtLcd7XmuOEGGwnwzLw+ff3Lo/nf6lkZ9lgV/YbgyWLPL6PZfHsSXwlGKPsYm7q8
	zwUy/9jzB3sE91PU05a412Tqutki9F2n/y4KEZ3t+W+hwxwQB3tWPea01NrzuqbQUsKghd3PANlkW
	sgOsXt61AHIEJ7PXrmMLz8/q3fA5nDcgCx7fKxC1UwoCpKNLFNT/1rIeWMxK1vTLrCVGitu8XJao/
	DROGWvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bRI-0000000EY8Z-2nZJ
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 13:30:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bRD-0000000EY4r-45s7
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 13:30:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8C905C5EF7
	for <ath12k@lists.infradead.org>; Wed, 23 Oct 2024 13:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C63FC4CEE4;
	Wed, 23 Oct 2024 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729690211;
	bh=WhqUp89niG73soI3Z+gPZdZCpLv8Zj5caHmZSK60xqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJBJN4aHamrRHWxtdlUm5xRHP3fCAj/hA3O5WxXo6WkossJTgc2Q36qLdFDZln9Wl
	 zJwx0Q0dsmw6P0aTUPu1ZtDarZSAxyLGA8vxLMmimGqqDO6kv4TFxrlRacs5igePka
	 6q+cFxuB7T2sSuXmpm6fHggWMgjIWHWZsr4xQ25oInWYBoFaXenzb4rmyII3L6hhoS
	 QAA+IY9dzrjQfpPStp3Wmw/0btjsZ7Z25eODJbbWQ72xmO7lpqeiJ0aglGZk6ERzuX
	 RxGlVlzBGHfoFrn33byifhm2eRTqHHy4wgsk2kDSFMOoDIIKsKai4SlGkvuqQY70T1
	 QnpyC8GcYCIFQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 4/8] wifi: ath12k: introduce ath12k_hw_warn()
Date: Wed, 23 Oct 2024 16:30:00 +0300
Message-Id: <20241023133004.2253830-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023133004.2253830-1-kvalo@kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_063012_125264_51A8A3BC 
X-CRM114-Status: GOOD (  13.81  )
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
 drivers/net/wireless/ath/ath12k/debug.c | 4 ++--
 drivers/net/wireless/ath/ath12k/debug.h | 5 ++++-
 drivers/net/wireless/ath/ath12k/mac.c   | 2 ++
 4 files changed, 10 insertions(+), 3 deletions(-)

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
index fe5a732ba9ec..c5c8c7624cdb 100644
--- a/drivers/net/wireless/ath/ath12k/debug.c
+++ b/drivers/net/wireless/ath/ath12k/debug.c
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
index 3de6d605cd74..19c445cf52f1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10193,6 +10193,8 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 			goto err;
 		}
 
+		ah->dev = ab->dev;
+
 		ab->ah[i] = ah;
 	}
 
-- 
2.39.5



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A012AC4167B
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snOHBgxAThHp40sCmeHa5+rNwUcGu0XCmM3Bl7Qt9QA=; b=zeVtIQMzQuhlx+
	ZzqBazoAR+A97i5QSz+8zYYqba5KJsuDPDUmYMmHUvBSPaok0eiatJD2dkj8p2ALbD/iKl0sAJAzv
	WVpRp4h2vu/YdJv9EFPpa3ANIdOIO/Xak0LtY+9z4X1LAzC7V2ExxIsa6HAYDG1PEPVrR+Tlhgcev
	d+cUiCn9bN3GyN2497PQKvAuvBZVI10zoQKBvSAqjcnctoFENvzyA270Mgz4102w2JhmcCbrBcSx3
	6RXmZ94CDFXszIF6HM85ndcJ22V6NakIvXZfy3FxzO8qtI6plfBPtp+6xCt6ne9eWivZxP4cFzSCw
	/IosKq4720D6Kgct/gKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRZ-005xfY-24
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:39:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRW-005xdQ-MK
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AFA361EC1
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBC2C433D7;
	Wed, 16 Nov 2022 16:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616758;
	bh=4IoCUrGf0FwbVKzhWv2BPh7LogF1bHxu5TFd/Yrmcz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HXtWoIe1FGY27cl21vVsZ52K5OWOs6mnSzuJ5+rjxDMQR9FgLS4BHnaV6RDrprlbQ
	 qs4Mctglg4u4VBSzbXiTmilRNfWqOFL/qWaUItnUWP3nc52roI/3kEUdHpIjG3ksM+
	 4LSLlBS87wtcamGRuq1vKs36oMjg45e5bxChFeRU3iYxhIQJxqltuvvPjq3c9Synnk
	 1Ugm1+7aFXoaeSGh9ddjDND15joBwyevemCR3YP2AEgGdV+8z9ALFyfc1FLY0TyLGY
	 nbZnhQ+pahMg/EtniOlYvZ7oYgchzvEMCwg4gkly6h9fTEIgA0DjZBVST+WI54zPp0
	 zpFkRKLoqx3eg==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 10/50] wifi: ath12k: add debug.h
Date: Wed, 16 Nov 2022 18:38:22 +0200
Message-Id: <20221116163902.24996-11-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_083918_828258_5E04090A 
X-CRM114-Status: GOOD (  12.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/debug.h | 67 +++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
new file mode 100644
index 000000000000..aa685295f8a4
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _ATH12K_DEBUG_H_
+#define _ATH12K_DEBUG_H_
+
+#include "trace.h"
+
+enum ath12k_debug_mask {
+	ATH12K_DBG_AHB		= 0x00000001,
+	ATH12K_DBG_WMI		= 0x00000002,
+	ATH12K_DBG_HTC		= 0x00000004,
+	ATH12K_DBG_DP_HTT	= 0x00000008,
+	ATH12K_DBG_MAC		= 0x00000010,
+	ATH12K_DBG_BOOT		= 0x00000020,
+	ATH12K_DBG_QMI		= 0x00000040,
+	ATH12K_DBG_DATA		= 0x00000080,
+	ATH12K_DBG_MGMT		= 0x00000100,
+	ATH12K_DBG_REG		= 0x00000200,
+	ATH12K_DBG_TESTMODE	= 0x00000400,
+	ATH12K_DBG_HAL		= 0x00000800,
+	ATH12K_DBG_PCI		= 0x00001000,
+	ATH12K_DBG_DP_TX	= 0x00002000,
+	ATH12K_DBG_DP_RX	= 0x00004000,
+	ATH12K_DBG_ANY		= 0xffffffff,
+};
+
+__printf(2, 3) void ath12k_info(struct ath12k_base *ab, const char *fmt, ...);
+__printf(2, 3) void ath12k_err(struct ath12k_base *ab, const char *fmt, ...);
+__printf(2, 3) void ath12k_warn(struct ath12k_base *ab, const char *fmt, ...);
+
+extern unsigned int ath12k_debug_mask;
+
+#ifdef CONFIG_ATH12K_DEBUG
+__printf(3, 4) void __ath12k_dbg(struct ath12k_base *ab,
+				 enum ath12k_debug_mask mask,
+				 const char *fmt, ...);
+void ath12k_dbg_dump(struct ath12k_base *ab,
+		     enum ath12k_debug_mask mask,
+		     const char *msg, const char *prefix,
+		     const void *buf, size_t len);
+#else /* CONFIG_ATH12K_DEBUG */
+static inline void __ath12k_dbg(struct ath12k_base *ab,
+				enum ath12k_debug_mask dbg_mask,
+				const char *fmt, ...)
+{
+}
+
+static inline void ath12k_dbg_dump(struct ath12k_base *ab,
+				   enum ath12k_debug_mask mask,
+				   const char *msg, const char *prefix,
+				   const void *buf, size_t len)
+{
+}
+#endif /* CONFIG_ATH12K_DEBUG */
+
+#define ath12k_dbg(ar, dbg_mask, fmt, ...)			\
+do {								\
+	typeof(dbg_mask) mask = (dbg_mask);			\
+	if (ath12k_debug_mask & mask)				\
+		__ath12k_dbg(ar, mask, fmt, ##__VA_ARGS__);	\
+} while (0)
+
+#endif /* _ATH12K_DEBUG_H_ */


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B36C4332F
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhBeAf5j8327tNUtq9K741YeKqqPR76S+o3ivWQ0wLg=; b=D7hHfpSHgAqGHd
	atiGKGPb7Wd/yD5/pRG54GDnT4oTYeVk4KXB1brwO8EUtVWsB7IJu3OWaKnscv+PDRnw6qbXLxEA1
	VyvraNJhlYaEVkMOvhOAz3dV+7KHPNogax0Op51NFfxs1suw1RKaH5yjBFVR7pUlJgZlzkUMPC4K7
	A/pB52gNv3TST8X+rcpblxfc5hp/Yr1ikLxLqxsSipKob9KXKaV+oMHrAnCEO+tuarwlhTI7p6Y38
	v6JFxZVqVjmcVGhpYJ+Am+l5MRX0e8G2KMl+T9bHIvO6+bUZRjc0g4M1W/jWUsoueE0A31Y1YCZVV
	cORRZNRh2Bb7+yLzXd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSF-005yee-Eo
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:40:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSC-005yUs-EL
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:40:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id BEB98CE1BF2
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E05BC433C1;
	Wed, 16 Nov 2022 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616795;
	bh=FuZczF/hyCy9Ks5fu7boL/st6k7IVj/C/Yj5WbdQ/rY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ng1LIGQlljpWlNVRjYdu72g1qP5e+mlcnvs+E4asXoy5eGwWvXNDfxqfIivMMfXro
	 JO+q5rkpXBeNgapEEjDZnhyfO3+e16lIm8t1q907viVJQ0hsUrwk2hPe2c6Dp+RRpt
	 8pimBsPpOdfllDEuDqP2L/cvQm3OO+16FdrWNJwAKOG9UJ2seoiDKEsTlzcfId2o8z
	 p3+EivQW8VsfFYQNXDocCSTwwaWCembkkg53l4kieNYyvyUV30xDd62tcAQV6+aTqV
	 QyKrnzCtiTlrTAAhsLDJvM1Xvg/wiSLbgUsn3cCSJEcweMX2q1/LWW1S28vtD6Zv4d
	 hgXlzOJG8A9Ng==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 45/50] wifi: ath12k: add trace.h
Date: Wed, 16 Nov 2022 18:38:57 +0200
Message-Id: <20221116163902.24996-46-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_084000_909907_6E70035D 
X-CRM114-Status: GOOD (  12.57  )
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
 drivers/net/wireless/ath/ath12k/trace.h | 152 ++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/trace.h b/drivers/net/wireless/ath/ath12k/trace.h
new file mode 100644
index 000000000000..f72096684b74
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/trace.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#if !defined(_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
+
+#include <linux/tracepoint.h>
+#include "core.h"
+
+#define _TRACE_H_
+
+/* create empty functions when tracing is disabled */
+#if !defined(CONFIG_ATH12K_TRACING)
+#undef TRACE_EVENT
+#define TRACE_EVENT(name, proto, ...) \
+static inline void trace_ ## name(proto) {}
+#endif /* !CONFIG_ATH12K_TRACING || __CHECKER__ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM ath12k
+
+TRACE_EVENT(ath12k_htt_pktlog,
+	    TP_PROTO(struct ath12k *ar, const void *buf, u16 buf_len,
+		     u32 pktlog_checksum),
+
+	TP_ARGS(ar, buf, buf_len, pktlog_checksum),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->ab->dev))
+		__string(driver, dev_driver_string(ar->ab->dev))
+		__field(u16, buf_len)
+		__field(u32, pktlog_checksum)
+		__dynamic_array(u8, pktlog, buf_len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->ab->dev));
+		__assign_str(driver, dev_driver_string(ar->ab->dev));
+		__entry->buf_len = buf_len;
+		__entry->pktlog_checksum = pktlog_checksum;
+		memcpy(__get_dynamic_array(pktlog), buf, buf_len);
+	),
+
+	TP_printk(
+		"%s %s size %u pktlog_checksum %d",
+		__get_str(driver),
+		__get_str(device),
+		__entry->buf_len,
+		__entry->pktlog_checksum
+	 )
+);
+
+TRACE_EVENT(ath12k_htt_ppdu_stats,
+	    TP_PROTO(struct ath12k *ar, const void *data, size_t len),
+
+	TP_ARGS(ar, data, len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->ab->dev))
+		__string(driver, dev_driver_string(ar->ab->dev))
+		__field(u16, len)
+		__field(u32, info)
+		__field(u32, sync_tstmp_lo_us)
+		__field(u32, sync_tstmp_hi_us)
+		__field(u32, mlo_offset_lo)
+		__field(u32, mlo_offset_hi)
+		__field(u32, mlo_offset_clks)
+		__field(u32, mlo_comp_clks)
+		__field(u32, mlo_comp_timer)
+		__dynamic_array(u8, ppdu, len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->ab->dev));
+		__assign_str(driver, dev_driver_string(ar->ab->dev));
+		__entry->len = len;
+		__entry->info = ar->pdev->timestamp.info;
+		__entry->sync_tstmp_lo_us = ar->pdev->timestamp.sync_timestamp_hi_us;
+		__entry->sync_tstmp_hi_us = ar->pdev->timestamp.sync_timestamp_lo_us;
+		__entry->mlo_offset_lo = ar->pdev->timestamp.mlo_offset_lo;
+		__entry->mlo_offset_hi = ar->pdev->timestamp.mlo_offset_hi;
+		__entry->mlo_offset_clks = ar->pdev->timestamp.mlo_offset_clks;
+		__entry->mlo_comp_clks = ar->pdev->timestamp.mlo_comp_clks;
+		__entry->mlo_comp_timer = ar->pdev->timestamp.mlo_comp_timer;
+		memcpy(__get_dynamic_array(ppdu), data, len);
+	),
+
+	TP_printk(
+		"%s %s ppdu len %d",
+		__get_str(driver),
+		__get_str(device),
+		__entry->len
+	 )
+);
+
+TRACE_EVENT(ath12k_htt_rxdesc,
+	    TP_PROTO(struct ath12k *ar, const void *data, size_t type, size_t len),
+
+	TP_ARGS(ar, data, type, len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->ab->dev))
+		__string(driver, dev_driver_string(ar->ab->dev))
+		__field(u16, len)
+		__field(u16, type)
+		__field(u32, info)
+		__field(u32, sync_tstmp_lo_us)
+		__field(u32, sync_tstmp_hi_us)
+		__field(u32, mlo_offset_lo)
+		__field(u32, mlo_offset_hi)
+		__field(u32, mlo_offset_clks)
+		__field(u32, mlo_comp_clks)
+		__field(u32, mlo_comp_timer)
+		__dynamic_array(u8, rxdesc, len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->ab->dev));
+		__assign_str(driver, dev_driver_string(ar->ab->dev));
+		__entry->len = len;
+		__entry->type = type;
+		__entry->info = ar->pdev->timestamp.info;
+		__entry->sync_tstmp_lo_us = ar->pdev->timestamp.sync_timestamp_hi_us;
+		__entry->sync_tstmp_hi_us = ar->pdev->timestamp.sync_timestamp_lo_us;
+		__entry->mlo_offset_lo = ar->pdev->timestamp.mlo_offset_lo;
+		__entry->mlo_offset_hi = ar->pdev->timestamp.mlo_offset_hi;
+		__entry->mlo_offset_clks = ar->pdev->timestamp.mlo_offset_clks;
+		__entry->mlo_comp_clks = ar->pdev->timestamp.mlo_comp_clks;
+		__entry->mlo_comp_timer = ar->pdev->timestamp.mlo_comp_timer;
+		memcpy(__get_dynamic_array(rxdesc), data, len);
+	),
+
+	TP_printk(
+		"%s %s rxdesc len %d",
+		__get_str(driver),
+		__get_str(device),
+		__entry->len
+	 )
+);
+
+#endif /* _TRACE_H_ || TRACE_HEADER_MULTI_READ*/
+
+/* we don't want to use include/trace/events */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

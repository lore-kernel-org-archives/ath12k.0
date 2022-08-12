From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:58 +0300
Subject: [PATCH 45/50] wifi: ath12k: add trace.h
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-46-kvalo@kernel.org>
List-Id: <ath12k.lists.infradead.org>
To: ath12k@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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



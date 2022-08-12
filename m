From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:23 +0300
Subject: [PATCH 10/50] wifi: ath12k: add debug.h
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-11-kvalo@kernel.org>
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
 drivers/net/wireless/ath/ath12k/debug.h | 68 +++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
new file mode 100644
index 000000000000..ec2be467edbc
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -0,0 +1,68 @@
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
+	ATH12K_DBG_DP_TX	= 0x00001000,
+	ATH12K_DBG_DP_RX	= 0x00002000,
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
+static inline int __ath12k_dbg(struct ath12k_base *ab,
+			       enum ath12k_debug_mask dbg_mask,
+			       const char *fmt, ...)
+{
+	return 0;
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



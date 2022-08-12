From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:21 +0300
Subject: [PATCH 08/50] wifi: ath12k: add dbring.h
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-9-kvalo@kernel.org>
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
 drivers/net/wireless/ath/ath12k/dbring.h | 80 ++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dbring.h b/drivers/net/wireless/ath/ath12k/dbring.h
new file mode 100644
index 000000000000..2be2d8def3f0
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/dbring.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_DBRING_H
+#define ATH12K_DBRING_H
+
+#include <linux/types.h>
+#include <linux/idr.h>
+#include <linux/spinlock.h>
+#include "dp.h"
+
+struct ath12k_dbring_element {
+	dma_addr_t paddr;
+	u8 payload[0];
+};
+
+struct ath12k_dbring_data {
+	void *data;
+	u32 data_sz;
+	struct ath12k_wmi_dma_buf_release_meta_data_params meta;
+};
+
+struct ath12k_dbring_buf_release_event {
+	struct ath12k_wmi_dma_buf_release_fixed_params fixed;
+	const struct ath12k_wmi_dma_buf_release_entry_params *buf_entry;
+	const struct ath12k_wmi_dma_buf_release_meta_data_params *meta_data;
+	u32 num_buf_entry;
+	u32 num_meta;
+};
+
+struct ath12k_dbring_cap {
+	u32 pdev_id;
+	enum wmi_direct_buffer_module id;
+	u32 min_elem;
+	u32 min_buf_sz;
+	u32 min_buf_align;
+};
+
+struct ath12k_dbring {
+	struct dp_srng refill_srng;
+	struct idr bufs_idr;
+	/* Protects bufs_idr */
+	spinlock_t idr_lock;
+	dma_addr_t tp_addr;
+	dma_addr_t hp_addr;
+	int bufs_max;
+	u32 pdev_id;
+	u32 buf_sz;
+	u32 buf_align;
+	u32 num_resp_per_event;
+	u32 event_timeout_ms;
+	int (*handler)(struct ath12k *ar, struct ath12k_dbring_data *data);
+};
+
+int ath12k_dbring_set_cfg(struct ath12k *ar,
+			  struct ath12k_dbring *ring,
+			  u32 num_resp_per_event,
+			  u32 event_timeout_ms,
+			  int (*handler)(struct ath12k *,
+					 struct ath12k_dbring_data *));
+int ath12k_dbring_wmi_cfg_setup(struct ath12k *ar,
+				struct ath12k_dbring *ring,
+				enum wmi_direct_buffer_module id);
+int ath12k_dbring_buf_setup(struct ath12k *ar,
+			    struct ath12k_dbring *ring,
+			    struct ath12k_dbring_cap *db_cap);
+int ath12k_dbring_srng_setup(struct ath12k *ar, struct ath12k_dbring *ring,
+			     int ring_num, int num_entries);
+int ath12k_dbring_buffer_release_event(struct ath12k_base *ab,
+				       struct ath12k_dbring_buf_release_event *ev);
+int ath12k_dbring_get_cap(struct ath12k_base *ab,
+			  u8 pdev_idx,
+			  enum wmi_direct_buffer_module id,
+			  struct ath12k_dbring_cap *db_cap);
+void ath12k_dbring_srng_cleanup(struct ath12k *ar, struct ath12k_dbring *ring);
+void ath12k_dbring_buf_cleanup(struct ath12k *ar, struct ath12k_dbring *ring);
+#endif /* ATH12K_DBRING_H */



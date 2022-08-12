From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:51 +0300
Subject: [PATCH 38/50] wifi: ath12k: add peer.h
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-39-kvalo@kernel.org>
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
 drivers/net/wireless/ath/ath12k/peer.h | 69 ++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
new file mode 100644
index 000000000000..d0346e8b1b60
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_PEER_H
+#define ATH12K_PEER_H
+
+#include "dp_rx.h"
+
+struct ppdu_user_delayba {
+	u8 reserved0;
+	u16 sw_peer_id;
+	u32 info0;
+	u16 ru_end;
+	u16 ru_start;
+	u32 info1;
+	u32 rate_flags;
+	u32 resp_rate_flags;
+} __packed;
+
+struct ath12k_peer {
+	struct list_head list;
+	struct ieee80211_sta *sta;
+	int vdev_id;
+	u8 addr[ETH_ALEN];
+	int peer_id;
+	u16 ast_hash;
+	u8 pdev_idx;
+	u16 hw_peer_id;
+
+	/* protected by ab->data_lock */
+	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
+	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
+
+	/* Info used in MMIC verification of
+	 * RX fragments
+	 */
+	struct crypto_shash *tfm_mmic;
+	u8 mcast_keyidx;
+	u8 ucast_keyidx;
+	u16 sec_type;
+	u16 sec_type_grp;
+	struct ppdu_user_delayba ppdu_stats_delayba;
+	bool delayba_flag;
+	bool is_authorized;
+};
+
+void ath12k_peer_unmap_event(struct ath12k_base *ab, u16 peer_id);
+void ath12k_peer_map_event(struct ath12k_base *ab, u8 vdev_id, u16 peer_id,
+			   u8 *mac_addr, u16 ast_hash, u16 hw_peer_id);
+struct ath12k_peer *ath12k_peer_find(struct ath12k_base *ab, int vdev_id,
+				     const u8 *addr);
+struct ath12k_peer *ath12k_peer_find_by_addr(struct ath12k_base *ab,
+					     const u8 *addr);
+struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab, int peer_id);
+void ath12k_peer_cleanup(struct ath12k *ar, u32 vdev_id);
+int ath12k_peer_delete(struct ath12k *ar, u32 vdev_id, u8 *addr);
+int ath12k_peer_create(struct ath12k *ar, struct ath12k_vif *arvif,
+		       struct ieee80211_sta *sta,
+		       struct ath12k_wmi_peer_create_arg *arg);
+int ath12k_wait_for_peer_delete_done(struct ath12k *ar, u32 vdev_id,
+				     const u8 *addr);
+struct ath12k_peer *ath12k_peer_find_by_vdev_id(struct ath12k_base *ab,
+						int vdev_id);
+struct ath12k_peer *ath12k_peer_find_by_ast(struct ath12k_base *ab, int ast_hash);
+
+#endif /* _PEER_H_ */



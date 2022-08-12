From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:45 +0300
Subject: [PATCH 32/50] wifi: ath12k: add mac.h
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-33-kvalo@kernel.org>
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
 drivers/net/wireless/ath/ath12k/mac.h | 69 +++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
new file mode 100644
index 000000000000..7c32f18201fe
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_MAC_H
+#define ATH12K_MAC_H
+
+#include <net/mac80211.h>
+#include <net/cfg80211.h>
+
+struct ath12k;
+struct ath12k_base;
+
+struct ath12k_generic_iter {
+	struct ath12k *ar;
+	int ret;
+};
+
+/* number of failed packets (20 packets with 16 sw reties each) */
+#define ATH12K_KICKOUT_THRESHOLD		(20 * 16)
+
+/* Use insanely high numbers to make sure that the firmware implementation
+ * won't start, we have the same functionality already in hostapd. Unit
+ * is seconds.
+ */
+#define ATH12K_KEEPALIVE_MIN_IDLE		3747
+#define ATH12K_KEEPALIVE_MAX_IDLE		3895
+#define ATH12K_KEEPALIVE_MAX_UNRESPONSIVE	3900
+
+/* FIXME: should these be in ieee80211.h? */
+#define IEEE80211_VHT_MCS_SUPPORT_0_11_MASK	GENMASK(23, 16)
+#define IEEE80211_DISABLE_VHT_MCS_SUPPORT_0_11	BIT(24)
+
+#define ATH12K_CHAN_WIDTH_NUM			8
+
+#define ATH12K_TX_POWER_MAX_VAL	70
+#define ATH12K_TX_POWER_MIN_VAL	0
+
+extern const struct htt_rx_ring_tlv_filter ath12k_mac_mon_status_filter_default;
+
+void ath12k_mac_destroy(struct ath12k_base *ab);
+void ath12k_mac_unregister(struct ath12k_base *ab);
+int ath12k_mac_register(struct ath12k_base *ab);
+int ath12k_mac_allocate(struct ath12k_base *ab);
+int ath12k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc, u8 preamble, u8 *rateidx,
+					  u16 *rate);
+u8 ath12k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
+			     u32 bitrate);
+u8 ath12k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
+			     u8 hw_rate, bool cck);
+
+void __ath12k_mac_scan_finish(struct ath12k *ar);
+void ath12k_mac_scan_finish(struct ath12k *ar);
+
+struct ath12k_vif *ath12k_mac_get_arvif(struct ath12k *ar, u32 vdev_id);
+struct ath12k_vif *ath12k_mac_get_arvif_by_vdev_id(struct ath12k_base *ab,
+						   u32 vdev_id);
+struct ath12k *ath12k_mac_get_ar_by_vdev_id(struct ath12k_base *ab, u32 vdev_id);
+struct ath12k *ath12k_mac_get_ar_by_pdev_id(struct ath12k_base *ab, u32 pdev_id);
+
+void ath12k_mac_drain_tx(struct ath12k *ar);
+void ath12k_mac_peer_cleanup_all(struct ath12k *ar);
+int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
+u8 ath12k_mac_bw_to_mac80211_bw(u8 bw);
+enum ath12k_supported_bw ath12k_mac_mac80211_bw_to_ath12k_bw(enum rate_info_bw bw);
+enum hal_encrypt_type ath12k_dp_tx_get_encrypt_type(u32 cipher);
+#endif



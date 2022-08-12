From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:55 +0300
Subject: [PATCH 42/50] wifi: ath12k: add reg.h
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-43-kvalo@kernel.org>
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
 drivers/net/wireless/ath/ath12k/reg.h | 95 +++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/reg.h b/drivers/net/wireless/ath/ath12k/reg.h
new file mode 100644
index 000000000000..56d009a47234
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/reg.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_REG_H
+#define ATH12K_REG_H
+
+#include <linux/kernel.h>
+#include <net/regulatory.h>
+
+struct ath12k_base;
+struct ath12k;
+
+/* DFS regdomains supported by Firmware */
+enum ath12k_dfs_region {
+	ATH12K_DFS_REG_UNSET,
+	ATH12K_DFS_REG_FCC,
+	ATH12K_DFS_REG_ETSI,
+	ATH12K_DFS_REG_MKK,
+	ATH12K_DFS_REG_CN,
+	ATH12K_DFS_REG_KR,
+	ATH12K_DFS_REG_MKK_N,
+	ATH12K_DFS_REG_UNDEF,
+};
+
+enum ath12k_reg_cc_code {
+	REG_SET_CC_STATUS_PASS = 0,
+	REG_CURRENT_ALPHA2_NOT_FOUND = 1,
+	REG_INIT_ALPHA2_NOT_FOUND = 2,
+	REG_SET_CC_CHANGE_NOT_ALLOWED = 3,
+	REG_SET_CC_STATUS_NO_MEMORY = 4,
+	REG_SET_CC_STATUS_FAIL = 5,
+};
+
+struct ath12k_reg_rule {
+	u16 start_freq;
+	u16 end_freq;
+	u16 max_bw;
+	u8 reg_power;
+	u8 ant_gain;
+	u16 flags;
+	bool psd_flag;
+	u16 psd_eirp;
+};
+
+struct ath12k_reg_info {
+	enum ath12k_reg_cc_code status_code;
+	u8 num_phy;
+	u8 phy_id;
+	u16 reg_dmn_pair;
+	u16 ctry_code;
+	u8 alpha2[REG_ALPHA2_LEN + 1];
+	u32 dfs_region;
+	u32 phybitmap;
+	bool is_ext_reg_event;
+	u32 min_bw_2g;
+	u32 max_bw_2g;
+	u32 min_bw_5g;
+	u32 max_bw_5g;
+	u32 num_2g_reg_rules;
+	u32 num_5g_reg_rules;
+	struct ath12k_reg_rule *reg_rules_2g_ptr;
+	struct ath12k_reg_rule *reg_rules_5g_ptr;
+	enum wmi_reg_6g_client_type client_type;
+	bool rnr_tpe_usable;
+	bool unspecified_ap_usable;
+	/* TODO: All 6G related info can be stored only for required
+	 * combination instead of all types, to optimize memory usage.
+	 */
+	u8 domain_code_6g_ap[WMI_REG_CURRENT_MAX_AP_TYPE];
+	u8 domain_code_6g_client[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+	u32 domain_code_6g_super_id;
+	u32 min_bw_6g_ap[WMI_REG_CURRENT_MAX_AP_TYPE];
+	u32 max_bw_6g_ap[WMI_REG_CURRENT_MAX_AP_TYPE];
+	u32 min_bw_6g_client[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+	u32 max_bw_6g_client[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+	u32 num_6g_reg_rules_ap[WMI_REG_CURRENT_MAX_AP_TYPE];
+	u32 num_6g_reg_rules_cl[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+	struct ath12k_reg_rule *reg_rules_6g_ap_ptr[WMI_REG_CURRENT_MAX_AP_TYPE];
+	struct ath12k_reg_rule *reg_rules_6g_client_ptr
+		[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+};
+
+void ath12k_reg_init(struct ath12k *ar);
+void ath12k_reg_free(struct ath12k_base *ab);
+void ath12k_regd_update_work(struct work_struct *work);
+struct ieee80211_regdomain *ath12k_reg_build_regd(struct ath12k_base *ab,
+						  struct ath12k_reg_info *reg_info,
+						  bool intersect);
+int ath12k_regd_update(struct ath12k *ar, bool init);
+int ath12k_reg_update_chan_list(struct ath12k *ar);
+
+#endif



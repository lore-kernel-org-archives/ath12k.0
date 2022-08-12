From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:47 +0300
Subject: [PATCH 34/50] wifi: ath12k: add mhi.h
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-35-kvalo@kernel.org>
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
 drivers/net/wireless/ath/ath12k/mhi.h | 46 +++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.h b/drivers/net/wireless/ath/ath12k/mhi.h
new file mode 100644
index 000000000000..258152d3a7dd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/mhi.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef _ATH12K_MHI_H
+#define _ATH12K_MHI_H
+
+#include "pci.h"
+
+#define PCIE_TXVECDB				0x360
+#define PCIE_TXVECSTATUS			0x368
+#define PCIE_RXVECDB				0x394
+#define PCIE_RXVECSTATUS			0x39C
+
+#define MHISTATUS				0x48
+#define MHICTRL					0x38
+#define MHICTRL_RESET_MASK			0x2
+
+enum ath12k_mhi_state {
+	ATH12K_MHI_INIT,
+	ATH12K_MHI_DEINIT,
+	ATH12K_MHI_POWER_ON,
+	ATH12K_MHI_POWER_OFF,
+	ATH12K_MHI_FORCE_POWER_OFF,
+	ATH12K_MHI_SUSPEND,
+	ATH12K_MHI_RESUME,
+	ATH12K_MHI_TRIGGER_RDDM,
+	ATH12K_MHI_RDDM,
+	ATH12K_MHI_RDDM_DONE,
+};
+
+extern struct mhi_controller_config ath12k_mhi_config_qcn9274;
+extern struct mhi_controller_config ath12k_mhi_config_wcn7850;
+
+int ath12k_mhi_start(struct ath12k_pci *ar_pci);
+void ath12k_mhi_stop(struct ath12k_pci *ar_pci);
+int ath12k_mhi_register(struct ath12k_pci *ar_pci);
+void ath12k_mhi_unregister(struct ath12k_pci *ar_pci);
+void ath12k_mhi_set_mhictrl_reset(struct ath12k_base *ab);
+void ath12k_mhi_clear_vector(struct ath12k_base *ab);
+
+void ath12k_mhi_suspend(struct ath12k_pci *ar_pci);
+void ath12k_mhi_resume(struct ath12k_pci *ar_pci);
+
+#endif



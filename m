From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:14 +0300
Subject: [PATCH 01/50] wifi: ath12k: add Kconfig
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-2-kvalo@kernel.org>
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
 drivers/net/wireless/ath/ath12k/Kconfig | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
new file mode 100644
index 000000000000..4b60852691ba
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+config ATH12K
+	tristate "Qualcomm Technologies Wi-Fi 7 support (ath12k)"
+	depends on MAC80211 && HAS_DMA && PCI
+	depends on CRYPTO_MICHAEL_MIC
+	select QCOM_QMI_HELPERS
+	select MHI_BUS
+	select QRTR
+	select QRTR_MHI
+	help
+	  Enable support for Qualcomm Technologies Wi-Fi 7 (IEEE
+	  802.11be) family of chipsets, for example WCN7850 and
+	  QCN9274.
+
+	  If you choose to build a module, it'll be called ath12k.
+
+config ATH12K_DEBUG
+	bool "ath12k debugging"
+	depends on ATH12K
+	help
+	  Enable debug support, for example debug messages which must
+	  be enabled separately using the debug_mask module parameter.
+
+	  If unsure, say Y to make it easier to debug problems. But if
+	  you want optimal perfomance choose N.
+
+config ATH12K_TRACING
+	bool "ath12k tracing support"
+	depends on ATH12K && EVENT_TRACING
+	help
+	  Enable ath12k tracing infrastructure.
+
+	  If unsure, say Y to make it easier to debug problems. But if
+	  you want optimal perfomance choose N.



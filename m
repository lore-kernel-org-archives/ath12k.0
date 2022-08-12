From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:15 +0300
Subject: [PATCH 02/50] wifi: ath12k: add Makefile
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-3-kvalo@kernel.org>
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
 drivers/net/wireless/ath/ath12k/Makefile | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
new file mode 100644
index 000000000000..62c52e733b5e
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k.o
+ath12k-y += core.o \
+	    hal.o \
+	    hal_tx.o \
+	    hal_rx.o \
+	    wmi.o \
+	    mac.o \
+	    reg.o \
+	    htc.o \
+	    qmi.o \
+	    dp.o  \
+	    dp_tx.o \
+	    dp_rx.o \
+	    debug.o \
+	    ce.o \
+	    peer.o \
+	    dbring.o \
+	    hw.o \
+	    mhi.o \
+	    pci.o \
+	    dp_mon.o
+
+ath12k-$(CONFIG_ATH12K_TRACING) += trace.o
+
+# for tracing framework to find trace.h
+CFLAGS_trace.o := -I$(src)



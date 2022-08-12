From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:10:01 +0300
Subject: [PATCH 48/50] wifi: ath: add ath12k to Makefile
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-49-kvalo@kernel.org>
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
 drivers/net/wireless/ath/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/Makefile b/drivers/net/wireless/ath/Makefile
index 8e4ae9de5ae4..8d6e6e218d24 100644
--- a/drivers/net/wireless/ath/Makefile
+++ b/drivers/net/wireless/ath/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_WIL6210)		+= wil6210/
 obj-$(CONFIG_ATH10K)		+= ath10k/
 obj-$(CONFIG_WCN36XX)		+= wcn36xx/
 obj-$(CONFIG_ATH11K)		+= ath11k/
+obj-$(CONFIG_ATH12K)		+= ath12k/
 
 obj-$(CONFIG_ATH_COMMON)	+= ath.o
 



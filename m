From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:10:03 +0300
Subject: [PATCH 50/50] MAINTAINERS: add ath12k
In-Reply-To: <20220812161003.27279-1-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
Message-ID: <20220812161003.27279-51-kvalo@kernel.org>
List-Id: <ath12k.lists.infradead.org>
To: ath12k@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Kalle Valo <quic_kvalo@quicinc.com>

Add an entry for ath12k to the MAINTAINERS file.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66738c8330db..98d7b5ba058b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16571,6 +16571,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
 F:	Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
 F:	drivers/net/wireless/ath/ath11k/
 
+QUALCOMM ATH12K WIRELESS DRIVER
+M:	Kalle Valo <kvalo@kernel.org>
+L:	ath12k at lists.infradead.org
+S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
+F:	drivers/net/wireless/ath/ath12k/
+
 QUALCOMM ATHEROS ATH9K WIRELESS DRIVER
 M:	Toke H?iland-J?rgensen <toke@toke.dk>
 L:	linux-wireless at vger.kernel.org



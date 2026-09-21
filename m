Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34620C982F1
	for <ath12k@archiver.kernel.org>; Mon, 21 Sep 2026 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzrkqQ21Gah/dAi0Srmbi5ljHGXsktYWQhRfllB2PFI=; b=QG26DtvEZ7EINr7dQXf0QWXL0E
	xF1euUNg5JlpQkoK4eqpfrUkqNguyT0+AuL4UbggfR83Bqg8DZqy7g9eKR8OXIvhNdPXrogOPKA1l
	bAVR2SoJjjPIENf0CBSeXYTdGRDJrm3tYmNDf0vYXMEp1wc/IXOEyyWc1z1cRqYRyy90SJioHicy9
	T2iLkevyw+ft9cy6UbjiJ46WMkNyT/M51vBhZT5IjOcbxTTM5dXO5rZvYOl9QTIPUI58/qVbrBDk8
	nDW7/58hTX8UtP+QyMWLqhJrV9sD1+2ftxuBsvBXr1gy+S6h2yHTxZAhVWfdhBsxn2kjyMwqSXOi7
	qYId8zgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c7W-00000001tRX-3XPK;
	Mon, 21 Sep 2026 11:23:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c7R-00000001tNN-2kd9;
	Mon, 21 Sep 2026 11:23:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 341974491F;
	Mon, 21 Sep 2026 11:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 124F1C32781;
	Mon, 21 Sep 2026 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789989813;
	bh=hkOGfl3uMR+TD4cA7bZLolJR7gTPPKlkrku5dBBzcmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ItywH7ySUgyIRibh2QkNRtLu2QSFXxfPmCbzPjwfPlCZzTFWdB/WAIrUGCdExe7mW
	 gdaNJB/LuWZYaGgJ0ZO39NrnfQyzoZ0gBQfqkZYeGB1BaieswUY26MBt80ZArB8IQn
	 KjQaaZii5iRlj5FRJkOkN5XhM5DoM8emvRFDNaPn6TlQaOAirBwihL+Zg1d7eblSZT
	 ypgmGBpmXq5M08Xjf9047Iv3fspSQB7XUM6RpGT9oWChsmmUAqspgtbR8xug5hHb0h
	 OOn3lxtPb7mZHHHirQ3jMzv5cCNIGmQEkPEfW6XDbC0+fVqndoN8aREhALUUo3y304
	 2CPi36z1gCLuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F108FC982F1;
	Mon, 21 Sep 2026 11:23:32 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 21 Sep 2026 13:23:30 +0200
Subject: [PATCH v2 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qrtr-multi-ep-v2-4-27dd80d841a0@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chris Lew <christopher.lew@oss.qualcomm.com>, 
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4259;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=curbfmqjxjKsnWzL9i8aIUn+dQtL2mKCKSdc3ihT0zc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqsROyWsTe7CPHCDfSrklguphvrDTeebUQcmibe
 P5mYBiAnGmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCarETsgAKCRBVnxHm/pHO
 9bmHB/4hEKmPMHJeTP7s6r44zQpK0dEbXTf+c2QMD4FOtXceJRN2//xYJIf72j7RxRMEoDedmq1
 VkQKYoV6voaaSttLz0/c9+S1pKxxgNJxfyKnRCaiCmkEkb/LW0xT8UA5dMqiBakAo4yS4WHydow
 7BFGM9ZANASKOY76FfgNAugyc09MBvh6NpecfYr/EJSYsxLSJIHqTj6MOWzZD04FhKNbcueer6e
 UZyfRKRKLGdCbB8IgG2ii5flYS9XSuuVpOmD64tp1S1UbPg/gUHzZOg7NxbQ9uBjLgLA511UrAU
 hnwP6EQIqg52AaUpN+2TDRpykctIRarS57G7CTy29i0axiFN
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

When two identical ath12k PCIe devices are connected to the same host, both
advertise the WLFW service with the same service and instance id. The QMI
lookup reports both servers to each device, so a device may connect to the
firmware running on the other device.

But now, QRTR provides each MHI endpoint a unique node id which is
different from the node id announced by the device. So use the same id to
pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
the node id derived from the MHI controller index and zero for transports
that do not assign one. In the new_server callback, skip any service whose
node id does not match. A node id of zero disables the check, so transports
that do not assign one keep their current behavior.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hif.h |  9 +++++++++
 drivers/net/wireless/ath/ath12k/pci.c |  9 +++++++++
 drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index 4de8667690e9..be9c070cf716 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -32,6 +32,7 @@ struct ath12k_hif_ops {
 	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
 	int (*panic_handler)(struct ath12k_base *ab);
 	void (*coredump_download)(struct ath12k_base *ab);
+	int (*get_qrtr_node_id)(struct ath12k_base *ab);
 };
 
 static inline int ath12k_hif_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
@@ -162,4 +163,12 @@ static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
 	if (ab->hif.ops->coredump_download)
 		ab->hif.ops->coredump_download(ab);
 }
+
+static inline int ath12k_hif_get_qrtr_node_id(struct ath12k_base *ab)
+{
+	if (!ab->hif.ops->get_qrtr_node_id)
+		return 0;
+
+	return ab->hif.ops->get_qrtr_node_id(ab);
+}
 #endif /* ATH12K_HIF_H */
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 6441927b5382..2b1b122bbb3b 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/time.h>
 #include <linux/vmalloc.h>
+#include <net/qrtr.h>
 
 #include "pci.h"
 #include "core.h"
@@ -1491,6 +1492,13 @@ static int ath12k_pci_panic_handler(struct ath12k_base *ab)
 	return NOTIFY_OK;
 }
 
+static int ath12k_pci_get_qrtr_node_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+
+	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);
+}
+
 static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 	.start = ath12k_pci_start,
 	.stop = ath12k_pci_stop,
@@ -1512,6 +1520,7 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 #ifdef CONFIG_ATH12K_COREDUMP
 	.coredump_download = ath12k_pci_coredump_download,
 #endif
+	.get_qrtr_node_id = ath12k_pci_get_qrtr_node_id,
 };
 
 static enum ath12k_device_family
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 280e50a1f31d..22b8cbbbf4f4 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -9,6 +9,7 @@
 #include "qmi.h"
 #include "core.h"
 #include "debug.h"
+#include "hif.h"
 #include <linux/of.h>
 #include <linux/firmware.h>
 #include <linux/of_address.h>
@@ -3940,8 +3941,18 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct ath12k_qmi *qmi = container_of(qmi_hdl, struct ath12k_qmi, handle);
 	struct ath12k_base *ab = qmi->ab;
 	struct sockaddr_qrtr *sq = &qmi->sq;
+	int node_id;
 	int ret;
 
+	/* Identical devices advertise the same QMI services, so connect only to
+	 * the QMI server on this device's node. A node id of 0 means the
+	 * transport has not assigned a unique node id, so accept the server
+	 * unfiltered.
+	 */
+	node_id = ath12k_hif_get_qrtr_node_id(ab);
+	if (node_id && service->node != node_id)
+		return 0;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;

-- 
2.43.0




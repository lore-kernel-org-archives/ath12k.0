Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD9BC982F9
	for <ath12k@archiver.kernel.org>; Mon, 21 Sep 2026 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNYL1W80i1a6DOcASTZYxlglp6cQjARVWrhnr+JniGY=; b=4XpV6xe3IbML0R7KR96sLTtmne
	8yxOZYNeMQRIaGBJafQ+rZR5lU33sYAtQRppNwK9Xul7H2a7nKrJe30MKDqMhIELjURaHUfubezyU
	AZawMnuRUPL6OXKpXdxVOcvQ6ugmLbUaALQhzxvbipNefpqTce1wHFJzXW9BY2LS9Hp00+X3QK/J7
	3/HPVfuAqFSaVY7l/TGBwtJZ5chfDtGmGDqMPj+jpejP1NLvzQnWnHueo6XTmsGepiG9ekaSDGgjl
	iQInr89sV7x9JbxdqWiKqNHwP28C9gxVg2XSXbSUJ6px4CoDL9oLTRwpr08yyLkNg4WWyh7zjlf1d
	02gGcJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c7X-00000001tSB-0XzF;
	Mon, 21 Sep 2026 11:23:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c7R-00000001tNC-2kfa;
	Mon, 21 Sep 2026 11:23:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 244EF4027E;
	Mon, 21 Sep 2026 11:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3CA4C2BCB8;
	Mon, 21 Sep 2026 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789989813;
	bh=XDDzM4aSYEc7ZNFEAujEu7CcK5fcN2uK5xdWdBsU3Yw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cs8/B+Bye797EpeKOxmRaLOuwb9aCQO014x9iKpdFxfR0jLEce4qEc6vwIhFYrJZw
	 1HHVSrb0vPoIWBytZu2XxHIKEl78nYl9EycBXXiNH+vk3pWNAzbvleX/9qHVz0et69
	 rUGf8/zCirwS5SZv9+D1vCIfvCHwcVIQqNe5t//N9oyGzS4uKVZXJLqT1tCbBDWPkU
	 ABtWmn95bVt9iVM54xpytzEiZQRrlCVVNJ5j5KlPO2Mt6ebdCcPmaXfsDrG7bmX319
	 OzN2p4kcmpdUDJzGLpteUYfnIgvj4RqMzn4gaszoc/IJci45KLO8KHYZFVFmUnf6hu
	 6BP3D5u37082g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF677C982EE;
	Mon, 21 Sep 2026 11:23:32 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 21 Sep 2026 13:23:29 +0200
Subject: [PATCH v2 3/4] wifi: ath11k: Connect to the QMI server belonging
 to the device owned by this driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4047;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=LLx7gXAkXsmoLEJnemQrijc01fAxmMC5ydG4+GSiAaI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqsROyVCfNYWTDn5qcRfNToj9qFO2htOZUzMN3s
 vrz1q4dyAKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCarETsgAKCRBVnxHm/pHO
 9eNSCACPGty/j8lFSPl+QCifkvQNjbShpBxzw1ygp9/O18AplWnNbPIP/4ftMibyRFpOFJKi/RX
 c4KQpUqPxEYyqSh/Zcz8ghoUsofrYYh4ZJoc7i+c4QxuOj9NDX00ZpbRH5Gh3JAc09G2oPooN67
 WkPVy671dVTjdSBaCnchkM4w1AC/cT8T/cIlv7lHPwIyS8E/GtDYf9HK1ioE8kdKP3Lf2u+99Nu
 88zzcXynmO2hZ/XMjoiHtapT4Ow3SffKWeti3PX8HRoxoGaOve9mFI/Dln3aCO9IO/BbLtJ6FfE
 Z4FZU9R0SHtMVDY8QR2tuQv8zn8R6XrELTPPAlXH7RgA2F+Z
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

When two identical ath11k PCIe devices are connected to the same host, both
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
 drivers/net/wireless/ath/ath11k/hif.h |  9 +++++++++
 drivers/net/wireless/ath/ath11k/pci.c |  9 +++++++++
 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
index 017fed1b4bd1..0da9025c7ed8 100644
--- a/drivers/net/wireless/ath/ath11k/hif.h
+++ b/drivers/net/wireless/ath/ath11k/hif.h
@@ -32,6 +32,7 @@ struct ath11k_hif_ops {
 	void (*ce_irq_disable)(struct ath11k_base *ab);
 	void (*get_ce_msi_idx)(struct ath11k_base *ab, u32 ce_id, u32 *msi_idx);
 	void (*coredump_download)(struct ath11k_base *ab);
+	int (*get_qrtr_node_id)(struct ath11k_base *ab);
 };
 
 static inline void ath11k_hif_ce_irq_enable(struct ath11k_base *ab)
@@ -159,4 +160,12 @@ static inline void ath11k_hif_coredump_download(struct ath11k_base *ab)
 		ab->hif.ops->coredump_download(ab);
 }
 
+static inline int ath11k_hif_get_qrtr_node_id(struct ath11k_base *ab)
+{
+	if (!ab->hif.ops->get_qrtr_node_id)
+		return 0;
+
+	return ab->hif.ops->get_qrtr_node_id(ab);
+}
+
 #endif /* _HIF_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index a163168f3617..4d327b5cc98a 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/time.h>
 #include <linux/vmalloc.h>
+#include <net/qrtr.h>
 
 #include "pci.h"
 #include "core.h"
@@ -900,6 +901,13 @@ static int ath11k_pci_start(struct ath11k_base *ab)
 	return 0;
 }
 
+static int ath11k_pci_get_qrtr_node_id(struct ath11k_base *ab)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+
+	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);
+}
+
 static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 	.start = ath11k_pci_start,
 	.stop = ath11k_pcic_stop,
@@ -921,6 +929,7 @@ static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 #ifdef CONFIG_DEV_COREDUMP
 	.coredump_download = ath11k_pci_coredump_download,
 #endif
+	.get_qrtr_node_id = ath11k_pci_get_qrtr_node_id,
 };
 
 static void ath11k_pci_read_hw_version(struct ath11k_base *ab, u32 *major, u32 *minor)
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b957..dadf78f30b89 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3170,8 +3170,18 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
 	struct ath11k_base *ab = qmi->ab;
 	struct sockaddr_qrtr *sq = &qmi->sq;
+	int node_id;
 	int ret;
 
+	/* Identical devices advertise the same QMI services, so connect only to
+	 * the QMI server on this device's node. A node id of 0 means the
+	 * transport has not assigned a unique node id, so accept the server
+	 * unfiltered.
+	 */
+	node_id = ath11k_hif_get_qrtr_node_id(ab);
+	if (node_id && service->node != node_id)
+		return 0;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;

-- 
2.43.0




Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86074606EEA1
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YUSO1f7W;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lm4a0+Y5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lXC/bDKgvZAq8xaE8sidEO6SzUhZpkifQG9ccrdjriU=; b=YUSO1f7WE1ikyZEGX9VhB7zv3d
	aKTQNKqiDcoqfjWrRyBSTUV4e15g7ArqUO2SG1IhByN1AjgNvi0mvEwhB3ShhCP9jC1cmI4Oi2Hjd
	zTbpYuI0LG4kY1TdHpzu2fyZY/WST4SThY//6asR1/XcenJmf/TMqBLAklTQqcJjcmwGNxeXOb/3O
	4lb4QgYLU+krxffoNirZ0YA35WDDAPwnBJf4Coejztp5DCqlMI5Ct7bI6lghA5tYwugxJWqOFFGb8
	0OrRi0/gT0mvk2udJS+ZNyNXbsIXCeLTTcuxjLs2W+vR5y1NRWnzmCC5O0Cz2hxKGV4P/RSowPUdY
	HG4xkkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe7u-000000063aN-00Og;
	Wed, 04 Nov 2026 16:46:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe7p-000000063TH-01PA;
	Wed, 04 Nov 2026 16:46:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 703BF60BFB;
	Wed,  4 Nov 2026 16:46:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793810772;
	b=w31vBUzygulAJ0E1m/kwBoB65WZiniio5usWDPIpKOQj8owd7AkRaqLOsuPqeZH+9qHg
	 RfGYl1OiGHOtTIx4DvtoTcW0xWLkkSHxM9/X5tuxcPGNyorEGqOTjbbOZLQg3Vnqs5dYM
	 kLpSMxYiJuhilXPr86Wzvl1SU0SD6uk5gLHu+0DbKcJCD/h/5ag6qrGJXQl8fYdAI7zCN
	 94efNXSF1ygH/IQm2B7iIRoy1/7VNoqtNlZeKO8yiUaBc0Ws53r5RhxRE4LuI74XbGRNK
	 JrjMOAYB87UnkS64lg+laP6Z2tZlM9p35a/ISdkMO97lollZdDyq+KQKIb4nTH80udw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793810772;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lXC/bDKgvZAq8xaE8sidEO6SzUhZpkifQG9ccrdjriU=;
	b=kxMSp2iDthB0HRD001RVjXpJ+NxBE0xh3Cg3DZ3w8irRE73PHWlbzm3kQJo0NNijFmjP
	 EL2BFpHTUb5glJbkqN9KA1ebJruOhXr0deLNu9KVQMbSgz92vSayxdV4Ne3H8oOFSlDNw
	 wc5l+yvGu5b7C+rwn8xygqRp650NMgDDV/pOozxMtvRfDTUiKfi6AhA/uMrgyQA+pr14t
	 r4zN94IXTfHRE6LWnsWT4iJrEoXJOQhPlqqsFovvtDw3nWB2PKsqKNC/ux509Lg0Hvkri
	 vmKnvSs8tSLAYnyr7LGv2m+IF3tub8VGrT950H22MmFfRo35zpt0E0r5JH3oRGhwz2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BC251F00A17;
	Wed,  4 Nov 2026 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810772;
	bh=lXC/bDKgvZAq8xaE8sidEO6SzUhZpkifQG9ccrdjriU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Lm4a0+Y5wbyRqtEWBJPzJ9K3eZAFIhVBud7e2d4r11RIze3Gn2zYHSR7+JIt2247F
	 0Ima9QEd2gtTD9I6A8vT819cXz8nM6ZCEwmjlx0nnyTkzImGAFAFGCuhpqX02HOk5N
	 bXzwgXQZ82NJBX5M0UD8An7+KUBYKU2n20cm6Mgt5+x7wSqCqO64nz3vb3WqkPvb4g
	 wFnxsKu1qeQdI/C9GLFEbGecJYANRDSWB4f3ofdjRhQgb8oijLRuRNaxLnQmPMaa/9
	 fQn1owF1AJWlUN5Hp+m45AP4I4iFoN7RmKW+Dx2dFfA5kF5NK3jYjkhs62ev5Vsvvu
	 g0uU1ZQG1O49Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8A26346ED6;
	Wed,  4 Nov 2026 16:46:09 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 04 Nov 2026 08:46:04 -0800
Subject: [PATCH net-next v5 4/4] wifi: ath12k: Connect to the QMI server
 belonging to the device owned by this driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-qrtr-multi-ep-v5-4-4cdb2b4f1920@oss.qualcomm.com>
References: <20261104-qrtr-multi-ep-v5-0-4cdb2b4f1920@oss.qualcomm.com>
In-Reply-To: <20261104-qrtr-multi-ep-v5-0-4cdb2b4f1920@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chris Lew <christopher.lew@oss.qualcomm.com>, 
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4724;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhErcsLQdS5uRROGeaSOA51h7VNX0VQpNNW/OtbOflM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq62FQQ+e73zlMkQF+JuIZ6XZ0mdAZt9RxUsC4F
 GjvsyPFLMiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauthUAAKCRBVnxHm/pHO
 9evWB/9/LYxl9U54MCxD1UJD42IV/qA1YSt+cs8LuG7azAex5n1APg9aQgiYrPk5tKnCO45v8G7
 IAcrCUVEg1X1f1XMJ2wppe/3TUTDcSZYmnwUabbwqH1p6q5TcGCyaiuvmKWPw4MafFaoaeFVW4m
 X0BJhGecv0n875+Jblcgvak15aZ/TS9DjE8qcT3gJZjNAvFAegC1R/bNoSGONrNRTklr5ncoUFP
 eFnILIAfHr1Zyk8dx/ypg8ggoRIPeUc8O/eDoZkJSK/Y7Qb4GP28Epwvb4T8OjuEH2RV1WTpzUs
 LYkrZ/mdRA/m7kVqRAnUWZ2R8OnO+ffcYE84aJmLeeLeRUD8
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

When two identical ath12k PCIe devices are connected to the same host, both
advertise the WLFW service with the same service and instance id. The QMI
lookup reports both servers to each device, so a device may connect to the
firmware running on the other device.

But now, QRTR provides each MHI endpoint a unique node id which is
different from the node id announced by the device. So use the same id to
pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
the node id derived from the MHI controller index and zero for transports
that do not assign one. In the new_server callback, reject any service
whose node id does not match. A node id of zero disables the check, so
transports that do not assign one keep their current behavior.

Tested-on: 2x WCN7850 hw2.0 WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

Reviewed-by: Simon Horman <horms@kernel.org>
Tested-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Tested-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hif.h |  9 +++++++++
 drivers/net/wireless/ath/ath12k/pci.c |  9 +++++++++
 drivers/net/wireless/ath/ath12k/qmi.c | 12 ++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index aecdb0c5f285..c2cfe9a75493 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -31,6 +31,7 @@ struct ath12k_hif_ops {
 	void (*ce_irq_disable)(struct ath12k_base *ab);
 	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
 	void (*coredump_download)(struct ath12k_base *ab);
+	unsigned int (*get_qrtr_node_id)(struct ath12k_base *ab);
 };
 
 static inline int ath12k_hif_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
@@ -153,4 +154,12 @@ static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
 	if (ab->hif.ops->coredump_download)
 		ab->hif.ops->coredump_download(ab);
 }
+
+static inline unsigned int ath12k_hif_get_qrtr_node_id(struct ath12k_base *ab)
+{
+	if (!ab->hif.ops->get_qrtr_node_id)
+		return 0;
+
+	return ab->hif.ops->get_qrtr_node_id(ab);
+}
 #endif /* ATH12K_HIF_H */
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 12bbb75570f1..e56f2f9d721e 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/time.h>
 #include <linux/vmalloc.h>
+#include <net/qrtr.h>
 
 #include "pci.h"
 #include "core.h"
@@ -1493,6 +1494,13 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
 	ath12k_pci_sw_reset(ab_pci->ab, false);
 }
 
+static unsigned int ath12k_pci_get_qrtr_node_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+
+	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);
+}
+
 static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 	.start = ath12k_pci_start,
 	.stop = ath12k_pci_stop,
@@ -1513,6 +1521,7 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 #ifdef CONFIG_ATH12K_COREDUMP
 	.coredump_download = ath12k_pci_coredump_download,
 #endif
+	.get_qrtr_node_id = ath12k_pci_get_qrtr_node_id,
 };
 
 static enum ath12k_device_family
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..86ec7f2431e2 100644
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
@@ -3992,8 +3993,19 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct ath12k_qmi *qmi = container_of(qmi_hdl, struct ath12k_qmi, handle);
 	struct ath12k_base *ab = qmi->ab;
 	struct sockaddr_qrtr *sq = &qmi->sq;
+	unsigned int node_id;
 	int ret;
 
+	/*
+	 * Identical devices advertise the same QMI services, so connect only
+	 * to the QMI server on this device's node. A node id of 0 means the
+	 * transport has not assigned a unique node id, so accept the server
+	 * unfiltered.
+	 */
+	node_id = ath12k_hif_get_qrtr_node_id(ab);
+	if (node_id && service->node != node_id)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;

-- 
2.43.0




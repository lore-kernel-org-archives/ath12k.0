Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2723DE77173
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a4QcNuHMP9eYpvltjkuDLbvkiqkf/Eotnf21Kbdmvg=; b=FGmnuNCYgQmLSqBG6Fng9YQJ2M
	NCae4cDcumHdZWGZ/wG6DYGWjWxRCBHdsAtEmDTSD4t69ZncGXtVH6vXmryag0lVoDi0PgqJRJK9A
	TKO5QtUyr5ieQzKbA/QbrGolYsjHbhC4wfjImOz0WNqCIq9fAS9ARuYny8e2Cpwo+AAHedKaDaCRl
	EAYz3R56sB2cDlvIxdsSdvACieJsNabEhZS3gCAXam+z7iDwDRgu9hQpj/2AOBWOMJ3bEVi1A42KG
	Toom9olfKz8r4fw3VyldN2pCrHIBGM3kHZMssbpjQEKcGr0STo8bAAFwQM4fsuG9FEkgzATc9Y9G8
	mcwPlqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIUv-0000000HJPq-3fTO
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 20:30:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIUt-0000000HJOZ-1gmU
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 20:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B99D95C598D
	for <ath12k@lists.infradead.org>; Thu,  5 Dec 2024 20:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE94C4CEDD;
	Thu,  5 Dec 2024 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733430650;
	bh=4Q8+H2y5FnU0Zo2LpMai5VHA+mQYFkZLKUDC/zyQpog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=goVgtnGDRgeYmMhgzx9ZWjafhyLp2lLPQ9eVJAtPvUV5KD9C0RlkVN6zjYwyGY6Cv
	 /BqO/fW9g4rHlduBkcyJuq326utLvxfFZ3thMBeS8gNgylUbunOtwSdIuSH2FCCDVJ
	 5Pxkmw/GTptNSuNtgmFVc+wDDkMguoCTMWn6fUWE9yMyFzD7h6qq8kQX/w3wZERe0J
	 XF4Q9v+Q9hCm57g2e82r5acSZcEs9a5vmLGU4ZX2V4KJa7qwY6Zh+uvAooFRQDbDH2
	 L8bLBHAaX/eTNfrokisRcS+WnQGLOJgDcUMeZ0pfMmspd09LBN1jIuNCnDOxDfhiZa
	 lODOX2lS8Qvpg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/8] wifi: ath12k: parse multiple device information from Device Tree
Date: Thu,  5 Dec 2024 22:30:38 +0200
Message-Id: <20241205203044.589499-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205203044.589499-1-kvalo@kernel.org>
References: <20241205203044.589499-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_123051_637931_52C07DA2 
X-CRM114-Status: GOOD (  26.18  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Currently, a single device is part of the device group abstraction. However,
for multi-link operations, multiple devices need to be combined. This
multi-device grouping is done via WSI (WLAN Serial Interface), which is
described in the Device Tree. Information about different WSI groups and the
number of devices involved in each group can be parsed from the Device Tree.

Add changes to parse the Device Tree and determine WSI information, such as the
different WSI groups and the number of devices per WSI group. Assign WSI index
zero to the WSI controller device (to synchronize the clock among the devices
within the WSI group), and increment the WSI index of each device in the order
of the WSI connection.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 183 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/core.h |   8 ++
 2 files changed, 178 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 49d1ac15cb7a..1a43e00cffb2 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -9,6 +9,7 @@
 #include <linux/remoteproc.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include "core.h"
 #include "dp_tx.h"
 #include "dp_rx.h"
@@ -1383,20 +1384,24 @@ bool ath12k_core_hw_group_create_ready(struct ath12k_hw_group *ag)
 	return (ag->num_probed == ag->num_devices);
 }
 
-static struct ath12k_hw_group *ath12k_core_hw_group_alloc(u8 id, u8 max_devices)
+static struct ath12k_hw_group *ath12k_core_hw_group_alloc(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag;
+	int count = 0;
 
 	lockdep_assert_held(&ath12k_hw_group_mutex);
 
+	list_for_each_entry(ag, &ath12k_hw_group_list, list)
+		count++;
+
 	ag = kzalloc(sizeof(*ag), GFP_KERNEL);
 	if (!ag)
 		return NULL;
 
-	ag->id = id;
-	ag->num_devices = max_devices;
+	ag->id = count;
 	list_add(&ag->list, &ath12k_hw_group_list);
 	mutex_init(&ag->mutex);
+	ag->mlo_capable = false;
 
 	return ag;
 }
@@ -1411,35 +1416,180 @@ static void ath12k_core_hw_group_free(struct ath12k_hw_group *ag)
 	mutex_unlock(&ath12k_hw_group_mutex);
 }
 
+static struct ath12k_hw_group *ath12k_core_hw_group_find_by_dt(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag;
+	int i;
+
+	if (!ab->dev->of_node)
+		return NULL;
+
+	list_for_each_entry(ag, &ath12k_hw_group_list, list)
+		for (i = 0; i < ag->num_devices; i++)
+			if (ag->wsi_node[i] == ab->dev->of_node)
+				return ag;
+
+	return NULL;
+}
+
+static int ath12k_core_get_wsi_info(struct ath12k_hw_group *ag,
+				    struct ath12k_base *ab)
+{
+	struct device_node *wsi_dev = ab->dev->of_node, *next_wsi_dev;
+	struct device_node *tx_endpoint, *next_rx_endpoint;
+	int device_count = 0;
+
+	next_wsi_dev = wsi_dev;
+
+	if (!next_wsi_dev)
+		return -ENODEV;
+
+	do {
+		ag->wsi_node[device_count] = next_wsi_dev;
+
+		tx_endpoint = of_graph_get_endpoint_by_regs(next_wsi_dev, 0, -1);
+		if (!tx_endpoint) {
+			of_node_put(next_wsi_dev);
+			return -ENODEV;
+		}
+
+		next_rx_endpoint = of_graph_get_remote_endpoint(tx_endpoint);
+		if (!next_rx_endpoint) {
+			of_node_put(next_wsi_dev);
+			of_node_put(tx_endpoint);
+			return -ENODEV;
+		}
+
+		of_node_put(tx_endpoint);
+		of_node_put(next_wsi_dev);
+
+		next_wsi_dev = of_graph_get_port_parent(next_rx_endpoint);
+		if (!next_wsi_dev) {
+			of_node_put(next_rx_endpoint);
+			return -ENODEV;
+		}
+
+		of_node_put(next_rx_endpoint);
+
+		device_count++;
+		if (device_count > ATH12K_MAX_SOCS) {
+			ath12k_warn(ab, "device count in DT %d is more than limit %d\n",
+				    device_count, ATH12K_MAX_SOCS);
+			of_node_put(next_wsi_dev);
+			return -EINVAL;
+		}
+	} while (wsi_dev != next_wsi_dev);
+
+	of_node_put(next_wsi_dev);
+	ag->num_devices = device_count;
+
+	return 0;
+}
+
+static int ath12k_core_get_wsi_index(struct ath12k_hw_group *ag,
+				     struct ath12k_base *ab)
+{
+	int i, wsi_controller_index = -1, node_index = -1;
+	bool control;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		control = of_property_read_bool(ag->wsi_node[i], "qcom,wsi-controller");
+		if (control)
+			wsi_controller_index = i;
+
+		if (ag->wsi_node[i] == ab->dev->of_node)
+			node_index = i;
+	}
+
+	if (wsi_controller_index == -1) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "wsi controller is not defined in dt");
+		return -EINVAL;
+	}
+
+	if (node_index == -1) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "unable to get WSI node index");
+		return -EINVAL;
+	}
+
+	ab->wsi_info.index = (ag->num_devices + node_index - wsi_controller_index) %
+		ag->num_devices;
+
+	return 0;
+}
+
 static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *ab)
 {
-	u32 group_id = ATH12K_INVALID_GROUP_ID;
+	struct ath12k_wsi_info *wsi = &ab->wsi_info;
 	struct ath12k_hw_group *ag;
 
 	lockdep_assert_held(&ath12k_hw_group_mutex);
 
 	/* The grouping of multiple devices will be done based on device tree file.
-	 * TODO: device tree file parsing to know about the devices involved in group.
+	 * The platforms that do not have any valid group information would have
+	 * each device to be part of its own invalid group.
 	 *
-	 * The platforms that do not have any valid group information would have each
-	 * device to be part of its own invalid group.
-	 *
-	 * Currently, we are not parsing any device tree information and hence, grouping
-	 * of multiple devices is not involved. Thus, single device is added to device
-	 * group.
+	 * We use group id ATH12K_INVALID_GROUP_ID for single device group
+	 * which didn't have dt entry or wrong dt entry, there could be many
+	 * groups with same group id, i.e ATH12K_INVALID_GROUP_ID. So
+	 * default group id of ATH12K_INVALID_GROUP_ID combined with
+	 * num devices in ath12k_hw_group determines if the group is
+	 * multi device or single device group
 	 */
-	ag = ath12k_core_hw_group_alloc(group_id, 1);
+
+	ag = ath12k_core_hw_group_find_by_dt(ab);
+	if (!ag) {
+		ag = ath12k_core_hw_group_alloc(ab);
+		if (!ag) {
+			ath12k_warn(ab, "unable to create new hw group\n");
+			return NULL;
+		}
+
+		if (ath12k_core_get_wsi_info(ag, ab) ||
+		    ath12k_core_get_wsi_index(ag, ab)) {
+			ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				   "unable to get wsi info from dt, grouping single device");
+			ag->id = ATH12K_INVALID_GROUP_ID;
+			ag->num_devices = 1;
+			memset(ag->wsi_node, 0, sizeof(ag->wsi_node));
+			wsi->index = 0;
+		}
+
+		goto exit;
+	} else if (test_bit(ATH12K_GROUP_FLAG_UNREGISTER, &ag->flags)) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "group id %d in unregister state\n",
+			   ag->id);
+		goto invalid_group;
+	} else {
+		if (ath12k_core_get_wsi_index(ag, ab))
+			goto invalid_group;
+		goto exit;
+	}
+
+invalid_group:
+	ag = ath12k_core_hw_group_alloc(ab);
 	if (!ag) {
 		ath12k_warn(ab, "unable to create new hw group\n");
 		return NULL;
 	}
 
+	ag->id = ATH12K_INVALID_GROUP_ID;
+	ag->num_devices = 1;
+	wsi->index = 0;
+
 	ath12k_dbg(ab, ATH12K_DBG_BOOT, "single device added to hardware group\n");
 
+exit:
+	if (ag->num_probed >= ag->num_devices) {
+		ath12k_warn(ab, "unable to add new device to group, max limit reached\n");
+		goto invalid_group;
+	}
+
 	ab->device_id = ag->num_probed++;
 	ag->ab[ab->device_id] = ab;
 	ab->ag = ag;
-	ag->mlo_capable = false;
+
+	ath12k_dbg(ab, ATH12K_DBG_BOOT, "wsi group-id %d num-devices %d index %d",
+		   ag->id, ag->num_devices, wsi->index);
 
 	return ag;
 }
@@ -1507,6 +1657,13 @@ static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)
 
 	mutex_lock(&ag->mutex);
 
+	if (test_bit(ATH12K_GROUP_FLAG_UNREGISTER, &ag->flags)) {
+		mutex_unlock(&ag->mutex);
+		return;
+	}
+
+	set_bit(ATH12K_GROUP_FLAG_UNREGISTER, &ag->flags);
+
 	ath12k_core_hw_group_stop(ag);
 
 	for (i = 0; i < ag->num_devices; i++) {
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 458e3d0071a8..d0e466819036 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -219,6 +219,7 @@ enum ath12k_scan_state {
 
 enum ath12k_hw_group_flags {
 	ATH12K_GROUP_FLAG_REGISTERED,
+	ATH12K_GROUP_FLAG_UNREGISTER,
 };
 
 enum ath12k_dev_flags {
@@ -845,6 +846,12 @@ struct ath12k_hw_group {
 	struct ath12k_hw *ah[ATH12K_GROUP_MAX_RADIO];
 	u8 num_hw;
 	bool mlo_capable;
+	struct device_node *wsi_node[ATH12K_MAX_SOCS];
+};
+
+/* Holds WSI info specific to each device, excluding WSI group info */
+struct ath12k_wsi_info {
+	u32 index;
 };
 
 /* Master structure to hold the hw data which may be used in core module */
@@ -1028,6 +1035,7 @@ struct ath12k_base {
 	struct notifier_block panic_nb;
 
 	struct ath12k_hw_group *ag;
+	struct ath12k_wsi_info wsi_info;
 
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
-- 
2.39.5



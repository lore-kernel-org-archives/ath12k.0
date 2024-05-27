Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE29C25B74
	for <ath12k@archiver.kernel.org>; Mon, 27 May 2024 07:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKkYY+fxG0JFx6qzdH8OY27raY2dKZT7t1X6YeLzNuk=; b=rBW27YT7GOX344GMPU3X5gGKSX
	oPLrOk43X1DAZiL24cuehKkfOvZL0t81dcZ/qJCcJQgaXhR8PppNfSIlexVDf6TKDrzp300S2J8cZ
	Lqcw8X2yLsvq+MdZeNy3Fyrlo3VzkrAJeKu7sE6QRiLYwng3KOF0bcE+wUQoPp1mW0wYEeLvdTiOR
	7+uB5HhvH64G56vR2RIi5j+nwSbewdUSKSeyi+/5eDTB3qdsOhiaJeqj51nB1yU04TWQ7lKWhimVb
	hQu8T61ptovf52BO6F4UwXwxz26cZpUId51m8Pu50wv8hHeGxRFqY/4EI19S/ik/A3d9S0A/fZB8h
	loL7ehdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUvS-0000000E5az-2BIq
	for ath12k@archiver.kernel.org;
	Mon, 27 May 2024 07:37:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUvN-0000000E5XN-04Dw
	for ath12k@lists.infradead.org;
	Mon, 27 May 2024 07:37:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R0k2hi013343
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XKkYY+fxG0J
	Fx6qzdH8OY27raY2dKZT7t1X6YeLzNuk=; b=jWxxogi9KG9eOwp1A4+UQdFJsKB
	4/5AovhyZGum61AmnWc9stUMa8iTTG3gu6vwny44RW0HyIUXW86ixE94eMJWvNpv
	xOulOZfgtpmJnqLOlmX4Z4XBBUPCTiCYiGF8WNhcq4BVfLr0G48u2qdZY8xUwooi
	kS9Ey5tMoG1kEYpRgTtcyALnr7RnbjJDiC8DgxDk/rm0hTu5e6dtkpCm1Y5+PEiG
	JRsKupDNKETs6/gY5iJzZej+gJu+8AAPpRm536CCsYmUH0f1srt3uh52ihM2QcI2
	YTXfOLb0bfgjMaTS4SQxYQ7woxa6LqukRWRS2Anp7V31nUNP0kxMhyei2Iw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2pjw1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44R7bUVr017198
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3yb92k9at5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:36 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44R7bVIo017215
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:36 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44R7baqC017262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 07:37:36 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 57DB14114B; Mon, 27 May 2024 13:07:35 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v6 6/8] wifi: ath12k: Introduce device group abstraction
Date: Mon, 27 May 2024 13:07:21 +0530
Message-Id: <20240527073723.2520319-7-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073723.2520319-1-quic_hprem@quicinc.com>
References: <20240527073723.2520319-1-quic_hprem@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nr4YVTaHPAJXe90Y3MyahcgMK85MPojt
X-Proofpoint-ORIG-GUID: nr4YVTaHPAJXe90Y3MyahcgMK85MPojt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_003741_330424_66141455 
X-CRM114-Status: GOOD (  27.79  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, single device is probed and once firmware is ready, the device
is registered to mac80211. For multi-link operation, different bands of
different devices or same device would be part of a single wiphy and for
this, hardware device group abstraction would be helpful.

Hardware device group abstraction - when there are multiple devices (with
single radio or dual radio) that are connected by any means of interface
for communicating between them, then these devices can be combined
together as a single group using a group id to form a group abstraction
and register to mac80211.

The grouping information of multiple devices would be based on device tree
during device probe. If no such information is available then a single
device will be part of group abstraction and registered to mac80211 else
multiple devices advertised in device tree are combined and then registered
to mac80211.

For device group abstraction, a base structure named ath12k_hw_group (ag)
and the following helpers are introduced:
        ath12k_core_hw_group_alloc()    : allocate ath12k_hw_group (ag)
                                          based on group id and number
                                          of devices that are going to
                                          be part of this group.
        ath12k_core_hw_group_free()     : free ag during deinit.
        ath12k_core_assign_hw_group()   : assign/map the details of group
                                          to ath12k_base (ab).
        ath12k_core_unassign_hw_group() : unassign/unmap the details of ag
                                          in ath12k_base (ab).
        ath12k_core_hw_group_create()   : create the devices which are part
                                          of group (ag).
        ath12k_core_hw_group_destroy()  : cleanup the devices in ag

These helpers are used during device probe and mapping the group to the
devices involved.

Please find the illustration of how multiple devices might be combined
together in future based on group id.

                Grouping of multiple devices (in future)

+------------------------------------------------------------------------+
|  +-------------------------------------+       +-------------------+   |
|  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
|  |   | ar (2GHz) | | | | ar (5GHz) |   |       |   | ar (6GHz) |   |   |
|  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
|  |          ath12k_base (ab)           |       | ath12k_base (ab)  |   |
|  |         (Dual band device)          |       |                   |   |
|  +-------------------------------------+       +-------------------+   |
|                 ath12k_hw_group (ag) based on group id                 |
+------------------------------------------------------------------------+

In the above representation, two devices are combined into single group
based on group id.

Add base code changes where single device would be part of a group with an
invalid group id forming an group abstraction. Multi device grouping will
be introduced in future.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 218 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/core.h |  19 +++
 drivers/net/wireless/ath/ath12k/pci.c  |   1 +
 3 files changed, 229 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 7ad65ace7123..ebe31cbb6435 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -21,6 +21,9 @@ unsigned int ath12k_debug_mask;
 module_param_named(debug_mask, ath12k_debug_mask, uint, 0644);
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 
+static DEFINE_MUTEX(ath12k_hw_lock);
+static struct list_head ath12k_hw_groups = LIST_HEAD_INIT(ath12k_hw_groups);
+
 static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 {
 	struct ath12k *ar;
@@ -1185,20 +1188,111 @@ int ath12k_core_pre_init(struct ath12k_base *ab)
 	return 0;
 }
 
-int ath12k_core_init(struct ath12k_base *ab)
+static inline
+bool ath12k_core_hw_group_create_ready(struct ath12k_hw_group *ag)
 {
-	int ret;
+	lockdep_assert_held(&ag->mutex_lock);
 
-	ret = ath12k_core_soc_create(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to create soc core: %d\n", ret);
-		return ret;
+	return (ag->num_probed == ag->num_devices);
+}
+
+static struct ath12k_hw_group *
+ath12k_core_hw_group_alloc(u8 id, u8 max_devices)
+{
+	struct ath12k_hw_group *ag;
+
+	lockdep_assert_held(&ath12k_hw_lock);
+
+	ag = kzalloc(sizeof(*ag), GFP_KERNEL);
+	if (!ag)
+		return NULL;
+
+	ag->id = id;
+	ag->num_devices = max_devices;
+	list_add(&ag->list, &ath12k_hw_groups);
+	mutex_init(&ag->mutex_lock);
+
+	return ag;
+}
+
+static void ath12k_core_hw_group_free(struct ath12k_hw_group *ag)
+{
+	mutex_lock(&ath12k_hw_lock);
+
+	list_del(&ag->list);
+	kfree(ag);
+
+	mutex_unlock(&ath12k_hw_lock);
+}
+
+static struct ath12k_hw_group *ath12k_core_assign_hw_group(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag;
+	u32 group_id = ATH12K_INVALID_GROUP_ID;
+
+	lockdep_assert_held(&ath12k_hw_lock);
+
+	/* The grouping of multiple devices will be done based on device tree file.
+	 * TODO: device tree file parsing to know about the devices involved in group.
+	 *
+	 * The platforms that do not have any valid group information would have each
+	 * device to be part of its own invalid group.
+	 *
+	 * Currently, we are not parsing any device tree information and hence, grouping
+	 * of multiple devices is not involved. Thus, single device is added to device
+	 * group.
+	 */
+	ag = ath12k_core_hw_group_alloc(group_id, 1);
+	if (!ag) {
+		ath12k_warn(ab, "unable to create new hw group\n");
+		return NULL;
 	}
+	ath12k_dbg(ab, ATH12K_DBG_BOOT, "Single device is added to hardware group\n");
 
-	return 0;
+	ab->device_id = ag->num_probed++;
+	ag->ab[ab->device_id] = ab;
+	ab->ag = ag;
+
+	return ag;
 }
 
-void ath12k_core_deinit(struct ath12k_base *ab)
+void ath12k_core_unassign_hw_group(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag = ab->ag;
+	u8 device_id = ab->device_id;
+	int num_probed;
+
+	if (!ag)
+		return;
+
+	mutex_lock(&ag->mutex_lock);
+
+	if (WARN_ON(device_id >= ag->num_devices)) {
+		mutex_unlock(&ag->mutex_lock);
+		return;
+	}
+
+	if (WARN_ON(ag->ab[device_id] != ab)) {
+		mutex_unlock(&ag->mutex_lock);
+		return;
+	}
+
+	ag->ab[device_id] = NULL;
+	ab->ag = NULL;
+	ab->device_id = ATH12K_INVALID_DEVICE_ID;
+
+	if (ag->num_probed)
+		ag->num_probed--;
+
+	num_probed = ag->num_probed;
+
+	mutex_unlock(&ag->mutex_lock);
+
+	if (!num_probed)
+		ath12k_core_hw_group_free(ag);
+}
+
+static void ath12k_core_device_cleanup(struct ath12k_base *ab)
 {
 	mutex_lock(&ab->core_lock);
 
@@ -1209,8 +1303,114 @@ void ath12k_core_deinit(struct ath12k_base *ab)
 	ath12k_core_stop(ab);
 
 	mutex_unlock(&ab->core_lock);
+}
+
+static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i;
 
-	ath12k_core_soc_destroy(ab);
+	if (WARN_ON(!ag))
+		return;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		if (test_and_clear_bit(ATH12K_FLAG_HW_GROUP_ATTACHED, &ab->dev_flags))
+			ath12k_core_soc_destroy(ab);
+	}
+}
+
+static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i;
+
+	if (!ag)
+		return;
+
+	mutex_lock(&ag->mutex_lock);
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		if (test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))
+			ath12k_core_device_cleanup(ab);
+	}
+	mutex_unlock(&ag->mutex_lock);
+}
+
+static int ath12k_core_hw_group_create(struct ath12k_hw_group *ag)
+{
+	int i, ret;
+	struct ath12k_base *ab;
+
+	lockdep_assert_held(&ag->mutex_lock);
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		mutex_lock(&ab->core_lock);
+		ret = ath12k_core_soc_create(ab);
+		if (ret) {
+			mutex_unlock(&ab->core_lock);
+			ath12k_err(ab, "failed to create soc core: %d\n", ret);
+			return ret;
+		}
+		set_bit(ATH12K_FLAG_HW_GROUP_ATTACHED, &ab->dev_flags);
+		mutex_unlock(&ab->core_lock);
+	}
+
+	return 0;
+}
+
+int ath12k_core_init(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag;
+	int ret;
+
+	mutex_lock(&ath12k_hw_lock);
+	ag = ath12k_core_assign_hw_group(ab);
+	if (!ag) {
+		mutex_unlock(&ath12k_hw_lock);
+		ath12k_warn(ab, "unable to get hw group\n");
+		return -ENODEV;
+	}
+	mutex_unlock(&ath12k_hw_lock);
+
+	mutex_lock(&ag->mutex_lock);
+
+	ath12k_dbg(ab, ATH12K_DBG_BOOT, "num devices in group %d, num probed %d\n",
+		   ag->num_devices, ag->num_probed);
+
+	if (ath12k_core_hw_group_create_ready(ag)) {
+		ret = ath12k_core_hw_group_create(ag);
+		if (ret) {
+			mutex_unlock(&ag->mutex_lock);
+			ath12k_warn(ab, "unable to create hw group\n");
+			goto err_hw_group;
+		}
+	}
+	mutex_unlock(&ag->mutex_lock);
+
+	return 0;
+
+err_hw_group:
+	ath12k_core_hw_group_destroy(ab->ag);
+	ath12k_core_unassign_hw_group(ab);
+	return ret;
+}
+
+void ath12k_core_deinit(struct ath12k_base *ab)
+{
+	ath12k_core_hw_group_cleanup(ab->ag);
+	ath12k_core_hw_group_destroy(ab->ag);
+	ath12k_core_unassign_hw_group(ab);
 }
 
 void ath12k_core_free(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bc2a9e1b1885..a6b8c100ebc8 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -59,6 +59,10 @@
 #define ATH12K_RECONFIGURE_TIMEOUT_HZ		(10 * HZ)
 #define ATH12K_RECOVER_START_TIMEOUT_HZ		(20 * HZ)
 
+#define ATH12K_MAX_SOCS 3
+#define ATH12K_INVALID_GROUP_ID  0xFF
+#define ATH12K_INVALID_DEVICE_ID 0xFF
+
 enum ath12k_bdf_search {
 	ATH12K_BDF_SEARCH_DEFAULT,
 	ATH12K_BDF_SEARCH_BUS_AND_BOARD,
@@ -209,6 +213,7 @@ enum ath12k_dev_flags {
 	ATH12K_FLAG_CE_IRQ_ENABLED,
 	ATH12K_FLAG_EXT_IRQ_ENABLED,
 	ATH12K_FLAG_QMI_FW_READY_COMPLETE,
+	ATH12K_FLAG_HW_GROUP_ATTACHED,
 };
 
 struct ath12k_tx_conf {
@@ -725,6 +730,17 @@ struct ath12k_soc_dp_stats {
 	struct ath12k_soc_dp_tx_err_stats tx_err;
 };
 
+/* Holds info on the group of devices that are registered as a single wiphy */
+struct ath12k_hw_group {
+	struct list_head list;
+	u8 id;
+	u8 num_devices;
+	u8 num_probed;
+	struct ath12k_base *ab[ATH12K_MAX_SOCS];
+	/* To synchronize group create, assign, start, stop */
+	struct mutex mutex_lock;
+};
+
 /**
  * enum ath12k_link_capable_flags - link capable flags
  *
@@ -925,6 +941,8 @@ struct ath12k_base {
 
 #endif /* CONFIG_ACPI */
 
+	struct ath12k_hw_group *ag;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
@@ -955,6 +973,7 @@ int ath12k_core_resume_early(struct ath12k_base *ab);
 int ath12k_core_resume(struct ath12k_base *ab);
 int ath12k_core_suspend(struct ath12k_base *ab);
 int ath12k_core_suspend_late(struct ath12k_base *ab);
+void ath12k_core_unassign_hw_group(struct ath12k_base *ab);
 
 const struct firmware *ath12k_core_firmware_request(struct ath12k_base *ab,
 						    const char *filename);
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 8f37f6efb8a2..82d6aedb0963 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1522,6 +1522,7 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
 		ath12k_pci_power_down(ab, false);
 		ath12k_qmi_deinit_service(ab);
+		ath12k_core_unassign_hw_group(ab);
 		goto qmi_fail;
 	}
 
-- 
2.34.1



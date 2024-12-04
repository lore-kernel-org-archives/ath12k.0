Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB15E7716D
	for <ath12k@archiver.kernel.org>; Wed,  4 Dec 2024 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h5hYC/sF6PdNyUrRQmDpFUJ1rEQqnWvCfUenIWh7Rk=; b=zy14kQwHu+3QFfjo5Y4zm6Jyu4
	APBn3g8+/qkD3bRcfr+IjWvmo1EeLSCkQgS/DEXJWeEgIrMaqZT5FxT00WPxdEk9I/2qb1bpMm2b4
	5rsVj5bVREcLRolO1gc0PXgznFHOzNIKokbrHiDxqlNLFku+DftD50juLpxmzmoynBRR0+PyAd7kG
	fgLEoOoo2OAXH/ivX2Jph0Vu/a+OShzswFg2IH1bWWP1ZVZJkv1gvQHuZCYg9shFmTLlJUmnZ4Nwa
	YlwKS9DHK/aoXA5HT0roKUCUbJnsL3ZZMm3RF4UI06iC6/xlkLeKiZDmIDGRx2MjxKvYKLxvDlJO7
	pyZIQI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIg-0000000DCWM-2kaI
	for ath12k@archiver.kernel.org;
	Wed, 04 Dec 2024 16:32:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIe-0000000DCUi-2wBS
	for ath12k@bombadil.infradead.org;
	Wed, 04 Dec 2024 16:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6h5hYC/sF6PdNyUrRQmDpFUJ1rEQqnWvCfUenIWh7Rk=; b=WtmosjD6qToRaLl+NDbfi3jCqB
	cgywT1W093DW506Aj40y+ygZlo72weD1x3BaoyVd1WHkH09Sw0rQVFZooQdYophRdPGfQ+rxNIcV7
	sK3JkpHOFN2x85rR+qxyoAuyBkvl6uPyUAFl4CBnOvEtYtBRXKQ36cvCiRgTRNXeXofQ4n77fyQJo
	OSssqDk6z7Vx0gCaPQb2myWiJpn25/j2qCfr203dVDU2aU6lU2sziY3uz5bPO7MUT0qDx8W6yZ7eS
	VWit4hyBnWqNAWOnTtlaeiZaNT/u32uir8OvJ/gakYa5f0E/EKwq0D7K12c+gnbQsvrgP8kn+ZuJS
	uPl/NEig==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIb-00000002et9-3HFe
	for ath12k@lists.infradead.org;
	Wed, 04 Dec 2024 16:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D96B3A41A2C
	for <ath12k@lists.infradead.org>; Wed,  4 Dec 2024 16:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256A1C4CED1;
	Wed,  4 Dec 2024 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733329942;
	bh=eOwBX+tMPFKV/Z+PuXHK2DnM5Hw8dvGaA7Y4eazG6YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y8UgreYkqZwy1KNtSJZ9MQyU/lrU4chGgFuOKmp/qHITZux96DFh7D9WKeuGIgZpR
	 0iTJPeX85+IPzmKDT9Ut5vI8Vxl4dFvRFI1CjobKYBDkVDjEy97blDll3jkPxtHGJ6
	 7+14KUAbNpK10B/eORVQR2GHUyMyeP7qfv5Pvhbdz9CRZMKr8U4BuKk57trhweDatu
	 dYhfGetD2+iin3tRdStSy+b6dC5lR4kQC71kjJxVL2kHyHysm3ttcTlG1IhdYNlEOh
	 KK/svsdyhP7F94c3K8gZo+p2TPFmF/jgVJRuLA9orN53RcMrRv5ESh3Kxi8zz8l2/v
	 ThXW5HIZCbLtg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 3/7] wifi: ath12k: introduce device group abstraction
Date: Wed,  4 Dec 2024 18:32:12 +0200
Message-Id: <20241204163216.433795-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204163216.433795-1-kvalo@kernel.org>
References: <20241204163216.433795-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_163226_136797_829656F7 
X-CRM114-Status: GOOD (  25.29  )
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

Currently, single device is probed, and once firmware is ready, the device
is registered to mac80211. For Multi-Link Operation, different bands of
different devices or same device are part of a single wiphy and for
this, hardware device group abstraction is needed.

Hardware device group abstraction - when there are multiple devices (with
single radio or dual radio) that are connected by any means of interface
for communicating between them, then these devices can be combined
together as a single group using a group id to form a group abstraction
and register to mac80211.

The grouping information of multiple devices would be based on device tree
during device probe (will be implemented in future patches). If no such
information is available, then a single device will be part of group abstraction
and registered to mac80211, else multiple devices advertised in device tree are
combined and then registered to mac80211.

For device group abstraction, a base structure ath12k_hw_group (ag) and the
helpers are implemented. These helpers are used during device probe and mapping
the group to the devices involved.

An illustration of how multiple devices might be combined together in
future based on group id:

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

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 237 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/core.h |  17 ++
 drivers/net/wireless/ath/ath12k/pci.c  |   1 +
 3 files changed, 239 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 568c9b6e2c1c..41e3454b60f5 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -22,6 +22,11 @@ unsigned int ath12k_debug_mask;
 module_param_named(debug_mask, ath12k_debug_mask, uint, 0644);
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 
+/* protected with ath12k_hw_group_mutex */
+static struct list_head ath12k_hw_group_list = LIST_HEAD_INIT(ath12k_hw_group_list);
+
+static DEFINE_MUTEX(ath12k_hw_group_mutex);
+
 static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 {
 	struct ath12k *ar;
@@ -1244,27 +1249,112 @@ static void ath12k_core_panic_notifier_unregister(struct ath12k_base *ab)
 					 &ab->panic_nb);
 }
 
-int ath12k_core_init(struct ath12k_base *ab)
+static inline
+bool ath12k_core_hw_group_create_ready(struct ath12k_hw_group *ag)
 {
-	int ret;
+	lockdep_assert_held(&ag->mutex);
 
-	ret = ath12k_core_soc_create(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to create soc core: %d\n", ret);
-		return ret;
-	}
-
-	ret = ath12k_core_panic_notifier_register(ab);
-	if (ret)
-		ath12k_warn(ab, "failed to register panic handler: %d\n", ret);
-
-	return 0;
+	return (ag->num_probed == ag->num_devices);
 }
 
-void ath12k_core_deinit(struct ath12k_base *ab)
+static struct ath12k_hw_group *ath12k_core_hw_group_alloc(u8 id, u8 max_devices)
 {
-	ath12k_core_panic_notifier_unregister(ab);
+	struct ath12k_hw_group *ag;
 
+	lockdep_assert_held(&ath12k_hw_group_mutex);
+
+	ag = kzalloc(sizeof(*ag), GFP_KERNEL);
+	if (!ag)
+		return NULL;
+
+	ag->id = id;
+	ag->num_devices = max_devices;
+	list_add(&ag->list, &ath12k_hw_group_list);
+	mutex_init(&ag->mutex);
+
+	return ag;
+}
+
+static void ath12k_core_hw_group_free(struct ath12k_hw_group *ag)
+{
+	mutex_lock(&ath12k_hw_group_mutex);
+
+	list_del(&ag->list);
+	kfree(ag);
+
+	mutex_unlock(&ath12k_hw_group_mutex);
+}
+
+static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *ab)
+{
+	u32 group_id = ATH12K_INVALID_GROUP_ID;
+	struct ath12k_hw_group *ag;
+
+	lockdep_assert_held(&ath12k_hw_group_mutex);
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
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_BOOT, "single device added to hardware group\n");
+
+	ab->device_id = ag->num_probed++;
+	ag->ab[ab->device_id] = ab;
+	ab->ag = ag;
+
+	return ag;
+}
+
+void ath12k_core_hw_group_unassign(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag = ab->ag;
+	u8 device_id = ab->device_id;
+	int num_probed;
+
+	if (!ag)
+		return;
+
+	mutex_lock(&ag->mutex);
+
+	if (WARN_ON(device_id >= ag->num_devices)) {
+		mutex_unlock(&ag->mutex);
+		return;
+	}
+
+	if (WARN_ON(ag->ab[device_id] != ab)) {
+		mutex_unlock(&ag->mutex);
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
+	mutex_unlock(&ag->mutex);
+
+	if (!num_probed)
+		ath12k_core_hw_group_free(ag);
+}
+
+static void ath12k_core_device_cleanup(struct ath12k_base *ab)
+{
 	mutex_lock(&ab->core_lock);
 
 	ath12k_hif_irq_disable(ab);
@@ -1274,8 +1364,123 @@ void ath12k_core_deinit(struct ath12k_base *ab)
 	ath12k_core_stop(ab);
 
 	mutex_unlock(&ab->core_lock);
+}
 
-	ath12k_core_soc_destroy(ab);
+static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i;
+
+	if (WARN_ON(!ag))
+		return;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		ath12k_core_soc_destroy(ab);
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
+	mutex_lock(&ag->mutex);
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		ath12k_core_device_cleanup(ab);
+	}
+
+	mutex_unlock(&ag->mutex);
+}
+
+static int ath12k_core_hw_group_create(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i, ret;
+
+	lockdep_assert_held(&ag->mutex);
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		mutex_lock(&ab->core_lock);
+
+		ret = ath12k_core_soc_create(ab);
+		if (ret) {
+			mutex_unlock(&ab->core_lock);
+			ath12k_err(ab, "failed to create soc core: %d\n", ret);
+			return ret;
+		}
+
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
+	ret = ath12k_core_panic_notifier_register(ab);
+	if (ret)
+		ath12k_warn(ab, "failed to register panic handler: %d\n", ret);
+
+	mutex_lock(&ath12k_hw_group_mutex);
+
+	ag = ath12k_core_hw_group_assign(ab);
+	if (!ag) {
+		mutex_unlock(&ath12k_hw_group_mutex);
+		ath12k_warn(ab, "unable to get hw group\n");
+		return -ENODEV;
+	}
+
+	mutex_unlock(&ath12k_hw_group_mutex);
+
+	mutex_lock(&ag->mutex);
+
+	ath12k_dbg(ab, ATH12K_DBG_BOOT, "num devices %d num probed %d\n",
+		   ag->num_devices, ag->num_probed);
+
+	if (ath12k_core_hw_group_create_ready(ag)) {
+		ret = ath12k_core_hw_group_create(ag);
+		if (ret) {
+			mutex_unlock(&ag->mutex);
+			ath12k_warn(ab, "unable to create hw group\n");
+			goto err;
+		}
+	}
+
+	mutex_unlock(&ag->mutex);
+
+	return 0;
+
+err:
+	ath12k_core_hw_group_destroy(ab->ag);
+	ath12k_core_hw_group_unassign(ab);
+	return ret;
+}
+
+void ath12k_core_deinit(struct ath12k_base *ab)
+{
+	ath12k_core_panic_notifier_unregister(ab);
+	ath12k_core_hw_group_cleanup(ab->ag);
+	ath12k_core_hw_group_destroy(ab->ag);
+	ath12k_core_hw_group_unassign(ab);
 }
 
 void ath12k_core_free(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d93ba844f61d..dca4b9a3538f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -816,6 +816,20 @@ struct ath12k_soc_dp_stats {
 	struct ath12k_soc_dp_tx_err_stats tx_err;
 };
 
+/* Holds info on the group of devices that are registered as a single
+ * wiphy, protected with struct ath12k_hw_group::mutex.
+ */
+struct ath12k_hw_group {
+	struct list_head list;
+	u8 id;
+	u8 num_devices;
+	u8 num_probed;
+	struct ath12k_base *ab[ATH12K_MAX_SOCS];
+
+	/* protects access to this struct */
+	struct mutex mutex;
+};
+
 /* Master structure to hold the hw data which may be used in core module */
 struct ath12k_base {
 	enum ath12k_hw_rev hw_rev;
@@ -1005,6 +1019,8 @@ struct ath12k_base {
 
 	struct notifier_block panic_nb;
 
+	struct ath12k_hw_group *ag;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
@@ -1035,6 +1051,7 @@ int ath12k_core_resume_early(struct ath12k_base *ab);
 int ath12k_core_resume(struct ath12k_base *ab);
 int ath12k_core_suspend(struct ath12k_base *ab);
 int ath12k_core_suspend_late(struct ath12k_base *ab);
+void ath12k_core_hw_group_unassign(struct ath12k_base *ab);
 
 const struct firmware *ath12k_core_firmware_request(struct ath12k_base *ab,
 						    const char *filename);
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 8dbc7377ae7c..06cff3849ab8 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1725,6 +1725,7 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
 		ath12k_pci_power_down(ab, false);
 		ath12k_qmi_deinit_service(ab);
+		ath12k_core_hw_group_unassign(ab);
 		goto qmi_fail;
 	}
 
-- 
2.39.5



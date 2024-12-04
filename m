Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D5AE7716D
	for <ath12k@archiver.kernel.org>; Wed,  4 Dec 2024 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pmSCPC14m4Mal9xG0lfkVpQiIw2+Hmht6Po67paeno=; b=z/ASg1dwZbcADL5Cryp0ZqumCx
	Q+cizbk8ewW8IxtToXdzBfAzIU1Cm6P8iaR7t8brh0BOx4apenNmN+gFEY9lowQDcBdtti1r6odZm
	P97gqQ9TuSNyEPPkZzi6eLOoNcSzHBu7iZgMEIstWkrR1ytT/dFyOAq64D9IzbEnSpPIuFfAZzHbi
	TQYQBf8SJlF09CSN5pgmUtne7tMSn5v4Ese4mq1coOfcIhbwdh+l++wZI+43wJJ8milcjHuRULhyk
	p+SpopLJCgC+/upAeobKBIYeWwoJVrN2kzHb2pkRs8mxstUYYXsUo3SB+3Jv48OiwDpuD+hrFngcr
	bGxyK35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tItPu-0000000DPeR-3VK4
	for ath12k@archiver.kernel.org;
	Wed, 04 Dec 2024 17:44:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIa-0000000DCST-34I2
	for ath12k@lists.infradead.org;
	Wed, 04 Dec 2024 16:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E502FA40C04
	for <ath12k@lists.infradead.org>; Wed,  4 Dec 2024 16:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB69C4CECD;
	Wed,  4 Dec 2024 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733329943;
	bh=yNWBoLpuMM1CGqIEGRaxfmG2n8G7gEySqM67EG1DS44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ir10Dx82sh1N3rCqVjnJSMyHOmwz+xsxTzQ5ZdKoDvh3I1zbqx6+oJRGc7zgr9EQ6
	 WY58fIdYGWCBRcpeVkl2wbjpdzSfDcA1mz0xDlkMI5J5ksf/SoR0r4FcYI3WN7d9+A
	 6xKhJB3yZblgsC7rEjQnQwvRNv08AFz/Pipd3FVgg7ykxRpXbqnTBLwWlueU2/3btU
	 70rbx9xf7ANWPpZKXdlkIiO/dyFOO0LnB71JbRaJUXKpec0FJuJuIZ4LEDcmaF2Lwv
	 Mi1No4zw2SHN4Ia/VB3lej2IWMrizq9fUVFSwRIVDCG1nMVYY/9s7+fmIoYGFbo+vH
	 ASk8ZshJv9tVA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 4/7] wifi: ath12k: refactor core start based on hardware group
Date: Wed,  4 Dec 2024 18:32:13 +0200
Message-Id: <20241204163216.433795-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204163216.433795-1-kvalo@kernel.org>
References: <20241204163216.433795-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_083224_900963_E5360AD7 
X-CRM114-Status: GOOD (  22.19  )
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

Currently, mac allocate/register and core_pdev_create are initiated immediately
when QMI firmware ready event is received for a particular device. With
hardware device group abstraction, QMI firmware ready event can be received
simultaneously for different devices in the group and so, it should not be
registered immediately rather it has to be deferred until all devices in the
group has received QMI firmware ready.

To handle this, refactor the code of core start to have registering within
ath12k_core_hw_group_start() and unregistering in ath12k_core_hw_group_stop().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 199 ++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/core.h |  22 +++
 drivers/net/wireless/ath/ath12k/qmi.c  |   4 +-
 3 files changed, 172 insertions(+), 53 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 41e3454b60f5..dea2c53bcc07 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -604,6 +604,8 @@ u32 ath12k_core_get_max_num_tids(struct ath12k_base *ab)
 
 static void ath12k_core_stop(struct ath12k_base *ab)
 {
+	ath12k_core_stopped(ab);
+
 	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
 		ath12k_qmi_firmware_stop(ab);
 
@@ -743,6 +745,8 @@ static int ath12k_core_start(struct ath12k_base *ab,
 {
 	int ret;
 
+	lockdep_assert_held(&ab->core_lock);
+
 	ret = ath12k_wmi_attach(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to attach wmi: %d\n", ret);
@@ -836,6 +840,10 @@ static int ath12k_core_start(struct ath12k_base *ab,
 		/* ACPI is optional so continue in case of an error */
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "acpi failed: %d\n", ret);
 
+	if (!test_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags))
+		/* Indicate the core start in the appropriate group */
+		ath12k_core_started(ab);
+
 	return 0;
 
 err_reo_cleanup:
@@ -847,6 +855,96 @@ static int ath12k_core_start(struct ath12k_base *ab,
 	return ret;
 }
 
+static void ath12k_core_device_cleanup(struct ath12k_base *ab)
+{
+	mutex_lock(&ab->core_lock);
+
+	ath12k_hif_irq_disable(ab);
+	ath12k_core_pdev_destroy(ab);
+	ath12k_mac_unregister(ab);
+	ath12k_mac_destroy(ab);
+
+	mutex_unlock(&ab->core_lock);
+}
+
+static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i;
+
+	lockdep_assert_held(&ag->mutex);
+
+	for (i = ag->num_devices - 1; i >= 0; i--) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+		ath12k_core_device_cleanup(ab);
+	}
+}
+
+static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int ret, i;
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
+		/* Check if already registered or not, since same flow
+		 * execute for HW restart case.
+		 */
+		if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags))
+			goto core_pdev_create;
+
+		ret = ath12k_mac_allocate(ab);
+		if (ret) {
+			ath12k_err(ab, "failed to create new hw device with mac80211 :%d\n",
+				   ret);
+			mutex_unlock(&ab->core_lock);
+			return ret;
+		}
+
+		ret = ath12k_mac_register(ab);
+		if (ret) {
+			ath12k_err(ab, "failed to register radio with mac80211: %d\n",
+				   ret);
+			mutex_unlock(&ab->core_lock);
+			goto err;
+		}
+
+core_pdev_create:
+		ret = ath12k_core_pdev_create(ab);
+		if (ret) {
+			ath12k_err(ab, "failed to create pdev core %d\n", ret);
+			mutex_unlock(&ab->core_lock);
+			goto err;
+		}
+
+		ath12k_hif_irq_enable(ab);
+
+		ret = ath12k_core_rfkill_config(ab);
+		if (ret && ret != -EOPNOTSUPP) {
+			mutex_unlock(&ab->core_lock);
+			goto err;
+		}
+
+		mutex_unlock(&ab->core_lock);
+	}
+
+	return 0;
+
+err:
+	ath12k_core_hw_group_stop(ag);
+
+	return ret;
+}
+
 static int ath12k_core_start_firmware(struct ath12k_base *ab,
 				      enum ath12k_firmware_mode mode)
 {
@@ -864,9 +962,18 @@ static int ath12k_core_start_firmware(struct ath12k_base *ab,
 	return ret;
 }
 
+static inline
+bool ath12k_core_hw_group_start_ready(struct ath12k_hw_group *ag)
+{
+	lockdep_assert_held(&ag->mutex);
+
+	return (ag->num_started == ag->num_devices);
+}
+
 int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 {
-	int ret;
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
+	int ret, i;
 
 	ret = ath12k_core_start_firmware(ab, ATH12K_FIRMWARE_MODE_NORMAL);
 	if (ret) {
@@ -886,59 +993,50 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	mutex_lock(&ag->mutex);
 	mutex_lock(&ab->core_lock);
+
 	ret = ath12k_core_start(ab, ATH12K_FIRMWARE_MODE_NORMAL);
 	if (ret) {
 		ath12k_err(ab, "failed to start core: %d\n", ret);
 		goto err_dp_free;
 	}
 
-	ret = ath12k_mac_allocate(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to create new hw device with mac80211 :%d\n",
-			   ret);
-		goto err_core_stop;
-	}
-
-	ret = ath12k_mac_register(ab);
-	if (ret) {
-		ath12k_err(ab, "failed register the radio with mac80211: %d\n", ret);
-		goto err_mac_destroy;
-	}
-
-	ret = ath12k_core_pdev_create(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to create pdev core: %d\n", ret);
-		goto err_mac_unregister;
-	}
-
-	ath12k_hif_irq_enable(ab);
-
-	ret = ath12k_core_rfkill_config(ab);
-	if (ret && ret != -EOPNOTSUPP) {
-		ath12k_err(ab, "failed to config rfkill: %d\n", ret);
-		goto err_hif_irq_disable;
-	}
-
 	mutex_unlock(&ab->core_lock);
 
+	if (ath12k_core_hw_group_start_ready(ag)) {
+		ret = ath12k_core_hw_group_start(ag);
+		if (ret) {
+			ath12k_warn(ab, "unable to start hw group\n");
+			goto err_core_stop;
+		}
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "group %d started\n", ag->id);
+	}
+
+	mutex_unlock(&ag->mutex);
+
 	return 0;
 
-err_hif_irq_disable:
-	ath12k_hif_irq_disable(ab);
-	ath12k_core_pdev_destroy(ab);
-err_mac_unregister:
-	ath12k_mac_unregister(ab);
-err_mac_destroy:
-	ath12k_mac_destroy(ab);
 err_core_stop:
-	ath12k_core_stop(ab);
+	for (i = ag->num_devices - 1; i >= 0; i--) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		mutex_lock(&ab->core_lock);
+		ath12k_core_stop(ab);
+		mutex_unlock(&ab->core_lock);
+	}
+	goto exit;
+
 err_dp_free:
 	ath12k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
 err_firmware_stop:
 	ath12k_qmi_firmware_stop(ab);
 
+exit:
+	mutex_unlock(&ag->mutex);
 	return ret;
 }
 
@@ -1135,6 +1233,14 @@ static void ath12k_core_restart(struct work_struct *work)
 	}
 
 	if (ab->is_reset) {
+		if (!test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags)) {
+			atomic_dec(&ab->reset_count);
+			complete(&ab->reset_complete);
+			ab->is_reset = false;
+			atomic_set(&ab->fail_cont_count, 0);
+			ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset success\n");
+		}
+
 		for (i = 0; i < ath12k_get_num_hw(ab); i++) {
 			ah = ath12k_ab_to_ah(ab, i);
 			ieee80211_restart_hw(ah->hw);
@@ -1319,7 +1425,7 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
 
 void ath12k_core_hw_group_unassign(struct ath12k_base *ab)
 {
-	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
 	u8 device_id = ab->device_id;
 	int num_probed;
 
@@ -1353,19 +1459,6 @@ void ath12k_core_hw_group_unassign(struct ath12k_base *ab)
 		ath12k_core_hw_group_free(ag);
 }
 
-static void ath12k_core_device_cleanup(struct ath12k_base *ab)
-{
-	mutex_lock(&ab->core_lock);
-
-	ath12k_hif_irq_disable(ab);
-	ath12k_core_pdev_destroy(ab);
-	ath12k_mac_unregister(ab);
-	ath12k_mac_destroy(ab);
-	ath12k_core_stop(ab);
-
-	mutex_unlock(&ab->core_lock);
-}
-
 static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
 {
 	struct ath12k_base *ab;
@@ -1393,12 +1486,16 @@ static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)
 
 	mutex_lock(&ag->mutex);
 
+	ath12k_core_hw_group_stop(ag);
+
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
 		if (!ab)
 			continue;
 
-		ath12k_core_device_cleanup(ab);
+		mutex_lock(&ab->core_lock);
+		ath12k_core_stop(ab);
+		mutex_unlock(&ab->core_lock);
 	}
 
 	mutex_unlock(&ag->mutex);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index dca4b9a3538f..b8b1ee8d3302 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -824,6 +824,8 @@ struct ath12k_hw_group {
 	u8 id;
 	u8 num_devices;
 	u8 num_probed;
+	u8 num_started;
+	unsigned long flags;
 	struct ath12k_base *ab[ATH12K_MAX_SOCS];
 
 	/* protects access to this struct */
@@ -1175,4 +1177,24 @@ static inline int ath12k_get_num_hw(struct ath12k_base *ab)
 {
 	return ab->num_hw;
 }
+
+static inline struct ath12k_hw_group *ath12k_ab_to_ag(struct ath12k_base *ab)
+{
+	return ab->ag;
+}
+
+static inline void ath12k_core_started(struct ath12k_base *ab)
+{
+	lockdep_assert_held(&ab->ag->mutex);
+
+	ab->ag->num_started++;
+}
+
+static inline void ath12k_core_stopped(struct ath12k_base *ab)
+{
+	lockdep_assert_held(&ab->ag->mutex);
+
+	ab->ag->num_started--;
+}
+
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index efcf2dfac4ac..8b4d500fe426 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3321,7 +3321,6 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			break;
 		case ATH12K_QMI_EVENT_SERVER_EXIT:
 			set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
-			set_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
 			break;
 		case ATH12K_QMI_EVENT_REQUEST_MEM:
 			ret = ath12k_qmi_event_mem_request(qmi);
@@ -3338,13 +3337,14 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			if (test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags)) {
 				if (ab->is_reset)
 					ath12k_hal_dump_srng_stats(ab);
+
+				set_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
 				queue_work(ab->workqueue, &ab->restart_work);
 				break;
 			}
 
 			clear_bit(ATH12K_FLAG_CRASH_FLUSH,
 				  &ab->dev_flags);
-			clear_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
 			ret = ath12k_core_qmi_firmware_ready(ab);
 			if (!ret)
 				set_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE,
-- 
2.39.5



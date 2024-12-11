Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCC9E77183
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bHdh1LXysZzzpP/lt72OlGKAD+QD63HLTpiDBl3u7U=; b=NA1QXCu6CbxPNcAOB+ft0jmgVK
	Uk4jzsJk5ZqbRLdeHPZzgX4NtZP5D/f2QyNqRUtdPS0IeDq4rZLj7k+NMqdKLQ2Wo/YIKONd0wcOw
	shCvKNieacelQR0XmoZVPZVcBKANpOWU2bgRMMAQ/KEFIDHJxoeW5HpK6PqtKz/6CkmnzvFCqkRMz
	4gZRL7/KZuj3Zp5zNvsNLxQKkOPs+hsSOeqgcWaCiKhkBZIzSBoycf5ZLQX8tBtPYgm7c0Nk1CPkh
	+pxvZ8FIjyQ2NrfglU0MkFlDqbaVSaYMku8Zwd97MfTZlJeFKwzEyamMEMClwBIASaujsewn0uuZa
	5ErKP5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsf-0000000FIxe-2mak
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:44:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsd-0000000FIvi-11Bl
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:44:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05C18A40BB8
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53787C4CED2;
	Wed, 11 Dec 2024 15:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931842;
	bh=Pg3VZnen9pod2yEoejxGZ+ectvVGrsvQKPjCyF3HelQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ig99/Zg2/neKQdhq4NUaGCpr9hr/n1KlFZbdSPejcaoVYbAYTj25IXAxA8QOXEvaK
	 FUeNusR0P7EzVtPh9UCQ5J7EXhBavpxEkkd6Y61I2k1d8jKy9AkcNrPMFOjkULFwr7
	 tEbNDpJ1PgvkSKEIeQ5gzsouahQ8SeNloRtAPEjVSarEBlApYmINVyu2jOhopN5uAE
	 lbk1j6jw6rfpDybF+BRvvaYasfI19oz9q47PvckqTDopAAzYfaq9R4qWFXY/Ev25FA
	 a2D6dnyJt/8YoxYhAN4GhuVVkDp492ntDD6R23eUihLhJMCVq6qNvwppKBDQWqjaQP
	 42t+TLCG71ebg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/7] wifi: ath12k: symmetrize scan vdev creation and deletion during HW scan
Date: Wed, 11 Dec 2024 17:43:52 +0200
Message-Id: <20241211154358.776279-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211154358.776279-1-kvalo@kernel.org>
References: <20241211154358.776279-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074403_418092_4F0A12D1 
X-CRM114-Status: GOOD (  27.97  )
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

From: Aditya Kumar Singh <quic_adisi@quicinc.com>

Currently, the hardware scan is initiated in the driver on scan link (15).
After mapping to the appropriate radio based on the scan frequency, the vdev is
created and the scan begins. However, the vdev is only deleted when channel
assignment is about to occur after the scan. Additionally, it is also deleted
if a new scan is requested on the same interface but the underlying radio
differs in the new request.

This imbalance leads to various hardware scan issues, especially when a non-MLO
and MLO combination exists. In such cases, the latter tries to skip the scan
and proceed with channel assignment while the former is still scanning, causing
a firmware assert.

To address this issue, symmetrize the scan vdev creation and deletion during
hardware scan operations. This means creating a vdev when the scan starts and
deleting it once the scan is completed or aborted.

While at this, add a few debug prints in scan handling and a few empty lines
for better code read.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   3 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 120 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.c  |   3 +-
 3 files changed, 99 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d09ebcdde94f..9aed24597548 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -603,9 +603,10 @@ struct ath12k {
 		struct delayed_work timeout;
 		enum ath12k_scan_state state;
 		bool is_roc;
-		int vdev_id;
 		int roc_freq;
 		bool roc_notify;
+		struct wiphy_work vdev_clean_wk;
+		struct ath12k_link_vif *arvif;
 	} scan;
 
 	struct {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6f4a34c91038..bd5a3c790c3b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4000,22 +4000,9 @@ void __ath12k_mac_scan_finish(struct ath12k *ar)
 			ieee80211_remain_on_channel_expired(hw);
 		fallthrough;
 	case ATH12K_SCAN_STARTING:
-		if (!ar->scan.is_roc) {
-			struct cfg80211_scan_info info = {
-				.aborted = ((ar->scan.state ==
-					    ATH12K_SCAN_ABORTING) ||
-					    (ar->scan.state ==
-					    ATH12K_SCAN_STARTING)),
-			};
-
-			ieee80211_scan_completed(hw, &info);
-		}
-
-		ar->scan.state = ATH12K_SCAN_IDLE;
-		ar->scan_channel = NULL;
-		ar->scan.roc_freq = 0;
 		cancel_delayed_work(&ar->scan.timeout);
 		complete(&ar->scan.completed);
+		wiphy_work_queue(ar->ah->hw->wiphy, &ar->scan.vdev_clean_wk);
 		break;
 	}
 }
@@ -4056,15 +4043,15 @@ static int ath12k_scan_stop(struct ath12k *ar)
 	}
 
 out:
-	/* Scan state should be updated upon scan completion but in case
-	 * firmware fails to deliver the event (for whatever reason) it is
-	 * desired to clean up scan state anyway. Firmware may have just
-	 * dropped the scan completion event delivery due to transport pipe
-	 * being overflown with data and/or it can recover on its own before
-	 * next scan request is submitted.
+	/* Scan state should be updated in scan completion worker but in
+	 * case firmware fails to deliver the event (for whatever reason)
+	 * it is desired to clean up scan state anyway. Firmware may have
+	 * just dropped the scan completion event delivery due to transport
+	 * pipe being overflown with data and/or it can recover on its own
+	 * before next scan request is submitted.
 	 */
 	spin_lock_bh(&ar->data_lock);
-	if (ar->scan.state != ATH12K_SCAN_IDLE)
+	if (ret)
 		__ath12k_mac_scan_finish(ar);
 	spin_unlock_bh(&ar->data_lock);
 
@@ -4115,6 +4102,53 @@ static void ath12k_scan_timeout_work(struct work_struct *work)
 	wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
 }
 
+static void ath12k_scan_vdev_clean_work(struct wiphy *wiphy, struct wiphy_work *work)
+{
+	struct ath12k *ar = container_of(work, struct ath12k,
+					 scan.vdev_clean_wk);
+	struct ath12k_hw *ah = ar->ah;
+	struct ath12k_link_vif *arvif;
+
+	lockdep_assert_wiphy(wiphy);
+
+	arvif = ar->scan.arvif;
+
+	/* The scan vdev has already been deleted. This can occur when a
+	 * new scan request is made on the same vif with a different
+	 * frequency, causing the scan arvif to move from one radio to
+	 * another. Or, scan was abrupted and via remove interface, the
+	 * arvif is already deleted. Alternatively, if the scan vdev is not
+	 * being used as an actual vdev, then do not delete it.
+	 */
+	if (!arvif || arvif->is_started)
+		goto work_complete;
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac clean scan vdev (link id %u)",
+		   arvif->link_id);
+
+	ath12k_mac_remove_link_interface(ah->hw, arvif);
+	ath12k_mac_unassign_link_vif(arvif);
+
+work_complete:
+	spin_lock_bh(&ar->data_lock);
+	ar->scan.arvif = NULL;
+	if (!ar->scan.is_roc) {
+		struct cfg80211_scan_info info = {
+			.aborted = ((ar->scan.state ==
+				    ATH12K_SCAN_ABORTING) ||
+				    (ar->scan.state ==
+				    ATH12K_SCAN_STARTING)),
+		};
+
+		ieee80211_scan_completed(ar->ah->hw, &info);
+	}
+
+	ar->scan.state = ATH12K_SCAN_IDLE;
+	ar->scan_channel = NULL;
+	ar->scan.roc_freq = 0;
+	spin_unlock_bh(&ar->data_lock);
+}
+
 static int ath12k_start_scan(struct ath12k *ar,
 			     struct ath12k_wmi_scan_req_arg *arg)
 {
@@ -4208,6 +4242,9 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 	link_id = ath12k_mac_find_link_id_by_ar(ahvif, ar);
 	arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
 
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac link ID %d selected for scan",
+		   arvif->link_id);
+
 	/* If the vif is already assigned to a specific vdev of an ar,
 	 * check whether its already started, vdev which is started
 	 * are not allowed to switch to a new radio.
@@ -4231,6 +4268,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 			create = false;
 		}
 	}
+
 	if (create) {
 		/* Previous arvif would've been cleared in radio switch block
 		 * above, assign arvif again for create.
@@ -4251,7 +4289,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		reinit_completion(&ar->scan.completed);
 		ar->scan.state = ATH12K_SCAN_STARTING;
 		ar->scan.is_roc = false;
-		ar->scan.vdev_id = arvif->vdev_id;
+		ar->scan.arvif = arvif;
 		ret = 0;
 		break;
 	case ATH12K_SCAN_STARTING:
@@ -4313,6 +4351,8 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		spin_unlock_bh(&ar->data_lock);
 	}
 
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac scan started");
+
 	/* As per cfg80211/mac80211 scan design, it allows only one
 	 * scan at a time. Hence last_scan link id is used for
 	 * tracking the link id on which the scan is been done on
@@ -4346,7 +4386,7 @@ static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
 	lockdep_assert_wiphy(hw->wiphy);
 
 	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-	if (!arvif || !arvif->is_created)
+	if (!arvif || arvif->is_started)
 		return;
 
 	ar = arvif->ar;
@@ -7404,6 +7444,7 @@ static void ath12k_mac_stop(struct ath12k *ar)
 	clear_bit(ATH12K_CAC_RUNNING, &ar->dev_flags);
 
 	cancel_delayed_work_sync(&ar->scan.timeout);
+	wiphy_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &ar->scan.vdev_clean_wk);
 	cancel_work_sync(&ar->regd_update_work);
 	cancel_work_sync(&ar->ab->rfkill_work);
 
@@ -8033,7 +8074,7 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 		scan_arvif = wiphy_dereference(hw->wiphy,
 					       ahvif->link[ATH12K_DEFAULT_SCAN_LINK]);
 		if (scan_arvif && scan_arvif->ar == ar) {
-			ar->scan.vdev_id = -1;
+			ar->scan.arvif = NULL;
 			ath12k_mac_remove_link_interface(hw, scan_arvif);
 			ath12k_mac_unassign_link_vif(scan_arvif);
 		}
@@ -8234,6 +8275,7 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_link_vif *arvif;
+	struct ath12k *ar;
 	u8 link_id;
 
 	lockdep_assert_wiphy(hw->wiphy);
@@ -8247,6 +8289,31 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 		if (!arvif || !arvif->is_created)
 			continue;
 
+		ar = arvif->ar;
+
+		/* Scan abortion is in progress since before this, cancel_hw_scan()
+		 * is expected to be executed. Since link is anyways going to be removed
+		 * now, just cancel the worker and send the scan aborted to user space
+		 */
+		if (ar->scan.arvif == arvif) {
+			wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
+
+			spin_lock_bh(&ar->data_lock);
+			ar->scan.arvif = NULL;
+			if (!ar->scan.is_roc) {
+				struct cfg80211_scan_info info = {
+					.aborted = true,
+				};
+
+				ieee80211_scan_completed(ar->ah->hw, &info);
+			}
+
+			ar->scan.state = ATH12K_SCAN_IDLE;
+			ar->scan_channel = NULL;
+			ar->scan.roc_freq = 0;
+			spin_unlock_bh(&ar->data_lock);
+		}
+
 		ath12k_mac_remove_link_interface(hw, arvif);
 		ath12k_mac_unassign_link_vif(arvif);
 	}
@@ -9952,6 +10019,7 @@ static int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	ath12k_scan_abort(ar);
 
 	cancel_delayed_work_sync(&ar->scan.timeout);
+	wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
 
 	return 0;
 }
@@ -10035,7 +10103,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 		reinit_completion(&ar->scan.on_channel);
 		ar->scan.state = ATH12K_SCAN_STARTING;
 		ar->scan.is_roc = true;
-		ar->scan.vdev_id = arvif->vdev_id;
+		ar->scan.arvif = arvif;
 		ar->scan.roc_freq = chan->center_freq;
 		ar->scan.roc_notify = true;
 		ret = 0;
@@ -10952,6 +11020,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	ar->cfg_rx_chainmask = pdev->cap.rx_chain_mask;
 	ar->num_tx_chains = hweight32(pdev->cap.tx_chain_mask);
 	ar->num_rx_chains = hweight32(pdev->cap.rx_chain_mask);
+	ar->scan.arvif = NULL;
 
 	spin_lock_init(&ar->data_lock);
 	INIT_LIST_HEAD(&ar->arvifs);
@@ -10969,6 +11038,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	init_completion(&ar->mlo_setup_done);
 
 	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
+	wiphy_work_init(&ar->scan.vdev_clean_wk, ath12k_scan_vdev_clean_work);
 	INIT_WORK(&ar->regd_update_work, ath12k_regd_update_work);
 
 	wiphy_work_init(&ar->wmi_mgmt_tx_work, ath12k_mgmt_over_wmi_tx_work);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 10a6ba926343..e9bda625e9a7 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6338,7 +6338,8 @@ static struct ath12k *ath12k_get_ar_on_scan_state(struct ath12k_base *ab,
 
 			spin_lock_bh(&ar->data_lock);
 			if (ar->scan.state == state &&
-			    ar->scan.vdev_id == vdev_id) {
+			    ar->scan.arvif &&
+			    ar->scan.arvif->vdev_id == vdev_id) {
 				spin_unlock_bh(&ar->data_lock);
 				return ar;
 			}
-- 
2.39.5



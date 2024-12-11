Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43979E77182
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mO5gDrRATjzVworVVcjccHY9s8SJgPjrZhJPC5WE6Bs=; b=DNgD9+L1JQBITXCeKTkh3hQCzt
	spqrxxuVL+uLnbqQmTlEAEuEHWa9UsIfDhIw+Hxw8fGRbGBesoQCWQQzL7FeEnYzzpD9v8ivAHdKM
	lVr+E2ucmVFOxqJatXiWizgZs33Vyuc1Cx7fdTARex6tSv6mMsGTVIlGKJWc/PhiyMzMiZHBZSsfS
	biveHUxOuXng1i2bL32b6rAmQK82KHwt5S11y7yxJeBaOPCXF0bDdMEnGukcX2tX6Y7rA7KWSiiil
	cauYpQS9RuN3mLI9gV2gm0lFbQ+8gOi+vFcA65rEL1gJGrhVyhtjRzblU7mbN+oIcc90BsjD69Nh+
	llbtGjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOjh-0000000FH1c-09OD
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:34:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOje-0000000FGyM-1Dor
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14BE5A40826
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39011C4CED4;
	Wed, 11 Dec 2024 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931285;
	bh=d0QZughSZQWEuh5lk2IPYSI2BmSOFSPhXvF7DYFzblM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1tmzEoJOID7lrvwx32B5BVB1WqDvtHKX2QqnlsxURouLCu/ZXRPBAKfSMflv+QFM
	 5qP5oVEw8+14t75C0geAPYJRfy1Lu+AwQRGxkd4/eGN1vDry0Kw1nKecq7owxk1gUG
	 BWAJrO+/JCcB4M7GuunPsHyxhUpJE+oLbKgckTE+G7LlWCVzVKrbxYRJvmVyOdeTIR
	 XTw2/OCixN1Q0f3oZP+9NPzX7by87SJkAt6IF66fR8f9Hbmn0Jjf1M7KydMzPCLBvk
	 sRvN1uAxeQTi7/faHbp6khm4N6lfHBW836ALA/bn58ixLNWsARrsUBMVVfRLolYr1s
	 UQgxgz+3jsFAg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 7/8] wifi: ath12k: enable MLO setup and teardown from core
Date: Wed, 11 Dec 2024 17:34:31 +0200
Message-Id: <20241211153432.775335-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211153432.775335-1-kvalo@kernel.org>
References: <20241211153432.775335-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_073446_463733_C86A9263 
X-CRM114-Status: GOOD (  18.27  )
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

In case of multi device group abstraction, host has to exchange the multi-link
operation commands such as setup and ready to firmware before registering the
device group to mac80211.

The multi-link operation commands - setup, ready and teardown are necessary for
many commands such as WMI_PEER_ASSOC_CMD, WMI_BCN_TMPL_CMD in case of
multi-link interfaces.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  73 ++++++++++++-
 drivers/net/wireless/ath/ath12k/core.h |   3 +
 drivers/net/wireless/ath/ath12k/mac.c  | 142 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/mac.h  |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c  |   3 +
 drivers/net/wireless/ath/ath12k/wmi.h  |   1 +
 6 files changed, 224 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 1a43e00cffb2..af642b466ea0 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -887,6 +887,70 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 	ath12k_mac_destroy(ag);
 }
 
+static int __ath12k_mac_mlo_ready(struct ath12k *ar)
+{
+	int ret;
+
+	ret = ath12k_wmi_mlo_ready(ar);
+	if (ret) {
+		ath12k_err(ar->ab, "MLO ready failed for pdev %d: %d\n",
+			   ar->pdev_idx, ret);
+		return ret;
+	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mlo ready done for pdev %d\n",
+		   ar->pdev_idx);
+
+	return 0;
+}
+
+int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
+{
+	struct ath12k_hw *ah;
+	struct ath12k *ar;
+	int ret;
+	int i, j;
+
+	for (i = 0; i < ag->num_hw; i++) {
+		ah = ag->ah[i];
+		if (!ah)
+			continue;
+
+		for_each_ar(ah, ar, j) {
+			ar = &ah->radio[j];
+			ret = __ath12k_mac_mlo_ready(ar);
+			if (ret)
+				goto out;
+		}
+	}
+
+out:
+	return ret;
+}
+
+static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
+{
+	int ret;
+
+	if (!ag->mlo_capable || ag->num_devices == 1)
+		return 0;
+
+	ret = ath12k_mac_mlo_setup(ag);
+	if (ret)
+		return ret;
+
+	ret = ath12k_mac_mlo_ready(ag);
+	if (ret)
+		goto err_mlo_teardown;
+
+	return 0;
+
+err_mlo_teardown:
+	ath12k_mac_mlo_teardown(ag);
+
+	return ret;
+}
+
 static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 {
 	struct ath12k_base *ab;
@@ -901,10 +965,14 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 	if (WARN_ON(ret))
 		return ret;
 
-	ret = ath12k_mac_register(ag);
+	ret = ath12k_core_mlo_setup(ag);
 	if (WARN_ON(ret))
 		goto err_mac_destroy;
 
+	ret = ath12k_mac_register(ag);
+	if (WARN_ON(ret))
+		goto err_mlo_teardown;
+
 	set_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags);
 
 core_pdev_create:
@@ -939,6 +1007,9 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 	ath12k_core_hw_group_stop(ag);
 	return ret;
 
+err_mlo_teardown:
+	ath12k_mac_mlo_teardown(ag);
+
 err_mac_destroy:
 	ath12k_mac_destroy(ag);
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bf310df3d8f7..dc01f7b3fd73 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -715,6 +715,9 @@ struct ath12k {
 	u32 freq_high;
 
 	bool nlo_enabled;
+
+	struct completion mlo_setup_done;
+	u32 mlo_setup_status;
 };
 
 struct ath12k_hw {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index c4eab4c1c10e..23c5c8fd952d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10810,6 +10810,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	init_completion(&ar->scan.started);
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
+	init_completion(&ar->mlo_setup_done);
 
 	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
 	INIT_WORK(&ar->regd_update_work, ath12k_regd_update_work);
@@ -10818,6 +10819,147 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
 }
 
+static int __ath12k_mac_mlo_setup(struct ath12k *ar)
+{
+	u8 num_link = 0, partner_link_id[ATH12K_GROUP_MAX_RADIO] = {};
+	struct ath12k_base *partner_ab, *ab = ar->ab;
+	struct ath12k_hw_group *ag = ab->ag;
+	struct wmi_mlo_setup_arg mlo = {};
+	struct ath12k_pdev *pdev;
+	unsigned long time_left;
+	int i, j, ret;
+
+	lockdep_assert_held(&ag->mutex);
+
+	reinit_completion(&ar->mlo_setup_done);
+
+	for (i = 0; i < ag->num_devices; i++) {
+		partner_ab = ag->ab[i];
+
+		for (j = 0; j < partner_ab->num_radios; j++) {
+			pdev = &partner_ab->pdevs[j];
+
+			/* Avoid the self link */
+			if (ar == pdev->ar)
+				continue;
+
+			partner_link_id[num_link] = pdev->hw_link_id;
+			num_link++;
+
+			ath12k_dbg(ab, ATH12K_DBG_MAC, "device %d pdev %d hw_link_id %d num_link %d\n",
+				   i, j, pdev->hw_link_id, num_link);
+		}
+	}
+
+	mlo.group_id = cpu_to_le32(ag->id);
+	mlo.partner_link_id = partner_link_id;
+	mlo.num_partner_links = num_link;
+	ar->mlo_setup_status = 0;
+
+	ath12k_dbg(ab, ATH12K_DBG_MAC, "group id %d num_link %d\n", ag->id, num_link);
+
+	ret = ath12k_wmi_mlo_setup(ar, &mlo);
+	if (ret) {
+		ath12k_err(ab, "failed to send  setup MLO WMI command for pdev %d: %d\n",
+			   ar->pdev_idx, ret);
+		return ret;
+	}
+
+	time_left = wait_for_completion_timeout(&ar->mlo_setup_done,
+						WMI_MLO_CMD_TIMEOUT_HZ);
+
+	if (!time_left || ar->mlo_setup_status)
+		return ar->mlo_setup_status ? : -ETIMEDOUT;
+
+	ath12k_dbg(ab, ATH12K_DBG_MAC, "mlo setup done for pdev %d\n", ar->pdev_idx);
+
+	return 0;
+}
+
+static int __ath12k_mac_mlo_teardown(struct ath12k *ar)
+{
+	struct ath12k_base *ab = ar->ab;
+	int ret;
+
+	if (test_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags))
+		return 0;
+
+	ret = ath12k_wmi_mlo_teardown(ar);
+	if (ret) {
+		ath12k_warn(ab, "failed to send MLO teardown WMI command for pdev %d: %d\n",
+			    ar->pdev_idx, ret);
+		return ret;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_MAC, "mlo teardown for pdev %d\n", ar->pdev_idx);
+
+	return 0;
+}
+
+int ath12k_mac_mlo_setup(struct ath12k_hw_group *ag)
+{
+	struct ath12k_hw *ah;
+	struct ath12k *ar;
+	int ret;
+	int i, j;
+
+	for (i = 0; i < ag->num_hw; i++) {
+		ah = ag->ah[i];
+		if (!ah)
+			continue;
+
+		for_each_ar(ah, ar, j) {
+			ar = &ah->radio[j];
+			ret = __ath12k_mac_mlo_setup(ar);
+			if (ret) {
+				ath12k_err(ar->ab, "failed to setup MLO: %d\n", ret);
+				goto err_setup;
+			}
+		}
+	}
+
+	return 0;
+
+err_setup:
+	for (i = i - 1; i >= 0; i--) {
+		ah = ag->ah[i];
+		if (!ah)
+			continue;
+
+		for (j = j - 1; j >= 0; j--) {
+			ar = &ah->radio[j];
+			if (!ar)
+				continue;
+
+			__ath12k_mac_mlo_teardown(ar);
+		}
+	}
+
+	return ret;
+}
+
+void ath12k_mac_mlo_teardown(struct ath12k_hw_group *ag)
+{
+	struct ath12k_hw *ah;
+	struct ath12k *ar;
+	int ret, i, j;
+
+	for (i = 0; i < ag->num_hw; i++) {
+		ah = ag->ah[i];
+		if (!ah)
+			continue;
+
+		for_each_ar(ah, ar, j) {
+			ar = &ah->radio[j];
+			ret = __ath12k_mac_mlo_teardown(ar);
+			if (ret) {
+				ath12k_err(ar->ab, "failed to teardown MLO: %d\n", ret);
+				break;
+			}
+		}
+	}
+}
+
 int ath12k_mac_register(struct ath12k_hw_group *ag)
 {
 	struct ath12k_base *ab = ag->ab[0];
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index ccfc215d83ff..81cfb950e6cd 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -96,6 +96,9 @@ int ath12k_mac_vif_set_keepalive(struct ath12k_link_vif *arvif,
 				 enum wmi_sta_keepalive_method method,
 				 u32 interval);
 u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar);
+int ath12k_mac_mlo_setup(struct ath12k_hw_group *ag);
+int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag);
+void ath12k_mac_mlo_teardown(struct ath12k_hw_group *ag);
 int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 8f4b0941360d..10a6ba926343 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7369,6 +7369,9 @@ static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
 		goto out;
 	}
 
+	ar->mlo_setup_status = le32_to_cpu(ev->status);
+	complete(&ar->mlo_setup_done);
+
 out:
 	kfree(tb);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 640720b68782..270ed458302e 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4938,6 +4938,7 @@ struct wmi_probe_tmpl_cmd {
 
 #define MAX_RADIOS 2
 
+#define WMI_MLO_CMD_TIMEOUT_HZ (5 * HZ)
 #define WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)
 #define WMI_SEND_TIMEOUT_HZ (3 * HZ)
 
-- 
2.39.5



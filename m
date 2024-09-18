Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AF1CDD552
	for <ath12k@archiver.kernel.org>; Wed, 18 Sep 2024 18:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJhCgDNmWbegI0QE5ZCasNBj6dWabTDP+aN6Gab0V80=; b=ucM4QVJfgnE6WneWx3FZQFOD8T
	am9IvY0XFcCX2ZLcZVklVYLkt3SZqTLTF4VpwFrYtEc1CVuDU3jORBBJJOu6VK1b+P0Ts93FH1wc9
	4KZaTmHAyNaRqihBKcUyv9yC/bFUsWZ3TxXsWI+QsOUYPyLBQT/Hwiv3JW4pR3xDHsiCJDnahXZ47
	5qU18gMC8oJ+KLlv2QSNJvOqzqCHxk48yxkkdPzIJcggP+uKwMejiJsyDuEMy8Qs8JXWdPVmjyyw/
	VUKG9UnV7e9AJeddPjteDIT9OxxRzhmLMEizP611ELIfoO+5Bs6Oyh1rg5a3UAU74RxCD7HqHS1b3
	v1nl8OoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqz8g-00000008n36-3Sd7
	for ath12k@archiver.kernel.org;
	Wed, 18 Sep 2024 18:10:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqz8c-00000008mzY-1YQ6
	for ath12k@lists.infradead.org;
	Wed, 18 Sep 2024 18:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B30D8A438B2
	for <ath12k@lists.infradead.org>; Wed, 18 Sep 2024 18:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCFCC4CEC2;
	Wed, 18 Sep 2024 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726683049;
	bh=qUczHlsEy8fEkQChpwjpyaXMav5RgCU0UhYt5rStH64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eTCONex2dRsmJt4SwrqfY/dnmYAS3Im+lomlfc2fMtqrPnPjRDFyBbiEDnVVWH0th
	 KJx6H3PrgbVPzV/ZVfskiOBi3TnHhEy8pVu5OadC0PzNc/83kktLCoRCQY6XoJ1x2z
	 NFf0NMlypSy22zzUDkbM/Yu9FMjAZOxDlhVvBbT7YHUdq4VmfJu/ivqER/vsNpZCia
	 0giG2fs4CL64Uef/uZvqHJ+dRFMVe0NiRIO72C3Ppk4T9Bvyqc613VQqoaDU86Ms+z
	 aF87/JtVh+CAFE9NpnGXR2ITYT9O9vCyVRw1vISlnyS/Q0g7sY12ov9VDm2fxiy81k
	 HDdPIVUMbstVg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC v2 4/4] wifi: ath12k: convert struct ath12k_sta::update_wk to use struct wiphy_work
Date: Wed, 18 Sep 2024 21:10:42 +0300
Message-Id: <20240918181042.91891-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240918181042.91891-1-kvalo@kernel.org>
References: <20240918181042.91891-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_111050_613521_C0CF154D 
X-CRM114-Status: GOOD (  12.35  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

As ath12k is now converted to use wiphy lock we can convert
ath12k_sta_rc_update_wk() to use wiphy_work_queue(). This is just for
consistency.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 14 ++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7551494716b5..ebfc1e370acc 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -451,7 +451,7 @@ struct ath12k_sta {
 	u32 smps;
 	enum hal_pn_type pn_type;
 
-	struct work_struct update_wk;
+	struct wiphy_work update_wk;
 	struct rate_info txrate;
 	struct rate_info last_txrate;
 	u64 rx_duration;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 80db9004cdd7..e70b4212ae80 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4258,7 +4258,7 @@ static int ath12k_station_disassoc(struct ath12k *ar,
 	return 0;
 }
 
-static void ath12k_sta_rc_update_wk(struct work_struct *wk)
+static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *work)
 {
 	struct ath12k *ar;
 	struct ath12k_vif *arvif;
@@ -4274,7 +4274,9 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
 	struct ath12k_wmi_peer_assoc_arg peer_arg;
 	enum wmi_phy_mode peer_phymode;
 
-	arsta = container_of(wk, struct ath12k_sta, update_wk);
+	lockdep_assert_wiphy(wiphy);
+
+	arsta = container_of(work, struct ath12k_sta, update_wk);
 	sta = container_of((void *)arsta, struct ieee80211_sta, drv_priv);
 	arvif = arsta->arvif;
 	ar = arvif->ar;
@@ -4571,7 +4573,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	/* cancel must be done outside the mutex to avoid deadlock */
 	if ((old_state == IEEE80211_STA_NONE &&
 	     new_state == IEEE80211_STA_NOTEXIST))
-		cancel_work_sync(&arsta->update_wk);
+		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
 
 	ar = ath12k_get_ar_by_vif(hw, vif);
 	if (!ar) {
@@ -4585,7 +4587,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	    new_state == IEEE80211_STA_NONE) {
 		memset(arsta, 0, sizeof(*arsta));
 		arsta->arvif = arvif;
-		INIT_WORK(&arsta->update_wk, ath12k_sta_rc_update_wk);
+		wiphy_work_init(&arsta->update_wk, ath12k_sta_rc_update_wk);
 
 		ret = ath12k_mac_station_add(ar, vif, sta);
 		if (ret)
@@ -4792,7 +4794,7 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 
 	spin_unlock_bh(&ar->data_lock);
 
-	ieee80211_queue_work(hw, &arsta->update_wk);
+	wiphy_work_queue(hw->wiphy, &arsta->update_wk);
 }
 
 static int ath12k_conf_tx_uapsd(struct ath12k_vif *arvif,
@@ -8065,7 +8067,7 @@ static void ath12k_mac_set_bitrate_mask_iter(void *data,
 	arsta->changed |= IEEE80211_RC_SUPP_RATES_CHANGED;
 	spin_unlock_bh(&ar->data_lock);
 
-	ieee80211_queue_work(ath12k_ar_to_hw(ar), &arsta->update_wk);
+	wiphy_work_queue(ath12k_ar_to_hw(ar)->wiphy, &arsta->update_wk);
 }
 
 static void ath12k_mac_disable_peer_fixed_rate(void *data,
-- 
2.39.5



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A67D65532
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peGa9bU/vSu02jugFoF6jHjYQXfNjtRoAvLT2udNRmI=; b=p+GjCuyBm6Zsn9jNkDVnond2as
	Soqy6KMmbUGupnl3/zY2Iz0sh9Y5hJZ7QcnB4NLh1gxVNgys4ai7ualqBohAaySfQMZ7QYW+/SPXj
	rhIsN3BOMA+N3LMeHyRyXFl7l8xbnucCati/+WNEzK9HxM2GOkFQwM0asxr7lxIUyd/FdVdCzFJ1t
	9zW7VbUtDSDtsy51Y2rsOBVgCQB+JsTxsGIEdORBuyMuFxV0tLXrXP0OmgYdZY/L2vd4TVAwc13IB
	s3fJdLro15AJikYtnRldP6oFHfd4+j/JX5mBhI1wRhuXad8NtEF+YvHmZuxsujJq/kzv297y42tVj
	13mJIgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6Q-0000000BGHk-0X1l
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6J-0000000BGDL-0x41
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DE685C581C
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0948BC4CED3;
	Tue, 26 Nov 2024 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641106;
	bh=9fW4jLn9X601tBwJ7wtiYiYrpoL3BaIh614cdRw2Z1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TSubEoR/0yO8ZgZDB7JklivlBZX1MS4hV2cn8e8PqcfdchHMEx65wdIUhMknGtrmn
	 03i0sqgOrvADDWbHl/y2OqTev+YC0bMbuieMCCxa0BwAe1kAofwMhLMFDAgWQvsjGE
	 CUBPQZMqJQPuerjAgfmuAnZAAc/GONgMu87TAHMjf4doOShudy9tRkfhSNGmbTNrqx
	 MkR+WUBCP/DglK8GCpdKoxceoWlke4Y+FLIBSKQ1i5kCD+XDH3PPi1V/ZgW9METNKH
	 FHDp2qFwg+ek04bSWraBfyualh2b4fgJfnrxEADN99z3yDlIMB88DMTIK4fvIjGn4Y
	 QJMWGlgQ3aYXQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 04/10] wifi: ath12k: ath12k_mac_op_ampdu_action(): MLO support
Date: Tue, 26 Nov 2024 19:11:33 +0200
Message-Id: <20241126171139.2350704-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126171139.2350704-1-kvalo@kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091147_349833_E9B5685D 
X-CRM114-Status: GOOD (  14.10  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Apply tid queue setup based on all link stations on receiving ampdu action
params for an ML Station.

Modify ath12k_get_ar_by_vif() to fetch ar based on link arvif inside ahvif.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 36 +++++++++---
 drivers/net/wireless/ath/ath12k/dp_rx.h |  6 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 76 ++++++++++++++-----------
 3 files changed, 76 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 70680f2124e5..b24d1de4aabb 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1065,15 +1065,25 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 }
 
 int ath12k_dp_rx_ampdu_start(struct ath12k *ar,
-			     struct ieee80211_ampdu_params *params)
+			     struct ieee80211_ampdu_params *params,
+			     u8 link_id)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(params->sta);
-	struct ath12k_link_sta *arsta = &ahsta->deflink;
-	int vdev_id = arsta->arvif->vdev_id;
+	struct ath12k_link_sta *arsta;
+	int vdev_id;
 	int ret;
 
-	ret = ath12k_dp_rx_peer_tid_setup(ar, params->sta->addr, vdev_id,
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	arsta = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
+				  ahsta->link[link_id]);
+	if (!arsta)
+		return -ENOLINK;
+
+	vdev_id = arsta->arvif->vdev_id;
+
+	ret = ath12k_dp_rx_peer_tid_setup(ar, arsta->addr, vdev_id,
 					  params->tid, params->buf_size,
 					  params->ssn, arsta->ahsta->pn_type);
 	if (ret)
@@ -1083,19 +1093,29 @@ int ath12k_dp_rx_ampdu_start(struct ath12k *ar,
 }
 
 int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
-			    struct ieee80211_ampdu_params *params)
+			    struct ieee80211_ampdu_params *params,
+			    u8 link_id)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_peer *peer;
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(params->sta);
-	struct ath12k_link_sta *arsta = &ahsta->deflink;
-	int vdev_id = arsta->arvif->vdev_id;
+	struct ath12k_link_sta *arsta;
+	int vdev_id;
 	bool active;
 	int ret;
 
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	arsta = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
+				  ahsta->link[link_id]);
+	if (!arsta)
+		return -ENOLINK;
+
+	vdev_id = arsta->arvif->vdev_id;
+
 	spin_lock_bh(&ab->base_lock);
 
-	peer = ath12k_peer_find(ab, vdev_id, params->sta->addr);
+	peer = ath12k_peer_find(ab, vdev_id, arsta->addr);
 	if (!peer) {
 		spin_unlock_bh(&ab->base_lock);
 		ath12k_warn(ab, "failed to find the peer to stop rx aggregation\n");
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index bfd4f814553e..1ce82088c954 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -85,9 +85,11 @@ static inline u32 ath12k_he_gi_to_nl80211_he_gi(u8 sgi)
 }
 
 int ath12k_dp_rx_ampdu_start(struct ath12k *ar,
-			     struct ieee80211_ampdu_params *params);
+			     struct ieee80211_ampdu_params *params,
+			     u8 link_id);
 int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
-			    struct ieee80211_ampdu_params *params);
+			    struct ieee80211_ampdu_params *params,
+			    u8 link_id);
 int ath12k_dp_rx_peer_pn_replay_config(struct ath12k_link_vif *arvif,
 				       const u8 *peer_addr,
 				       enum set_key_cmd key_cmd,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d1c94eb8145a..428415237831 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -725,11 +725,14 @@ static struct ath12k *ath12k_get_ar_by_ctx(struct ieee80211_hw *hw,
 }
 
 static struct ath12k *ath12k_get_ar_by_vif(struct ieee80211_hw *hw,
-					   struct ieee80211_vif *vif)
+					   struct ieee80211_vif *vif,
+					   u8 link_id)
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif = &ahvif->deflink;
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct ath12k_link_vif *arvif;
+
+	lockdep_assert_wiphy(hw->wiphy);
 
 	/* If there is one pdev within ah, then we return
 	 * ar directly.
@@ -737,7 +740,11 @@ static struct ath12k *ath12k_get_ar_by_vif(struct ieee80211_hw *hw,
 	if (ah->num_radio == 1)
 		return ah->radio;
 
-	if (arvif->is_created)
+	if (!(ahvif->links_map & BIT(link_id)))
+		return NULL;
+
+	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+	if (arvif && arvif->is_created)
 		return arvif->ar;
 
 	return NULL;
@@ -5667,6 +5674,7 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 	struct ath12k *ar;
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k_link_sta *arsta;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_peer *peer;
@@ -5676,20 +5684,17 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 	 */
 	u8 link_id = ATH12K_DEFAULT_LINK_ID;
 
-	ar = ath12k_get_ar_by_vif(hw, vif);
-	if (!ar) {
-		WARN_ON_ONCE(1);
-		return;
-	}
-
 	rcu_read_lock();
 	arvif = rcu_dereference(ahvif->link[link_id]);
 	if (!arvif) {
-		ath12k_warn(ar->ab, "mac sta rc update failed to fetch link vif on link id %u for peer %pM\n",
-			    link_id, sta->addr);
+		ath12k_hw_warn(ah, "mac sta rc update failed to fetch link vif on link id %u for peer %pM\n",
+			       link_id, sta->addr);
 		rcu_read_unlock();
 		return;
 	}
+
+	ar = arvif->ar;
+
 	arsta = rcu_dereference(ahsta->link[link_id]);
 	if (!arsta) {
 		rcu_read_unlock();
@@ -8288,20 +8293,26 @@ static int ath12k_mac_op_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx
 	return ret;
 }
 
-static int ath12k_mac_ampdu_action(struct ath12k_link_vif *arvif,
-				   struct ieee80211_ampdu_params *params)
+static int ath12k_mac_ampdu_action(struct ieee80211_hw *hw,
+				   struct ieee80211_vif *vif,
+				   struct ieee80211_ampdu_params *params,
+				   u8 link_id)
 {
-	struct ath12k *ar = arvif->ar;
+	struct ath12k *ar;
 	int ret = -EINVAL;
 
-	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+	lockdep_assert_wiphy(hw->wiphy);
+
+	ar = ath12k_get_ar_by_vif(hw, vif, link_id);
+	if (!ar)
+		return -EINVAL;
 
 	switch (params->action) {
 	case IEEE80211_AMPDU_RX_START:
-		ret = ath12k_dp_rx_ampdu_start(ar, params);
+		ret = ath12k_dp_rx_ampdu_start(ar, params, link_id);
 		break;
 	case IEEE80211_AMPDU_RX_STOP:
-		ret = ath12k_dp_rx_ampdu_stop(ar, params);
+		ret = ath12k_dp_rx_ampdu_stop(ar, params, link_id);
 		break;
 	case IEEE80211_AMPDU_TX_START:
 	case IEEE80211_AMPDU_TX_STOP_CONT:
@@ -8315,6 +8326,10 @@ static int ath12k_mac_ampdu_action(struct ath12k_link_vif *arvif,
 		break;
 	}
 
+	if (ret)
+		ath12k_warn(ar->ab, "unable to perform ampdu action %d for vif %pM link %u ret %d\n",
+			    params->action, vif->addr, link_id, ret);
+
 	return ret;
 }
 
@@ -8322,27 +8337,24 @@ static int ath12k_mac_op_ampdu_action(struct ieee80211_hw *hw,
 				      struct ieee80211_vif *vif,
 				      struct ieee80211_ampdu_params *params)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
-	struct ath12k *ar;
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif;
+	struct ieee80211_sta *sta = params->sta;
+	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
+	unsigned long links_map = ahsta->links_map;
 	int ret = -EINVAL;
+	u8 link_id;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	ar = ath12k_get_ar_by_vif(hw, vif);
-	if (!ar)
-		return -EINVAL;
+	if (WARN_ON(!links_map))
+		return ret;
 
-	ar = ath12k_ah_to_ar(ah, 0);
-	arvif = &ahvif->deflink;
+	for_each_set_bit(link_id, &links_map, IEEE80211_MLD_MAX_NUM_LINKS) {
+		ret = ath12k_mac_ampdu_action(hw, vif, params, link_id);
+		if (ret)
+			return ret;
+	}
 
-	ret = ath12k_mac_ampdu_action(arvif, params);
-	if (ret)
-		ath12k_warn(ar->ab, "pdev idx %d unable to perform ampdu action %d ret %d\n",
-			    ar->pdev_idx, params->action, ret);
-
-	return ret;
+	return 0;
 }
 
 static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
-- 
2.39.5



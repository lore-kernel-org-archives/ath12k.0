Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD55E6F069
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 15:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T/gLPvh9PjJc07BHLOYpWbW3jNxj15TDzvLyjor78k=; b=GNiGg6kqDU1whDFIpDIDCf2SXq
	WY4hHwYJcU9H2Pc1jIxmy8MJEmgNRL2IOmZtkKvQviBT9CIFq2F4vf4iPJSE57PoOg0cGhLN412Pc
	SA30ahcZfxEflxxlK+HEAxwFV/x7QQ7sMyS4idmBJaUfsk/82duk1ZeXOGYYM7/Ns4dVFqLKPdcS7
	BYSmjB6b+GLx/aM3J288B+GuDhkbCR1r+f3usSS8g58wKHwKhNv0MfAZaTjZdaVxnBDfkhie5mpAb
	MndBXGaJUJxhSoDFjkZl2ZO1e8WGruq2xEGZyQqFkJiL4PTjSxDPg+QRQSGOU70BFE2H8KRY6VM1H
	yXvAvoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOl-00000007TZf-1kLc
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 15:17:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOi-00000007TXy-0cvV
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 15:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3791A5C482F
	for <ath12k@lists.infradead.org>; Fri,  1 Nov 2024 15:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4042CC4CECD;
	Fri,  1 Nov 2024 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730474230;
	bh=rcBypkgCgL8SvIFBJXsWTYcHZliyF4Ma4VJgUOVrcJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GkUknXbgM+PgLx0083Kk72TO+dKkwOxtTWSl7MYpvH7bInjHEfo+6cPeOurN3SQXN
	 8ccylpJD/rYndmRvjrnHbyqxDO5co7IPjq4s/6o1It2G6lcAd8kgtbyXDa2jpiCPRd
	 0mEM3ddppK3HJA0XG11n8PX0VEun/CEi/Zb8LWHlk7JFKeXi/TEzn1A9zMJhl4HdKS
	 bsFKiE0GgMiwTJDHBn+EMeNqz3RpYzoVKkB6HusrDHnC6UuwFug2hkJ81TgN8LgtMi
	 NHHQFu3LY4cqSgp0+73jYOdaQ58A6z3Tql1zdK/7adUN3eWf7M9bXTlAJrV6gRGqW7
	 5Y1kI0djHezEQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 3/8] wifi: ath12k: Refactor sta state machine
Date: Fri,  1 Nov 2024 17:17:00 +0200
Message-Id: <20241101151705.165987-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101151705.165987-1-kvalo@kernel.org>
References: <20241101151705.165987-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_081712_316558_0FDF1849 
X-CRM114-Status: GOOD (  21.41  )
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

Refactor ath12k_mac_op_sta_state(), with generic wrappers which can be used for
both multi link stations and non-ML stations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   3 +
 drivers/net/wireless/ath/ath12k/mac.c  | 343 +++++++++++++++++--------
 2 files changed, 244 insertions(+), 102 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 06b637ba8b8f..6faa46b9adc9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -461,6 +461,9 @@ struct ath12k_link_sta {
 	struct ath12k_link_vif *arvif;
 	struct ath12k_sta *ahsta;
 
+	/* link address similar to ieee80211_link_sta */
+	u8 addr[ETH_ALEN];
+
 	/* the following are protected by ar->data_lock */
 	u32 changed; /* IEEE80211_RC_* */
 	u32 bw;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 16b14ae502a6..354fc21f2af2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4519,10 +4519,10 @@ ath12k_mac_set_peer_vht_fixed_rate(struct ath12k_link_vif *arvif,
 	return ret;
 }
 
-static int ath12k_station_assoc(struct ath12k *ar,
-				struct ath12k_link_vif *arvif,
-				struct ath12k_link_sta *arsta,
-				bool reassoc)
+static int ath12k_mac_station_assoc(struct ath12k *ar,
+				    struct ath12k_link_vif *arvif,
+				    struct ath12k_link_sta *arsta,
+				    bool reassoc)
 {
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
@@ -4609,28 +4609,19 @@ static int ath12k_station_assoc(struct ath12k *ar,
 	return 0;
 }
 
-static int ath12k_station_disassoc(struct ath12k *ar,
-				   struct ath12k_link_vif *arvif,
-				   struct ath12k_link_sta *arsta)
+static int ath12k_mac_station_disassoc(struct ath12k *ar,
+				       struct ath12k_link_vif *arvif,
+				       struct ath12k_link_sta *arsta)
 {
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
-	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	if (!sta->wme) {
 		arvif->num_legacy_stations--;
-		ret = ath12k_recalc_rtscts_prot(arvif);
-		if (ret)
-			return ret;
+		return ath12k_recalc_rtscts_prot(arvif);
 	}
 
-	ret = ath12k_clear_peer_keys(arvif, sta->addr);
-	if (ret) {
-		ath12k_warn(ar->ab, "failed to clear all peer keys for vdev %i: %d\n",
-			    arvif->vdev_id, ret);
-		return ret;
-	}
 	return 0;
 }
 
@@ -4826,6 +4817,147 @@ static void ath12k_mac_dec_num_stations(struct ath12k_link_vif *arvif,
 	ar->num_stations--;
 }
 
+static void ath12k_mac_station_post_remove(struct ath12k *ar,
+					   struct ath12k_link_vif *arvif,
+					   struct ath12k_link_sta *arsta)
+{
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
+	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
+	struct ath12k_sta *ahsta = arsta->ahsta;
+	struct ath12k_peer *peer;
+
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	ath12k_mac_dec_num_stations(arvif, arsta);
+
+	spin_lock_bh(&ar->ab->base_lock);
+
+	peer = ath12k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
+	if (peer && peer->sta == sta) {
+		ath12k_warn(ar->ab, "Found peer entry %pM n vdev %i after it was supposedly removed\n",
+			    vif->addr, arvif->vdev_id);
+		peer->sta = NULL;
+		list_del(&peer->list);
+		kfree(peer);
+		ar->num_peers--;
+	}
+
+	spin_unlock_bh(&ar->ab->base_lock);
+
+	kfree(arsta->rx_stats);
+	arsta->rx_stats = NULL;
+
+	if (arsta->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
+		ahsta->links_map &= ~(BIT(arsta->link_id));
+		rcu_assign_pointer(ahsta->link[arsta->link_id], NULL);
+		synchronize_rcu();
+		arsta->link_id = ATH12K_INVALID_LINK_ID;
+		arsta->ahsta = NULL;
+	}
+}
+
+static int ath12k_mac_station_unauthorize(struct ath12k *ar,
+					  struct ath12k_link_vif *arvif,
+					  struct ath12k_link_sta *arsta)
+{
+	struct ath12k_peer *peer;
+	int ret;
+
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	spin_lock_bh(&ar->ab->base_lock);
+
+	peer = ath12k_peer_find(ar->ab, arvif->vdev_id, arsta->addr);
+	if (peer)
+		peer->is_authorized = false;
+
+	spin_unlock_bh(&ar->ab->base_lock);
+
+	/* Driver must clear the keys during the state change from
+	 * IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC, since after
+	 * returning from here, mac80211 is going to delete the keys
+	 * in __sta_info_destroy_part2(). This will ensure that the driver does
+	 * not retain stale key references after mac80211 deletes the keys.
+	 */
+	ret = ath12k_clear_peer_keys(arvif, arsta->addr);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to clear all peer keys for vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ath12k_mac_station_authorize(struct ath12k *ar,
+					struct ath12k_link_vif *arvif,
+					struct ath12k_link_sta *arsta)
+{
+	struct ath12k_peer *peer;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
+	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
+	int ret;
+
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	spin_lock_bh(&ar->ab->base_lock);
+
+	peer = ath12k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
+	if (peer)
+		peer->is_authorized = true;
+
+	spin_unlock_bh(&ar->ab->base_lock);
+
+	if (vif->type == NL80211_IFTYPE_STATION && arvif->is_up) {
+		ret = ath12k_wmi_set_peer_param(ar, sta->addr,
+						arvif->vdev_id,
+						WMI_PEER_AUTHORIZE,
+						1);
+		if (ret) {
+			ath12k_warn(ar->ab, "Unable to authorize peer %pM vdev %d: %d\n",
+				    sta->addr, arvif->vdev_id, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ath12k_mac_station_remove(struct ath12k *ar,
+				     struct ath12k_link_vif *arvif,
+				     struct ath12k_link_sta *arsta)
+{
+	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	int ret;
+
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	wiphy_work_cancel(ar->ah->hw->wiphy, &arsta->update_wk);
+
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA) {
+		ath12k_bss_disassoc(ar, arvif);
+		ret = ath12k_mac_vdev_stop(arvif);
+		if (ret)
+			ath12k_warn(ar->ab, "failed to stop vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+	}
+
+	ath12k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
+
+	ret = ath12k_peer_delete(ar, arvif->vdev_id, sta->addr);
+	if (ret)
+		ath12k_warn(ar->ab, "Failed to delete peer: %pM for VDEV: %d\n",
+			    sta->addr, arvif->vdev_id);
+	else
+		ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "Removed peer: %pM for VDEV: %d\n",
+			   sta->addr, arvif->vdev_id);
+
+	ath12k_mac_station_post_remove(ar, arvif, arsta);
+
+	return ret;
+}
+
 static int ath12k_mac_station_add(struct ath12k *ar,
 				  struct ath12k_link_vif *arvif,
 				  struct ath12k_link_sta *arsta)
@@ -4933,31 +5065,37 @@ static u32 ath12k_mac_ieee80211_sta_bw_to_wmi(struct ath12k *ar,
 	return bw;
 }
 
-static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
-				   struct ieee80211_vif *vif,
-				   struct ieee80211_sta *sta,
-				   enum ieee80211_sta_state old_state,
-				   enum ieee80211_sta_state new_state)
+static int ath12k_mac_handle_link_sta_state(struct ieee80211_hw *hw,
+					    struct ath12k_link_vif *arvif,
+					    struct ath12k_link_sta *arsta,
+					    enum ieee80211_sta_state old_state,
+					    enum ieee80211_sta_state new_state)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
-	struct ath12k *ar;
-	struct ath12k_link_vif *arvif;
-	struct ath12k_link_sta *arsta;
-	struct ath12k_peer *peer;
+	struct ath12k *ar = arvif->ar;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
+	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
+	struct ath12k_sta *ahsta = arsta->ahsta;
 	int ret = 0;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arvif = &ahvif->deflink;
-	arsta = &ahsta->deflink;
+	/* IEEE80211_STA_NONE -> IEEE80211_STA_NOTEXIST: Remove the station
+	 * from driver
+	 */
+	if ((old_state == IEEE80211_STA_NONE &&
+	     new_state == IEEE80211_STA_NOTEXIST)) {
+		/* ML sta needs separate handling */
+		if (sta->mlo)
+			return 0;
 
-	ar = ath12k_get_ar_by_vif(hw, vif);
-	if (!ar) {
-		WARN_ON_ONCE(1);
-		return -EINVAL;
+		ret = ath12k_mac_station_remove(ar, arvif, arsta);
+		if (ret) {
+			ath12k_warn(ar->ab, "Failed to remove station: %pM for VDEV: %d\n",
+				    arsta->addr, arvif->vdev_id);
+		}
 	}
 
+	/* IEEE80211_STA_NOTEXIST -> IEEE80211_STA_NONE: Add new station to driver */
 	if (old_state == IEEE80211_STA_NOTEXIST &&
 	    new_state == IEEE80211_STA_NONE) {
 		memset(arsta, 0, sizeof(*arsta));
@@ -4975,56 +5113,16 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 		if (ret)
 			ath12k_warn(ar->ab, "Failed to add station: %pM for VDEV: %d\n",
 				    sta->addr, arvif->vdev_id);
-	} else if ((old_state == IEEE80211_STA_NONE &&
-		    new_state == IEEE80211_STA_NOTEXIST)) {
-		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
 
-		if (ahvif->vdev_type == WMI_VDEV_TYPE_STA) {
-			ath12k_bss_disassoc(ar, arvif);
-			ret = ath12k_mac_vdev_stop(arvif);
-			if (ret)
-				ath12k_warn(ar->ab, "failed to stop vdev %i: %d\n",
-					    arvif->vdev_id, ret);
-		}
-		ath12k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
-
-		ret = ath12k_peer_delete(ar, arvif->vdev_id, sta->addr);
-		if (ret)
-			ath12k_warn(ar->ab, "Failed to delete peer: %pM for VDEV: %d\n",
-				    sta->addr, arvif->vdev_id);
-		else
-			ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "Removed peer: %pM for VDEV: %d\n",
-				   sta->addr, arvif->vdev_id);
-
-		ath12k_mac_dec_num_stations(arvif, arsta);
-		spin_lock_bh(&ar->ab->base_lock);
-		peer = ath12k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
-		if (peer && peer->sta == sta) {
-			ath12k_warn(ar->ab, "Found peer entry %pM n vdev %i after it was supposedly removed\n",
-				    vif->addr, arvif->vdev_id);
-			peer->sta = NULL;
-			list_del(&peer->list);
-			kfree(peer);
-			ar->num_peers--;
-		}
-		spin_unlock_bh(&ar->ab->base_lock);
-
-		kfree(arsta->rx_stats);
-		arsta->rx_stats = NULL;
-
-		if (arsta->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
-			rcu_assign_pointer(ahsta->link[arsta->link_id], NULL);
-			synchronize_rcu();
-			ahsta->links_map &= ~(BIT(arsta->link_id));
-			arsta->link_id = ATH12K_INVALID_LINK_ID;
-			arsta->ahsta = NULL;
-		}
+	/* IEEE80211_STA_AUTH -> IEEE80211_STA_ASSOC: Send station assoc command for
+	 * peer associated to AP/Mesh/ADHOC vif type.
+	 */
 	} else if (old_state == IEEE80211_STA_AUTH &&
 		   new_state == IEEE80211_STA_ASSOC &&
 		   (vif->type == NL80211_IFTYPE_AP ||
 		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
-		ret = ath12k_station_assoc(ar, arvif, arsta, false);
+		ret = ath12k_mac_station_assoc(ar, arvif, arsta, false);
 		if (ret)
 			ath12k_warn(ar->ab, "Failed to associate station: %pM\n",
 				    sta->addr);
@@ -5035,40 +5133,32 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 		arsta->bw_prev = sta->deflink.bandwidth;
 
 		spin_unlock_bh(&ar->data_lock);
+
+	/* IEEE80211_STA_ASSOC -> IEEE80211_STA_AUTHORIZED: set peer status as
+	 * authorized
+	 */
 	} else if (old_state == IEEE80211_STA_ASSOC &&
 		   new_state == IEEE80211_STA_AUTHORIZED) {
-		spin_lock_bh(&ar->ab->base_lock);
+		ret = ath12k_mac_station_authorize(ar, arvif, arsta);
+		if (ret)
+			ath12k_warn(ar->ab, "Failed to authorize station: %pM\n",
+				    sta->addr);
 
-		peer = ath12k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
-		if (peer)
-			peer->is_authorized = true;
-
-		spin_unlock_bh(&ar->ab->base_lock);
-
-		if (vif->type == NL80211_IFTYPE_STATION && arvif->is_up) {
-			ret = ath12k_wmi_set_peer_param(ar, sta->addr,
-							arvif->vdev_id,
-							WMI_PEER_AUTHORIZE,
-							1);
-			if (ret)
-				ath12k_warn(ar->ab, "Unable to authorize peer %pM vdev %d: %d\n",
-					    sta->addr, arvif->vdev_id, ret);
-		}
+	/* IEEE80211_STA_AUTHORIZED -> IEEE80211_STA_ASSOC: station may be in removal,
+	 * deauthorize it.
+	 */
 	} else if (old_state == IEEE80211_STA_AUTHORIZED &&
 		   new_state == IEEE80211_STA_ASSOC) {
-		spin_lock_bh(&ar->ab->base_lock);
-
-		peer = ath12k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
-		if (peer)
-			peer->is_authorized = false;
-
-		spin_unlock_bh(&ar->ab->base_lock);
+		ath12k_mac_station_unauthorize(ar, arvif, arsta);
+	/* IEEE80211_STA_ASSOC -> IEEE80211_STA_AUTH: disassoc peer connected to
+	 * AP/mesh/ADHOC vif type.
+	 */
 	} else if (old_state == IEEE80211_STA_ASSOC &&
 		   new_state == IEEE80211_STA_AUTH &&
 		   (vif->type == NL80211_IFTYPE_AP ||
 		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
-		ret = ath12k_station_disassoc(ar, arvif, arsta);
+		ret = ath12k_mac_station_disassoc(ar, arvif, arsta);
 		if (ret)
 			ath12k_warn(ar->ab, "Failed to disassociate station: %pM\n",
 				    sta->addr);
@@ -5077,6 +5167,55 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
+static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
+				   struct ieee80211_vif *vif,
+				   struct ieee80211_sta *sta,
+				   enum ieee80211_sta_state old_state,
+				   enum ieee80211_sta_state new_state)
+{
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
+	struct ath12k_link_vif *arvif;
+	struct ath12k_link_sta *arsta;
+	int ret;
+	u8 link_id = 0;
+
+	lockdep_assert_wiphy(hw->wiphy);
+
+	if (ieee80211_vif_is_mld(vif) && sta->valid_links) {
+		WARN_ON(!sta->mlo && hweight16(sta->valid_links) != 1);
+		link_id = ffs(sta->valid_links) - 1;
+	}
+
+	/* Handle for non-ML station */
+	if (!sta->mlo) {
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		arsta = &ahsta->deflink;
+		arsta->ahsta = ahsta;
+
+		if (WARN_ON(!arvif || !arsta)) {
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		/* vdev might be in deleted */
+		if (WARN_ON(!arvif->ar)) {
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		ret = ath12k_mac_handle_link_sta_state(hw, arvif, arsta,
+						       old_state, new_state);
+		if (ret)
+			goto exit;
+	}
+
+	ret = 0;
+
+exit:
+	return ret;
+}
+
 static int ath12k_mac_op_sta_set_txpwr(struct ieee80211_hw *hw,
 				       struct ieee80211_vif *vif,
 				       struct ieee80211_sta *sta)
-- 
2.39.5



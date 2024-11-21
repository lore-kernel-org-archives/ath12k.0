Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1F7D78783
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLiwxmatfF9Yh8cu4rmrX3jznoUQixQLMWIAHqCOMqk=; b=EHWel1YfMudUpTS4LoxrVFFeSR
	eVO0WsbDnPeVUiIktFK4UMh9heYNaKllzHPxkk//oy7e4+91zz2fLtBrYoUo7+6qr2wQC0Z1WGQ0k
	fjls8NseFmyc5VUVLadgkq+Yi7Tq6JL242iX2bd9kyV5fNqI2YFHzXux7Ap350QAXWR3IoMqIDaLd
	l+IuYTHcc71hKrgH4EunBH2rPu1nc3dRAdZsex1gs9J3FxkhZcNjGxAN0y6XngPOO8xa8i7pyIy6J
	nVZojngtvcCy9CqiKGVmpxbh0n8Mlebxz03ZKzeHZFN1oAWu8VweOEYZTC2A3YmujACDoCzVlIvPF
	7oNkKopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9ZO-00000000OLK-3gbB
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 15:58:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9ZL-00000000OJJ-2OHk
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 15:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84FCBA40ADC
	for <ath12k@lists.infradead.org>; Thu, 21 Nov 2024 15:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1845C4CED0;
	Thu, 21 Nov 2024 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732204690;
	bh=Zf6zgHwrTaC4gB3fGdR9UTcGCwprQF28h7NNBvnDxb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=inMrrCIiv+Xm4W1HeTPa9luqzBL8ktIWv1EItegN2UERfD0g3WBNs0k1BWoisgJjw
	 ycpxsVAapRQ9DRqh7m1/eN/xY9ON6eqF+TLPJEr0ownL1xtUgkV588JFWeLs2OE91O
	 PSZZbUEeBSjgckDliyP+jCQ1EX+SE8trDQXc5N+nhmSHXcNhsKLLH/xVyZuxJeGNEK
	 bZdN3pRKtAOGMZnEAVESSKT9xJT5JGjNSVzpotofPOkPcKZ7Aq3j+bkh0wDi1nWhSq
	 PDs7cXOy0Wm0wgRJ4G4Je8oqUDdlzUJknPg5c/NpWArwvBt5FJxRXHop2ZFTTrh2oo
	 Q3sm5GVvphh3w==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/8] wifi: ath12k: support change_sta_links() mac80211 op
Date: Thu, 21 Nov 2024 17:58:00 +0200
Message-Id: <20241121155806.1862733-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121155806.1862733-1-kvalo@kernel.org>
References: <20241121155806.1862733-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_075811_738698_25C985C4 
X-CRM114-Status: GOOD (  14.20  )
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

Add ath12k_mac_op_change_sta_links() for adding and removing
link station.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 97 ++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d796185c8431..d92a5e0afe2e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5554,6 +5554,101 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 	rcu_read_unlock();
 }
 
+static struct ath12k_link_sta *ath12k_mac_alloc_assign_link_sta(struct ath12k_hw *ah,
+								struct ath12k_sta *ahsta,
+								struct ath12k_vif *ahvif,
+								u8 link_id)
+{
+	struct ath12k_link_sta *arsta;
+	int ret;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
+		return NULL;
+
+	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
+	if (arsta)
+		return NULL;
+
+	arsta = kmalloc(sizeof(*arsta), GFP_KERNEL);
+	if (!arsta)
+		return NULL;
+
+	ret = ath12k_mac_assign_link_sta(ah, ahsta, arsta, ahvif, link_id);
+	if (ret) {
+		kfree(arsta);
+		return NULL;
+	}
+
+	return arsta;
+}
+
+static int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
+					  struct ieee80211_vif *vif,
+					  struct ieee80211_sta *sta,
+					  u16 old_links, u16 new_links)
+{
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
+	struct ath12k_hw *ah = hw->priv;
+	struct ath12k_link_vif *arvif;
+	struct ath12k_link_sta *arsta;
+	unsigned long valid_links;
+	struct ath12k *ar;
+	u8 link_id;
+	int ret;
+
+	lockdep_assert_wiphy(hw->wiphy);
+
+	if (!sta->valid_links)
+		return -EINVAL;
+
+	/* Firmware does not support removal of one of link stas. All sta
+	 * would be removed during ML STA delete in sta_state(), hence link
+	 * sta removal is not handled here.
+	 */
+	if (new_links < old_links)
+		return 0;
+
+	if (ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID) {
+		ath12k_hw_warn(ah, "unable to add link for ml sta %pM", sta->addr);
+		return -EINVAL;
+	}
+
+	/* this op is expected only after initial sta insertion with default link */
+	if (WARN_ON(ahsta->links_map == 0))
+		return -EINVAL;
+
+	valid_links = new_links;
+	for_each_set_bit(link_id, &valid_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		if (ahsta->links_map & BIT(link_id))
+			continue;
+
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		arsta = ath12k_mac_alloc_assign_link_sta(ah, ahsta, ahvif, link_id);
+
+		if (!arvif || !arsta) {
+			ath12k_hw_warn(ah, "Failed to alloc/assign link sta");
+			continue;
+		}
+
+		ar = arvif->ar;
+		if (!ar)
+			continue;
+
+		ret = ath12k_mac_station_add(ar, arvif, arsta);
+		if (ret) {
+			ath12k_warn(ar->ab, "Failed to add station: %pM for VDEV: %d\n",
+				    arsta->addr, arvif->vdev_id);
+			ath12k_mac_free_unassign_link_sta(ah, ahsta, link_id);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int ath12k_conf_tx_uapsd(struct ath12k_link_vif *arvif,
 				u16 ac, bool enable)
 {
@@ -9604,7 +9699,7 @@ static const struct ieee80211_ops ath12k_ops = {
 	.sta_statistics			= ath12k_mac_op_sta_statistics,
 	.remain_on_channel              = ath12k_mac_op_remain_on_channel,
 	.cancel_remain_on_channel       = ath12k_mac_op_cancel_remain_on_channel,
-
+	.change_sta_links               = ath12k_mac_op_change_sta_links,
 #ifdef CONFIG_PM
 	.suspend			= ath12k_wow_op_suspend,
 	.resume				= ath12k_wow_op_resume,
-- 
2.39.5



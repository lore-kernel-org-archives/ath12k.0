Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE72D44D79
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NlA9zvXK8hcX0Dd6J+vmEAFvKrGCA+ACn4Z2FeuEGw=; b=K2H7OHxeOWv9Lm/+8mudiaNzCx
	VG9ZnaYSMvClM7WyuAH4yG+o/qwfCLHrL8MNBtUmE0w0Fh2viDn6dsD7VWcViTVUqAW8v3HKnW8Zi
	WcIP9MmM0S7A1kde+F/iRWQLFM90JB3v/dK6/B/bKBc7RIc9AcOUh/63ThSv/eq7q/+UBsrChVICn
	grtz+CgxOqZBhUxywzjCoOfGLy2cjOv25BHvHxI6+Iu96nqfOSm0AozJo4ddk8zd1xkPEjgdNBU7D
	NJnyZYK+4/1UJg7VGwWa7tLOZevq8B0qtH/ABtdHsd7HXeNv4AYV0Ar07C+fsL1TfUDu02A2nCFIr
	G4H3FalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h1C-00000003bQU-16Fl
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 14:28:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gzH-00000003ay5-3MOY
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 14:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2FC9EA43359
	for <ath12k@lists.infradead.org>; Wed,  6 Nov 2024 14:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E69C4CEC6;
	Wed,  6 Nov 2024 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730903182;
	bh=Ap9/h5NgMcK+7h7rhdftCzmszD6ZfQ0sCRtSTkUAcOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNkueiNOB0PnKT5MyXY6rKtB1wI+TE581hyMIlv0S5Mb/julJnt9YfHZe1GhfDXOR
	 s/OrsnZku/kYFUkL8lfxEC1vkKGVTV9rLap3EuLbD3+DAF8DqFgudgSZ3RLN39ZoLr
	 0uxT427l2TyRFrvgjIWAbxamidLNu+n3j6emm3ZgVhV4V+9gry2x85cNPSSfexXE9G
	 dgu2j9wEhiQdFUtxtDfEJCsm/m6OXTgEJnW+ljuZ+H9tokQoKnlzituGRCdnylle3Z
	 by1eih0X9uwqGlfhZKS6UuubE3f4fFICa4R4aO9Ruq86soT1sQ49Bh8YYhUo+f4GwE
	 9kuMc6UqVXa9w==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/8] wifi: ath12k: support change_sta_links() mac80211 op
Date: Wed,  6 Nov 2024 16:26:11 +0200
Message-Id: <20241106142617.660901-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106142617.660901-1-kvalo@kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_062623_996227_3C12EB25 
X-CRM114-Status: GOOD (  14.71  )
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
index 0ff886e4b3ed..c0cc4e51a4d1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5572,6 +5572,101 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 	rcu_read_unlock();
 }
 
+static struct ath12k_link_sta *
+ath12k_mac_alloc_assign_link_sta(struct ath12k_hw *ah,
+				 struct ath12k_sta *ahsta,
+				 struct ath12k_vif *ahvif, u8 link_id)
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
+	arsta = kzalloc(sizeof(*arsta), GFP_KERNEL);
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
@@ -9622,7 +9717,7 @@ static const struct ieee80211_ops ath12k_ops = {
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



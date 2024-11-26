Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35E7D6552F
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCmIfXb9hgPXfK4pVVZGk4thKSAWDplgsghQJXXl4F4=; b=WNahWgrrmyLODe/uk+hD6kgrF0
	aRCqAY5u2p8cGMCzUZrgJjNv6lElqFP5rJSx8xZ5gjl8zxBWPXrAWYo/oQkQdW+YwMVIGaCFOCpL0
	nMMzz76UubXQ3lssalFyBvonMfYYcMSa0jysxgXXa+VqiORXVIbV1MPv1dHEi4PxpYDEN+REwYeVd
	Kxo6QFqSE66rbKKwF2LF66GastJ2xbLqtNdrJzZ06wX3PuTHOtmSAw0QNnpQvZi3v3uziW+Rfms/V
	Z4ppfkSsNKXxyng99+Iy8zJMaPJqk6UiKdPsdqpT5eALqNN3jwPCftk5L7b6hLMn9xd/EJMwbJX85
	V6xZGiFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6U-0000000BGNK-1mSU
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6P-0000000BGEO-0ZN8
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 943425C5C4E
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DA3C4CECF;
	Tue, 26 Nov 2024 17:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641112;
	bh=5zCC/YdFWWxBJ7fJkYtfZKtr8YGh1fyzP8LdtP0IzJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t8eEbBlPRgzvFSk/Qhh3etKr9/vBUuABFpnoNN69EwNv6JCGDfgC8E3zuSNp2JwCm
	 GcXsOifmnFrSe7xdeW85pohfldfhG+dpA5vg1rK0XqfpWRBtmuO6Z8aG7mEv+fko5p
	 NAHjjDphnrWHh2gVe45nzXMS/3DxSdz5T6E17MJohgYeWVb2cEmm7vLcNWSWpBhN5p
	 hOI0oooMVdTgwpXsxJ2VNq0CV0BBcgBdE5bGqL9Jcam5pvtPp+B0KnfdhKJ3rSemlX
	 oEOP2Svdz2m0cZOe67UhvInYJn66ulciFHwE8zvq5/OFQoXKalRh1YZ9YU0HJoffWw
	 fkcU2f7aa2D0w==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 10/10] wifi: ath12k: ath12k_mac_op_sta_rc_update(): use mac80211 provided link id
Date: Tue, 26 Nov 2024 19:11:39 +0200
Message-Id: <20241126171139.2350704-11-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126171139.2350704-1-kvalo@kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091153_304943_8FBAB7D4 
X-CRM114-Status: GOOD (  10.84  )
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

There's a todo comment to use mac80211 provided link id. As mac80211 now
provides it use it in ath12k and remove the comment.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f6c3128a675a..164c974fb5f4 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5696,10 +5696,10 @@ static int ath12k_mac_op_sta_set_txpwr(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
-					struct ieee80211_vif *vif,
-					struct ieee80211_link_sta *link_sta,
-					u32 changed)
+static void ath12k_mac_op_link_sta_rc_update(struct ieee80211_hw *hw,
+					     struct ieee80211_vif *vif,
+					     struct ieee80211_link_sta *link_sta,
+					     u32 changed)
 {
 	struct ieee80211_sta *sta = link_sta->sta;
 	struct ath12k *ar;
@@ -5710,27 +5710,23 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 	struct ath12k_link_vif *arvif;
 	struct ath12k_peer *peer;
 	u32 bw, smps;
-	/* TODO: use proper link id once link sta specific rc update support is
-	 * available in mac80211.
-	 */
-	u8 link_id = ATH12K_DEFAULT_LINK_ID;
 
 	rcu_read_lock();
-	arvif = rcu_dereference(ahvif->link[link_id]);
+	arvif = rcu_dereference(ahvif->link[link_sta->link_id]);
 	if (!arvif) {
 		ath12k_hw_warn(ah, "mac sta rc update failed to fetch link vif on link id %u for peer %pM\n",
-			       link_id, sta->addr);
+			       link_sta->link_id, sta->addr);
 		rcu_read_unlock();
 		return;
 	}
 
 	ar = arvif->ar;
 
-	arsta = rcu_dereference(ahsta->link[link_id]);
+	arsta = rcu_dereference(ahsta->link[link_sta->link_id]);
 	if (!arsta) {
 		rcu_read_unlock();
 		ath12k_warn(ar->ab, "mac sta rc update failed to fetch link sta on link id %u for peer %pM\n",
-			    link_id, sta->addr);
+			    link_sta->link_id, sta->addr);
 		return;
 	}
 	spin_lock_bh(&ar->ab->base_lock);
@@ -10165,7 +10161,7 @@ static const struct ieee80211_ops ath12k_ops = {
 	.set_rekey_data	                = ath12k_mac_op_set_rekey_data,
 	.sta_state                      = ath12k_mac_op_sta_state,
 	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
-	.link_sta_rc_update		= ath12k_mac_op_sta_rc_update,
+	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
 	.conf_tx                        = ath12k_mac_op_conf_tx,
 	.set_antenna			= ath12k_mac_op_set_antenna,
 	.get_antenna			= ath12k_mac_op_get_antenna,
-- 
2.39.5



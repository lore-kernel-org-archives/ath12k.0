Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F5ED1D893
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDZmLbVlWx1PY2a2EDhELu+MQ7IpomfOLGtGRBw6w84=; b=FEpEWDy6MMGlYIbLvvDbxRLWTz
	os4nTpRcCSvnh1bdt+INYtBpcR2rZd3gENkQKdDUo2ie1Ep37UPC0GKoD1tXk2CWPYJxd19me8+Q5
	HVyNbu7cxC8poZQNN160dwLVljBVnyN10mKauyM/vH1zwyj/0OOZRbOsaOaYrFilitGJ7/BZwgS8d
	hMEiQLt5g4lwJcx9hD+U7iKVKNriRrqV6yiqeFdv1vIuXio46NFbs8X2IFhdo4hICVQSRtFo7uLPs
	jU6jUgmWpqZCgCV8nOvxFqY/Wr3la2EmxThIyEbYv/qRMWPKCCwQG8QOSQUwgw02doPdhqFau0m3o
	vCtgrUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7t-00000008znN-1FIB
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 17:14:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7q-00000008zkp-0U8O
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 17:14:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33E9B5C5CAD
	for <ath12k@lists.infradead.org>; Tue, 15 Oct 2024 17:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56ABC4CECF;
	Tue, 15 Oct 2024 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729012465;
	bh=uqUqwPy7xxBGqKDeN9sHyDh1l78ZazaJwZza2SPLuEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQaE0W3kRTEVyIpx7BeFlomBxl6T5vjyLzVJkZ7nc/AGbpdr1CKDjx1tdjXt7Cgxr
	 P1KQeqsf40lM6lSjbzcI19FGUKTr9sDgU3Q4ZnC6njR2jQSAoMicFa5zsia973iYuj
	 Nea7nBerqPechfaaYj1Zu20qgVhEN9+FOpRFH06DrcFnQhT8qJWTM6KFDhDh93Ex5O
	 R+ocv9VflW0iBIswEIDfY6D72TYFrihpiLkUf8p+AIYxbNLLcIC2/bYZ1AyY4uI0wb
	 UTWZYQK1dDVLG9MH+/jUBM5wZUueU7oRDnDT/o3pMoYePGY/pg7M2EDxfXSfBPeE1y
	 7UqxOy7MUKDyQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 05/11] wifi: ath12k: modify ath12k_mac_vif_chan() for MLO
Date: Tue, 15 Oct 2024 20:14:10 +0300
Message-Id: <20241015171416.518022-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241015171416.518022-1-kvalo@kernel.org>
References: <20241015171416.518022-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_101426_404389_38B2C752 
X-CRM114-Status: GOOD (  11.72  )
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

From: Rameshkumar Sundaram <quic_ramess@quicinc.com>

With MLO, multiple links can be affiliated to a vif (struct ieee80211_vif) and
hence ath12k_mac_vif_chan() needs to know the link id to fetch the channel
context among the links. Rename ath12k_mac_vif_chan() to
ath12k_mac_vif_link_chan() and introduce link id argument to fetch the channel
context from the link bss corresponding to the link id.

For non-MLO vif, link 0's (i.e. deflink) channel context will be returned.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 39 ++++++++++++++++-----------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 85d084d6fb34..a0869ed1cb57 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -476,18 +476,25 @@ static u8 ath12k_parse_mpdudensity(u8 mpdudensity)
 	}
 }
 
-static int ath12k_mac_vif_chan(struct ieee80211_vif *vif,
-			       struct cfg80211_chan_def *def)
+static int ath12k_mac_vif_link_chan(struct ieee80211_vif *vif, u8 link_id,
+				    struct cfg80211_chan_def *def)
 {
+	struct ieee80211_bss_conf *link_conf;
 	struct ieee80211_chanctx_conf *conf;
 
 	rcu_read_lock();
-	conf = rcu_dereference(vif->bss_conf.chanctx_conf);
+	link_conf = rcu_dereference(vif->link_conf[link_id]);
+
+	if (!link_conf) {
+		rcu_read_unlock();
+		return -ENOLINK;
+	}
+
+	conf = rcu_dereference(link_conf->chanctx_conf);
 	if (!conf) {
 		rcu_read_unlock();
 		return -ENOENT;
 	}
-
 	*def = conf->def;
 	rcu_read_unlock();
 
@@ -721,7 +728,7 @@ static u8 ath12k_mac_get_target_pdev_id_from_vif(struct ath12k_link_vif *arvif)
 	u8 pdev_id = ab->fw_pdev[0].pdev_id;
 	int i;
 
-	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
 		return pdev_id;
 
 	band = def.chan->band;
@@ -1780,7 +1787,7 @@ static void ath12k_peer_assoc_h_crypto(struct ath12k *ar,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
 		return;
 
 	bss = cfg80211_get_bss(hw->wiphy, def.chan, info->bssid, NULL, 0,
@@ -1846,7 +1853,7 @@ static void ath12k_peer_assoc_h_rates(struct ath12k *ar,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
 		return;
 
 	band = def.chan->band;
@@ -1908,7 +1915,7 @@ static void ath12k_peer_assoc_h_ht(struct ath12k *ar,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
 		return;
 
 	if (!ht_cap->ht_supported)
@@ -2071,7 +2078,7 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
 		return;
 
 	if (!vht_cap->vht_supported)
@@ -2320,7 +2327,7 @@ static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
 	enum nl80211_band band;
 	u8 ampdu_factor, mpdu_density;
 
-	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
 		return;
 
 	band = def.chan->band;
@@ -2624,7 +2631,7 @@ static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
 
-	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
 		return;
 
 	band = def.chan->band;
@@ -3369,7 +3376,7 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 	}
 
 	if (changed & BSS_CHANGED_MCAST_RATE &&
-	    !ath12k_mac_vif_chan(vif, &def)) {
+	    !ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)) {
 		band = def.chan->band;
 		mcast_rate = vif->bss_conf.mcast_rate[band];
 
@@ -3413,7 +3420,7 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 	}
 
 	if (changed & BSS_CHANGED_BASIC_RATES &&
-	    !ath12k_mac_vif_chan(vif, &def))
+	    !ath12k_mac_vif_link_chan(vif, arvif->link_id, &def))
 		ath12k_recalculate_mgmt_rate(ar, arvif, &def);
 
 	if (changed & BSS_CHANGED_TWT) {
@@ -4260,7 +4267,7 @@ static int ath12k_station_assoc(struct ath12k *ar,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
 		return -EPERM;
 
 	band = def.chan->band;
@@ -4384,7 +4391,7 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 	vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	ar = arvif->ar;
 
-	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
 		return;
 
 	band = def.chan->band;
@@ -8348,7 +8355,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	arvif = &ahvif->deflink;
 
 	ar = arvif->ar;
-	if (ath12k_mac_vif_chan(vif, &def)) {
+	if (ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)) {
 		ret = -EPERM;
 		goto out;
 	}
-- 
2.39.5



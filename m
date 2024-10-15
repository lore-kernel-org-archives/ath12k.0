Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1362FD1D88D
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tgx50BZUdRp5H+YZSXqg68Zk+eTJdJ6Ik/J3b1Ei+u8=; b=QZsim0hR5suln8XjgN67TZqFYr
	O5yOdJ+Y/gY4Wv7F7kYJOA8Z2/rGnvcJJpC3i0umDrWKiCtWpS6qYJrDwPJinfI53NsuRdf5xvwIC
	3JhwEPisgPlRFuD9DCDU5Ea2PZQxt2qWezm2svZY3jvg9DPkNTZMXErYHG/TUHizbWu+81DcvEBwl
	QWHui89GBlCkZkFB2ihzGh1Vq436E/MzhdxKoIBpvqOI9HScybhlj6Nhhjrrx6VEhC9dKQ6EGvNc4
	dFYkPihT0MBITEdidUCrPBuh9s8RhJFKXfHU+kFI1vhpuV7NTypGPvGvfU+9bH2pRuCYRRGw97KpH
	h0shRLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7q-00000008zlX-2HYN
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 17:14:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7n-00000008ziL-0sEx
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 17:14:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06AC35C5718
	for <ath12k@lists.infradead.org>; Tue, 15 Oct 2024 17:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C329C4CEC6;
	Tue, 15 Oct 2024 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729012462;
	bh=6QSeVWb1ZYgDj6KwviHlFN5ZNGjnrgkfuwr6bWspEjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LZ8G66zwJIWYv9CuD9/xAMmIXTQ7kYdsM2QrtaopxulANW1edo33Eh+ORKBpiVIRv
	 dkAq/Ss5HyN63A6h+9v9SAjGhe1uPHRdzl2iGbjfy8kEaimUs7rtloCZIrYSrwPSxl
	 ZjHPCY6K7DfK0XFjCqj74rnt1ivdpMRTfwW9ktpc+XFfQjv5pgr/MwpKiOXefRWNhb
	 b6nlsM3U0OHHDJDuNfdtcqUS2OPPtcoJ3EI5BqbX2izqMyf1hZv9RtzzS00h4S0hnw
	 RJT+qC0S2ILv2+8yNRHFI5OQgO1v+5V6vxitod0HWfXXNSIMt0vt7w6HmYPZm9t9L9
	 T1iDvMABzmMjA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 02/11] wifi: ath12k: pass ath12k_link_vif instead of vif/ahvif
Date: Tue, 15 Oct 2024 20:14:07 +0300
Message-Id: <20241015171416.518022-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241015171416.518022-1-kvalo@kernel.org>
References: <20241015171416.518022-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_101423_411720_2E0F49CE 
X-CRM114-Status: GOOD (  15.92  )
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

Currently ieee80211_vif/ahvif is passed as argument for all vif related control
path functions that are being called from mac80211 ops. With MLO support being
added multiple link vifs can be part of an ieee80211_vif/ahvif and all these
functions will need link id along with ieee80211_vif/ahvif to be passed to
fetch the corresponding link vif (arvif) to which the control/config applies.
Also all these functions need to validate the locking dependency before
dereferencing and start using the link vifs.

To avoid these redundant link dereferences and validations, limit
ieee80211_vif/ahvif argument to mac80211 ops unless otherwise really required.
Do link vif dereference only in mac80211 ops. Replace vif arg with
ath12k_link_vif and internally fetch ath12k_vif (ahvif) and vif (ieee80211_vif)
if required on other functions.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 182 +++++++++++---------------
 1 file changed, 75 insertions(+), 107 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 92f05bc7c7fa..92117d7fb795 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -252,8 +252,8 @@ static const u32 ath12k_smps_map[] = {
 static int ath12k_start_vdev_delay(struct ath12k *ar,
 				   struct ath12k_link_vif *arvif);
 static void ath12k_mac_stop(struct ath12k *ar);
-static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif);
-static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ieee80211_vif *vif);
+static int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif);
+static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ath12k_link_vif *arvif);
 
 static const char *ath12k_mac_phymode_str(enum wmi_phy_mode mode)
 {
@@ -1738,18 +1738,16 @@ static void ath12k_mac_vif_sta_connection_loss_work(struct work_struct *work)
 }
 
 static void ath12k_peer_assoc_h_basic(struct ath12k *ar,
-				      struct ieee80211_vif *vif,
+				      struct ath12k_link_vif *arvif,
 				      struct ieee80211_sta *sta,
 				      struct ath12k_wmi_peer_assoc_arg *arg)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
-	struct ath12k_link_vif *arvif;
 	u32 aid;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arvif = &ahvif->deflink;
 	if (vif->type == NL80211_IFTYPE_STATION)
 		aid = vif->cfg.aid;
 	else
@@ -1766,13 +1764,12 @@ static void ath12k_peer_assoc_h_basic(struct ath12k *ar,
 }
 
 static void ath12k_peer_assoc_h_crypto(struct ath12k *ar,
-				       struct ieee80211_vif *vif,
+				       struct ath12k_link_vif *arvif,
 				       struct ieee80211_sta *sta,
 				       struct ath12k_wmi_peer_assoc_arg *arg)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct ieee80211_bss_conf *info = &vif->bss_conf;
-	struct ath12k_link_vif *arvif;
 	struct cfg80211_chan_def def;
 	struct cfg80211_bss *bss;
 	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
@@ -1781,7 +1778,6 @@ static void ath12k_peer_assoc_h_crypto(struct ath12k *ar,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arvif = &ahvif->deflink;
 	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
 		return;
 
@@ -1830,17 +1826,16 @@ static void ath12k_peer_assoc_h_crypto(struct ath12k *ar,
 }
 
 static void ath12k_peer_assoc_h_rates(struct ath12k *ar,
-				      struct ieee80211_vif *vif,
+				      struct ath12k_link_vif *arvif,
 				      struct ieee80211_sta *sta,
 				      struct ath12k_wmi_peer_assoc_arg *arg)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct wmi_rate_set_arg *rateset = &arg->peer_legacy_rates;
 	struct cfg80211_chan_def def;
 	const struct ieee80211_supported_band *sband;
 	const struct ieee80211_rate *rates;
 	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
-	struct ath12k_link_vif *arvif;
 	enum nl80211_band band;
 	u32 ratemask;
 	u8 rate;
@@ -1848,7 +1843,6 @@ static void ath12k_peer_assoc_h_rates(struct ath12k *ar,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arvif = &ahvif->deflink;
 	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
 		return;
 
@@ -1895,13 +1889,12 @@ ath12k_peer_assoc_h_vht_masked(const u16 *vht_mcs_mask)
 }
 
 static void ath12k_peer_assoc_h_ht(struct ath12k *ar,
-				   struct ieee80211_vif *vif,
+				   struct ath12k_link_vif *arvif,
 				   struct ieee80211_sta *sta,
 				   struct ath12k_wmi_peer_assoc_arg *arg)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	const struct ieee80211_sta_ht_cap *ht_cap = &sta->deflink.ht_cap;
-	struct ath12k_link_vif *arvif;
 	struct cfg80211_chan_def def;
 	enum nl80211_band band;
 	const u8 *ht_mcs_mask;
@@ -1911,7 +1904,6 @@ static void ath12k_peer_assoc_h_ht(struct ath12k *ar,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
 	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
 		return;
 
@@ -2058,13 +2050,12 @@ ath12k_peer_assoc_h_vht_limit(u16 tx_mcs_set,
 }
 
 static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
-				    struct ieee80211_vif *vif,
+				    struct ath12k_link_vif *arvif,
 				    struct ieee80211_sta *sta,
 				    struct ath12k_wmi_peer_assoc_arg *arg)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	const struct ieee80211_sta_vht_cap *vht_cap = &sta->deflink.vht_cap;
-	struct ath12k_link_vif *arvif;
 	struct cfg80211_chan_def def;
 	enum nl80211_band band;
 	const u16 *vht_mcs_mask;
@@ -2075,8 +2066,6 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
-
 	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
 		return;
 
@@ -2158,10 +2147,11 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 }
 
 static void ath12k_peer_assoc_h_he(struct ath12k *ar,
-				   struct ieee80211_vif *vif,
+				   struct ath12k_link_vif *arvif,
 				   struct ieee80211_sta *sta,
 				   struct ath12k_wmi_peer_assoc_arg *arg)
 {
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	const struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
 	int i;
 	u8 ampdu_factor, max_nss;
@@ -2313,11 +2303,12 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 }
 
 static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
-					struct ieee80211_vif *vif,
+					struct ath12k_link_vif *arvif,
 					struct ieee80211_sta *sta,
 					struct ath12k_wmi_peer_assoc_arg *arg)
 {
 	const struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct cfg80211_chan_def def;
 	enum nl80211_band band;
 	u8 ampdu_factor, mpdu_density;
@@ -2411,13 +2402,11 @@ static void ath12k_peer_assoc_h_smps(struct ieee80211_sta *sta,
 }
 
 static void ath12k_peer_assoc_h_qos(struct ath12k *ar,
-				    struct ieee80211_vif *vif,
+				    struct ath12k_link_vif *arvif,
 				    struct ieee80211_sta *sta,
 				    struct ath12k_wmi_peer_assoc_arg *arg)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-
-	switch (ahvif->vdev_type) {
+	switch (arvif->ahvif->vdev_type) {
 	case WMI_VDEV_TYPE_AP:
 		if (sta->wme) {
 			/* TODO: Check WME vs QoS */
@@ -2609,7 +2598,7 @@ static enum wmi_phy_mode ath12k_mac_get_phymode_eht(struct ath12k *ar,
 }
 
 static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
-					struct ieee80211_vif *vif,
+					struct ath12k_link_vif *arvif,
 					struct ieee80211_sta *sta,
 					struct ath12k_wmi_peer_assoc_arg *arg)
 {
@@ -2618,12 +2607,11 @@ static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 	const u8 *ht_mcs_mask;
 	const u16 *vht_mcs_mask;
 	enum wmi_phy_mode phymode = MODE_UNKNOWN;
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
+
 	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
 		return;
 
@@ -2758,21 +2746,18 @@ static void ath12k_mac_set_eht_ppe_threshold(const u8 *ppe_thres,
 }
 
 static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
-				    struct ieee80211_vif *vif,
+				    struct ath12k_link_vif *arvif,
 				    struct ieee80211_sta *sta,
 				    struct ath12k_wmi_peer_assoc_arg *arg)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	const struct ieee80211_sta_eht_cap *eht_cap = &sta->deflink.eht_cap;
 	const struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
 	const struct ieee80211_eht_mcs_nss_supp_20mhz_only *bw_20;
 	const struct ieee80211_eht_mcs_nss_supp_bw *bw;
-	struct ath12k_link_vif *arvif;
 	u32 *rx_mcs, *tx_mcs;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
 	if (!sta->deflink.he_cap.has_he || !eht_cap->has_eht)
 		return;
 
@@ -2845,7 +2830,7 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 }
 
 static void ath12k_peer_assoc_prepare(struct ath12k *ar,
-				      struct ieee80211_vif *vif,
+				      struct ath12k_link_vif *arvif,
 				      struct ieee80211_sta *sta,
 				      struct ath12k_wmi_peer_assoc_arg *arg,
 				      bool reassoc)
@@ -2857,16 +2842,16 @@ static void ath12k_peer_assoc_prepare(struct ath12k *ar,
 	reinit_completion(&ar->peer_assoc_done);
 
 	arg->peer_new_assoc = !reassoc;
-	ath12k_peer_assoc_h_basic(ar, vif, sta, arg);
-	ath12k_peer_assoc_h_crypto(ar, vif, sta, arg);
-	ath12k_peer_assoc_h_rates(ar, vif, sta, arg);
-	ath12k_peer_assoc_h_ht(ar, vif, sta, arg);
-	ath12k_peer_assoc_h_vht(ar, vif, sta, arg);
-	ath12k_peer_assoc_h_he(ar, vif, sta, arg);
-	ath12k_peer_assoc_h_he_6ghz(ar, vif, sta, arg);
-	ath12k_peer_assoc_h_eht(ar, vif, sta, arg);
-	ath12k_peer_assoc_h_qos(ar, vif, sta, arg);
-	ath12k_peer_assoc_h_phymode(ar, vif, sta, arg);
+	ath12k_peer_assoc_h_basic(ar, arvif, sta, arg);
+	ath12k_peer_assoc_h_crypto(ar, arvif, sta, arg);
+	ath12k_peer_assoc_h_rates(ar, arvif, sta, arg);
+	ath12k_peer_assoc_h_ht(ar, arvif, sta, arg);
+	ath12k_peer_assoc_h_vht(ar, arvif, sta, arg);
+	ath12k_peer_assoc_h_he(ar, arvif, sta, arg);
+	ath12k_peer_assoc_h_he_6ghz(ar, arvif, sta, arg);
+	ath12k_peer_assoc_h_eht(ar, arvif, sta, arg);
+	ath12k_peer_assoc_h_qos(ar, arvif, sta, arg);
+	ath12k_peer_assoc_h_phymode(ar, arvif, sta, arg);
 	ath12k_peer_assoc_h_smps(sta, arg);
 
 	/* TODO: amsdu_disable req? */
@@ -2919,7 +2904,7 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 		return;
 	}
 
-	ath12k_peer_assoc_prepare(ar, vif, ap_sta, &peer_arg, false);
+	ath12k_peer_assoc_prepare(ar, arvif, ap_sta, &peer_arg, false);
 
 	rcu_read_unlock();
 
@@ -3040,13 +3025,12 @@ static u32 ath12k_mac_get_rate_hw_value(int bitrate)
 }
 
 static void ath12k_recalculate_mgmt_rate(struct ath12k *ar,
-					 struct ieee80211_vif *vif,
+					 struct ath12k_link_vif *arvif,
 					 struct cfg80211_chan_def *def)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
 	const struct ieee80211_supported_band *sband;
-	struct ath12k_link_vif *arvif;
 	u8 basic_rate_idx;
 	int hw_rate_code;
 	u32 vdev_param;
@@ -3055,7 +3039,6 @@ static void ath12k_recalculate_mgmt_rate(struct ath12k *ar,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arvif = &ahvif->deflink;
 	sband = hw->wiphy->bands[def->chan->band];
 	basic_rate_idx = ffs(vif->bss_conf.basic_rates) - 1;
 	bitrate = sband->bitrates[basic_rate_idx].bitrate;
@@ -3408,7 +3391,7 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 
 	if (changed & BSS_CHANGED_BASIC_RATES &&
 	    !ath12k_mac_vif_chan(vif, &def))
-		ath12k_recalculate_mgmt_rate(ar, vif, &def);
+		ath12k_recalculate_mgmt_rate(ar, arvif, &def);
 
 	if (changed & BSS_CHANGED_TWT) {
 		if (info->twt_requester || info->twt_responder)
@@ -3763,7 +3746,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 			 * would assign the arvif->ar to NULL after the call
 			 */
 			prev_ar = arvif->ar;
-			ret = ath12k_mac_vdev_delete(prev_ar, vif);
+			ret = ath12k_mac_vdev_delete(prev_ar, arvif);
 			if (ret)
 				ath12k_warn(prev_ar->ab,
 					    "unable to delete scan vdev %d\n", ret);
@@ -3772,7 +3755,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		}
 	}
 	if (create) {
-		ret = ath12k_mac_vdev_create(ar, vif);
+		ret = ath12k_mac_vdev_create(ar, arvif);
 		if (ret) {
 			ath12k_warn(ar->ab, "unable to create scan vdev %d\n", ret);
 			return -EINVAL;
@@ -4002,12 +3985,12 @@ static int ath12k_clear_peer_keys(struct ath12k_link_vif *arvif,
 }
 
 static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
-			      struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+			      struct ath12k_link_vif *arvif, struct ieee80211_sta *sta,
 			      struct ieee80211_key_conf *key)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_base *ab = ar->ab;
-	struct ath12k_link_vif *arvif;
 	struct ath12k_peer *peer;
 	struct ath12k_sta *arsta;
 	const u8 *peer_addr;
@@ -4016,7 +3999,6 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
 	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags))
 		return 1;
 
@@ -4161,7 +4143,7 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	 * should be use based on link id passed from mac80211 and such link
 	 * access needs to be protected with ah->conf_mutex.
 	 */
-	ret = ath12k_mac_set_key(ar, cmd, vif, sta, key);
+	ret = ath12k_mac_set_key(ar, cmd, arvif, sta, key);
 
 	return ret;
 }
@@ -4227,29 +4209,27 @@ ath12k_mac_set_peer_vht_fixed_rate(struct ath12k_link_vif *arvif,
 }
 
 static int ath12k_station_assoc(struct ath12k *ar,
-				struct ieee80211_vif *vif,
+				struct ath12k_link_vif *arvif,
 				struct ieee80211_sta *sta,
 				bool reassoc)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct ath12k_wmi_peer_assoc_arg peer_arg;
 	int ret;
 	struct cfg80211_chan_def def;
 	enum nl80211_band band;
-	struct ath12k_link_vif *arvif;
 	struct cfg80211_bitrate_mask *mask;
 	u8 num_vht_rates;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
 	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
 		return -EPERM;
 
 	band = def.chan->band;
 	mask = &arvif->bitrate_mask;
 
-	ath12k_peer_assoc_prepare(ar, vif, sta, &peer_arg, reassoc);
+	ath12k_peer_assoc_prepare(ar, arvif, sta, &peer_arg, reassoc);
 
 	if (peer_arg.peer_nss < 1) {
 		ath12k_warn(ar->ab,
@@ -4318,16 +4298,13 @@ static int ath12k_station_assoc(struct ath12k *ar,
 }
 
 static int ath12k_station_disassoc(struct ath12k *ar,
-				   struct ieee80211_vif *vif,
+				   struct ath12k_link_vif *arvif,
 				   struct ieee80211_sta *sta)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif;
 	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
 	if (!sta->wme) {
 		arvif->num_legacy_stations--;
 		ret = ath12k_recalc_rtscts_prot(arvif);
@@ -4393,7 +4370,7 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 			   ath12k_mac_max_vht_nss(vht_mcs_mask)));
 
 	if (changed & IEEE80211_RC_BW_CHANGED) {
-		ath12k_peer_assoc_h_phymode(ar, vif, sta, &peer_arg);
+		ath12k_peer_assoc_h_phymode(ar, arvif, sta, &peer_arg);
 		peer_phymode = peer_arg.peer_phymode;
 
 		if (bw > bw_prev) {
@@ -4488,7 +4465,7 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 			 * is provided in the new bitrate mask we set the
 			 * other rates using peer_assoc command.
 			 */
-			ath12k_peer_assoc_prepare(ar, vif, sta,
+			ath12k_peer_assoc_prepare(ar, arvif, sta,
 						  &peer_arg, true);
 
 			err = ath12k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
@@ -4535,19 +4512,17 @@ static void ath12k_mac_dec_num_stations(struct ath12k_link_vif *arvif,
 }
 
 static int ath12k_mac_station_add(struct ath12k *ar,
-				  struct ieee80211_vif *vif,
+				  struct ath12k_link_vif *arvif,
 				  struct ieee80211_sta *sta)
 {
 	struct ath12k_base *ab = ar->ab;
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct ath12k_sta *arsta = ath12k_sta_to_arsta(sta);
 	struct ath12k_wmi_peer_create_arg peer_param;
-	struct ath12k_link_vif *arvif;
 	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
 	ret = ath12k_mac_inc_num_stations(arvif, sta);
 	if (ret) {
 		ath12k_warn(ab, "refusing to associate station: too many connected already (%d)\n",
@@ -4672,7 +4647,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 		arsta->arvif = arvif;
 		wiphy_work_init(&arsta->update_wk, ath12k_sta_rc_update_wk);
 
-		ret = ath12k_mac_station_add(ar, vif, sta);
+		ret = ath12k_mac_station_add(ar, arvif, sta);
 		if (ret)
 			ath12k_warn(ar->ab, "Failed to add station: %pM for VDEV: %d\n",
 				    sta->addr, arvif->vdev_id);
@@ -4717,7 +4692,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 		   (vif->type == NL80211_IFTYPE_AP ||
 		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
-		ret = ath12k_station_assoc(ar, vif, sta, false);
+		ret = ath12k_station_assoc(ar, arvif, sta, false);
 		if (ret)
 			ath12k_warn(ar->ab, "Failed to associate station: %pM\n",
 				    sta->addr);
@@ -4761,7 +4736,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 		   (vif->type == NL80211_IFTYPE_AP ||
 		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
-		ret = ath12k_station_disassoc(ar, vif, sta);
+		ret = ath12k_station_disassoc(ar, arvif, sta);
 		if (ret)
 			ath12k_warn(ar->ab, "Failed to disassociate station: %pM\n",
 				    sta->addr);
@@ -6527,15 +6502,15 @@ static void ath12k_mac_op_update_vif_offload(struct ieee80211_hw *hw,
 	ath12k_mac_update_vif_offload(&ahvif->deflink);
 }
 
-int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
+int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 {
 	struct ath12k_hw *ah = ar->ah;
 	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_hw *hw = ah->hw;
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_wmi_vdev_create_arg vdev_arg = {0};
 	struct ath12k_wmi_peer_create_arg peer_param;
-	struct ath12k_link_vif *arvif;
 	u32 param_id, param_value;
 	u16 nss;
 	int i;
@@ -6543,7 +6518,6 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arvif = &ahvif->deflink;
 	arvif->ar = ar;
 	vdev_id = __ffs64(ab->free_vdev_map);
 	arvif->vdev_id = vdev_id;
@@ -6751,18 +6725,16 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
 	return ret;
 }
 
-static void ath12k_mac_vif_cache_flush(struct ath12k *ar, struct ieee80211_vif *vif)
+static void ath12k_mac_vif_cache_flush(struct ath12k *ar,  struct ath12k_link_vif *arvif)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_vif_cache *cache;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
+	struct ath12k_vif_cache *cache = arvif->cache;
 	struct ath12k_base *ab = ar->ab;
-	struct ath12k_link_vif *arvif;
+
 	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
-	cache = arvif->cache;
 	if (!cache)
 		return;
 
@@ -6781,7 +6753,7 @@ static void ath12k_mac_vif_cache_flush(struct ath12k *ar, struct ieee80211_vif *
 	}
 
 	if (cache->key_conf.changed) {
-		ret = ath12k_mac_set_key(ar, cache->key_conf.cmd, vif, NULL,
+		ret = ath12k_mac_set_key(ar, cache->key_conf.cmd, arvif, NULL,
 					 cache->key_conf.key);
 		if (ret)
 			ath12k_warn(ab, "unable to apply set key param to vdev %d ret %d\n",
@@ -6791,11 +6763,10 @@ static void ath12k_mac_vif_cache_flush(struct ath12k *ar, struct ieee80211_vif *
 }
 
 static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
-						    struct ieee80211_vif *vif,
+						    struct ath12k_link_vif *arvif,
 						    struct ieee80211_chanctx_conf *ctx)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct ath12k_hw *ah = hw->priv;
 	struct ath12k *ar, *prev_ar;
 	struct ath12k_base *ab;
@@ -6803,8 +6774,6 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arvif = &ahvif->deflink;
-
 	if (ah->num_radio == 1)
 		ar = ah->radio;
 	else if (ctx)
@@ -6837,7 +6806,7 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 			 * be set to NULL after vdev delete is done
 			 */
 			prev_ar = arvif->ar;
-			ret = ath12k_mac_vdev_delete(prev_ar, vif);
+			ret = ath12k_mac_vdev_delete(prev_ar, arvif);
 			if (ret)
 				ath12k_warn(prev_ar->ab, "unable to delete vdev %d\n",
 					    ret);
@@ -6861,7 +6830,7 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 		goto unlock;
 	}
 
-	ret = ath12k_mac_vdev_create(ar, vif);
+	ret = ath12k_mac_vdev_create(ar, arvif);
 	if (ret) {
 		ath12k_warn(ab, "failed to create vdev %pM ret %d", vif->addr, ret);
 		goto unlock;
@@ -6872,7 +6841,7 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 	 * add_interface(), Apply any parameters for the vdev which were received
 	 * after add_interface, corresponding to this vif.
 	 */
-	ath12k_mac_vif_cache_flush(ar, vif);
+	ath12k_mac_vif_cache_flush(ar, arvif);
 unlock:
 	return arvif->ar;
 }
@@ -6918,7 +6887,7 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 	 * creation until channel_assign to determine the radio on which the
 	 * vdev needs to be created
 	 */
-	ath12k_mac_assign_vif_to_vdev(hw, vif, NULL);
+	ath12k_mac_assign_vif_to_vdev(hw, arvif, NULL);
 
 	return 0;
 }
@@ -6948,17 +6917,16 @@ static void ath12k_mac_vif_unref(struct ath12k_dp *dp, struct ieee80211_vif *vif
 	}
 }
 
-static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ieee80211_vif *vif)
+static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ath12k_link_vif *arvif)
 {
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_base *ab = ar->ab;
-	struct ath12k_link_vif *arvif;
 	unsigned long time_left;
 	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	arvif = &ahvif->deflink;
 	reinit_completion(&ar->vdev_delete_done);
 
 	ret = ath12k_wmi_vdev_delete(ar, arvif->vdev_id);
@@ -7055,7 +7023,7 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 	}
 
-	ath12k_mac_vdev_delete(ar, vif);
+	ath12k_mac_vdev_delete(ar, arvif);
 }
 
 /* FIXME: Has to be verified. */
@@ -7785,7 +7753,7 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	 */
 	arvif = &ahvif->deflink;
 
-	ar = ath12k_mac_assign_vif_to_vdev(hw, vif, ctx);
+	ar = ath12k_mac_assign_vif_to_vdev(hw, arvif, ctx);
 	if (WARN_ON(!ar)) {
 		ret = -EINVAL;
 		goto out;
@@ -8683,7 +8651,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 			 * would assign the arvif->ar to NULL after the call
 			 */
 			prev_ar = arvif->ar;
-			ret = ath12k_mac_vdev_delete(prev_ar, vif);
+			ret = ath12k_mac_vdev_delete(prev_ar, arvif);
 			if (ret) {
 				ath12k_warn(prev_ar->ab,
 					    "unable to delete scan vdev for roc: %d\n",
@@ -8696,7 +8664,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	}
 
 	if (create) {
-		ret = ath12k_mac_vdev_create(ar, vif);
+		ret = ath12k_mac_vdev_create(ar, arvif);
 		if (ret) {
 			ath12k_warn(ar->ab, "unable to create scan vdev for roc: %d\n",
 				    ret);
-- 
2.39.5



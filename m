Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2224D24470
	for <ath12k@archiver.kernel.org>; Fri, 11 Oct 2024 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nk7VUBIRqzSsxWgsiRI53VWVS8LHSaOtOmGCpb10kV8=; b=LRzcvbngkRMYpRXqOiTLtQnTfR
	jQRbj7vtEtXg3HgmMCC4aiTiQ2o1bNahF70PmDYbOzPQ2IPTLAZ+XnC+NGLnueFfHWh37kR1Yoq+o
	ZKdnb0MguCVgEv0ijAXKWtimWu4rjEcLQ9v+zPXbZEagKbWAzziQgrmFJXaPH1BSEgQgBq34/yJNz
	v6LfaxIF6olw1Su/cd0ToDPUfUE4uTWNhJPWZcW6tdA1Z41qBAQuYHDLFxKoUxjlqXlQh9ZowB630
	G+92DAdw9K5pjBOcQlKMUQyM7EAiIieyIArixP7UY2uJm7dyBz9NuTiJBElUcYIlq2wfa51sBN/4U
	ceaGJUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szJW6-0000000H7r0-22RG
	for ath12k@archiver.kernel.org;
	Fri, 11 Oct 2024 17:33:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szJW3-0000000H7ps-2Y4E
	for ath12k@lists.infradead.org;
	Fri, 11 Oct 2024 17:33:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12078A44B96
	for <ath12k@lists.infradead.org>; Fri, 11 Oct 2024 17:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0511C4CEC3;
	Fri, 11 Oct 2024 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728668006;
	bh=VAU7YA/w68NZSQl51W4+MT+/LOFKh4WFwBtuFGI3a9k=;
	h=From:To:Cc:Subject:Date:From;
	b=Dl3n2UtyEk/VO4b2mgwoQE/8GepO3hoTOXbPRrc3k6lP5AhK5D16W3Z3aQcYgwPBD
	 /7yFedoO+5X44XXI7/S9JbDkJemb+yHmyhjEpcoNvIHBMHlJy6SmIR/PYsod3cZUBI
	 NFjNVqfZO7unY8fqTBVRp/N9V2aJcc3WqaZOo3aaP9rkJVCPR68RuBkI0n3vk+UCEh
	 dp6OPLg6J/8BvHgZJf1QeE/yc/YB5dsN0x9P2FHG59SHRoYnemXn6cCS7Gt4t8N4g+
	 2TdK17p9Szh8Cd8GaREShTgbLBBjiXQJuQAi+0rXqs58+WhYTzK4He7TY23kGCgjHW
	 okTrT2hNZlMfA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: add missing lockdep_assert_wiphy() for ath12k_mac_op_ functions
Date: Fri, 11 Oct 2024 20:33:23 +0300
Message-Id: <20241011173323.924473-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_103327_803824_8A8ACBED 
X-CRM114-Status: GOOD (  15.09  )
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

Use lockdep_assert_wiphy() to document the ath12k_mac_op_ functions which are
called under wiphy_lock(). And make sure that the functions which already have
that is in the beginning of the function.

No functional changes.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 61 +++++++++++++++++----------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4b438e4b7bf..d3c37b895b69 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1312,6 +1312,8 @@ static int ath12k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 	struct ath12k *ar;
 	int ret;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ar = ath12k_ah_to_ar(ah, 0);
 
 	ret = ath12k_mac_config(ar, changed);
@@ -3435,6 +3437,8 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k_vif_cache *cache;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ar = ath12k_get_ar_by_vif(hw, vif);
 
 	/* if the vdev is not created on a certain radio,
@@ -3449,8 +3453,6 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 		return;
 	}
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	ath12k_mac_bss_info_changed(ar, arvif, info, changed);
 }
 
@@ -3809,13 +3811,13 @@ static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k *ar;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	if (!arvif->is_created)
 		return;
 
 	ar = arvif->ar;
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	ath12k_scan_abort(ar);
 
 	cancel_delayed_work_sync(&ar->scan.timeout);
@@ -4569,14 +4571,14 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	struct ath12k_peer *peer;
 	int ret = 0;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ar = ath12k_get_ar_by_vif(hw, vif);
 	if (!ar) {
 		WARN_ON_ONCE(1);
 		return -EINVAL;
 	}
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	if (old_state == IEEE80211_STA_NOTEXIST &&
 	    new_state == IEEE80211_STA_NONE) {
 		memset(arsta, 0, sizeof(*arsta));
@@ -4691,6 +4693,8 @@ static int ath12k_mac_op_sta_set_txpwr(struct ieee80211_hw *hw,
 	int ret;
 	s16 txpwr;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	if (sta->deflink.txpwr.type == NL80211_TX_POWER_AUTOMATIC) {
 		txpwr = 0;
 	} else {
@@ -4704,8 +4708,6 @@ static int ath12k_mac_op_sta_set_txpwr(struct ieee80211_hw *hw,
 
 	ar = ath12k_ah_to_ar(ah, 0);
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	ret = ath12k_wmi_set_peer_param(ar, sta->addr, arvif->vdev_id,
 					WMI_PEER_USE_FIXED_PWR, txpwr);
 	if (ret) {
@@ -6030,6 +6032,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 	struct ath12k *ar;
 	int ret, i;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ath12k_drain_tx(ah);
 
 	guard(mutex)(&ah->hw_mutex);
@@ -6169,6 +6173,8 @@ static void ath12k_mac_op_stop(struct ieee80211_hw *hw, bool suspend)
 	struct ath12k *ar;
 	int i;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ath12k_drain_tx(ah);
 
 	mutex_lock(&ah->hw_mutex);
@@ -6391,6 +6397,8 @@ static void ath12k_mac_op_update_vif_offload(struct ieee80211_hw *hw,
 {
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ath12k_mac_update_vif_offload(arvif);
 }
 
@@ -6935,10 +6943,10 @@ static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 
-	ar = ath12k_ah_to_ar(ah, 0);
-
 	lockdep_assert_wiphy(hw->wiphy);
 
+	ar = ath12k_ah_to_ar(ah, 0);
+
 	*total_flags &= SUPPORTED_FILTERS;
 	ath12k_mac_configure_filter(ar, *total_flags);
 }
@@ -7020,14 +7028,14 @@ static int ath12k_mac_op_ampdu_action(struct ieee80211_hw *hw,
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	int ret = -EINVAL;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ar = ath12k_get_ar_by_vif(hw, vif);
 	if (!ar)
 		return -EINVAL;
 
 	ar = ath12k_ah_to_ar(ah, 0);
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	ret = ath12k_mac_ampdu_action(arvif, params);
 	if (ret)
 		ath12k_warn(ar->ab, "pdev idx %d unable to perform ampdu action %d ret %d\n",
@@ -7042,6 +7050,8 @@ static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 	struct ath12k *ar;
 	struct ath12k_base *ab;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ar = ath12k_get_ar_by_ctx(hw, ctx);
 	if (!ar)
 		return -EINVAL;
@@ -7052,8 +7062,6 @@ static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 		   "mac chanctx add freq %u width %d ptr %p\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx);
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	spin_lock_bh(&ar->data_lock);
 	/* TODO: In case of multiple channel context, populate rx_channel from
 	 * Rx PPDU desc information.
@@ -7070,6 +7078,8 @@ static void ath12k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 	struct ath12k *ar;
 	struct ath12k_base *ab;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ar = ath12k_get_ar_by_ctx(hw, ctx);
 	if (!ar)
 		return;
@@ -7080,8 +7090,6 @@ static void ath12k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 		   "mac chanctx remove freq %u width %d ptr %p\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx);
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	spin_lock_bh(&ar->data_lock);
 	/* TODO: In case of there is one more channel context left, populate
 	 * rx_channel with the channel of that remaining channel context.
@@ -7524,14 +7532,14 @@ static void ath12k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 	struct ath12k *ar;
 	struct ath12k_base *ab;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ar = ath12k_get_ar_by_ctx(hw, ctx);
 	if (!ar)
 		return;
 
 	ab = ar->ab;
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
 		   "mac chanctx change freq %u width %d ptr %p changed %x\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx, changed);
@@ -7661,6 +7669,8 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	int ret;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	/* The vif is expected to be attached to an ar's VDEV.
 	 * We leave the vif/vdev in this function as is
 	 * and not delete the vdev symmetric to assign_vif_chanctx()
@@ -7674,8 +7684,6 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	ar = arvif->ar;
 	ab = ar->ab;
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
 		   "mac chanctx unassign ptr %p vdev_id %i\n",
 		   ctx, arvif->vdev_id);
@@ -7713,12 +7721,12 @@ ath12k_mac_op_switch_vif_chanctx(struct ieee80211_hw *hw,
 {
 	struct ath12k *ar;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	ar = ath12k_get_ar_by_ctx(hw, vifs->old_ctx);
 	if (!ar)
 		return -EINVAL;
 
-	lockdep_assert_wiphy(hw->wiphy);
-
 	/* Switching channels across radio is not allowed */
 	if (ar != ath12k_get_ar_by_ctx(hw, vifs->new_ctx))
 		return -EINVAL;
@@ -7764,6 +7772,8 @@ static int ath12k_mac_op_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 	struct ath12k *ar;
 	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD, ret = 0, i;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	/* Currently we set the rts threshold value to all the vifs across
 	 * all radios of the single wiphy.
 	 * TODO Once support for vif specific RTS threshold in mac80211 is
@@ -7793,6 +7803,9 @@ static int ath12k_mac_op_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 	 * supported. This effectively prevents mac80211 from doing frame
 	 * fragmentation in software.
 	 */
+
+	lockdep_assert_wiphy(hw->wiphy);
+
 	return -EOPNOTSUPP;
 }
 
@@ -7837,6 +7850,8 @@ static void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
 	struct ath12k *ar;
 	int i;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	if (drop)
 		return;
 
@@ -8364,6 +8379,8 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 {
 	struct ath12k_sta *arsta = ath12k_sta_to_arsta(sta);
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	sinfo->rx_duration = arsta->rx_duration;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
 

base-commit: 69eabe24843f238e79a6dbbd2b3fcc8eef39d6b8
-- 
2.39.5



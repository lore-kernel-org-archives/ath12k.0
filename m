Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98EED1D88F
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rsTgfgBboc7E9fQxYhrzn9aTn9EharNAQZdTKzfO8M=; b=21QdvKQizXUUIMgvd+251FfeGE
	RjMAa+NceMbCho3mJz7qCmyPCcjNbpcAErFqA+6bE6t8ejxv42HZXRb/lPNr94q1Wf21YONBcK0Bb
	gmz29O64h/AjOtaf9UrunyNrP66tP+P18nOhX3ERDhB2BPouQsTP+7Hi/+twXFJEkBqsJovQJCpua
	YIoZmhgdz36pV1vqjIaYHeM86m1x+O6CQHAn0mlt8cIdAbXGVvgu4uEVY0KSWVBVG/FCEBGwnrxTb
	jb+oCNSFSyjddiGvjLJr8/eoHv/jLFBFXck7ZvqqYxVI8pOaarq7KFH7s9lsBHGZv6LCLI7ivkY2E
	NpNKDRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7w-00000008zpf-2luo
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 17:14:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7s-00000008zmJ-1bQ3
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 17:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACFC9A43364
	for <ath12k@lists.infradead.org>; Tue, 15 Oct 2024 17:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B612BC4CECD;
	Tue, 15 Oct 2024 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729012467;
	bh=L4JXM+1KunNHBc8a7dM4iQIojzcYVY8fZs6p55n8CwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N3PiQOV6hScDy+snYq+u5sM4d3/lz20ohkbtRhXDQyNToH+SZ5FvR3frGS/Wjw79L
	 B/p/OY8ijcFacUNuk8SGO1wIo1Z8/R5S+6nnzJz2CbKXDlqJ/7yEfL0w7TKQeo1LK1
	 PIT1S5XRqrv2y0ci8K1+bgtLXNnmTCGOf15IS9SRczTFUizdQMqHsR3EZ6JH/bGOyx
	 r+cKCh358hNkAZBdkxm8+RAmbLQitPNETNsilqUGooDX9PsOcTQxftZVOp58gHp1Sl
	 1TCW6bao5mUEqlHPyCQ0M8a1IY6+ZNJehgqj+aWxqJIOuwVWpUh9lmgVI2JNVB6hLA
	 J5CWuxZwDQCAQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 07/11] wifi: ath12k: modify ath12k_mac_op_bss_info_changed() for MLO
Date: Tue, 15 Oct 2024 20:14:12 +0300
Message-Id: <20241015171416.518022-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241015171416.518022-1-kvalo@kernel.org>
References: <20241015171416.518022-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_101428_633931_B4D9FDC1 
X-CRM114-Status: GOOD (  16.32  )
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

Currently bss_info_changed callback (which is registered with
ath12k_mac_op_bss_info_changed()) is used to inform vif (struct ieee80211_vif) and bss
(struct ieee80211_bss_conf) level configuration changes to driver.

With MLO, vif level config as well each link config changes inside vif needs to
be updated and mac80211 uses vif_cfg_changed() and link_info_changed() callback
ops for the same, this is also backward compatible where mac80211 will update
default link conf changes in case VIF is non-MLO.

Rename ath12k_mac_op_bss_info_changed() to ath12k_mac_op_link_info_changed()
and register the same to link_info_changed callback.  Register
ath12k_mac_op_vif_cfg_changed() to vif_cfg_changed() callback and handle all
vif level configuration changes there.

Also, currently ath12k_mac_op_bss_info_changed() uses deflink to apply the
config or to cache the config based on the availability of corresponding vdev.
With MLO multiple links can be affiliated to a vif/BSS, so use the link id
provided by mac80211 to fetch the corresponding link to which the bss change
was intended.

For non-MLO link id 0 will be provided by mac80211 and deflink (which is mapped
to ahvif->links[0]) will be used.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 61 ++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fb4b800435f8..c8a330eb0d4b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3150,6 +3150,40 @@ static int ath12k_mac_fils_discovery(struct ath12k_link_vif *arvif,
 	return ret;
 }
 
+static void ath12k_mac_op_vif_cfg_changed(struct ieee80211_hw *hw,
+					  struct ieee80211_vif *vif,
+					  u64 changed)
+{
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	unsigned long links = ahvif->links_map;
+	struct ath12k_link_vif *arvif;
+	struct ath12k *ar;
+	u8 link_id;
+
+	lockdep_assert_wiphy(hw->wiphy);
+
+	if (changed & BSS_CHANGED_SSID && vif->type == NL80211_IFTYPE_AP) {
+		ahvif->u.ap.ssid_len = vif->cfg.ssid_len;
+		if (vif->cfg.ssid_len)
+			memcpy(ahvif->u.ap.ssid, vif->cfg.ssid, vif->cfg.ssid_len);
+	}
+
+	if (changed & BSS_CHANGED_ASSOC) {
+		for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+			if (!arvif || !arvif->ar)
+				continue;
+
+			ar = arvif->ar;
+
+			if (vif->cfg.assoc)
+				ath12k_bss_assoc(ar, arvif, &vif->bss_conf);
+			else
+				ath12k_bss_disassoc(ar, arvif);
+		}
+	}
+}
+
 static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
 {
 	struct ath12k *ar = arvif->ar;
@@ -3497,33 +3531,27 @@ static void ath12k_ahvif_put_link_cache(struct ath12k_vif *ahvif, u8 link_id)
 	ahvif->cache[link_id] = NULL;
 }
 
-static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
-					   struct ieee80211_vif *vif,
-					   struct ieee80211_bss_conf *info,
-					   u64 changed)
+static void ath12k_mac_op_link_info_changed(struct ieee80211_hw *hw,
+					    struct ieee80211_vif *vif,
+					    struct ieee80211_bss_conf *info,
+					    u64 changed)
 {
 	struct ath12k *ar;
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_vif_cache *cache;
 	struct ath12k_link_vif *arvif;
+	u8 link_id = info->link_id;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	/* TODO use info->link_id and fetch corresponding ahvif->link[]
-	 * with MLO support.
-	 */
-	arvif = &ahvif->deflink;
-	ar = ath12k_get_ar_by_vif(hw, vif);
+	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
 
 	/* if the vdev is not created on a certain radio,
 	 * cache the info to be updated later on vdev creation
 	 */
 
-	if (!ar) {
-		/* TODO Once link vif is fetched based on link id from
-		 * info, avoid using ATH12K_DEFAULT_LINK_ID.
-		 */
-		cache = ath12k_ahvif_get_link_cache(ahvif, ATH12K_DEFAULT_LINK_ID);
+	if (!arvif || !arvif->is_created) {
+		cache = ath12k_ahvif_get_link_cache(ahvif, link_id);
 		if (!cache)
 			return;
 
@@ -3532,6 +3560,8 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 		return;
 	}
 
+	ar = arvif->ar;
+
 	ath12k_mac_bss_info_changed(ar, arvif, info, changed);
 }
 
@@ -8888,7 +8918,8 @@ static const struct ieee80211_ops ath12k_ops = {
 	.remove_interface		= ath12k_mac_op_remove_interface,
 	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
 	.config                         = ath12k_mac_op_config,
-	.bss_info_changed               = ath12k_mac_op_bss_info_changed,
+	.link_info_changed              = ath12k_mac_op_link_info_changed,
+	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
 	.configure_filter		= ath12k_mac_op_configure_filter,
 	.hw_scan                        = ath12k_mac_op_hw_scan,
 	.cancel_hw_scan                 = ath12k_mac_op_cancel_hw_scan,
-- 
2.39.5



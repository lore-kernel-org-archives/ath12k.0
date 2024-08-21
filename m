Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B56EC52D7C
	for <ath12k@archiver.kernel.org>; Wed, 21 Aug 2024 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoM5RbvqQodHgn5DG78M9HOQXUVDAJu7FCXIy/NFttY=; b=dPM1MpRgFw+ZwXqjoa1HBPyDX2
	oWv05SsspB/HbgqMXZv63FittGiLjhENPi8T0SgF0ZI8HjWUC0EBSRPTp0vMbM3q19r9IILaG2m8h
	w61Qe9aJFF4alO3xEvhSZXGf/tbUXkHoQl9bXss9eDiF77KiKMAK3M5giio3svlcV7lEYC4othrTw
	d0nYda5H9FBTZdgiL3SW6GneISXxwf0svoby9RIuDhDrS7eHQTrus9IqzKZQ6/3Jc68qIlC6Ky5yi
	K/OJqmyjNyObZAHA+5JAtW4nxm7Hdy/6fFsjaYGR4pjqnAmttklt1ZZJvvIE+37/NxJ94hFtW5+NS
	No7rDp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnPK-00000009WZr-3oGO
	for ath12k@archiver.kernel.org;
	Wed, 21 Aug 2024 15:37:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnOw-00000009WRR-3mw9
	for ath12k@lists.infradead.org;
	Wed, 21 Aug 2024 15:37:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0579460E88
	for <ath12k@lists.infradead.org>; Wed, 21 Aug 2024 15:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B83C4AF09;
	Wed, 21 Aug 2024 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724254653;
	bh=ZW9dPyWMG1cmVlTQ++lm7oUNqXWUy6HqWXeKCAZrp0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pUUTpGO31evVjp35X9JL282GG4TqEke9eMy8jbyMtK/SEneg1jiN8UOpXIsoNFyO1
	 x4voocrGIbt+8aQPvYoYJHXCKjm4NXUnQxzHemP43J3Kt8Ikv1hOOwbCRAksqGAOM/
	 C/jiqGNM7sJh+jckMp+GBd/4uvEUt1ItQ8rdpLLnqwIzoGPk/FzKb3S/jgwQnnJZID
	 19DWKT74n1fP5AosIwjxFwF2FO3i+s5zYKL9Uwh0q7+SzgPmLhVEdGUO9FDw48tO/w
	 B1TENO0U/0Z0M1dS5ndCezhHR2GN5SS1iJRo8PSOUJT2qwRxvGazkR7YdFbieCqxLy
	 FpUuytUwEj95Q==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC 2/4] wifi: ath12k: cleanup unneeded labels
Date: Wed, 21 Aug 2024 18:37:26 +0300
Message-Id: <20240821153728.2121600-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821153728.2121600-1-kvalo@kernel.org>
References: <20240821153728.2121600-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_083735_059236_8B3CE70A 
X-CRM114-Status: GOOD (  13.41  )
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

After removing the conf_mutex in the previous patch there are no unnecessary
labels in mac.c. Sparse also warns one instance of it:

drivers/net/wireless/ath/ath12k/mac.c:6635:1: warning: statement expected after label

Remove the labels and instead use directly return.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 61 ++++++++++-----------------
 1 file changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7bb181092ead..a9d37a59a8c2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1279,24 +1279,23 @@ static int ath12k_mac_config(struct ath12k *ar, u32 changed)
 		ar->monitor_conf_enabled = conf->flags & IEEE80211_CONF_MONITOR;
 		if (ar->monitor_conf_enabled) {
 			if (ar->monitor_vdev_created)
-				goto exit;
+				return ret;
 			ret = ath12k_mac_monitor_vdev_create(ar);
 			if (ret)
-				goto exit;
+				return ret;
 			ret = ath12k_mac_monitor_start(ar);
 			if (ret)
 				goto err_mon_del;
 		} else {
 			if (!ar->monitor_vdev_created)
-				goto exit;
+				return ret;
 			ret = ath12k_mac_monitor_stop(ar);
 			if (ret)
-				goto exit;
+				return ret;
 			ath12k_mac_monitor_vdev_delete(ar);
 		}
 	}
 
-exit:
 	return ret;
 
 err_mon_del:
@@ -4716,10 +4715,9 @@ static int ath12k_mac_op_sta_set_txpwr(struct ieee80211_hw *hw,
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to set tx power for station ret: %d\n",
 			    ret);
-		goto out;
+		return ret;
 	}
 
-out:
 	return ret;
 }
 
@@ -6472,7 +6470,7 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
 	if (ret) {
 		ath12k_warn(ab, "failed to create WMI vdev %d: %d\n",
 			    arvif->vdev_id, ret);
-		goto err;
+		return ret;
 	}
 
 	ar->num_created_vdevs++;
@@ -6589,13 +6587,13 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
 				    arvif->vdev_id, vif->addr);
-			goto err;
+			return ret;
 		}
 
 		ret = ath12k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						       vif->addr);
 		if (ret)
-			goto err;
+			return ret;
 
 		ar->num_peers--;
 	}
@@ -7547,7 +7545,7 @@ static void ath12k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 	 * switch_vif_chanctx().
 	 */
 	if (WARN_ON(changed & IEEE80211_CHANCTX_CHANGE_CHANNEL))
-		goto unlock;
+		return;
 
 	if (changed & IEEE80211_CHANCTX_CHANGE_WIDTH ||
 	    changed & IEEE80211_CHANCTX_CHANGE_RADAR ||
@@ -7555,8 +7553,6 @@ static void ath12k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 		ath12k_mac_update_active_vif_chan(ar, ctx);
 
 	/* TODO: Recalc radar detection */
-
-unlock:
 }
 
 static int ath12k_start_vdev_delay(struct ath12k *ar,
@@ -7629,21 +7625,18 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	    arvif->vdev_type != WMI_VDEV_TYPE_MONITOR &&
 	    !ath12k_peer_exist_by_vdev_id(ab, arvif->vdev_id)) {
 		memcpy(&arvif->chanctx, ctx, sizeof(*ctx));
-		ret = 0;
-		goto out;
+		return 0;
 	}
 
-	if (WARN_ON(arvif->is_started)) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (WARN_ON(arvif->is_started))
+		return -EBUSY;
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath12k_mac_monitor_start(ar);
 		if (ret)
-			goto out;
+			return ret;
 		arvif->is_started = true;
-		goto out;
+		return ret;
 	}
 
 	ret = ath12k_mac_vdev_start(arvif, ctx);
@@ -7651,7 +7644,7 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		ath12k_warn(ab, "failed to start vdev %i addr %pM on freq %d: %d\n",
 			    arvif->vdev_id, vif->addr,
 			    ctx->def.chan->center_freq, ret);
-		goto out;
+		return ret;
 	}
 
 	if (arvif->vdev_type != WMI_VDEV_TYPE_MONITOR && ar->monitor_vdev_created)
@@ -7661,7 +7654,6 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	/* TODO: Setup ps and cts/rts protection */
 
-out:
 	return ret;
 }
 
@@ -8129,10 +8121,8 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	ldpc = !!(ar->ht_cap_info & WMI_HT_CAP_LDPC);
 
 	sgi = mask->control[band].gi;
-	if (sgi == NL80211_TXRATE_FORCE_LGI) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (sgi == NL80211_TXRATE_FORCE_LGI)
+		return -EINVAL;
 
 	/* mac80211 doesn't support sending a fixed HT/VHT MCS alone, rather it
 	 * requires passing at least one of used basic rates along with them.
@@ -8148,7 +8138,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to get single legacy rate for vdev %i: %d\n",
 				    arvif->vdev_id, ret);
-			goto out;
+			return ret;
 		}
 		ieee80211_iterate_stations_atomic(hw,
 						  ath12k_mac_disable_peer_fixed_rate,
@@ -8193,8 +8183,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 			 */
 			ath12k_warn(ar->ab,
 				    "Setting more than one MCS Value in bitrate mask not supported\n");
-			ret = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 
 		ieee80211_iterate_stations_atomic(hw,
@@ -8213,7 +8202,6 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 			    arvif->vdev_id, ret);
 	}
 
-out:
 	return ret;
 }
 
@@ -8373,7 +8361,6 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	if (ar->rx_channel == survey->channel)
 		survey->filled |= SURVEY_INFO_IN_USE;
 
-exit:
 	return 0;
 }
 
@@ -8525,7 +8512,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	spin_unlock_bh(&ar->data_lock);
 
 	if (ret)
-		goto exit;
+		return ret;
 
 	scan_time_msec = hw->wiphy->max_remain_on_channel_duration * 2;
 
@@ -8534,10 +8521,8 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	arg.num_chan = 1;
 	arg.chan_list = kcalloc(arg.num_chan, sizeof(*arg.chan_list),
 				GFP_KERNEL);
-	if (!arg.chan_list) {
-		ret = -ENOMEM;
-		goto exit;
-	}
+	if (!arg.chan_list)
+		return -ENOMEM;
 
 	arg.vdev_id = arvif->vdev_id;
 	arg.scan_id = ATH12K_SCAN_ID;
@@ -8575,7 +8560,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 
 free_chan_list:
 	kfree(arg.chan_list);
-exit:
+
 	return ret;
 }
 
-- 
2.39.2



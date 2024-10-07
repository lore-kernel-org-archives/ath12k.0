Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64179CFB450
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mboS2052UNyddMH8hY8aV5RwWkZzAxl+s4aals3faKk=; b=XqmGEOVQTNmIzwOwoOipeAZqGk
	I9u/6rvei6lo72CtIIIWcShk4Kmdrnq+rMK6u9jIKtFitRNO8zfSlfX8mcvb3TQwjfXofASKhBn4f
	KbM4zxw2GmRQZL9jxbQ5Nc8L/lqMAgLUwMcl/ye+IUU99BriRyQDzRDOYqRmD3kVF2QhdNyqxmd0e
	dN8ubPZZp1bmI7p/7pTr//Wpk/vyzkvi+ZAwrrH/ssj1xIkpYPalMRS1boGmbaX0v9IbiirelS48A
	ZaRRi0gVzfXutYirZOux6VSb+F0t4ZzJmZYY7hjmq5sZoBIh8inBjtmdJc8HZLsFjE0/yxasF0Sds
	wheIMq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5q-00000003GSM-0Ma6
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 17:00:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5D-00000003GLU-2IPk
	for ath12k@bombadil.infradead.org;
	Mon, 07 Oct 2024 16:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mboS2052UNyddMH8hY8aV5RwWkZzAxl+s4aals3faKk=; b=EMRtZBOTnuMvcq4+oRUmQVUEOY
	unooeDuLzU2ctjHEJOWH889oelTv60aBkJjqvRG2HaP24JBv07w6WjUlAVlWG/0DEajX3NmZon+K8
	4EqXUhYY+8/pPHMbxxISWRj5bHjPeweHSHRdd7MlxN9JwuGkzSvGG/Ftnu8+9usYmOjAq79cuohuJ
	Qxv7iP5o/kEw/1rrl6bAkVzshifm9yTPUaB//C3N3o4sAjtBQVdCLmYns8+WUJM8lWfd6SbIMLK92
	dTQxMGhTTpHnhuf541M3XDYohCXH81M+wpp/t0ecs0KUil7bGzYETi0jv3ylOZ8RaBoPw6ttELWzm
	WdixlJvg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5A-00000004Sl3-2910
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 16:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D6185A41CEA
	for <ath12k@lists.infradead.org>; Mon,  7 Oct 2024 16:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEE4C4CEC7;
	Mon,  7 Oct 2024 16:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728320379;
	bh=EIdf9CULXaGGLNYPAeSY+A7yi4BPc7G21mEe+F9XkD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RanM/Va0R5ex2LZbrKZfKJMVjhef7D470P/x7U9IpNe9pbXWJ/FMghyexHcTxQTTf
	 X/JWaLgSgAC4rHE7PpdHz6L9mUA8Xwg9Mx0IdHvRHtGFrcEViaYOdftVd+Z1PsVdas
	 Va5i8dTnSnHepq7mDVCRYuzRaAKpQbqSSEsffM+ULfaxe7Gs6UgfjxW8jzOcuMhV8K
	 x8ImCMb71BXz784V2xCC6pGr/KkU0+jH4wNovfgIXIcxENu0sTtqpBx8JnaFOwJID6
	 KTi2MrFaPFZKnbdTjwXzH2soBlJWk8iRXHjauBgXDYrbLoOdgMT2kyNNuNwjAATszy
	 2B8buObRtqZuw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v4 4/6] wifi: ath12k: cleanup unneeded labels
Date: Mon,  7 Oct 2024 19:59:30 +0300
Message-Id: <20241007165932.78081-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241007165932.78081-1-kvalo@kernel.org>
References: <20241007165932.78081-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_175940_842212_55750FA0 
X-CRM114-Status: GOOD (  11.94  )
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

After removing the conf_mutex in the previous patch there are now unnecessary
labels in mac.c. Remove those and instead use directly return.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 56 +++++++++++----------------
 1 file changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 98894b4bf7e8..1d1e91b124ca 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1282,24 +1282,23 @@ static int ath12k_mac_config(struct ath12k *ar, u32 changed)
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
@@ -4717,10 +4716,9 @@ static int ath12k_mac_op_sta_set_txpwr(struct ieee80211_hw *hw,
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
@@ -7625,21 +7623,18 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
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
@@ -7647,7 +7642,7 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		ath12k_warn(ab, "failed to start vdev %i addr %pM on freq %d: %d\n",
 			    arvif->vdev_id, vif->addr,
 			    ctx->def.chan->center_freq, ret);
-		goto out;
+		return ret;
 	}
 
 	if (arvif->vdev_type != WMI_VDEV_TYPE_MONITOR && ar->monitor_vdev_created)
@@ -7657,7 +7652,6 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	/* TODO: Setup ps and cts/rts protection */
 
-out:
 	return ret;
 }
 
@@ -8125,10 +8119,8 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
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
@@ -8144,7 +8136,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to get single legacy rate for vdev %i: %d\n",
 				    arvif->vdev_id, ret);
-			goto out;
+			return ret;
 		}
 		ieee80211_iterate_stations_mtx(hw,
 					       ath12k_mac_disable_peer_fixed_rate,
@@ -8189,8 +8181,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 			 */
 			ath12k_warn(ar->ab,
 				    "Setting more than one MCS Value in bitrate mask not supported\n");
-			ret = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 
 		ieee80211_iterate_stations_mtx(hw,
@@ -8209,7 +8200,6 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 			    arvif->vdev_id, ret);
 	}
 
-out:
 	return ret;
 }
 
@@ -8520,7 +8510,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	spin_unlock_bh(&ar->data_lock);
 
 	if (ret)
-		goto exit;
+		return ret;
 
 	scan_time_msec = hw->wiphy->max_remain_on_channel_duration * 2;
 
@@ -8529,10 +8519,8 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
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
@@ -8570,7 +8558,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 
 free_chan_list:
 	kfree(arg.chan_list);
-exit:
+
 	return ret;
 }
 
-- 
2.39.5



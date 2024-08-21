Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F96DC54722
	for <ath12k@archiver.kernel.org>; Wed, 21 Aug 2024 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfJbLLvF9DMAmJeOHH0OEjy2hfBwbHscusleBFp9um8=; b=T1qRrKrZX1m9vKwdlBN2RKQ9aj
	UsIen+bafdF9tnFjWL34KS1sCh6IRREK/2TEtwDmPe3h5VbLHlt3Q7ejPhZBa9uxpWj1rLVp9QMsv
	tsNjgFdn8p3J24C2CaNWjf6ye/cJrHz0mt0xgslzrE4s4qLGvusLZ2Eb3zFwWYpa6fZ6eqpVGslfB
	gy/3HOaATwaooyoby0TDQ1g0YxrzKEZtlqhghUUdxhWX+T1cwYMUUlJyRAGrIC9Z1VMf3QTm3SYgF
	y0eDAQsdPCXKwKk6yAmupzl5cKjGoAwYT4wKCJQbKhTLbPKkp/iBG5smSX3jhYOhi7Aus+wwL+gt6
	JMTwXiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnPM-00000009Wag-03BU
	for ath12k@archiver.kernel.org;
	Wed, 21 Aug 2024 15:38:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnOy-00000009WSd-3A5O
	for ath12k@lists.infradead.org;
	Wed, 21 Aug 2024 15:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0351661088
	for <ath12k@lists.infradead.org>; Wed, 21 Aug 2024 15:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E14CC32786;
	Wed, 21 Aug 2024 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724254655;
	bh=hc1QliZ+Mc1C+sQ0pZCAmEAaGgIxjNk7WBgmSijLWD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VnEpLudFFkbuN8hJwwMT0nEkDpH5bQjmsj56rKIWk5QQa5GuFxeBs5nAfoPszaEsn
	 FQJTT7ZOGaTUFiWG8kzvCuhbPHqUxy6JclHetOCfaOqdw7R/S4jJWE37h/BolL7fPv
	 FacsIEy94EEwOYC2J4uGQpaXNGMQPX2CpyTu+Fszwc43LGaM/ZbrLVPYjy0XlXmoC2
	 SPd/hOvlxSHQDnPpcfVRulyPcxMkEH4/BFiSN6k2fHDX+98wJwzdPmbCKDjBVNFxpx
	 PyaMB3TA8bddX06yRafejjTFIv+SeuZ0b5OW/gT9z4J1us3SUypH0EISbkzZKam+zQ
	 ooTPSBCHDf0lw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC 4/4] wifi: ath12k: convert struct ath12k_sta::update_wk to use struct wiphy_work
Date: Wed, 21 Aug 2024 18:37:28 +0300
Message-Id: <20240821153728.2121600-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821153728.2121600-1-kvalo@kernel.org>
References: <20240821153728.2121600-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_083736_957888_94C81BC8 
X-CRM114-Status: GOOD (  12.86  )
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

As ath12k is now converted to use wiphy lock we can convert
ath12k_sta_rc_update_wk() to use wiphy_work_queue(). This is just for
consistency.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 17 +++++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7fad2150d9bd..cc28185be650 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -445,7 +445,7 @@ struct ath12k_sta {
 	u32 smps;
 	enum hal_pn_type pn_type;
 
-	struct work_struct update_wk;
+	struct wiphy_work update_wk;
 	struct rate_info txrate;
 	struct rate_info last_txrate;
 	u64 rx_duration;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 80db9004cdd7..8bf7b026f8e4 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4258,9 +4258,9 @@ static int ath12k_station_disassoc(struct ath12k *ar,
 	return 0;
 }
 
-static void ath12k_sta_rc_update_wk(struct work_struct *wk)
+static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *work)
 {
-	struct ath12k *ar;
+	struct ath12k *ar = wiphy_priv(wiphy);
 	struct ath12k_vif *arvif;
 	struct ath12k_sta *arsta;
 	struct ieee80211_sta *sta;
@@ -4274,10 +4274,11 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
 	struct ath12k_wmi_peer_assoc_arg peer_arg;
 	enum wmi_phy_mode peer_phymode;
 
-	arsta = container_of(wk, struct ath12k_sta, update_wk);
+	lockdep_assert_wiphy(wiphy);
+
+	arsta = container_of(work, struct ath12k_sta, update_wk);
 	sta = container_of((void *)arsta, struct ieee80211_sta, drv_priv);
 	arvif = arsta->arvif;
-	ar = arvif->ar;
 
 	if (WARN_ON(ath12k_mac_vif_chan(arvif->vif, &def)))
 		return;
@@ -4571,7 +4572,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	/* cancel must be done outside the mutex to avoid deadlock */
 	if ((old_state == IEEE80211_STA_NONE &&
 	     new_state == IEEE80211_STA_NOTEXIST))
-		cancel_work_sync(&arsta->update_wk);
+		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
 
 	ar = ath12k_get_ar_by_vif(hw, vif);
 	if (!ar) {
@@ -4585,7 +4586,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	    new_state == IEEE80211_STA_NONE) {
 		memset(arsta, 0, sizeof(*arsta));
 		arsta->arvif = arvif;
-		INIT_WORK(&arsta->update_wk, ath12k_sta_rc_update_wk);
+		wiphy_work_init(&arsta->update_wk, ath12k_sta_rc_update_wk);
 
 		ret = ath12k_mac_station_add(ar, vif, sta);
 		if (ret)
@@ -4792,7 +4793,7 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 
 	spin_unlock_bh(&ar->data_lock);
 
-	ieee80211_queue_work(hw, &arsta->update_wk);
+	wiphy_work_queue(hw->wiphy, &arsta->update_wk);
 }
 
 static int ath12k_conf_tx_uapsd(struct ath12k_vif *arvif,
@@ -8065,7 +8066,7 @@ static void ath12k_mac_set_bitrate_mask_iter(void *data,
 	arsta->changed |= IEEE80211_RC_SUPP_RATES_CHANGED;
 	spin_unlock_bh(&ar->data_lock);
 
-	ieee80211_queue_work(ath12k_ar_to_hw(ar), &arsta->update_wk);
+	wiphy_work_queue(ath12k_ar_to_hw(ar)->wiphy, &arsta->update_wk);
 }
 
 static void ath12k_mac_disable_peer_fixed_rate(void *data,
-- 
2.39.2



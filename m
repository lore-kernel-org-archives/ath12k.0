Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F3DD78786
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2fx7PY2axSND3FkFCMS31wq080bI6oQMwz3ltveoAw=; b=DLiDnW2Hz/c4lDq63nji/UWJVx
	+phnshCHoPcjzq2/0FHyvWvtJg5TP8XC9fI8m93odhpBWd0kB4UwvC0EpeoYsiiYtTi6dfIa9cBUg
	8SMDTLH73+bOGlvENjNp0zAuB9Eo1gWp3/KD/SnD0ATFxZcfnkFuorbR2JyDfxY7YegMLeUTlQmdO
	cD0V0tCHBmjoaUWteVU7MVubchKXehEujzvoZdLnbxWAD35UpTZanMF0Q9Os2FU2SXhfHX9j4csh+
	qfbuoNkOObzSSAAI0vUGSv+WJnfCauPZjqEhC4E/poKqKtPJag9vJqHO1iozN6g5krpXIsGTcmeJK
	/tOaUYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9ZU-00000000OQa-1ofH
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 15:58:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9ZP-00000000OM8-3XIB
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 15:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA832A4083D
	for <ath12k@lists.infradead.org>; Thu, 21 Nov 2024 15:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BE6C4CECD;
	Thu, 21 Nov 2024 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732204694;
	bh=NpdhGLFa8MrtWbe6x2SbAI+aznIf9wCLJufcsr3ViPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jpja58gaaepFVGXlZqhsZw6+I2Cn5JsBN/1aP9c1JazsbaNF6sdncpza3jyuDevOl
	 a+j7EZVBj9+ptg7QJiujdCGhBJP/Ga/5kquPigZN0ZO6PdYYWBTqaiWGoDAQWV/5Dk
	 /gE2StMJ3VlrnEsE04IZKMgHHgBru4Y50AsHGyP0T/DYkRkTraod/itxqLxDIWpm8f
	 yVMWW06w97jL+fITnT2o0v3PibXBMxWzfagsWuYIBJAntQpcUFUqrlOPLPAanUmUEH
	 5KYoTkAoHB3YaIzp/wi3CayZqszA+np16PXPxdblUNqEf1ryYopJD2J6nKSmIgL9jp
	 bfvKmeVO5tgWg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 6/8] wifi: ath12k: modify chanctx iterators for MLO
Date: Thu, 21 Nov 2024 17:58:04 +0200
Message-Id: <20241121155806.1862733-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121155806.1862733-1-kvalo@kernel.org>
References: <20241121155806.1862733-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_075816_010524_C28657DA 
X-CRM114-Status: GOOD (  11.21  )
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

Currently ath12k's chanctx iterator functions use deflink of given ahvif and
bss_conf of corresponding vif to make sure the iterator returns intended vif.
An ML vif can have multiple affiliated links each having its own channel
context, hence iterate through the links of the given ahvif and use the link
objects (arvif and link_conf) to make sure the chan ctx iterator returns
intended link of the given vif.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 80 +++++++++++++++++++--------
 1 file changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01932aeab4f3..956d43520510 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8309,19 +8309,32 @@ ath12k_mac_change_chanctx_cnt_iter(void *data, u8 *mac,
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_mac_change_chanctx_arg *arg = data;
+	struct ieee80211_bss_conf *link_conf;
 	struct ath12k_link_vif *arvif;
+	unsigned long links_map;
+	u8 link_id;
 
 	lockdep_assert_wiphy(ahvif->ah->hw->wiphy);
 
-	arvif = &ahvif->deflink;
+	links_map = ahvif->links_map;
+	for_each_set_bit(link_id, &links_map, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = wiphy_dereference(ahvif->ah->hw->wiphy, ahvif->link[link_id]);
+		if (WARN_ON(!arvif))
+			continue;
 
-	if (arvif->ar != arg->ar)
-		return;
+		if (arvif->ar != arg->ar)
+			continue;
 
-	if (rcu_access_pointer(vif->bss_conf.chanctx_conf) != arg->ctx)
-		return;
+		link_conf = wiphy_dereference(ahvif->ah->hw->wiphy,
+					      vif->link_conf[link_id]);
+		if (WARN_ON(!link_conf))
+			continue;
 
-	arg->n_vifs++;
+		if (rcu_access_pointer(link_conf->chanctx_conf) != arg->ctx)
+			continue;
+
+		arg->n_vifs++;
+	}
 }
 
 static void
@@ -8330,27 +8343,41 @@ ath12k_mac_change_chanctx_fill_iter(void *data, u8 *mac,
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_mac_change_chanctx_arg *arg = data;
+	struct ieee80211_bss_conf *link_conf;
 	struct ieee80211_chanctx_conf *ctx;
 	struct ath12k_link_vif *arvif;
+	unsigned long links_map;
+	u8 link_id;
 
 	lockdep_assert_wiphy(ahvif->ah->hw->wiphy);
 
-	arvif = &ahvif->deflink;
+	links_map = ahvif->links_map;
+	for_each_set_bit(link_id, &links_map, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = wiphy_dereference(ahvif->ah->hw->wiphy, ahvif->link[link_id]);
+		if (WARN_ON(!arvif))
+			continue;
 
-	if (arvif->ar != arg->ar)
-		return;
+		if (arvif->ar != arg->ar)
+			continue;
 
-	ctx = rcu_access_pointer(vif->bss_conf.chanctx_conf);
-	if (ctx != arg->ctx)
-		return;
+		link_conf = wiphy_dereference(ahvif->ah->hw->wiphy,
+					      vif->link_conf[arvif->link_id]);
+		if (WARN_ON(!link_conf))
+			continue;
 
-	if (WARN_ON(arg->next_vif == arg->n_vifs))
-		return;
+		ctx = rcu_access_pointer(link_conf->chanctx_conf);
+		if (ctx != arg->ctx)
+			continue;
 
-	arg->vifs[arg->next_vif].vif = vif;
-	arg->vifs[arg->next_vif].old_ctx = ctx;
-	arg->vifs[arg->next_vif].new_ctx = ctx;
-	arg->next_vif++;
+		if (WARN_ON(arg->next_vif == arg->n_vifs))
+			return;
+
+		arg->vifs[arg->next_vif].vif = vif;
+		arg->vifs[arg->next_vif].old_ctx = ctx;
+		arg->vifs[arg->next_vif].new_ctx = ctx;
+		arg->vifs[arg->next_vif].link_conf = link_conf;
+		arg->next_vif++;
+	}
 }
 
 static u32 ath12k_mac_nlwidth_to_wmiwidth(enum nl80211_chan_width width)
@@ -8410,10 +8437,12 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			   int n_vifs)
 {
 	struct ath12k_wmi_vdev_up_params params = {};
+	struct ieee80211_bss_conf *link_conf;
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_link_vif *arvif;
 	struct ieee80211_vif *vif;
 	struct ath12k_vif *ahvif;
+	u8 link_id;
 	int ret;
 	int i;
 	bool monitor_vif = false;
@@ -8423,7 +8452,10 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 	for (i = 0; i < n_vifs; i++) {
 		vif = vifs[i].vif;
 		ahvif = ath12k_vif_to_ahvif(vif);
-		arvif = &ahvif->deflink;
+		link_conf = vifs[i].link_conf;
+		link_id = link_conf->link_id;
+		arvif = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
+					  ahvif->link[link_id]);
 
 		if (vif->type == NL80211_IFTYPE_MONITOR)
 			monitor_vif = true;
@@ -8476,13 +8508,13 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 		params.aid = ahvif->aid;
 		params.bssid = arvif->bssid;
 		if (vif->mbssid_tx_vif) {
-			struct ath12k_vif *ahvif =
+			struct ath12k_vif *tx_ahvif =
 				ath12k_vif_to_ahvif(vif->mbssid_tx_vif);
-			struct ath12k_link_vif *arvif = &ahvif->deflink;
+			struct ath12k_link_vif *tx_arvif = &tx_ahvif->deflink;
 
-			params.tx_bssid = arvif->bssid;
-			params.nontx_profile_idx = vif->bss_conf.bssid_index;
-			params.nontx_profile_cnt = 1 << vif->bss_conf.bssid_indicator;
+			params.tx_bssid = tx_arvif->bssid;
+			params.nontx_profile_idx = link_conf->bssid_index;
+			params.nontx_profile_cnt = 1 << link_conf->bssid_indicator;
 		}
 		ret = ath12k_wmi_vdev_up(arvif->ar, &params);
 		if (ret) {
-- 
2.39.5



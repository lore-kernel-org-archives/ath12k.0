Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9AAD44D7F
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80dgWNPIQRiln26b5cP+d6FQUpSpmjbaqO6MKOO1/Zw=; b=FCVas1stwCkW2/kCyImarONMpT
	MuvfDhREMXJOUG7WagVFjRQX4H8CiXbjuvon4YnNO+zynau2TDcEReUFtmhAsZulF4PjmWuXJA5gc
	xoiVrza1CS6wx/eHT2DowZq9+6UYi1mL5nCWjaXwCARmP63rIUv8srBjK8M27dPGkWRy59V4ezu8D
	bxcGTi9bi1JCCECYcChDkzT1pLKanZCTNy6C9hosxJ1v76L0XEe/upiK83aqNLYcsTsSD9Z6M0UcC
	WOxsOach0hwqjGjquiWLO+cq3JXvRf0gNpWNX63K9uEMFq/Bty0FO6dmK7+kFeYkVY2rRJm4zm0zG
	bCqvi7Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h1E-00000003bSF-2f00
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 14:28:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gzL-00000003ayQ-2QmC
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 14:26:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6423CA43D9F
	for <ath12k@lists.infradead.org>; Wed,  6 Nov 2024 14:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9D5C4CECC;
	Wed,  6 Nov 2024 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730903187;
	bh=OOFu2ZyK64qfIWuHjZ6Lnlu4IaoDTdg+F7gN8yq2308=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CO1FDMM7GbYOEiCuDo1XpvZBYDAaJiPCB9Bk773NrQQOaR7cO2rQKBMXKZqjjU4gE
	 y1b5nL69bCnmSJp9zcRckmq7fsL0qZr+66PuQ63IyAjtlSEcsw8/0bOiNeRJmZZWOP
	 IrSvHMyogp2nsdywjK+3WAvukswP1/bavFbYtHv0o0s1R89BHe5Ioj76INPikV3x1o
	 EBza+pnxgDD+9Q+ICA98Uex1V9esyydRZ9SDcGJ3tnIB0Ovab88OzS25O6+ictU6UW
	 G2VU1iSYv3ljQZPuS1i5FhEt/lfE7JPobabvm2avWYab+J1ISj/bP+AbGraWv4Qg5s
	 3J6txaD9k4CWg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 6/8] wifi: ath12k: modify chanctx iterators for MLO
Date: Wed,  6 Nov 2024 16:26:15 +0200
Message-Id: <20241106142617.660901-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106142617.660901-1-kvalo@kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_062627_798062_ED858607 
X-CRM114-Status: GOOD (  11.61  )
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
index e45fe7949257..d810a5d74181 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8327,19 +8327,32 @@ ath12k_mac_change_chanctx_cnt_iter(void *data, u8 *mac,
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
@@ -8348,27 +8361,41 @@ ath12k_mac_change_chanctx_fill_iter(void *data, u8 *mac,
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
@@ -8428,10 +8455,12 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
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
@@ -8441,7 +8470,10 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
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
@@ -8494,13 +8526,13 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
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



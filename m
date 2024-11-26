Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD82AD6552E
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XTy5PhnmbC3fvw2EUks2fFVOeRTlk/hfkte1l7jQ0o=; b=YHgSbXDgQQ5/F45gs70lNQykRI
	QHqe/fOaMZQRMN5xBwSIbvFp7VKJkOUfKfE+CRglmDuEWm7L+I30DO6tQbAxtE83+Z26A/J7lM6Dz
	lemMkBnYg41kRp5NeS5mNBHiu96wZc7SNMm1ijo6BWKiHwQHLDylaPqO4pBYikVkwMCMwUrtvS3AM
	8TWHX2HaSnwO2f7gFWxsy5A3iBTaF9DEIgzRZ5E51eTXW8aA5ok6U5aRIkns61Hst1l9+cBf2WAre
	RAXghWValFLro21BO6KpseZCaD0igI26SJimQuN0MjAelQ/M47nOibzxBqnvBu+Vy+Rp9wizlri/p
	a0nE8IxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6S-0000000BGKA-1r2B
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6M-0000000BGEO-1fcc
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 890A45C5C2F
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19530C4CED0;
	Tue, 26 Nov 2024 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641109;
	bh=HyoLG6QjgE87YFN4fnogXsE9Gq2KZL1WR9gKzmiN5mQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pZm/8ZnZizPZmAYxNJtZcZCd1QKxSEWOQ3q4ASvauw+QLdogo3DoYcaFmQdHmMSbw
	 uBIAA/ZTj52N6tekOREMVugKgm+YkdVbPoQksB66sUyZc+CJeLGEJLkeAwpyo4lKpJ
	 4uhCXc++KmQczUouz72TPEYtMt1jwDmiJptFVOWyKXOzIYBhBkFDwLO8oHW85voIDL
	 0sMnC1Yj8rAns0q0+CuXLFeybtwKYVnnchiqPk2G4senEhCrBJ7h5Mi+1bikb9HO4N
	 TEO5mYr/Tolk/StvAna+EbzR6UYNS/d0jDXuo5bJtfP53rOTfmeChy9XTj2jEdOLOA
	 ND8rYNNuUIRVw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 07/10] wifi: ath12k: ath12k_bss_assoc(): MLO support
Date: Tue, 26 Nov 2024 19:11:36 +0200
Message-Id: <20241126171139.2350704-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126171139.2350704-1-kvalo@kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091150_529032_D86E655D 
X-CRM114-Status: GOOD (  11.04  )
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

From: Aditya Kumar Singh <quic_adisi@quicinc.com>

Currently, the ath12k_bss_assoc() function handles only deflink station
connections. To support multi-link station connections, make the necessary
changes to retrieve the required information from the link-level members.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 28 +++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 85cfbe1e4b9f..364e9c6adc73 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3133,7 +3133,9 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_wmi_vdev_up_params params = {};
-	struct ath12k_wmi_peer_assoc_arg peer_arg;
+	struct ath12k_wmi_peer_assoc_arg peer_arg = {};
+	struct ieee80211_link_sta *link_sta;
+	u8 link_id = bss_conf->link_id;
 	struct ath12k_link_sta *arsta;
 	struct ieee80211_sta *ap_sta;
 	struct ath12k_sta *ahsta;
@@ -3143,27 +3145,38 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %i assoc bssid %pM aid %d\n",
-		   arvif->vdev_id, arvif->bssid, ahvif->aid);
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+		   "mac vdev %i link id %u assoc bssid %pM aid %d\n",
+		   arvif->vdev_id, link_id, arvif->bssid, ahvif->aid);
 
 	rcu_read_lock();
 
-	ap_sta = ieee80211_find_sta(vif, bss_conf->bssid);
+	/* During ML connection, cfg.ap_addr has the MLD address. For
+	 * non-ML connection, it has the BSSID.
+	 */
+	ap_sta = ieee80211_find_sta(vif, vif->cfg.ap_addr);
 	if (!ap_sta) {
 		ath12k_warn(ar->ab, "failed to find station entry for bss %pM vdev %i\n",
-			    bss_conf->bssid, arvif->vdev_id);
+			    vif->cfg.ap_addr, arvif->vdev_id);
 		rcu_read_unlock();
 		return;
 	}
 
 	ahsta = ath12k_sta_to_ahsta(ap_sta);
-	arsta = &ahsta->deflink;
 
+	arsta = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
+				  ahsta->link[link_id]);
 	if (WARN_ON(!arsta)) {
 		rcu_read_unlock();
 		return;
 	}
 
+	link_sta = ath12k_mac_get_link_sta(arsta);
+	if (WARN_ON(!link_sta)) {
+		rcu_read_unlock();
+		return;
+	}
+
 	ath12k_peer_assoc_prepare(ar, arvif, arsta, &peer_arg, false);
 
 	rcu_read_unlock();
@@ -3182,8 +3195,7 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	}
 
 	ret = ath12k_setup_peer_smps(ar, arvif, bss_conf->bssid,
-				     &ap_sta->deflink.ht_cap,
-				     &ap_sta->deflink.he_6ghz_capa);
+				     &link_sta->ht_cap, &link_sta->he_6ghz_capa);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to setup peer SMPS for vdev %d: %d\n",
 			    arvif->vdev_id, ret);
-- 
2.39.5



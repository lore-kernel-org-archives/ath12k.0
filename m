Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174CFD44D78
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPGwQRpb7yx2faGrSv5F5ukecVHtZ3zQkg+HoqmuaxA=; b=l7f3HrukMIJF6mnOrMLoj0SVtQ
	8gbC8bcHKz73lxOeGAPUe9yPlz+LMtlxn7FGmX7X/QIiPTgeS+Xx8iQQgcfjzhr/BHJpNVMdHMos/
	O2znHrSpqbohoXnbYpGpR+lvE52ua9/nHOSWwMh3wbeuOiiN8tcAlkR07OkcZSIRIwXmcx80MKzOf
	zhW1+rLo7lrSxKtTfgDfwBCL7ooGYyHC9su0SEmQhQp/op23z/weVIi8Xd0DUDdXDQSdWIk8B6UtP
	oZIdqj8P0RHSDSdVLgQDJvKwdsRyJcSdn9AbPg9P0lRB11ukrE9aWUXP1GeU4X14qGJhz5HIDHVGC
	56pyb7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h1C-00000003bQk-3GlT
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 14:28:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gzI-00000003ayQ-46Bt
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 14:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D98DA43D9F
	for <ath12k@lists.infradead.org>; Wed,  6 Nov 2024 14:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F29C4CECC;
	Wed,  6 Nov 2024 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730903183;
	bh=qTaHc4R/d27pvXoPhMmjbH7pRWXHmJ2NJHBK9CVZHXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qu0p514bQYMQgz0NW8nFhhgBZmWs2lKlDkpdPKSSLY3XPY7C+3LLy7beeZoMUJG2N
	 6Ff3QqVVXEki+5wsHvXsL0blMvU5G9bcrWA3OY/DK2cH/szOhTC7w+NMLziSqI6+h8
	 FiMPpFgps3guufUHO4ZULkREAdfA8tPve/EaA/yjP4D5SbCo5ofV10jLfGyrYKIsUy
	 ro85ZFNQV4hxnPX4WISAzwCZB6TpHAvhFinNgSla3Og0nNNYP4uo/0YJHY58GQ30FZ
	 sikd5CoqIM3HCTytbDc4RBFRe0AaE4ZSv7FiT85tQd53e9Pp5b20/BNwXZpyTIQipN
	 mb3Wd9g50QryQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 3/8] wifi: ath12k: add primary link for data path operations
Date: Wed,  6 Nov 2024 16:26:12 +0200
Message-Id: <20241106142617.660901-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106142617.660901-1-kvalo@kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_062625_186311_4AC2AF28 
X-CRM114-Status: GOOD (  15.17  )
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

In case of Multi-link operation, data path peer setup and tid setup should be
done only for primary link of multi-link station. Add changes to introduce
primary link is peer. Currently, association link will be considered as primary
link.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c    |  5 +++++
 drivers/net/wireless/ath/ath12k/dp_rx.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/peer.c  | 23 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/peer.h  |  8 ++++++++
 4 files changed, 46 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index c99e9ceb1a6e..23326e2dfe8d 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -41,6 +41,11 @@ void ath12k_dp_peer_cleanup(struct ath12k *ar, int vdev_id, const u8 *addr)
 		return;
 	}
 
+	if (!peer->primary_link) {
+		spin_unlock_bh(&ab->base_lock);
+		return;
+	}
+
 	ath12k_dp_rx_peer_tid_cleanup(ar, peer);
 	crypto_free_shash(peer->tfm_mmic);
 	peer->dp_setup_done = false;
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 9ae579e50557..048edb79e993 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -940,6 +940,11 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 		return -ENOENT;
 	}
 
+	if (!peer->primary_link) {
+		spin_unlock_bh(&ab->base_lock);
+		return 0;
+	}
+
 	if (ab->hw_params->reoq_lut_support && !dp->reoq_lut.vaddr) {
 		spin_unlock_bh(&ab->base_lock);
 		ath12k_warn(ab, "reo qref table is not setup\n");
@@ -2781,6 +2786,11 @@ int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev
 		return -ENOENT;
 	}
 
+	if (!peer->primary_link) {
+		spin_unlock_bh(&ab->base_lock);
+		return 0;
+	}
+
 	for (i = 0; i <= IEEE80211_NUM_TIDS; i++) {
 		rx_tid = &peer->rx_tid[i];
 		rx_tid->ab = ab;
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 50e0d3d90bf6..b6d6a2983d09 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -313,7 +313,11 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		       struct ath12k_wmi_peer_create_arg *arg)
 {
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
+	struct ath12k_link_sta *arsta;
+	u8 link_id = arvif->link_id;
 	struct ath12k_peer *peer;
+	struct ath12k_sta *ahsta;
+	u16 ml_peer_id;
 	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -379,6 +383,25 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		arvif->ast_idx = peer->hw_peer_id;
 	}
 
+	if (sta) {
+		ahsta = ath12k_sta_to_ahsta(sta);
+		arsta = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
+					  ahsta->link[link_id]);
+
+		/* Fill ML info into created peer */
+		if (sta->mlo) {
+			ml_peer_id = ahsta->ml_peer_id;
+			peer->ml_id = ml_peer_id | ATH12K_PEER_ML_ID_VALID;
+			ether_addr_copy(peer->ml_addr, sta->addr);
+
+			/* the assoc link is considered primary for now */
+			peer->primary_link = arsta->is_assoc_link;
+		} else {
+			peer->ml_id = ATH12K_MLO_PEER_ID_INVALID;
+			peer->primary_link = true;
+		}
+	}
+
 	peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
 	peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
 
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index e398d5a3fdc8..a39e943bd66b 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -51,6 +51,14 @@ struct ath12k_peer {
 	bool dp_setup_done;
 
 	u16 ml_id;
+
+	/* any other ML info common for all partners can be added
+	 * here and would be same for all partner peers.
+	 */
+	u8 ml_addr[ETH_ALEN];
+
+	/* To ensure only certain work related to dp is done once */
+	bool primary_link;
 };
 
 struct ath12k_ml_peer {
-- 
2.39.5



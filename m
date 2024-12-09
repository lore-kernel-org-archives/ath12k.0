Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEAEE77182
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 18:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3z0M4ophDnNKMO+yaQsnrra2AU7gi5ODhMRqu2x3MOo=; b=KW2u1gSqhNw5gWR+PhGtEEFod0
	iWkCdFq853Mtb56UoaRNya2UuLkMtXayvgWAn8Y7V7ZOXHjzswqAY7/Fkk/v8fmowyJf1YFrlExze
	B2x4H4IxoYIGQ/nvS3KVisPfLcT3YNL3edzjSwPN3/zQb6kZx2xDdzmhPlhzw5ZTAcV8vdtJCj+jU
	Izz8O2HC2u3ghjODFoVzst2Vj6BPO+1PZw5NOucdVIQZxvWMNRi7abfSgnsODGZUEE4iIKWrnq+1T
	dMycD273pW+cmupJUPV3hAcu+0jfLkcxmYNJOqfInfAhBITATVc6f3Z94R+7uSBABaQxKkktW4HEi
	kp8ctBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitw-00000008wHs-32of
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 18:54:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitt-00000008w92-1vBN
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 18:54:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA4985C5FDF
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 18:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB8FC4CEE1;
	Mon,  9 Dec 2024 18:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733770473;
	bh=+eODcYiOK2lvd0sDtM4IPRRyMxPqg1E76bdc5gjjHbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OVQU831Yz3p4TKWP+Wd4f0SZ20yn4aBFDPw97KC0dyXU9npdLte21FhsMTM73Hhz+
	 1tl9BCquG8ytHFeSkYwgp4uUD9Rc5Jp8Id0eQLTjmvurgiJJ5RPO6zVjvzF3kwbRdZ
	 JmHmRyrnyaKO8yF9Zxfy+QubtQVzfWGmz6EzTqxtKrcOSYog2NpcENtGsVn5h5KusR
	 LblyKVf+p5pwvIEuzeApLTsfURM4OOR8QCGzEbKLiMJPCGcuP4v8kws2TbVavMvgz7
	 fhFEstS2RRZo6RD6bI0ahBMQR8bucomlm7m36x4GCHvMRU1uxepH8Q62NlYF7j9uW9
	 2ffyBAT+gbviQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 9/9] wifi: ath12k: pass link ID during MLO while delivering skb
Date: Mon,  9 Dec 2024 20:54:21 +0200
Message-Id: <20241209185421.376381-10-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209185421.376381-1-kvalo@kernel.org>
References: <20241209185421.376381-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_105433_593019_0258C146 
X-CRM114-Status: GOOD (  12.73  )
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

mac80211 expects link_id in some scenarios or else the packet might
get dropped. Hence, add link_id information before delivering the skb.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 +++++++-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 5 +++++
 drivers/net/wireless/ath/ath12k/peer.c   | 2 ++
 drivers/net/wireless/ath/ath12k/peer.h   | 3 +++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 494984133a91..2d53404095d6 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1093,8 +1093,14 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 		decap = ath12k_dp_rx_h_decap_type(ar->ab, rxcb->rx_desc);
 	spin_lock_bh(&ar->ab->base_lock);
 	peer = ath12k_dp_rx_h_find_peer(ar->ab, msdu);
-	if (peer && peer->sta)
+	if (peer && peer->sta) {
 		pubsta = peer->sta;
+		if (pubsta->valid_links) {
+			status->link_valid = 1;
+			status->link_id = peer->link_id;
+		}
+	}
+
 	spin_unlock_bh(&ar->ab->base_lock);
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_DATA,
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index adbd7bbcef6f..1cc7f6ce55b9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2474,6 +2474,11 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 
 	pubsta = peer ? peer->sta : NULL;
 
+	if (pubsta && pubsta->valid_links) {
+		status->link_valid = 1;
+		status->link_id = peer->link_id;
+	}
+
 	spin_unlock_bh(&ab->base_lock);
 
 	ath12k_dbg(ab, ATH12K_DBG_DATA,
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 5763c5a40cfc..792cca8a3fb1 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -388,6 +388,8 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		arsta = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
 					  ahsta->link[link_id]);
 
+		peer->link_id = arsta->link_id;
+
 		/* Fill ML info into created peer */
 		if (sta->mlo) {
 			ml_peer_id = ahsta->ml_peer_id;
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index 7e6231cb2b52..5870ee11a8c7 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -59,6 +59,9 @@ struct ath12k_peer {
 
 	/* To ensure only certain work related to dp is done once */
 	bool primary_link;
+
+	/* for reference to ath12k_link_sta */
+	u8 link_id;
 };
 
 struct ath12k_ml_peer {
-- 
2.39.5



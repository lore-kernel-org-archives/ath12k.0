Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908BAE6F06B
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4TibVvr53exYDJhclerV/cPhym1LE3cmQSVy9gRv1s=; b=GKiR5a0GcESVVR/TFJ2PL8IR5G
	39nN248PNhlZRBHsIzIzlSYRcoESjvzx6nJmAZlyg2dgjN0JmaErduZcNoer7zx4sIT8BFD33I01K
	HSCYDyEbvF6ferAKmervx3+rruovCLJ3k4ilv24dWICj8gUYS3Xu4wJAft8niys9Aw2SDjm3uTy4e
	lEAktmalWMo69u5gAWhX2S8tc+PETs0FOoHbBh+8AmDMpwTXjH6c5TbZPkitT3Xg6PyfL/BLoZcQU
	seaqdhE2dgUvwKaKYb3wYCF7zvRopPo008oVnwCgkyY52i9XEwt+MD8P9WyVipfnm0gBU5YsnlBCS
	DvTpsRuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOp-00000007TcF-1Gp9
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 15:17:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOm-00000007TZn-0LoE
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 15:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9EBAA443D3
	for <ath12k@lists.infradead.org>; Fri,  1 Nov 2024 15:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7136EC4CED1;
	Fri,  1 Nov 2024 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730474235;
	bh=GcHF9smJ63ZYYJcEtK76RykifUHXRqnHH0oKt4J7VQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fqbQVclJiqokSduUgTA0ZkRr6S7E0OP/Pu5GjFWXYkt9vlfgnMdG6aI89BWgWSCzP
	 btHyL9xik2yMl3fABwljiRPsGk72aUbl6xr8+LFAuYwedfha/FgqBvwfMLMgU+VoVZ
	 usd4iCmXlOdc91f4P+gzfHN7UXzYby5c/kbjZP3uKaFQTlOcOs9PbesR0xJGHpoCZt
	 rqRqtZEfpWmxt9H0aiwbWGRrqRmRmtnGd5WbNQkichMB00Yz9bHPg6x9RmyE8qaCZC
	 vlm+go/+J57NlS+6NhnKpdj7pXYPdIRALjca9wYHTqBBVa+8IAULdKXEq8qb2d59YN
	 EF05xgloLW+Kg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 7/8] wifi: ath12k: add helper to find multi-link station
Date: Fri,  1 Nov 2024 17:17:04 +0200
Message-Id: <20241101151705.165987-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101151705.165987-1-kvalo@kernel.org>
References: <20241101151705.165987-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_081716_257336_21E8492B 
X-CRM114-Status: GOOD (  11.10  )
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

Multi-link stations are identified in driver using the multi-link
peer id and they have ATH12K_PEER_ML_ID_VALID bit set in the id. Add a helper
to find multi-link station using the multi-link peer id.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/peer.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/peer.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 2ad19baf0664..0e86847edd6e 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -79,6 +79,20 @@ struct ath12k_peer *ath12k_peer_find_by_addr(struct ath12k_base *ab,
 	return NULL;
 }
 
+static struct ath12k_peer *ath12k_peer_find_by_ml_id(struct ath12k_base *ab,
+						     int ml_peer_id)
+{
+	struct ath12k_peer *peer;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	list_for_each_entry(peer, &ab->peers, list)
+		if (ml_peer_id == peer->ml_id)
+			return peer;
+
+	return NULL;
+}
+
 struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
 					   int peer_id)
 {
@@ -86,6 +100,9 @@ struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
 
 	lockdep_assert_held(&ab->base_lock);
 
+	if (peer_id & ATH12K_PEER_ML_ID_VALID)
+		return ath12k_peer_find_by_ml_id(ab, peer_id);
+
 	list_for_each_entry(peer, &ab->peers, list)
 		if (peer_id == peer->peer_id)
 			return peer;
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index 085246ca938d..c28aca5d88a0 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -19,6 +19,8 @@ struct ppdu_user_delayba {
 	u32 resp_rate_flags;
 };
 
+#define ATH12K_PEER_ML_ID_VALID         BIT(13)
+
 struct ath12k_peer {
 	struct list_head list;
 	struct ieee80211_sta *sta;
@@ -47,6 +49,8 @@ struct ath12k_peer {
 
 	/* protected by ab->data_lock */
 	bool dp_setup_done;
+
+	u16 ml_id;
 };
 
 struct ath12k_ml_peer {
-- 
2.39.5



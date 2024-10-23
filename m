Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4081CF538A
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SueQAxraL+mvBjfunIjNPj9CiZMkjRLGfbAW47A6RVI=; b=BIbjaZwbT+kQWXTkf4GvSPlLp4
	wIv2DcalprAwBhT4jVTpSf1ET36+G5qFNQLDBZT1GblSQlsXKJpr8576WiKU+vJ9oeokkbB/6Z6hN
	iqagaaWj5oFcJkGKp2Oq88WkCGme9a0KzrWqERSP/0/BTGKd9nnfy7eKhvtaS8oS2LQy4u/uRiWce
	AqDJzQJJo1r7i7LCHvlc4zXzG1bT0hiaQD/qfti4WeFFk5bU0sVmEW8dBbyGKvEmn0X9nQe8/lQ8H
	r5kCUqfAn7p0DZ0caYgNW/nwYYGw3lX3kbI7OcdExOSPsvqWaZUWAa1HISkXW0s5DNgUi4nhy0qvu
	RcBLTPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bRN-0000000EYCv-18bD
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 13:30:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bRH-0000000EY6y-1vlQ
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 13:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6AECFA44EF8
	for <ath12k@lists.infradead.org>; Wed, 23 Oct 2024 13:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51BEC4CEC6;
	Wed, 23 Oct 2024 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729690214;
	bh=BqfDhi/3OJXmo58YF+6jcdwSeLkPQeXxg4oys2yN8UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l8tD3z11ZqjdiGEqW5p9rcAf7EXVSxL8SI7sKX0QyXe7oi54BSfWSMEuu9OE2m7up
	 bMbkjEJiKSyoEs0TLFyPwb7LpCPgPiT+klBePPHMbRkn+a/JZeJ7LbgaAznIpgZ/R5
	 fRX17XxCsqLAJJhRkpi3LZMshu7mQWaI+QdwvKNF2oFUvjJIYiIqPJYE0T69+htBrr
	 86u93pkOUv1dd9y29+//ivRxzJ0gygojynEipeWCzAtinBl951QdwTNUFwmiul6sxJ
	 aUkLtGoV3r7tDLy+GPTCM1uINLBcvPmo00Dk6lPfnsD/+EICvzOKADTpxznvbEJ8xP
	 xDB/tDT08NkIA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 7/8] wifi: ath12k: add helper to find multi-link station
Date: Wed, 23 Oct 2024 16:30:03 +0300
Message-Id: <20241023133004.2253830-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023133004.2253830-1-kvalo@kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_063015_704368_151FB2A7 
X-CRM114-Status: GOOD (  10.47  )
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
peer id. Add a helper to find multi-link station using the ML
peer id.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h   |  2 ++
 drivers/net/wireless/ath/ath12k/peer.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/peer.h |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 2e05fc19410e..66b60f772efb 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1796,6 +1796,8 @@ static inline void ath12k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
 	memcpy(addr + 4, &addr_h16, ETH_ALEN - 4);
 }
 
+#define ATH12K_ML_PEER_ID_VALID         BIT(13)
+
 int ath12k_dp_service_srng(struct ath12k_base *ab,
 			   struct ath12k_ext_irq_grp *irq_grp,
 			   int budget);
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 39b371c7433c..c7eb60723d83 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -80,6 +80,20 @@ struct ath12k_peer *ath12k_peer_find_by_addr(struct ath12k_base *ab,
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
+		if (ml_peer_id == peer->ml_peer_id)
+			return peer;
+
+	return NULL;
+}
+
 struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
 					   int peer_id)
 {
@@ -87,6 +101,9 @@ struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
 
 	lockdep_assert_held(&ab->base_lock);
 
+	if (peer_id & ATH12K_ML_PEER_ID_VALID)
+		return ath12k_peer_find_by_ml_id(ab, peer_id);
+
 	list_for_each_entry(peer, &ab->peers, list)
 		if (peer_id == peer->peer_id)
 			return peer;
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index b91bb2106b76..5b718fc5c795 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -47,6 +47,8 @@ struct ath12k_peer {
 
 	/* protected by ab->data_lock */
 	bool dp_setup_done;
+
+	u16 ml_peer_id;
 };
 
 struct ath12k_ml_peer {
-- 
2.39.5



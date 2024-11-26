Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10350D6552E
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLzUQFhv9l+woxGiRx3GTcQn7A50zX6vo6o8W1Rc5kY=; b=VanUwPphuwNd7We80sjFjv89Bu
	ARjzIQib1n+TcV5GxTr4GV1mPdVMe+5tbsp6kt1g6Uc3s/FQU5f7T+VmFxVbbXJ2Lm9+MkZeQFkKq
	bmfOO+4nSZfn0L+pYkYx1iKlQhkmfeBfA8wNSI8IKopiwrjEVdIIzr3n8xmYdPLCan5aF6/ZI8YWi
	5jUYn23LZzco2i0uTsSIsCgfMhqk7G9FdmQWyEr1Cgok+H2qjfo5hEHcD53J9HJZhOFo3rCu4xZ2i
	cJUCo0Vy4QjXTj9m0sfPTuRKYEuRihUxOESdRv+N3BQFAxQn2IA4tQMrSrGNKms0C3IPR4kYbmyMc
	UgYfeB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6O-0000000BGG2-2uGd
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6G-0000000BGCC-1xdP
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 864F15C5C4E
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E628EC4CED0;
	Tue, 26 Nov 2024 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641103;
	bh=85ww3C21SXpj87eUXy7pkC/ca42JLA4U6FeavlmaBxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k4aIf/AkxR7mQjJmp8IqfVKasMkem93Jra6iABaSiweNhKKSYohkphTyztJ/YhiCL
	 9VzcBcGVLHrFdSHAJvTWFNJv8btoEWrNeMBpsM7fPPrzIpVmtPjjUlEQpz12r9gK+C
	 qZFRP3526Nv/KsbDgxJ1rqUC3Z8y2UaZ8Msd2FlKS2hWRTz6NiF/vnklfTl9cXHVvW
	 NshXOqTR/2tNKmrXV4GA6m0J9KDB/snyYWcD/hn7xjeyVr2LuDTsn/SvqR7CB47cVL
	 wMf6Bl0CjOgr+nL0FDNJF2FQtXnOhsaJoNMuYgchEJZCUDcgk01ro2RsJwHtQmwpm3
	 2/ranHMjTjlRQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 01/10] wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct wiphy_work
Date: Tue, 26 Nov 2024 19:11:30 +0200
Message-Id: <20241126171139.2350704-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126171139.2350704-1-kvalo@kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091144_594688_61F4F3AC 
X-CRM114-Status: GOOD (  14.53  )
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

To simplify locking for the next patches convert struct
ath12k::wmi_mgmt_tx_work to use wiphy_work. After this
ath12k_mgmt_over_wmi_tx_work() is called with wiphy_lock() taken. In
ath12k_core_suspend() we need to take wiphy_lock() because
ath12k_mac_wait_tx_complete() requires it.

Also add lockdep_assert_wiphy() to document when wiphy_lock() is held.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  6 ++++++
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 20 ++++++++++++++++----
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index c57322221e1d..263a7c789122 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -79,11 +79,17 @@ int ath12k_core_suspend(struct ath12k_base *ab)
 		ar = ab->pdevs[i].ar;
 		if (!ar)
 			continue;
+
+		wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
+
 		ret = ath12k_mac_wait_tx_complete(ar);
 		if (ret) {
+			wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
 			ath12k_warn(ab, "failed to wait tx complete: %d\n", ret);
 			return ret;
 		}
+
+		wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
 	}
 
 	/* PM framework skips suspend_late/resume_early callbacks
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index c1d5e93b679a..5be977008319 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -679,7 +679,7 @@ struct ath12k {
 
 	struct work_struct regd_update_work;
 
-	struct work_struct wmi_mgmt_tx_work;
+	struct wiphy_work wmi_mgmt_tx_work;
 	struct sk_buff_head wmi_mgmt_tx_queue;
 
 	struct ath12k_wow wow;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 60702bf07141..a6fe998c177e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6726,6 +6726,8 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
 {
 	int num_mgmt;
 
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
 	ieee80211_free_txskb(ath12k_ar_to_hw(ar), skb);
 
 	num_mgmt = atomic_dec_if_positive(&ar->num_pending_mgmt_tx);
@@ -6787,6 +6789,8 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 	int buf_id;
 	int ret;
 
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
 	ATH12K_SKB_CB(skb)->ar = ar;
 	spin_lock_bh(&ar->txmgmt_idr_lock);
 	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
@@ -6841,7 +6845,7 @@ static void ath12k_mgmt_over_wmi_tx_purge(struct ath12k *ar)
 		ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 }
 
-static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
+static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work *work)
 {
 	struct ath12k *ar = container_of(work, struct ath12k, wmi_mgmt_tx_work);
 	struct ath12k_skb_cb *skb_cb;
@@ -6850,6 +6854,8 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
 	struct sk_buff *skb;
 	int ret;
 
+	lockdep_assert_wiphy(wiphy);
+
 	while ((skb = skb_dequeue(&ar->wmi_mgmt_tx_queue)) != NULL) {
 		skb_cb = ATH12K_SKB_CB(skb);
 		if (!skb_cb->vif) {
@@ -6904,7 +6910,7 @@ static int ath12k_mac_mgmt_tx(struct ath12k *ar, struct sk_buff *skb,
 
 	skb_queue_tail(q, skb);
 	atomic_inc(&ar->num_pending_mgmt_tx);
-	ieee80211_queue_work(ath12k_ar_to_hw(ar), &ar->wmi_mgmt_tx_work);
+	wiphy_work_queue(ath12k_ar_to_hw(ar)->wiphy, &ar->wmi_mgmt_tx_work);
 
 	return 0;
 }
@@ -6981,10 +6987,12 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 
 void ath12k_mac_drain_tx(struct ath12k *ar)
 {
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
 	/* make sure rcu-protected mac80211 tx path itself is drained */
 	synchronize_net();
 
-	cancel_work_sync(&ar->wmi_mgmt_tx_work);
+	wiphy_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &ar->wmi_mgmt_tx_work);
 	ath12k_mgmt_over_wmi_tx_purge(ar);
 }
 
@@ -7101,6 +7109,8 @@ static void ath12k_drain_tx(struct ath12k_hw *ah)
 	struct ath12k *ar;
 	int i;
 
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
 	for_each_ar(ah, ar, i)
 		ath12k_mac_drain_tx(ar);
 }
@@ -9134,6 +9144,8 @@ static int ath12k_mac_flush(struct ath12k *ar)
 
 int ath12k_mac_wait_tx_complete(struct ath12k *ar)
 {
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
 	ath12k_mac_drain_tx(ar);
 	return ath12k_mac_flush(ar);
 }
@@ -10604,7 +10616,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
 	INIT_WORK(&ar->regd_update_work, ath12k_regd_update_work);
 
-	INIT_WORK(&ar->wmi_mgmt_tx_work, ath12k_mgmt_over_wmi_tx_work);
+	wiphy_work_init(&ar->wmi_mgmt_tx_work, ath12k_mgmt_over_wmi_tx_work);
 	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
 }
 
-- 
2.39.5



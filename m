Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFE1D70DE7
	for <ath12k@archiver.kernel.org>; Thu, 28 Nov 2024 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wClXHtLdxrtHP4hoBWt+n8nsAfrJjSLjXJ9UJFb3UY0=; b=MOLcBkVtpWH1/2+1EHX2BZ1f+Q
	lPOBLBd5K4txItxvPGVUjXeAMpmz7/5MQzxgJ/tfxpeEyTJDrDq3kjPqI6Jpj0N/iZigo3ilo6ONQ
	FzFx3MdGmss1OcWrpjlJI3oPj86mSNmjueVld0cRhhprCaHQFJUKK8VsvqBx1n71qVpCX7hVlY5RA
	dqUyAQKa0+WZ0zSty1En4EvJ+r3cXy0UGjqBPPeOeZf0p/rI6NSZVZ9pCTTBnVfglO0BDBGurI3b8
	jQgKrXmYOtrvb/dSG0v9pmNlT3N4rG2G+Bp0TdHXOPkphs9E+HIrpDPZOv39n6slM5wIYy2AqZ8c8
	Jxdr0VBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhjH-0000000G25l-2zSf
	for ath12k@archiver.kernel.org;
	Thu, 28 Nov 2024 16:50:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhiq-0000000G20o-0NFI
	for ath12k@lists.infradead.org;
	Thu, 28 Nov 2024 16:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E2AF5C4C52
	for <ath12k@lists.infradead.org>; Thu, 28 Nov 2024 16:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E7AC4CED3;
	Thu, 28 Nov 2024 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732812631;
	bh=vEh0qvVVLDemau2Z4sQp0eiz2HLCMuAfK1/h3EmQnpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=It8hPg64Nd4dgXRTSzQa5Y3OMfX4wUYIrN66x6RsYRWsr5JYpZVLunYbkel5oDoOH
	 YRU/g6eGqE5Sa/hfSjP2x9N1EyOdxALrxCMMTHciixiY67vUVy8/hoPxeh79wqHshT
	 WwuQdhEvqgCXc6mKXSX1B/sunXe8TTh5RBIk5xWB7v9oi1XKSSXd0D5lSADBfCrSHl
	 XSFyAyZe9qkrbXG8WZAxcECAFYmNxxDXb3J3+eirdRumJh+GyT3SX3iWAlkKKI0HL3
	 C3amGheIChjlyirJGkEpAxALXdfW1hKgQJyQ53OsNFeCCOEIlmoMLOgIYbgFhIPX78
	 u7tyLIo9nssmQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/4] wifi: ath12k: add ath12k_ab_to_ah() and ath12k_ab_set_ah()
Date: Thu, 28 Nov 2024 18:50:24 +0200
Message-Id: <20241128165026.2618331-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241128165026.2618331-1-kvalo@kernel.org>
References: <20241128165026.2618331-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_085032_214929_4BFE7391 
X-CRM114-Status: GOOD (  13.22  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, one or more ath12k_hw is part of a device (struct ath12k_base) but
in future, it would be part of device group abstraction (struct
ath12k_hw_group), i.e., when multiple radios (ar) across different devices can
be combined together in a device group (struct ath12k_hw_group).

In order to facilitate the above transition, introduce helpers
ath12k_ab_to_ah() and ath12k_ab_set_ah() to get and set values of ath12k_hw
respectively.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  8 ++++----
 drivers/net/wireless/ath/ath12k/core.h | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/mac.c  | 23 +++++++++++++----------
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 5313b0267307..14d0aa26d850 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -986,7 +986,7 @@ static void ath12k_rfkill_work(struct work_struct *work)
 	spin_unlock_bh(&ab->base_lock);
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
 
@@ -1038,7 +1038,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1077,7 +1077,7 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 	int i, j;
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1131,7 +1131,7 @@ static void ath12k_core_restart(struct work_struct *work)
 
 	if (ab->is_reset) {
 		for (i = 0; i < ab->num_hw; i++) {
-			ah = ab->ah[i];
+			ah = ath12k_ab_to_ah(ab, i);
 			ieee80211_restart_hw(ah->hw);
 		}
 	}
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index f4a710d49584..ba52be1cfd0f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1160,4 +1160,15 @@ static inline struct ieee80211_hw *ath12k_ar_to_hw(struct ath12k *ar)
 #define for_each_ar(ah, ar, index) \
 	for ((index) = 0; ((index) < (ah)->num_radio && \
 	     ((ar) = &(ah)->radio[(index)])); (index)++)
+
+static inline struct ath12k_hw *ath12k_ab_to_ah(struct ath12k_base *ab, int idx)
+{
+	return ab->ah[idx];
+}
+
+static inline void ath12k_ab_set_ah(struct ath12k_base *ab, int idx,
+				    struct ath12k_hw *ah)
+{
+	ab->ah[idx] = ah;
+}
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8d4207707867..8cafb67523c9 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10832,7 +10832,7 @@ int ath12k_mac_register(struct ath12k_base *ab)
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 
 		ret = ath12k_mac_hw_register(ah);
 		if (ret)
@@ -10843,7 +10843,7 @@ int ath12k_mac_register(struct ath12k_base *ab)
 
 err:
 	for (i = i - 1; i >= 0; i--) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
 
@@ -10859,7 +10859,7 @@ void ath12k_mac_unregister(struct ath12k_base *ab)
 	int i;
 
 	for (i = ab->num_hw - 1; i >= 0; i--) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
 
@@ -10917,6 +10917,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,
 void ath12k_mac_destroy(struct ath12k_base *ab)
 {
 	struct ath12k_pdev *pdev;
+	struct ath12k_hw *ah;
 	int i;
 
 	for (i = 0; i < ab->num_radios; i++) {
@@ -10928,11 +10929,12 @@ void ath12k_mac_destroy(struct ath12k_base *ab)
 	}
 
 	for (i = 0; i < ab->num_hw; i++) {
-		if (!ab->ah[i])
+		ah = ath12k_ab_to_ah(ab, i);
+		if (!ah)
 			continue;
 
-		ath12k_mac_hw_destroy(ab->ah[i]);
-		ab->ah[i] = NULL;
+		ath12k_mac_hw_destroy(ah);
+		ath12k_ab_set_ah(ab, i, NULL);
 	}
 }
 
@@ -10965,7 +10967,7 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 
 		ah->dev = ab->dev;
 
-		ab->ah[i] = ah;
+		ath12k_ab_set_ah(ab, i, ah);
 	}
 
 	ath12k_dp_pdev_pre_alloc(ab);
@@ -10974,11 +10976,12 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 
 err:
 	for (i = i - 1; i >= 0; i--) {
-		if (!ab->ah[i])
+		ah = ath12k_ab_to_ah(ab, i);
+		if (!ah)
 			continue;
 
-		ath12k_mac_hw_destroy(ab->ah[i]);
-		ab->ah[i] = NULL;
+		ath12k_mac_hw_destroy(ah);
+		ath12k_ab_set_ah(ab, i, NULL);
 	}
 
 	return ret;
-- 
2.39.5



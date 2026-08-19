Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68871C5DF81
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4li65BcNpSkuPJvoyH9P8yXhY9efVvAT0OcmyGsRKBI=; b=mMpGij89a9vCyHJ01nmHnhzT7D
	1Nih/m6/vZPCq1JGjVRnAXcL1RKsnp3gFkWWoR6JcNjZw76rduQWIPWzCTzxyyf7ahymxAJO2hFt/
	hw+yOEuGkRhwYQopTo+h3VPNe56TIO51vaDt1mGbyiREaYXcM+cnvP4RAZrMRAqq0tw+f/PH9kEzh
	O3COI5NVhwJFFEF8NZVXUfhs2n3a8OjeiMbXPD3KFFXB3YVX3V3Id0cUJzmH+s1AXjDwSJIl6LG9b
	wLZkK5ZbT7IcKmlnywOtSluWOdu+TRUY8TZTHXzELL4zIp6tL/Rj9mbq712iCD06NAZ4dE7B4Cw8T
	nJHKp7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgt5-00000009upv-2hz9;
	Wed, 19 Aug 2026 14:03:27 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgt2-00000009unn-3ovm;
	Wed, 19 Aug 2026 14:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4li65BcNpSkuPJvoyH9P8yXhY9efVvAT0OcmyGsRKBI=;
	t=1787148204; x=1788357804; b=LwZVpNLvb8l8IyTvIxeHGGiSZXEfv+xeMKJbw2ufrsPOweA
	0xhy63J3i2laDm9jpa37xcLRkfFrSvCKoVAQnxW9uGjdlb8kImjii/mGR9w5Udj0vq5AuPZpWKLKd
	fuvQj61lHP2zMlzUZ3IoZ+D1IXFTlpGKbwbNwuqAzsXWwMTtxpEIhZKFZKWSV/QnhxaDTweqJ6Ood
	iHTEgPi8KC50J3HK3EKkNn0jVNpvC8z4Txch3OiI/uu0EoSOrCmWgBeDbuV2MdKDuba7Yo7jDrGHn
	cVZoDxshVShxstFipuAc08117bjtPdeg346dJoAIk+MlApFAFJe0f6HB4SrzbX+w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1wwgsp-0000000B7qc-3gFp;
	Wed, 19 Aug 2026 16:03:12 +0200
From: Benjamin Berg <benjamin@sipsolutions.net>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH wireless-next v3 1/8] wifi: iwlwifi: use link_sta internally to the driver
Date: Wed, 19 Aug 2026 15:57:05 +0200
Message-ID: <20260819155703.a3a07dd29468.I41df561f8129fac1327a07729cf4734b8752bcd6@changeid>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819135703.4072215-10-benjamin@sipsolutions.net>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_070325_093780_9C882B6A 
X-CRM114-Status: GOOD (  21.80  )
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

From: Benjamin Berg <benjamin.berg@intel.com>

Using the link_sta is a natural way to pass both the STA and the link ID
information at the same time. Use that internally to the driver in
preparation to mac80211 changing its API and adopting the same method.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/agg.c  | 17 +++----
 drivers/net/wireless/intel/iwlwifi/mld/agg.h  |  4 +-
 drivers/net/wireless/intel/iwlwifi/mld/rx.c   | 45 ++++++++++---------
 drivers/net/wireless/intel/iwlwifi/mld/rx.h   |  2 +-
 .../wireless/intel/iwlwifi/mld/tests/agg.c    |  7 +--
 5 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/agg.c b/drivers/net/wireless/intel/iwlwifi/mld/agg.c
index 96102d2af2cf..c45c47337509 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/agg.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/agg.c
@@ -7,7 +7,8 @@
 #include "hcmd.h"
 
 static void
-iwl_mld_reorder_release_frames(struct iwl_mld *mld, struct ieee80211_sta *sta,
+iwl_mld_reorder_release_frames(struct iwl_mld *mld,
+			       struct ieee80211_link_sta *link_sta,
 			       struct napi_struct *napi,
 			       struct iwl_mld_baid_data *baid_data,
 			       struct iwl_mld_reorder_buffer *reorder_buf,
@@ -32,7 +33,7 @@ iwl_mld_reorder_release_frames(struct iwl_mld *mld, struct ieee80211_sta *sta,
 		while ((skb = __skb_dequeue(skb_list))) {
 			iwl_mld_pass_packet_to_mac80211(mld, napi, skb,
 							reorder_buf->queue,
-							sta);
+							link_sta);
 			reorder_buf->num_stored--;
 		}
 	}
@@ -74,7 +75,7 @@ static void iwl_mld_release_frames_from_notif(struct iwl_mld *mld,
 
 	reorder_buf = &ba_data->reorder_buf[queue];
 
-	iwl_mld_reorder_release_frames(mld, link_sta->sta, napi, ba_data,
+	iwl_mld_reorder_release_frames(mld, link_sta, napi, ba_data,
 				       reorder_buf, nssn);
 out_unlock:
 	rcu_read_unlock();
@@ -180,7 +181,7 @@ void iwl_mld_del_ba(struct iwl_mld *mld, int queue,
 	reorder_buf = &ba_data->reorder_buf[queue];
 
 	/* release all frames that are in the reorder buffer to the stack */
-	iwl_mld_reorder_release_frames(mld, link_sta->sta, NULL,
+	iwl_mld_reorder_release_frames(mld, link_sta, NULL,
 				       ba_data, reorder_buf,
 				       ieee80211_sn_add(reorder_buf->head_sn,
 							ba_data->buf_size));
@@ -193,7 +194,7 @@ void iwl_mld_del_ba(struct iwl_mld *mld, int queue,
  */
 enum iwl_mld_reorder_result
 iwl_mld_reorder(struct iwl_mld *mld, struct napi_struct *napi,
-		int queue, struct ieee80211_sta *sta,
+		int queue, struct ieee80211_link_sta *link_sta,
 		struct sk_buff *skb, struct iwl_rx_mpdu_desc *desc)
 {
 	struct ieee80211_hdr *hdr = (void *)skb_mac_header(skb);
@@ -228,12 +229,12 @@ iwl_mld_reorder(struct iwl_mld *mld, struct napi_struct *napi,
 		return IWL_MLD_PASS_SKB;
 
 	/* no sta yet */
-	if (IWL_FW_CHECK(mld, !sta,
+	if (IWL_FW_CHECK(mld, !link_sta,
 			 "Got valid BAID without a valid station assigned - %d\n",
 			 baid))
 		return IWL_MLD_PASS_SKB;
 
-	mld_sta = iwl_mld_sta_from_mac80211(sta);
+	mld_sta = iwl_mld_sta_from_mac80211(link_sta->sta);
 
 	/* not a data packet */
 	if (!ieee80211_is_data_qos(hdr->frame_control) ||
@@ -324,7 +325,7 @@ iwl_mld_reorder(struct iwl_mld *mld, struct napi_struct *napi,
 	 * will be released when the frame release notification arrives.
 	 */
 	if (!amsdu || last_subframe)
-		iwl_mld_reorder_release_frames(mld, sta, napi, baid_data,
+		iwl_mld_reorder_release_frames(mld, link_sta, napi, baid_data,
 					       buffer, nssn);
 	else if (buffer->num_stored == 1)
 		buffer->head_sn = nssn;
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/agg.h b/drivers/net/wireless/intel/iwlwifi/mld/agg.h
index 651c80d1c7cd..c6cd5fa219be 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/agg.h
+++ b/drivers/net/wireless/intel/iwlwifi/mld/agg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
 /*
- * Copyright (C) 2024 Intel Corporation
+ * Copyright (C) 2024, 2026 Intel Corporation
  */
 #ifndef __iwl_agg_h__
 #define __iwl_agg_h__
@@ -106,7 +106,7 @@ int iwl_mld_ampdu_rx_stop(struct iwl_mld *mld, struct ieee80211_sta *sta,
 
 enum iwl_mld_reorder_result
 iwl_mld_reorder(struct iwl_mld *mld, struct napi_struct *napi,
-		int queue, struct ieee80211_sta *sta,
+		int queue, struct ieee80211_link_sta *link_sta,
 		struct sk_buff *skb, struct iwl_rx_mpdu_desc *desc);
 
 void iwl_mld_handle_frame_release_notif(struct iwl_mld *mld,
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/rx.c b/drivers/net/wireless/intel/iwlwifi/mld/rx.c
index 269439d789f4..5696a247922b 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/rx.c
@@ -47,7 +47,8 @@ iwl_mld_fill_phy_data_from_mpdu(struct iwl_mld *mld,
 }
 
 static inline int iwl_mld_check_pn(struct iwl_mld *mld, struct sk_buff *skb,
-				   int queue, struct ieee80211_sta *sta)
+				   int queue,
+				   struct ieee80211_link_sta *link_sta)
 {
 	struct ieee80211_hdr *hdr = (void *)skb_mac_header(skb);
 	struct ieee80211_rx_status *stats = IEEE80211_SKB_RXCB(skb);
@@ -71,13 +72,13 @@ static inline int iwl_mld_check_pn(struct iwl_mld *mld, struct sk_buff *skb,
 		return 0;
 
 	/* if we are here - this for sure is either CCMP or GCMP */
-	if (!sta) {
+	if (!link_sta) {
 		IWL_DEBUG_DROP(mld,
 			       "expected hw-decrypted unicast frame for station\n");
 		return -1;
 	}
 
-	mld_sta = iwl_mld_sta_from_mac80211(sta);
+	mld_sta = iwl_mld_sta_from_mac80211(link_sta->sta);
 
 	extiv = (u8 *)hdr + ieee80211_hdrlen(hdr->frame_control);
 	keyidx = extiv[3] >> 6;
@@ -119,17 +120,17 @@ static inline int iwl_mld_check_pn(struct iwl_mld *mld, struct sk_buff *skb,
 void iwl_mld_pass_packet_to_mac80211(struct iwl_mld *mld,
 				     struct napi_struct *napi,
 				     struct sk_buff *skb, int queue,
-				     struct ieee80211_sta *sta)
+				     struct ieee80211_link_sta *link_sta)
 {
 	KUNIT_STATIC_STUB_REDIRECT(iwl_mld_pass_packet_to_mac80211,
-				   mld, napi, skb, queue, sta);
+				   mld, napi, skb, queue, link_sta);
 
-	if (unlikely(iwl_mld_check_pn(mld, skb, queue, sta))) {
+	if (unlikely(iwl_mld_check_pn(mld, skb, queue, link_sta))) {
 		kfree_skb(skb);
 		return;
 	}
 
-	ieee80211_rx_napi(mld->hw, sta, skb, napi);
+	ieee80211_rx_napi(mld->hw, link_sta->sta, skb, napi);
 }
 EXPORT_SYMBOL_IF_IWLWIFI_KUNIT(iwl_mld_pass_packet_to_mac80211);
 
@@ -1728,7 +1729,7 @@ static void iwl_mld_update_last_rx_timestamp(struct iwl_mld *mld, u8 baid)
  * Sets *drop to true if the packet should be dropped.
  * Returns the station if found, or NULL otherwise.
  */
-static struct ieee80211_sta *
+static struct ieee80211_link_sta *
 iwl_mld_rx_with_sta(struct iwl_mld *mld, struct ieee80211_hdr *hdr,
 		    struct sk_buff *skb,
 		    const struct iwl_rx_mpdu_desc *mpdu_desc,
@@ -1803,10 +1804,10 @@ iwl_mld_rx_with_sta(struct iwl_mld *mld, struct ieee80211_hdr *hdr,
 							    queue);
 	}
 
-	return sta;
+	return link_sta;
 }
 
-static int iwl_mld_rx_mgmt_prot(struct ieee80211_sta *sta,
+static int iwl_mld_rx_mgmt_prot(struct ieee80211_link_sta *link_sta,
 				struct ieee80211_hdr *hdr,
 				struct ieee80211_rx_status *rx_status,
 				u32 mpdu_status,
@@ -1820,7 +1821,6 @@ static int iwl_mld_rx_mgmt_prot(struct ieee80211_sta *sta,
 	struct ieee80211_key_conf *key;
 	const u8 *frame = (void *)hdr;
 	const u8 *mmie;
-	u8 link_id;
 
 	if ((mpdu_status & IWL_RX_MPDU_STATUS_SEC_MASK) ==
 	     IWL_RX_MPDU_STATUS_SEC_NONE)
@@ -1836,10 +1836,10 @@ static int iwl_mld_rx_mgmt_prot(struct ieee80211_sta *sta,
 	if (!ieee80211_is_beacon(hdr->frame_control))
 		return 0;
 
-	if (!sta)
+	if (!link_sta)
 		return -1;
 
-	mld_sta = iwl_mld_sta_from_mac80211(sta);
+	mld_sta = iwl_mld_sta_from_mac80211(link_sta->sta);
 	mld_vif = iwl_mld_vif_from_mac80211(mld_sta->vif);
 
 	/* key mismatch - will also report !MIC_OK but we shouldn't count it */
@@ -1853,8 +1853,7 @@ static int iwl_mld_rx_mgmt_prot(struct ieee80211_sta *sta,
 		return 0;
 	}
 
-	link_id = rx_status->link_valid ? rx_status->link_id : 0;
-	link = rcu_dereference(mld_vif->link[link_id]);
+	link = rcu_dereference(mld_vif->link[link_sta->link_id]);
 	if (WARN_ON_ONCE(!link))
 		return -1;
 
@@ -1905,7 +1904,7 @@ static int iwl_mld_rx_mgmt_prot(struct ieee80211_sta *sta,
 }
 
 static int iwl_mld_rx_crypto(struct iwl_mld *mld,
-			     struct ieee80211_sta *sta,
+			     struct ieee80211_link_sta *link_sta,
 			     struct ieee80211_hdr *hdr,
 			     struct ieee80211_rx_status *rx_status,
 			     struct iwl_rx_mpdu_desc *desc, int queue,
@@ -1915,7 +1914,7 @@ static int iwl_mld_rx_crypto(struct iwl_mld *mld,
 
 	if (unlikely(ieee80211_is_mgmt(hdr->frame_control) &&
 		     !ieee80211_has_protected(hdr->frame_control)))
-		return iwl_mld_rx_mgmt_prot(sta, hdr, rx_status, status,
+		return iwl_mld_rx_mgmt_prot(link_sta, hdr, rx_status, status,
 					    le16_to_cpu(desc->mpdu_len));
 
 	if (!ieee80211_has_protected(hdr->frame_control) ||
@@ -2023,7 +2022,7 @@ void iwl_mld_rx_mpdu(struct iwl_mld *mld, struct napi_struct *napi,
 	struct iwl_rx_packet *pkt = rxb_addr(rxb);
 	struct iwl_mld_rx_phy_data phy_data = {};
 	struct iwl_rx_mpdu_desc *mpdu_desc = (void *)pkt->data;
-	struct ieee80211_sta *sta;
+	struct ieee80211_link_sta *link_sta;
 	struct ieee80211_hdr *hdr;
 	struct sk_buff *skb;
 	size_t mpdu_desc_size = sizeof(*mpdu_desc);
@@ -2086,7 +2085,8 @@ void iwl_mld_rx_mpdu(struct iwl_mld *mld, struct napi_struct *napi,
 
 	rcu_read_lock();
 
-	sta = iwl_mld_rx_with_sta(mld, hdr, skb, mpdu_desc, pkt, queue, &drop);
+	link_sta = iwl_mld_rx_with_sta(mld, hdr, skb, mpdu_desc, pkt, queue,
+				       &drop);
 	if (drop)
 		goto drop;
 
@@ -2127,7 +2127,7 @@ void iwl_mld_rx_mpdu(struct iwl_mld *mld, struct napi_struct *napi,
 
 	iwl_mld_rx_fill_status(mld, link_id, hdr, skb, &phy_data);
 
-	if (iwl_mld_rx_crypto(mld, sta, hdr, rx_status, mpdu_desc, queue,
+	if (iwl_mld_rx_crypto(mld, link_sta, hdr, rx_status, mpdu_desc, queue,
 			      le32_to_cpu(pkt->len_n_flags), &crypto_len))
 		goto drop;
 
@@ -2140,7 +2140,8 @@ void iwl_mld_rx_mpdu(struct iwl_mld *mld, struct napi_struct *napi,
 	if (iwl_mld_time_sync_frame(mld, skb, hdr->addr2))
 		goto out;
 
-	reorder_res = iwl_mld_reorder(mld, napi, queue, sta, skb, mpdu_desc);
+	reorder_res = iwl_mld_reorder(mld, napi, queue, link_sta, skb,
+				      mpdu_desc);
 	switch (reorder_res) {
 	case IWL_MLD_PASS_SKB:
 		break;
@@ -2153,7 +2154,7 @@ void iwl_mld_rx_mpdu(struct iwl_mld *mld, struct napi_struct *napi,
 		goto drop;
 	}
 
-	iwl_mld_pass_packet_to_mac80211(mld, napi, skb, queue, sta);
+	iwl_mld_pass_packet_to_mac80211(mld, napi, skb, queue, link_sta);
 
 	goto out;
 
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/rx.h b/drivers/net/wireless/intel/iwlwifi/mld/rx.h
index 573b89c3c9c6..b08c5ade3db8 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/rx.h
+++ b/drivers/net/wireless/intel/iwlwifi/mld/rx.h
@@ -69,7 +69,7 @@ void iwl_mld_handle_rsc_notif(struct iwl_mld *mld,
 void iwl_mld_pass_packet_to_mac80211(struct iwl_mld *mld,
 				     struct napi_struct *napi,
 				     struct sk_buff *skb, int queue,
-				     struct ieee80211_sta *sta);
+				     struct ieee80211_link_sta *link_sta);
 
 void iwl_mld_handle_phy_air_sniffer_notif(struct iwl_mld *mld,
 					  struct napi_struct *napi,
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/tests/agg.c b/drivers/net/wireless/intel/iwlwifi/mld/tests/agg.c
index 29b0248cec3d..e9efe2996f07 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/tests/agg.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/tests/agg.c
@@ -2,7 +2,7 @@
 /*
  * KUnit tests for channel helper functions
  *
- * Copyright (C) 2024-2025 Intel Corporation
+ * Copyright (C) 2024-2026 Intel Corporation
  */
 #include <kunit/test.h>
 #include <kunit/static_stub.h>
@@ -441,7 +441,7 @@ static void
 fake_iwl_mld_pass_packet_to_mac80211(struct iwl_mld *mld,
 				     struct napi_struct *napi,
 				     struct sk_buff *skb, int queue,
-				     struct ieee80211_sta *sta)
+				     struct ieee80211_link_sta *link_sta)
 {
 	__skb_queue_tail(&g_released_skbs, skb);
 	g_num_released_skbs++;
@@ -630,7 +630,8 @@ static void test_reorder_buffer(struct kunit *test)
 	mpdu_desc = setup_mpdu_desc();
 
 	rcu_read_lock();
-	reorder_res = iwl_mld_reorder(mld, NULL, QUEUE, sta, skb, mpdu_desc);
+	reorder_res = iwl_mld_reorder(mld, NULL, QUEUE, &sta->deflink, skb,
+				      mpdu_desc);
 	rcu_read_unlock();
 
 	KUNIT_ASSERT_EQ(test, reorder_res, param->expected.reorder_res);
-- 
2.55.0



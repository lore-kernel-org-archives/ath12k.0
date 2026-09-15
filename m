Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A80AC982C4
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lr5yKwQyReCmI5WY68mGpXRsIWqGVg0b/ORUTt/uYZA=; b=fBMBSLEp9drlZ5CHVUldbebzVk
	TxcKsdL1kMDBmVHtd7sRuFbDFXpWB+9j6C+SNjF45UFGdgOV+mA1XyKdr07v+jHb60nvHq4W4lVdq
	56j8GxMJSmm9PRWw2NIaStegLIYOSTaZdVdbKRQukIDjK+qLejucC6Zz24EkVCI0VxqN/UOhH+WHC
	EHqTb5H8p96AGQ1pU8Bms0979hv0LO7XT5Eu3Hipb2HJQqz2aedvxM3tbzLfL+WzTWvOikQEBJnke
	yRbmBieghgOoDyMMJZzcGmLkkPO6mgmK4vXRW4yeYU64LiNvxaL17KwVnA3ONUhIGOZPZBGNim+KH
	zfvTqfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T6y-00000006hJB-42iZ;
	Tue, 15 Sep 2026 13:22:12 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T6v-00000006hFf-2rIl;
	Tue, 15 Sep 2026 13:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=lr5yKwQyReCmI5WY68mGpXRsIWqGVg0b/ORUTt/uYZA=;
	t=1789478529; x=1790688129; b=ikjavPaFYrLPZNBaIkdJ6+0mmWwTOT5uikbOfrgUcYcpU0B
	TUiZ82VAtZDpoOn9Oh3XcP2Hb9iekAlVPOyTP77F/U5ubEfeKvCkui9ji2ryhDToBrTA65moLbKcq
	L94rw/X5cFAaQttoG6ChC0BbUXauDNIkmzRdSaJZPUBlheiEk3YujOOcm36fRIvLKJc6QKjYAYH8j
	pZtIEnp359tKBB8MMl8ZdwEjOQkHmc3AbZgaqD8ThuQftMXEax7nWfaki7twgtxprODQtiSAc1Afi
	UrRg0NLnRsZ5zCxNeSAmFAvXZBW9ZSOAJCQJ6pImXYtfq/RV+r8d9GSH0/t4m0fA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1x6T6m-0000000H08V-2pd1;
	Tue, 15 Sep 2026 15:22:00 +0200
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
Subject: [PATCH wireless-next v4 7/8] wifi: mac80211: pass station to ieee80211_tx_skb_tid
Date: Tue, 15 Sep 2026 15:19:33 +0200
Message-ID: <20260915151925.759b6144ddf9.Ib7be90db0d3712d14e7a292023ff3d922baef860@changeid>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915131925.1780764-10-benjamin@sipsolutions.net>
References: <20260915131925.1780764-10-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_062209_880903_92B4C8BD 
X-CRM114-Status: GOOD (  14.57  )
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

The station may be relevant for queuing and will also generally be
resolved in some cases. However, we want to be able to prevent looking
up the station based on the address.

Add a station parameter, which can be set to the correct station, to an
error value to prevent station lookup or to NULL to get the old
behaviour where the address is used to find the appropriate station.

Also disable the station lookup for ieee80211_tx_skb_tid_band already as
it does not make any sense to find a station when doing an off-channel
transmit.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
---
 net/mac80211/agg-tx.c      |  4 ++--
 net/mac80211/ht.c          |  2 +-
 net/mac80211/ieee80211_i.h | 11 +++++++----
 net/mac80211/offchannel.c  |  2 +-
 net/mac80211/rx.c          |  2 +-
 net/mac80211/tdls.c        |  2 +-
 net/mac80211/tx.c          | 10 ++++++----
 7 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/net/mac80211/agg-tx.c b/net/mac80211/agg-tx.c
index 0832213430f4..ce9fb19d8c18 100644
--- a/net/mac80211/agg-tx.c
+++ b/net/mac80211/agg-tx.c
@@ -98,7 +98,7 @@ static void ieee80211_send_addba_request(struct sta_info *sta, u16 tid,
 	if (sta->sta.deflink.he_cap.has_he)
 		ieee80211_add_addbaext(skb, 0, agg_size);
 
-	ieee80211_tx_skb_tid(sdata, skb, tid, -1);
+	ieee80211_tx_skb_tid(sdata, skb, NULL, tid, -1);
 }
 
 void ieee80211_send_bar(struct ieee80211_vif *vif, u8 *ra, u16 tid, u16 ssn)
@@ -127,7 +127,7 @@ void ieee80211_send_bar(struct ieee80211_vif *vif, u8 *ra, u16 tid, u16 ssn)
 
 	IEEE80211_SKB_CB(skb)->flags |= IEEE80211_TX_INTFL_DONT_ENCRYPT |
 					IEEE80211_TX_CTL_REQ_TX_STATUS;
-	ieee80211_tx_skb_tid(sdata, skb, tid, -1);
+	ieee80211_tx_skb_tid(sdata, skb, NULL, tid, -1);
 }
 EXPORT_SYMBOL(ieee80211_send_bar);
 
diff --git a/net/mac80211/ht.c b/net/mac80211/ht.c
index e1e1b7f82f3f..c5c2113fa4f7 100644
--- a/net/mac80211/ht.c
+++ b/net/mac80211/ht.c
@@ -545,7 +545,7 @@ int ieee80211_send_smps_action(struct ieee80211_sub_if_data *sdata,
 	info->status_data = IEEE80211_STATUS_TYPE_SMPS |
 			    u16_encode_bits(status_link_id << 2 | smps,
 					    IEEE80211_STATUS_SUBDATA_MASK);
-	ieee80211_tx_skb_tid(sdata, skb, 7, link_id);
+	ieee80211_tx_skb_tid(sdata, skb, NULL, 7, link_id);
 
 	return 0;
 }
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 65311340db40..9514f01778be 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2471,7 +2471,8 @@ void ieee80211_xmit(struct ieee80211_sub_if_data *sdata,
 		    struct sta_info *sta, struct sk_buff *skb);
 
 void __ieee80211_tx_skb_tid_band(struct ieee80211_sub_if_data *sdata,
-				 struct sk_buff *skb, int tid, int link_id,
+				 struct sk_buff *skb, struct sta_info *sta,
+				 int tid, int link_id,
 				 enum nl80211_band band);
 
 static inline bool ieee80211_require_encrypted_assoc(__le16 fc,
@@ -2486,18 +2487,20 @@ ieee80211_tx_skb_tid_band(struct ieee80211_sub_if_data *sdata,
 			  enum nl80211_band band)
 {
 	rcu_read_lock();
-	__ieee80211_tx_skb_tid_band(sdata, skb, tid, -1, band);
+	__ieee80211_tx_skb_tid_band(sdata, skb, ERR_PTR(-ENOENT),
+				    tid, -1, band);
 	rcu_read_unlock();
 }
 
 void ieee80211_tx_skb_tid(struct ieee80211_sub_if_data *sdata,
-			  struct sk_buff *skb, int tid, int link_id);
+			  struct sk_buff *skb, struct sta_info *sta,
+			  int tid, int link_id);
 
 static inline void ieee80211_tx_skb(struct ieee80211_sub_if_data *sdata,
 				    struct sk_buff *skb)
 {
 	/* Send all internal mgmt frames on VO. Accordingly set TID to 7. */
-	ieee80211_tx_skb_tid(sdata, skb, 7, -1);
+	ieee80211_tx_skb_tid(sdata, skb, NULL, 7, -1);
 }
 
 /**
diff --git a/net/mac80211/offchannel.c b/net/mac80211/offchannel.c
index 7acef80d5f1f..5cec8747b193 100644
--- a/net/mac80211/offchannel.c
+++ b/net/mac80211/offchannel.c
@@ -1022,7 +1022,7 @@ int ieee80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	}
 
 	if (!need_offchan) {
-		ieee80211_tx_skb_tid(sdata, skb, 7, link_id);
+		ieee80211_tx_skb_tid(sdata, skb, NULL, 7, link_id);
 		ret = 0;
 		goto out_unlock;
 	}
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 6c823678d099..d6755a4c7d3c 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -4106,7 +4106,7 @@ ieee80211_rx_h_action_return(struct ieee80211_rx_data *rx)
 					local->hw.offchannel_tx_hw_queue;
 		}
 
-		__ieee80211_tx_skb_tid_band(rx->sdata, nskb, 7, -1,
+		__ieee80211_tx_skb_tid_band(rx->sdata, nskb, rx->sta, 7, -1,
 					    status->band);
 	}
 
diff --git a/net/mac80211/tdls.c b/net/mac80211/tdls.c
index 4f4cae9fd274..7ec33885a3e1 100644
--- a/net/mac80211/tdls.c
+++ b/net/mac80211/tdls.c
@@ -1066,7 +1066,7 @@ ieee80211_tdls_prep_mgmt_packet(struct wiphy *wiphy, struct net_device *dev,
 	}
 
 	if (action_code == WLAN_PUB_ACTION_TDLS_DISCOVER_RES) {
-		ieee80211_tx_skb_tid(sdata, skb, 7, link_id);
+		ieee80211_tx_skb_tid(sdata, skb, sta, 7, link_id);
 		return 0;
 	}
 
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 06c50183f064..73affc540f0c 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -6448,7 +6448,8 @@ void ieee80211_unreserve_tid(struct ieee80211_sta *pubsta, u8 tid)
 EXPORT_SYMBOL(ieee80211_unreserve_tid);
 
 void __ieee80211_tx_skb_tid_band(struct ieee80211_sub_if_data *sdata,
-				 struct sk_buff *skb, int tid, int link_id,
+				 struct sk_buff *skb, struct sta_info *sta,
+				 int tid, int link_id,
 				 enum nl80211_band band)
 {
 	const struct ieee80211_hdr *hdr = (void *)skb->data;
@@ -6500,12 +6501,13 @@ void __ieee80211_tx_skb_tid_band(struct ieee80211_sub_if_data *sdata,
 	 */
 	local_bh_disable();
 	IEEE80211_SKB_CB(skb)->band = band;
-	ieee80211_xmit(sdata, NULL, skb);
+	ieee80211_xmit(sdata, sta, skb);
 	local_bh_enable();
 }
 
 void ieee80211_tx_skb_tid(struct ieee80211_sub_if_data *sdata,
-			  struct sk_buff *skb, int tid, int link_id)
+			  struct sk_buff *skb, struct sta_info *sta,
+			  int tid, int link_id)
 {
 	struct ieee80211_chanctx_conf *chanctx_conf;
 	enum nl80211_band band;
@@ -6531,7 +6533,7 @@ void ieee80211_tx_skb_tid(struct ieee80211_sub_if_data *sdata,
 		band = 0;
 	}
 
-	__ieee80211_tx_skb_tid_band(sdata, skb, tid, link_id, band);
+	__ieee80211_tx_skb_tid_band(sdata, skb, sta, tid, link_id, band);
 	rcu_read_unlock();
 }
 
-- 
2.55.0



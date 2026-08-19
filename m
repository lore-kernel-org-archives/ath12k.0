Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501B6C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+Vp7Hj45ZQKaNArf4gq+RTJIat+1z6IOv9TIUEaawI=; b=c95KQDDcyl2o9ukg9aTEVDCJXG
	dX10P49jmyi057Y+SQcb6QdTm+xHurSlvPMR8m4hsvUzwlgRC/K5hB5armg7DZQf89D6CMKyfS2Ml
	xqD5ZvfMUMhJtTplBW48HDEMWwQ0uutLhzT0WkzM6sH41HzXBecPSXkDKkYS9bZ3N5TTRoKsjTi/V
	8LWCNlw2R9KOopabcWgoxgvULYHlR6vnOr/X/LQQOvUA+QtyR0uWcpqvF8/qY6x40hOfTdqPJXcOE
	+NjvBsOWutzXIaepNVQXSoM3RXR/MVe1MomVrQLJtSOMhULBUsJdjdPHQPU4zhlBT8iZVKHQufcjt
	K3dN+xOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfbi-00000009lSB-3fNW;
	Wed, 19 Aug 2026 12:41:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfbd-00000009lM6-3Ikc;
	Wed, 19 Aug 2026 12:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=M+Vp7Hj45ZQKaNArf4gq+RTJIat+1z6IOv9TIUEaawI=;
	t=1787143281; x=1788352881; b=GQvkcYcf3v+Nboj97VmAiZyR3BngmQzICFiPA3dpOgYiV1p
	cVWjLL260V4OFcYAGvkRjOVnDLk0CTB8H4a+15lBtv4mHjHEkhCtmdQQNPG1USMJRUmPqUhAfab0p
	JzstywahY/yD2PKZc3yLEEgZObgUrsqKm3xXKT3uXKD+vgni6giOw9Z4bPTotOmFLg73MD67TqT/Q
	IWt2TK2i9dCUqbyi1pTdTR8lrIaJoTTYj9uqmzJd69WJLwdfkV3ZvP1rtDHcH0yV5X0uAqcdLVEsV
	hQiDmK/RhjgJ8yHy45Bdmb6LRDm6aM+YbYWBWn8DvfMIrR0LTpNAhovChvZ483RQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1wwfbG-000000089Cs-3fvw;
	Wed, 19 Aug 2026 14:40:59 +0200
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
Subject: [wireless-next PATCH v2 4/8] wifi: mac80211: rework RX packet handling
Date: Wed, 19 Aug 2026 14:39:03 +0200
Message-ID: <20260819143858.1e179ba508f9.Ie12ec077142c6a7fdbb58cdfc5660497cc75150e@changeid>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819123858.4025935-10-benjamin@sipsolutions.net>
References: <20260819123858.4025935-10-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_054122_012984_879AFB44 
X-CRM114-Status: GOOD (  27.33  )
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

The code has grown over time and it was not correctly handling all
cases. Examples of issues are that for management frames we would match
the received address against the MLD address even though we should not
resolve the station in that case. Another issue was that for data frames
we would not correctly fall back to use link addresses when the driver
does not provide the pubsta already.

The new code still uses the same approach as before. For data frames,
assume that a valid station exists and interfaces do not need to be
iterated. On the other hand, for non-data frames (or if a data frame
without a station is received) all interfaces must be iterated.

Note that this rework makes mac80211 slightly more strict. For example,
previously mac80211 would have incorrectly accepted a data frame that
was transmitted on the wrong link.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>

---

v1:
 * Handle NAN_DATA interface type
 * Fix missing variable initialization in loop
---
 net/mac80211/rx.c | 291 +++++++++++++++++++++++++++-------------------
 1 file changed, 171 insertions(+), 120 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index b654b2d57f15..f9e8c5ec7e1e 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -4318,9 +4318,33 @@ static bool
 ieee80211_rx_is_valid_sta_link_id(struct ieee80211_sta *sta, u8 link_id)
 {
 	if (sta->mlo)
-		return !!(sta->valid_links & BIT(link_id));
-	else
-		return sta->deflink.link_id == link_id;
+		return sta->valid_links & BIT(link_id);
+
+	return sta->deflink.link_id == link_id;
+}
+
+static bool ieee80211_rx_data_set_link_sta(struct ieee80211_rx_data *rx,
+					   struct link_sta_info *link_sta)
+{
+	struct sta_info *sta;
+
+	if (WARN_ON_ONCE(!link_sta) ||
+	    !ieee80211_rx_is_valid_sta_link_id(&link_sta->sta->sta,
+					       link_sta->link_id))
+		return false;
+
+	sta = link_sta->sta;
+
+	rx->sta = sta;
+	rx->local = sta->sdata->local;
+	rx->link = rcu_dereference(sta->sdata->link[link_sta->link_id]);
+	if (!rx->link)
+		return false;
+
+	rx->link_id = rx->link->link_id;
+	rx->link_sta = link_sta;
+
+	return true;
 }
 
 static bool ieee80211_rx_data_set_link(struct ieee80211_rx_data *rx,
@@ -5296,60 +5320,19 @@ static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 	dev_kfree_skb(skb);
 }
 
-static bool ieee80211_rx_for_interface(struct ieee80211_rx_data *rx,
-				       struct sk_buff *skb, bool consume)
+static bool ieee80211_rx_valid_freq(int freq, struct ieee80211_link_data *link)
 {
-	struct link_sta_info *link_sta;
-	struct ieee80211_hdr *hdr = (void *)skb->data;
-	struct sta_info *sta;
-	int link_id = -1;
-
-	if (ieee80211_is_s1g_beacon(hdr->frame_control)) {
-		if (!ieee80211_rx_data_set_sta(rx, NULL, -1))
-			return false;
-
-		return ieee80211_prepare_and_rx_handle(rx, skb, consume);
-	}
-
-	/*
-	 * FIXME: Here we can assume that link addresses have not
-	 * been translated.
-	 *
-	 * Look up link station first, in case there's a
-	 * chance that they might have a link address that
-	 * is identical to the MLD address, that way we'll
-	 * have the link information if needed.
-	 */
-	link_sta = link_sta_info_get_bss(rx->sdata, hdr->addr2);
-	if (link_sta) {
-		sta = link_sta->sta;
-		link_id = link_sta->link_id;
-	} else {
-		struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
-
-		sta = sta_info_get_bss(rx->sdata, hdr->addr2);
-		if (ieee80211_vif_is_mld(&rx->sdata->vif) &&
-		    status->freq) {
-			struct ieee80211_link_data *link;
-			struct ieee80211_chanctx_conf *conf;
-
-			for_each_link_data_rcu(rx->sdata, link) {
-				conf = rcu_dereference(link->conf->chanctx_conf);
-				if (!conf || !conf->def.chan)
-					continue;
+	struct ieee80211_chanctx_conf *conf;
 
-				if (status->freq == conf->def.chan->center_freq) {
-					link_id = link->link_id;
-					break;
-				}
-			}
-		}
-	}
+	if (!freq || link->sdata->vif.type == NL80211_IFTYPE_NAN ||
+	    link->sdata->vif.type == NL80211_IFTYPE_NAN_DATA)
+		return true;
 
-	if (!ieee80211_rx_data_set_sta(rx, sta, link_id))
+	conf = rcu_dereference(link->conf->chanctx_conf);
+	if (!conf || !conf->def.chan)
 		return false;
 
-	return ieee80211_prepare_and_rx_handle(rx, skb, consume);
+	return freq == conf->def.chan->center_freq;
 }
 
 /*
@@ -5363,11 +5346,14 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 {
 	struct ieee80211_local *local = hw_to_local(hw);
 	struct ieee80211_sub_if_data *sdata;
+	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_hdr *hdr;
+	struct link_sta_info *link_sta;
+	struct sta_info *sta;
 	__le16 fc;
 	struct ieee80211_rx_data rx;
-	struct ieee80211_sub_if_data *prev;
 	struct rhlist_head *tmp;
+	bool rx_data_pending;
 	int err = 0;
 
 	fc = ((struct ieee80211_hdr *)skb->data)->frame_control;
@@ -5414,92 +5400,102 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 		     ieee80211_is_s1g_beacon(hdr->frame_control)))
 		ieee80211_scan_rx(local, skb);
 
+	/*
+	 * RX of a data frame should only happen to existing stations.
+	 * It is therefore more efficient to use the one provided by the driver
+	 * or search based on the station's address.
+	 *
+	 * Note we will fall through and handle a spurious data frame in the
+	 * same way as a management frame.
+	 */
 	if (ieee80211_is_data(fc)) {
-		struct sta_info *sta, *prev_sta;
-
 		if (link_pubsta) {
-			sta = container_of(link_pubsta->sta,
-					   struct sta_info, sta);
-			if (!ieee80211_rx_data_set_sta(&rx, sta,
-						       link_pubsta->link_id))
-				goto out;
+			sta = container_of(link_pubsta->sta, struct sta_info,
+					   sta);
+			link_sta = rcu_dereference(sta->link[link_pubsta->link_id]);
 
-			if (ieee80211_prepare_and_rx_handle(&rx, skb, true))
+			rx.sdata = sta->sdata;
+			if (ieee80211_rx_data_set_link_sta(&rx, link_sta) &&
+			    ieee80211_prepare_and_rx_handle(&rx, skb, true))
 				return;
+
 			goto out;
 		}
 
-		prev_sta = NULL;
+		rx_data_pending = false;
 
+		/* Search for stations on non-MLD interfaces */
 		for_each_sta_info(local, hdr->addr2, sta, tmp) {
-			int link_id;
+			struct ieee80211_link_data *link;
 
-			if (!prev_sta) {
-				prev_sta = sta;
+			if (ieee80211_vif_is_mld(&sta->sdata->vif))
 				continue;
-			}
 
-			rx.sdata = prev_sta->sdata;
-
-			/*
-			 * FIXME: This is not correct as the addr2 cannot be a
-			 * link address if the loop itself is iterated.
-			 */
-			if (prev_sta->sta.mlo) {
-				struct link_sta_info *link_sta;
-
-				link_sta = link_sta_info_get_bss(rx.sdata,
-								 hdr->addr2);
-				if (!link_sta)
-					continue;
+			link = &sta->sdata->deflink;
+			if (!ieee80211_rx_valid_freq(status->freq, link))
+				continue;
 
-				link_id = link_sta->link_id;
-			} else {
-				link_id = sta->deflink.link_id;
+			if (rx_data_pending) {
+				ieee80211_prepare_and_rx_handle(&rx, skb,
+								false);
+				rx_data_pending = false;
 			}
 
-			if (!ieee80211_rx_data_set_sta(&rx, prev_sta, link_id))
-				goto out;
-
-			ieee80211_prepare_and_rx_handle(&rx, skb, false);
+			rx.sdata = sta->sdata;
+			if (!ieee80211_rx_data_set_link_sta(&rx, &sta->deflink))
+				continue;
 
-			prev_sta = sta;
+			rx_data_pending = true;
 		}
 
-		if (prev_sta) {
-			int link_id;
-
-			rx.sdata = prev_sta->sdata;
+		/* And search stations on MLD interfaces */
+		for_each_link_sta_info(local, hdr->addr2, link_sta, tmp) {
+			struct ieee80211_link_data *link;
 
-			/*
-			 * FIXME: This is not correct as the addr2 cannot be a
-			 * link address if the loop itself is iterated.
-			 */
-			if (prev_sta->sta.mlo) {
-				struct link_sta_info *link_sta;
+			sta = link_sta->sta;
+			sdata =	sta->sdata;
+			link = rcu_dereference(sdata->link[link_sta->link_id]);
 
-				link_sta = link_sta_info_get_bss(rx.sdata,
-								 hdr->addr2);
-				if (!link_sta)
-					goto out;
+			if (!ieee80211_rx_valid_freq(status->freq, link))
+				continue;
 
-				link_id = link_sta->link_id;
-			} else {
-				link_id = sta->deflink.link_id;
+			if (rx_data_pending) {
+				ieee80211_prepare_and_rx_handle(&rx, skb,
+								false);
+				rx_data_pending = false;
 			}
 
-			if (!ieee80211_rx_data_set_sta(&rx, prev_sta, link_id))
-				goto out;
+			rx.sdata = sta->sdata;
+			if (!ieee80211_rx_data_set_link_sta(&rx, link_sta))
+				continue;
 
+			rx_data_pending = true;
+		}
+
+		if (rx_data_pending) {
 			if (ieee80211_prepare_and_rx_handle(&rx, skb, true))
 				return;
+
 			goto out;
 		}
+
+		/* fall through, e.g. for spurious frame notification */
 	}
 
-	prev = NULL;
+	/*
+	 * This is a management frame (or a data frame without a station) and
+	 * it will be delivered independent of whether a station exists,
+	 * so iterate the interfaces.
+	 */
+	rx_data_pending = false;
+
+	/* We expect the driver to provide frequency information */
+	if (WARN_ON_ONCE(!local->emulate_chanctx && !status->freq))
+		goto out;
 
 	list_for_each_entry_rcu(sdata, &local->interfaces, list) {
+		struct ieee80211_link_data *link = NULL;
+
 		if (!ieee80211_sdata_running(sdata))
 			continue;
 
@@ -5507,30 +5503,85 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 		    sdata->vif.type == NL80211_IFTYPE_AP_VLAN)
 			continue;
 
+		link_sta = NULL;
+		link = NULL;
+
+		/* Try to resolve the station */
+		if (!ieee80211_vif_is_mld(&sdata->vif)) {
+			sta = sta_info_get_bss(sdata, hdr->addr2);
+
+			if (sta) {
+				link_sta = &sta->deflink;
+				link = &sdata->deflink;
+			}
+		} else {
+			link_sta = link_sta_info_get_bss(sdata, hdr->addr2);
+
+			if (link_sta)
+				link = rcu_dereference(sdata->link[link_sta->link_id]);
+		}
+
 		/*
-		 * frame is destined for this interface, but if it's
-		 * not also for the previous one we handle that after
-		 * the loop to avoid copying the SKB once too much
+		 * If we found a STA and it has a valid link information, then
+		 * RX using the station.
 		 */
+		if (link_sta && link &&
+		    ieee80211_rx_valid_freq(status->freq, link)) {
+			if (rx_data_pending) {
+				ieee80211_prepare_and_rx_handle(&rx, skb, false);
+				rx_data_pending = false;
+			}
+
+			/* No valid_links check as we need to RX beacons */
+
+			rx.sdata = sdata;
+			if (ieee80211_rx_data_set_link_sta(&rx, link_sta))
+				rx_data_pending = true;
 
-		if (!prev) {
-			prev = sdata;
 			continue;
 		}
 
-		rx.sdata = prev;
-		ieee80211_rx_for_interface(&rx, skb, false);
+		/* No station, try to resolve the link and RX */
+		if (ieee80211_vif_is_mld(&sdata->vif)) {
+			struct ieee80211_chanctx_conf *conf;
+			bool found = false;
 
-		prev = sdata;
-	}
+			for_each_link_data_rcu(sdata, link) {
+				conf = rcu_dereference(link->conf->chanctx_conf);
+				if (!conf || !conf->def.chan)
+					continue;
 
-	if (prev) {
-		rx.sdata = prev;
+				if (status->freq == conf->def.chan->center_freq) {
+					found = true;
+					break;
+				}
+			}
 
-		if (ieee80211_rx_for_interface(&rx, skb, true))
-			return;
+			if (!found)
+				link = &sdata->deflink;
+		} else {
+			link = &sdata->deflink;
+		}
+
+		if (rx_data_pending) {
+			ieee80211_prepare_and_rx_handle(&rx, skb, false);
+			rx_data_pending = false;
+		}
+
+		rx.sdata = sdata;
+		rx.local = sdata->local;
+		rx.link = link;
+		rx.link_id = link->link_id;
+		rx.sta = NULL;
+		rx.link_sta = NULL;
+
+		rx_data_pending = true;
 	}
 
+	if (rx_data_pending &&
+	    ieee80211_prepare_and_rx_handle(&rx, skb, true))
+		return;
+
  out:
 	dev_kfree_skb(skb);
 }
-- 
2.55.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA0606A684
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lWVdxn1I;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oUfOY7jV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4ZlGoxzkJ56obQ814E/Ir1w79qAWdvvGnANYyfIPvJU=; b=lWVdxn1I1TvfX/
	kGZaKZn441zjrRVu0Cvu7UqK9swyV9tO9hnavktCoayeX+VJErhyChPFTl1ALHctCGUpr2razPxJk
	EwB6dY2WKvA5f4dXOcsWlH1zL2yAgCoi8KMNe/+7LMV1RdA1sNBR3YiqMZWgEs0UZhWmheKVwB4Bh
	pAXBO4+oyiA3YaatEWCQP2SBkViHkGY7sbB+5qNmRsRUjTAdXEaZdQybt6vIaem9khB1mKsoTHlbY
	wz5ns28Nkfe9Ndur0OT59Htc/TQdszlisc0Otq16FQ0rQMt4av3pWqSPdGxo8zWHWYTYDCzcZ6Jan
	jRyltwXHM9uC0X1foiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtq-00000000wQj-14bW;
	Sat, 28 Nov 2026 16:03:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtm-00000000wJd-0bmP
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c506a231b88so1198075966b.3
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881816; x=1796486616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZlGoxzkJ56obQ814E/Ir1w79qAWdvvGnANYyfIPvJU=;
        b=oUfOY7jVF9SfzAFFs/Wr4iuQzMS5LVErUjHyVyM8Rc7Fa0qgqVhlmpAoRq/DXiaduy
         DVyTqGg0kPPBNA4VPOVuUyvO5cIY3JGEpaIWR7qmCVy5Yq5El97jyDv8zC0DbjHFDkzr
         u3QTwceiy2czrFHW7m3NqOFqfodhreOgx+Y8FdFPdBSbuz/I39YANwkcVXlxsi/Ean6s
         UEGYSgSAoFPvGuYg4FXByixbmNTJ/6XUPXrJdtXAVma33LSNa7fem/F/knIe8icE/53P
         m0pIMX7Idz3mZi52QkUXpZR2p5vqw+lwioRGoBOoOJ8nbwN/2Ly2NPUJzTn8HQOVSqkK
         w/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881816; x=1796486616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZlGoxzkJ56obQ814E/Ir1w79qAWdvvGnANYyfIPvJU=;
        b=01fzQI8mQFMH7Iy4G/vGIgU4aET+br9QrD98PF/Bf942wzemIPIvciXpghSW6GtGmR
         w1I3h3C19/iLT4C/Y6fVLf6sRo0UH+jffjtvZlwWO3rX1/qLtyCxzmDV7Pzp1JU11LxN
         LAVjzmVpry1j6loAlrUpgNYTV0T/bVirN1gov5OE6XCwFWNs6a7Ri+0OD3pCE0Q5lIIZ
         5Nvyu6HoGE2Y0SogQh2Jn5KoCp5QnDzyR+TZrAk55kdcKnC76ghHxQwDFivDlgNEaNph
         oECBji+iH3Sz3S2ZRs4YccT99qJ6rHXH2PS6AmxcnACRHbq7SovpKARH11+GRS+gAQwn
         ZZyA==
X-Forwarded-Encrypted: i=1; AL+hErHx2nF0rj4ExL1okGmU/pl11F1hWrHlR/OPdza1P2caWGOEfe/HsLJNZjG0nxydW2g+QqTuOE8=@lists.infradead.org
X-Gm-Message-State: APuU4Z+MCWnPtfe6Jj6jBv2oUIHLv5kyhX7Bbqek2Z/O/+gqb7pTirVn
	OiJ33xAZUa10dOEYlBBFsUIrAc+7Aqy+f/2gYg/fAK3jMSsMGUxx+7j1/tBuvEqJ/w==
X-Gm-Gg: AZFdTZcOORfUEGI1ep6T7bc3ugrl7ld5HIeQH7TQwsfB8FwGW9M3rphbOg+Xihb4MgR
	YJDUP8NyW0RcLqRe2/Zpc6D8H/iLmaWdGg60n54ZtbDUUq/rOxZjIlJyMYkSmEsYOrNQ+/sEkZf
	bZuimLdb4aC3JUYnAXv8MMwrT3DEdJ7vkkcIJhKt+irQTTwdRYLWJMIbhCAwRpCkuJPoO0vqNfV
	J+9Ca+1mSAROvrfam4g9WU0/9OPHILAOu87XB+AjwfF23WmEOk84WQ2QMuvYSABzaNEYr4GX7DV
	zmfrz9LRY2s7M1GgC3xdIiUXlvmehIrYDwT/NDGhIevsg8m5kvJN71vti+mxXaJWW+k6M4Agm35
	m+VZ70hCRoF3dFN+krkWHhwj/dhWSOY/TsTg6TIznwjjVi2mLq0fWuY2zAdwMs+8qdUUjBrbprL
	iDB25ViZiI3rO8hetGCXPmPwoRnhloJaokxJijqGm8r2YPUxEZVPo6Vk5F7dHYSkillM4tn6v1Z
	PTtF+zOd3TOhC6WpaKzg7Ys3i0m7+lm9MXHSdKlncvU9pc8vo6NFe0iOwgyl633WLrrsZWa49ts
	agNgQ9yGi343YblRBeo59ZbWDEtRJbBt+JDPxmhtR0MMT96hvpQRBXOkMm9L0Vrw8wnUf6NFoLw
	vq49MQZGLQCTFSdvY5pbCKxHImTbj6ObUi8saYTN5ByQ0n6HwC1mb+3ovkHSr3NKRxQ1PS4jw+l
	aMH82r6Zwtkixy3IOo2McP1M1x77Wva+DWHJNHhVYLk0Z65DT9hOu66EITN9G3WVQKo+ueNynLV
	yZheWCIlFdI8PvybdpK5MpbF7nwj/HQkwvXEltpMmNvozf4N0G3F9HQ/YSwDwsSy65jmHsDbbfm
	TlJSErEknEsxMQ==
X-Received: by 2002:a17:907:3f1b:b0:c51:5547:1771 with SMTP id a640c23a62f3a-c5155471892mr2060807566b.13.1795881816381;
        Sat, 28 Nov 2026 08:03:36 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:36 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 4/7] wifi: mac80211: advertise TSO and SG for encap offloaded frames
Date: Sat, 28 Nov 2026 17:03:32 +0100
Message-ID: <20261128160335.1815537-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080338_291618_5A5FABE1 
X-CRM114-Status: GOOD (  27.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A driver whose hardware segments TCP frames and takes frames with
fragments on its 802.3 encap path cannot say so. hw->netdev_features
applies to every netdev of the hw, so a feature set there also reaches
the frames that go out through the 802.11 path.

Add hw->encap_netdev_features and hw->encap_gso_max_segs. When the hw
supports encap offload, mac80211 sets the features on each netdev it
creates, and ieee80211_8023_xmit() passes them to
ieee80211_tx_skb_fixup(), so a GSO frame reaches the driver whole.

Whether a netdev sends with encap offload changes with its type, 4addr
mode, fragmentation threshold and monitor interfaces, and mac80211
switches its netdev ops when it does. The ops of the 802.11 and monitor
paths get an ndo_features_check that drops the encap features, so the
stack segments, linearizes and resolves the checksum first.

AQL charges a frame by tx_time_est, which ieee80211_info_set_tx_time_est()
caps at 4095 us. A whole GSO frame to a slow station, or to one whose
rate mac80211 does not know yet, would be charged less than its
airtime. Segment such a frame in software instead; the segments keep
scatter-gather. The check uses the rate of the station when the frame
is queued.

The tx statistics count a TCP GSO frame as gso_segs packets, with the
headers of every segment in its length.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- Take the encap features away per frame in ndo_features_check of the
  non-encap ops, instead of setting them by interface type when the
  netdev is created. v1 left them on a netdev changed to mesh point,
  whose fast path then warned in skb_checksum_help(), and never set
  them on P2P netdevs. Found by the hosted Sashiko review of v1.
- The AQL fallback clears only the GSO bits and keeps SG. Found by the
  hosted Sashiko review of v1.
- Segment a GSO frame for a station with no usable rate, which AQL
  charges as 4 us. Found by an LLM review (Claude).
- Say in the kernel-doc that an encap_gso_max_segs of 0 keeps the
  default of the netdev. Found by an LLM review (Claude).

 include/net/mac80211.h | 15 ++++++++++
 net/mac80211/iface.c   | 28 ++++++++++++++++++
 net/mac80211/main.c    |  3 +-
 net/mac80211/tx.c      | 65 ++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index ba16096fea3a..58a0a387d86c 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3271,6 +3271,19 @@ enum ieee80211_hw_flags {
  * @netdev_features: netdev features to be set in each netdev created
  *	from this HW. Note that not all features are usable with mac80211,
  *	other features will be rejected during HW registration.
+ * @encap_netdev_features: netdev features, in addition to @netdev_features,
+ *	set in each netdev created from this HW when it supports 802.3
+ *	encapsulation offload, for the frames that are sent with it (see
+ *	%IEEE80211_OFFLOAD_ENCAP_ENABLED). A driver sets scatter-gather and
+ *	segmentation offload here when the hardware takes such frames whole.
+ *	mac80211 hands a driver a frame with these features only with
+ *	%IEEE80211_TX_CTL_HW_80211_ENCAP, and segments or linearizes it in
+ *	software on every other path, and for a station when the airtime
+ *	estimate of the whole frame is more than AQL can account to one frame.
+ *	Such a frame starts with its 802.3 header.
+ * @encap_gso_max_segs: the most segments of a GSO frame the driver takes
+ *	whole, when @encap_netdev_features has a segmentation offload; 0
+ *	keeps the default limit of the netdev.
  *
  * @uapsd_queues: This bitmap is included in (re)association frame to indicate
  *	for each access category if it is uAPSD trigger-enabled and delivery-
@@ -3330,6 +3343,8 @@ struct ieee80211_hw {
 		s16 accuracy;
 	} radiotap_timestamp;
 	netdev_features_t netdev_features;
+	netdev_features_t encap_netdev_features;
+	u16 encap_gso_max_segs;
 	u8 uapsd_queues;
 	u8 uapsd_max_sp_len;
 	u8 max_nan_de_entries;
diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index b6ed6541bc42..85c96da3391c 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/if_arp.h>
+#include <linux/if_vlan.h>
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
 #include <linux/kcov.h>
@@ -960,11 +961,28 @@ static int ieee80211_netdev_setup_tc(struct net_device *dev,
 	return drv_net_setup_tc(local, sdata, dev, type, type_data);
 }
 
+/* For the netdev ops that send without the 802.3 encap offload: the frame
+ * is built into an 802.11 frame here, which cannot take what only the encap
+ * offload path takes, so the stack segments or linearizes it first.
+ */
+static netdev_features_t
+ieee80211_netdev_features_check(struct sk_buff *skb, struct net_device *dev,
+				netdev_features_t features)
+{
+	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
+	struct ieee80211_hw *hw = &sdata->local->hw;
+
+	features &= ~(hw->encap_netdev_features & ~hw->netdev_features);
+
+	return vlan_features_check(skb, features);
+}
+
 static const struct net_device_ops ieee80211_dataif_ops = {
 	.ndo_open		= ieee80211_open,
 	.ndo_stop		= ieee80211_stop,
 	.ndo_uninit		= ieee80211_uninit,
 	.ndo_start_xmit		= ieee80211_subif_start_xmit,
+	.ndo_features_check	= ieee80211_netdev_features_check,
 	.ndo_set_rx_mode	= ieee80211_set_multicast_list,
 	.ndo_set_mac_address 	= ieee80211_change_mac,
 	.ndo_setup_tc		= ieee80211_netdev_setup_tc,
@@ -1003,6 +1021,7 @@ static const struct net_device_ops ieee80211_monitorif_ops = {
 	.ndo_stop		= ieee80211_stop,
 	.ndo_uninit		= ieee80211_uninit,
 	.ndo_start_xmit		= ieee80211_monitor_start_xmit,
+	.ndo_features_check	= ieee80211_netdev_features_check,
 	.ndo_set_rx_mode	= ieee80211_set_multicast_list,
 	.ndo_set_mac_address 	= ieee80211_change_mac,
 	.ndo_select_queue	= ieee80211_monitor_select_queue,
@@ -2407,6 +2426,15 @@ int ieee80211_if_add(struct ieee80211_local *local, const char *name,
 			sdata->u.mgd.use_4addr = params->use_4addr;
 
 		ndev->features |= local->hw.netdev_features;
+		/* ieee80211_netdev_features_check() takes the encap features
+		 * away from every frame sent without the encap offload
+		 */
+		if (ieee80211_hw_check(&local->hw, SUPPORTS_TX_ENCAP_OFFLOAD)) {
+			ndev->features |= local->hw.encap_netdev_features;
+			if (local->hw.encap_gso_max_segs)
+				netif_set_tso_max_segs(ndev,
+						       local->hw.encap_gso_max_segs);
+		}
 		ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 		ndev->hw_features |= ndev->features &
 					MAC80211_SUPPORTED_FEATURES_TX;
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index e03c2dbf4fb8..2a49fe7ed367 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1243,7 +1243,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 	}
 
 	/* Only HW csum features are currently compatible with mac80211 */
-	if (WARN_ON(hw->netdev_features & ~MAC80211_SUPPORTED_FEATURES))
+	if (WARN_ON((hw->netdev_features | hw->encap_netdev_features) &
+		    ~MAC80211_SUPPORTED_FEATURES))
 		return -EINVAL;
 
 	if (hw->max_report_rates == 0)
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index cb9ecac25a9c..91ddd282f08d 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/skbuff.h>
 #include <linux/if_vlan.h>
+#include <linux/tcp.h>
 #include <linux/etherdevice.h>
 #include <linux/bitmap.h>
 #include <linux/rcupdate.h>
@@ -4797,6 +4798,47 @@ static bool ieee80211_tx_8023(struct ieee80211_sub_if_data *sdata,
 	return ret;
 }
 
+/* A frame's airtime estimate has 10 bits, in units of 4 us. A GSO frame whose
+ * estimate would not fit, or that has no estimate because the rate of the
+ * station is not known, is charged less than it takes, so it is segmented in
+ * software instead.
+ */
+#define IEEE80211_TX_GSO_AIRTIME_MAX	4092
+
+static bool ieee80211_8023_gso_fits(struct ieee80211_sub_if_data *sdata,
+				    struct sta_info *sta, struct sk_buff *skb,
+				    u16 queue)
+{
+	struct ieee80211_local *local = sdata->local;
+	struct ieee80211_chanctx_conf *conf;
+	u32 airtime;
+	u8 band = 0;
+
+	if (!sta || !wiphy_ext_feature_isset(local->hw.wiphy,
+					     NL80211_EXT_FEATURE_AQL))
+		return true;
+
+	/* AQL charges the vif of the AP, as ieee80211_tx_dequeue() does */
+	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN)
+		sdata = container_of(sdata->bss, struct ieee80211_sub_if_data,
+				     u.ap);
+
+	/* the estimate of ieee80211_calc_expected_tx_airtime(), which charges
+	 * 4 us when it has no rate to estimate with
+	 */
+	conf = rcu_dereference(sdata->vif.bss_conf.chanctx_conf);
+	if (conf)
+		band = conf->def.chan->band;
+
+	airtime = ieee80211_rate_expected_tx_airtime(&local->hw,
+						     &sta->deflink.tx_stats.last_rate,
+						     &sta->deflink.tx_stats.last_rate_info,
+						     band, queue != IEEE80211_AC_VO,
+						     skb->len + 38);
+
+	return airtime && airtime / 1024 <= IEEE80211_TX_GSO_AIRTIME_MAX;
+}
+
 static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 				struct net_device *dev, struct sta_info *sta,
 				struct ieee80211_key *key, struct sk_buff *skb)
@@ -4807,6 +4849,7 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 	struct tid_ampdu_tx *tid_tx = NULL;
 	struct sk_buff *seg, *next;
 	unsigned int skbs = 0, len = 0;
+	netdev_features_t features;
 	u16 queue;
 	u8 tid;
 
@@ -4835,7 +4878,12 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 			tid_tx->last_tx = jiffies;
 	}
 
-	skb = ieee80211_tx_skb_fixup(skb, ieee80211_sdata_netdev_features(sdata));
+	features = ieee80211_sdata_netdev_features(sdata) |
+		   local->hw.encap_netdev_features;
+	if (skb_is_gso(skb) && !ieee80211_8023_gso_fits(sdata, sta, skb, queue))
+		features &= ~NETIF_F_GSO_MASK;
+
+	skb = ieee80211_tx_skb_fixup(skb, features);
 	if (!skb)
 		return;
 
@@ -4865,8 +4913,21 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 		info->control.hw_key = &key->conf;
 
 	skb_list_walk_safe(skb, seg, next) {
-		skbs++;
+		unsigned int segs = 1;
+
 		len += seg->len;
+		/* a GSO frame is one frame of the queues and of the airtime
+		 * estimate, and as many packets of the counters as it has
+		 * segments
+		 */
+		if (skb_is_gso(seg) &&
+		    (skb_shinfo(seg)->gso_type &
+		     (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
+			segs = max_t(unsigned int, skb_shinfo(seg)->gso_segs, 1);
+			len += (segs - 1) * (skb_transport_offset(seg) +
+					     tcp_hdrlen(seg));
+		}
+		skbs += segs;
 		if (seg != skb)
 			memcpy(IEEE80211_SKB_CB(seg), info, sizeof(*info));
 	}
-- 
2.53.0



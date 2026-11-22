Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC6606A682
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HEgCIAs8;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=glu7RpdL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0mrNNw5RU1jw35bxblvVtq/MtklTGf4DFTf79gjLB0E=; b=HEgCIAs86iEyeS
	8BFzBjGlG6hQBCmOx8Mij8roEYCc6dUXjJrESp4z69g/wEu0PO4HMB9UowqROgtlyeLAMdI83Y/qa
	mZAG+i61RtIuK7kRTNuP/Zc3LIFG3KJYXHerQr9TJxuvEXfv0hnbHjFFNqFjpQcOvcEni91i+yCEn
	SD76R8lK45v3MeYAjoeLZQ6ZoZZv9+SiFskNDXrbcwR9E/0h4KEAIpHnj3AS7IUR0ZOqhH9VXwicb
	kEHpQWrcykjyeFPLy+wM8bxujpZVrfjqAxlGsTxlPtQ4E/W29Sjmq+dc4+eoDRW43OCyvtFj7dHTA
	qfLtOx0RupYkrtcPaI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7q0-000000019aL-2iFq;
	Sun, 22 Nov 2026 13:42:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7pu-000000019VN-2BQR
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 13:42:34 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c247f6687dcso360491766b.2
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354949; x=1795959749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mrNNw5RU1jw35bxblvVtq/MtklTGf4DFTf79gjLB0E=;
        b=glu7RpdLWwYur1B+WJQ6jaoPBQzZT7TJF/OBnL3mP+Kckq1f3HHZ3WEDdmZmQyABf2
         BvM2nm9TSVz491bob8bSN3dsZ+ATIG3U8ceB6XN0vuNHG4TmJYCvQgQC+wuE6F+eG0JM
         roha3PGPi3RGJYc2ZsvbbuoNaN5mfTohdi97RiP8O8DE/DOYqaZ+xKG3yuUKHRiX2fvT
         qteUWqJByClFRIkay7fUyS9MEu3Fbdc9LdP3HCsVvwHQqb9aJLAzQk+Ylp2EInha9Rz3
         w+CwsEDH2NI3sruZzZOwOrh1JOw/YcJ+wdAacW1BVj17pm0dias2DYq3MeQxhR6iLWrR
         MWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354949; x=1795959749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0mrNNw5RU1jw35bxblvVtq/MtklTGf4DFTf79gjLB0E=;
        b=USWzSHluHJM7sEjPwjF1XkAMPdDNso6Vm7+ePod0RMYVgUy4PZ2BSppMSqkbHTbhIg
         Bh3ZCzHkJJbA8vj972V4E+0cApuSdxDndZtXm+rqaQYRFb9OYUMVD22GIr/+CI4zkKIQ
         4Toek6Nbk5XUHElxJEdhX2+Nqxy/c0dFfwqZ3gBrqdM5vDGB7nn11Xwr5o38jV4RXofW
         vZY4iE4JbPejLnwApwm0N/XlNv+ClleDfaqNtmNLk0rBylwhKvt+Sd5IQM3E5c/NBObs
         X9O+1LD4wg6ZIgCXWP96fdpgGOXPRYdwzIXaaMTKpyWoZWb1BJLeeNku/dtGyxoolPX6
         T+cA==
X-Forwarded-Encrypted: i=1; AL+hErHoFpSOp3E7fxVWXafTSjlbSKylUahfXnpc0HRIWC5+gOPc264QHNpjlVRw+2A033wqXCfBm0I=@lists.infradead.org
X-Gm-Message-State: APuU4Z+ZfQ+L8u98ZdDqR7t+0wuR1NlsjdcCmI7w5xgYyzvrT/P60Klh
	34sKUPijmA9br1HNg+7l84PkS+sid0JbHvtVZER2gdtupj2Giux09SFAifOkETEgMQ==
X-Gm-Gg: AZFdTZfTDRq5ub43uRTOE+yFMshwLBSXtMwwIrbEzZFcXC/nk4Ec1ZSDii8eCM9vhb4
	rBTVAwgAHUcE2sbZpPKdkbQXJNBjorxZi1l5FvWyKRhZoK081ihQUxxdVB+R7mK+D8x4Ty2HxF4
	Jstu2fBWrNkvgkb0w74y1sbeX9RJou44YX67ExDpG/9xGBT4qiYQIeKgfkPOcXhVV937eqzxC89
	Rg9IjGPq3grSWLF+tprQMdbtkPt8WmNVf54oLQ6+s2B7qi1pE0FvUoKzHWeEHjgqUP7cRlXVOMR
	0KAz5hJPMBsUTCgKIFQocORRuz5GCk9SgzoI7XRBHorUefcV+LKbY80KLLxJ0Nn0zD3LAZS1SKN
	H1dam8boaf6Tx/h6KmscGqvg5GQeSflAmDR4eGrkdg+q+kikxdI6x42MA37MhdlelhGZGJhjgHZ
	ithJ8X8SwkaW5ZL24grkbvMvodP4lm92fjuSN4HeiM9kWzCYI/9yzKmEPA+Lb9mkNxDGIdgDQYF
	pTsh//rp4M/Oaznr++lDittx/OP7cL3RcLgrDGtt9DNJ3g6nwhHpu5Rfs3mZcjV19EOFd1/y2Vf
	d1Wk4bmp1lqrNzHgl1+hP/9xRe28nRlfbv1vVvblCcKStS4AujmltdXAyfG7sFQJXfpYAxSWvTe
	mAJPx6kmWrr8zxtWqO+l5QR8i+DtwGvmZeiZldE8GkjtNz2WGzVnCZFvpWd2IfxNxe8j1NIYrWk
	Zdrc6lXTc8YTlLxr5sCXsorfSujwgFBjUGnqHp0x55PYlyqYrbrUsEWXS8dHVFhe9biafYo4GMI
	P4eJVW5+A5R6J+6kEfMeXiwnZYjpaYOVgXBg2x3vDrBFIXALWNumzUhONIBtCZQ+TrlvbNkrglc
	36d74lZ0CxeKzW3B/QHhXI68Y6ea/LbSeu25ZQGpsSvEvtOhC2339EU=
X-Received: by 2002:a17:907:bb48:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c513a9af930mr640165866b.30.1795354948816;
        Sun, 22 Nov 2026 05:42:28 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:27 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 1/4] wifi: mac80211: advertise TSO and SG for encap offloaded frames
Date: Sun, 22 Nov 2026 14:42:25 +0100
Message-ID: <20261122134228.956044-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_054231_722795_6D9E1700 
X-CRM114-Status: GOOD (  22.73  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A driver whose hardware segments TCP frames and takes frames with
fragments on its 802.3 encap path cannot say so. hw->netdev_features
applies to every netdev of the hw, so a feature set there also reaches
the frames that go out through the 802.11 path.

Add hw->encap_netdev_features and hw->encap_gso_max_segs. mac80211 sets
the features on the AP, AP_VLAN and station netdevs when the hw supports
encap offload, and ieee80211_8023_xmit() passes them to
ieee80211_tx_skb_fixup(), so a GSO frame reaches the driver whole. The
802.11 path keeps using the features of the vif, which do not include
them, and segments such a frame in software as before.

AQL charges a frame by tx_time_est, which ieee80211_info_set_tx_time_est()
caps at 4095 us. A whole GSO frame to a slow station can take longer and
would be charged less than its airtime. Segment such a frame in software
instead.

The tx statistics count a TCP GSO frame as gso_segs packets, with the
headers of every segment in its length.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/net/mac80211.h | 15 ++++++++++++
 net/mac80211/iface.c   | 14 +++++++++++
 net/mac80211/main.c    |  3 ++-
 net/mac80211/tx.c      | 53 ++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index f768ef9184eb..8eac4d50d06c 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3271,6 +3271,19 @@ enum ieee80211_hw_flags {
  * @netdev_features: netdev features to be set in each netdev created
  *	from this HW. Note that not all features are usable with mac80211,
  *	other features will be rejected during HW registration.
+ * @encap_netdev_features: netdev features, in addition to @netdev_features,
+ *	set in each AP, AP VLAN and station netdev created from this HW, for
+ *	the frames that are sent with 802.3 encapsulation offload (see
+ *	%IEEE80211_OFFLOAD_ENCAP_ENABLED). A driver sets scatter-gather and
+ *	segmentation offload here when the hardware takes such frames whole.
+ *	mac80211 hands a driver a frame with these features only with
+ *	%IEEE80211_TX_CTL_HW_80211_ENCAP, and segments or linearizes it in
+ *	software on every other path, and for a station when the airtime
+ *	estimate of the whole frame is more than AQL can account to one frame.
+ *	Such a frame starts with its 802.3 header; a GSO frame has at most
+ *	@encap_gso_max_segs segments.
+ * @encap_gso_max_segs: the most segments of a GSO frame the driver takes
+ *	whole, when @encap_netdev_features has a segmentation offload.
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
index b6ed6541bc42..c3869dbfdab7 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -2407,6 +2407,20 @@ int ieee80211_if_add(struct ieee80211_local *local, const char *name,
 			sdata->u.mgd.use_4addr = params->use_4addr;
 
 		ndev->features |= local->hw.netdev_features;
+		/* Only the netdevs that can use the encap offload offer its
+		 * features: every other path segments in software, with the
+		 * features of the vif.
+		 */
+		if (ieee80211_hw_check(&local->hw, SUPPORTS_TX_ENCAP_OFFLOAD) &&
+		    local->hw.encap_netdev_features &&
+		    (type == NL80211_IFTYPE_AP ||
+		     type == NL80211_IFTYPE_AP_VLAN ||
+		     type == NL80211_IFTYPE_STATION)) {
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
index cb9ecac25a9c..faf3e6b9e4f8 100644
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
@@ -4797,6 +4798,35 @@ static bool ieee80211_tx_8023(struct ieee80211_sub_if_data *sdata,
 	return ret;
 }
 
+/* A frame's airtime estimate has 10 bits, in units of 4 us. A GSO frame whose
+ * estimate would not fit is charged less than it takes and stays in the AQL
+ * limits for as long as it takes, so it is segmented in software instead.
+ */
+#define IEEE80211_TX_GSO_AIRTIME_MAX	4092
+
+static bool ieee80211_8023_gso_fits(struct ieee80211_sub_if_data *sdata,
+				    struct sta_info *sta, struct sk_buff *skb,
+				    u16 queue)
+{
+	struct ieee80211_local *local = sdata->local;
+	u32 airtime;
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
+	airtime = ieee80211_calc_expected_tx_airtime(&local->hw, &sdata->vif,
+						     &sta->sta, skb->len,
+						     queue != IEEE80211_AC_VO);
+
+	return airtime <= IEEE80211_TX_GSO_AIRTIME_MAX;
+}
+
 static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 				struct net_device *dev, struct sta_info *sta,
 				struct ieee80211_key *key, struct sk_buff *skb)
@@ -4807,6 +4837,7 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 	struct tid_ampdu_tx *tid_tx = NULL;
 	struct sk_buff *seg, *next;
 	unsigned int skbs = 0, len = 0;
+	netdev_features_t features;
 	u16 queue;
 	u8 tid;
 
@@ -4835,7 +4866,12 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 			tid_tx->last_tx = jiffies;
 	}
 
-	skb = ieee80211_tx_skb_fixup(skb, ieee80211_sdata_netdev_features(sdata));
+	features = ieee80211_sdata_netdev_features(sdata) |
+		   local->hw.encap_netdev_features;
+	if (skb_is_gso(skb) && !ieee80211_8023_gso_fits(sdata, sta, skb, queue))
+		features &= ~(NETIF_F_ALL_TSO | NETIF_F_SG);
+
+	skb = ieee80211_tx_skb_fixup(skb, features);
 	if (!skb)
 		return;
 
@@ -4865,8 +4901,21 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
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



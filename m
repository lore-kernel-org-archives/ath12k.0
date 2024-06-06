Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08243C27C6F
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 18:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOCst2QAjVjlhHAvyW0f7/33PkTY6/tNWmZ2vHouG+8=; b=siWcnjbJkrhU/yoZS2T1PCB3Ak
	eyPBqZVe5smSJOoaeS6rHvTfVZb1joBnJ6nklFvmn7JOamLO1XS7HSJLnI/0XXLcvWasn9QmXMoWm
	WDWrYfmwlaL7x3UyxO95iwlEIvgfSTvneUScj2fT4s66EJjZJXm1gb73qWT0P+2ZRGorONk4roD7a
	eB+pbzpjB9YHA2+yb3kadrNE3roVOobhSIEwpWl7ztPYCjeVlkPXEzAyBnbDhHIKxpefpvm4irb80
	NAorkJ2SwFDwYcTfKwFxNzMV5x7aOkDJGUIc8eZkozMBM2Wzv+XNn8pw+u26q3ZOd0W52UcTr6Q+n
	3LzzKmZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHWJ-0000000As5o-33Iv
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 18:07:27 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHWD-0000000As1a-3DP4
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 18:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vOCst2QAjVjlhHAvyW0f7/33PkTY6/tNWmZ2vHouG+8=; b=QOHIQoCHbVhtg1dva6hZXi07M1
	gsjMaHzVtlO69hcvCIwnzYlBZDxRpFwxbHo3VR56fEGzXbeQ2URDY+n6OmyrCLi7eaEao76QNpwbZ
	9WzZ3j5qW/9RX6TwsTVcFTR2wdzKqWi+wAIYifp6KDXWgHLBH71bQOvsBBkqDSJ+pyvA=;
Received: from p4ff130d0.dip0.t-ipconnect.de ([79.241.48.208] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFHW6-008aic-2j;
	Thu, 06 Jun 2024 20:07:14 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v3 3/8] wifi: cfg80211: extend interface combination check for multi-radio
Date: Thu,  6 Jun 2024 20:07:08 +0200
Message-ID: <754815488294f5b7f599b2adba085f1889b53b1a.1717696995.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_110721_994003_99CA9896 
X-CRM114-Status: GOOD (  18.33  )
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

Add a field in struct iface_combination_params to check per-radio
interface combinations instead of per-wiphy ones.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 include/net/cfg80211.h  |  5 +++++
 net/wireless/rdev-ops.h | 17 +++++++++++++++++
 net/wireless/trace.h    |  5 +++++
 net/wireless/util.c     | 36 +++++++++++++++++++++++++++++-------
 4 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 27355e08ae52..35d4d18e0500 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1595,6 +1595,7 @@ struct cfg80211_color_change_settings {
  *
  * Used to pass interface combination parameters
  *
+ * @radio: when set, check radio specific interface combinations.
  * @num_different_channels: the number of different channels we want
  *	to use for verification
  * @radar_detect: a bitmap where each bit corresponds to a channel
@@ -1608,6 +1609,7 @@ struct cfg80211_color_change_settings {
  *	the verification
  */
 struct iface_combination_params {
+	const struct wiphy_radio *radio;
 	int num_different_channels;
 	u8 radar_detect;
 	int iftype_num[NUM_NL80211_IFTYPES];
@@ -4577,6 +4579,7 @@ struct mgmt_frame_regs {
  *
  * @set_hw_timestamp: Enable/disable HW timestamping of TM/FTM frames.
  * @set_ttlm: set the TID to link mapping.
+ * @get_radio_mask: get bitmask of radios in use
  */
 struct cfg80211_ops {
 	int	(*suspend)(struct wiphy *wiphy, struct cfg80211_wowlan *wow);
@@ -4938,6 +4941,8 @@ struct cfg80211_ops {
 				    struct cfg80211_set_hw_timestamp *hwts);
 	int	(*set_ttlm)(struct wiphy *wiphy, struct net_device *dev,
 			    struct cfg80211_ttlm_params *params);
+	int	(*get_radio_mask)(struct wiphy *wiphy, struct net_device *dev,
+				  u32 *mask);
 };
 
 /*
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index 43897a5269b6..43d72d09ef34 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -1542,4 +1542,21 @@ rdev_set_ttlm(struct cfg80211_registered_device *rdev,
 
 	return ret;
 }
+
+static inline int
+rdev_get_radio_mask(struct cfg80211_registered_device *rdev,
+		    struct net_device *dev, u32 *mask)
+{
+	struct wiphy *wiphy = &rdev->wiphy;
+	int ret;
+
+	if (!rdev->ops->get_radio_mask)
+		return -EOPNOTSUPP;
+
+	trace_rdev_get_radio_mask(wiphy, dev);
+	ret = rdev->ops->get_radio_mask(wiphy, dev, mask);
+	trace_rdev_return_int(wiphy, ret);
+
+	return ret;
+}
 #endif /* __CFG80211_RDEV_OPS */
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 14cfa0aba93a..12081e81f9c5 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -4081,6 +4081,11 @@ TRACE_EVENT(cfg80211_links_removed,
 		  __entry->link_mask)
 );
 
+DEFINE_EVENT(wiphy_netdev_evt, rdev_get_radio_mask,
+	TP_PROTO(struct wiphy *wiphy, struct net_device *netdev),
+	TP_ARGS(wiphy, netdev)
+);
+
 #endif /* !__RDEV_OPS_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 2bde8a354631..cab40e4c3491 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2305,20 +2305,35 @@ static int cfg80211_wdev_bi(struct wireless_dev *wdev)
 
 static void cfg80211_calculate_bi_data(struct wiphy *wiphy, u32 new_beacon_int,
 				       u32 *beacon_int_gcd,
-				       bool *beacon_int_different)
+				       bool *beacon_int_different,
+				       const struct wiphy_radio *radio)
 {
+	struct cfg80211_registered_device *rdev;
 	struct wireless_dev *wdev;
+	int radio_idx = -1;
 
 	*beacon_int_gcd = 0;
 	*beacon_int_different = false;
+	if (radio)
+		radio_idx = radio - wiphy->radio;
 
+	rdev = wiphy_to_rdev(wiphy);
 	list_for_each_entry(wdev, &wiphy->wdev_list, list) {
 		int wdev_bi;
+		u32 mask;
 
 		/* this feature isn't supported with MLO */
 		if (wdev->valid_links)
 			continue;
 
+		if (radio_idx >= 0) {
+			if (rdev_get_radio_mask(rdev, wdev->netdev, &mask))
+				continue;
+
+			if (!(mask & BIT(radio_idx)))
+				continue;
+		}
+
 		wdev_bi = cfg80211_wdev_bi(wdev);
 
 		if (!wdev_bi)
@@ -2366,9 +2381,11 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 					    void *data),
 			       void *data)
 {
+	const struct wiphy_radio *radio = params->radio;
+	const struct ieee80211_iface_combination *c;
 	const struct ieee80211_regdomain *regdom;
 	enum nl80211_dfs_regions region = 0;
-	int i, j, iftype;
+	int i, j, n, iftype;
 	int num_interfaces = 0;
 	u32 used_iftypes = 0;
 	u32 beacon_int_gcd;
@@ -2385,7 +2402,8 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 	 * interfaces (while being brought up) and channel/radar data.
 	 */
 	cfg80211_calculate_bi_data(wiphy, params->new_beacon_int,
-				   &beacon_int_gcd, &beacon_int_different);
+				   &beacon_int_gcd, &beacon_int_different,
+				   radio);
 
 	if (params->radar_detect) {
 		rcu_read_lock();
@@ -2402,13 +2420,17 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 			used_iftypes |= BIT(iftype);
 	}
 
-	for (i = 0; i < wiphy->n_iface_combinations; i++) {
-		const struct ieee80211_iface_combination *c;
+	if (radio) {
+		c = radio->iface_combinations;
+		n = radio->n_iface_combinations;
+	} else {
+		c = wiphy->iface_combinations;
+		n = wiphy->n_iface_combinations;
+	}
+	for (i = 0; i < n; i++, c++) {
 		struct ieee80211_iface_limit *limits;
 		u32 all_iftypes = 0;
 
-		c = &wiphy->iface_combinations[i];
-
 		if (num_interfaces > c->max_interfaces)
 			continue;
 		if (params->num_different_channels > c->num_different_channels)
-- 
git-series 0.9.1


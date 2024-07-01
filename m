Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D929BC3065E
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhZQm3+3WPFbO9YbtdW5Zs7jKDQqnaJVGJktHz/IGaA=; b=S9aQxK3KS9aQipQzOgsE5xFeVB
	ILPz2rUnNjM8HBtLplkArQM7j0Yt1Lm3BIAVraKQn1K6nhx7LQ3xoiB6GizMuPKAXHOq1moi0cujy
	OkNVagsKFCHwhC9FsDLh/SYq/uJKsN3xF52EfVhPU3aMtHu1+Gy9OqgWnyKA9vL9rMkADLe33B+Ap
	n8vkoU0jz6rMWcdxGQQH1kqyk4ybJ1h3vnxOpL925fOH6/RXmni++H1vcfN39EVX5ZO0WPx/EAN3z
	bgtgiIhoJGagav+zixV7Kybx6LQHDv9nZ9UP8fYUQ61euaAKtiBhP+PNncVKSy/h9HoXO6JI/7F3/
	9dNBHh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHmr-00000003g58-2OPt
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 14:13:45 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHmj-00000003fx8-06gc
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 14:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nhZQm3+3WPFbO9YbtdW5Zs7jKDQqnaJVGJktHz/IGaA=; b=nFxr1OCcv1FO4guwYiDjSeMY5K
	RY6y2pqA4gAikJviLyhRh/HdfgrfcSDFhfgr7rfQO42xZpxHI2aU5QoWw2ArqhBrivpungaVMWbTc
	buf8aXO+vFaEQA1C6aoLoq5yqZKE7FdlRvZZMvUx6ekj5mcPa6BOploFQ8azJZBB2OFI=;
Received: from p4ff13dca.dip0.t-ipconnect.de ([79.241.61.202] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sOHmZ-001Qfu-10;
	Mon, 01 Jul 2024 16:13:27 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [PATCH v3 03/10] wifi: cfg80211: extend interface combination check for multi-radio
Date: Mon,  1 Jul 2024 16:13:18 +0200
Message-ID: <18a4aae4b14f1005fb5b1ed98173e31b18914155.1719843147.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a50ea6fd728e14cfdaafeb9cfac003364713c8e7.1719843147.git-series.nbd@nbd.name>
References: <cover.a50ea6fd728e14cfdaafeb9cfac003364713c8e7.1719843147.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_071337_205374_6346D194 
X-CRM114-Status: GOOD (  22.18  )
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
 net/mac80211/util.c     |  5 ++++-
 net/wireless/rdev-ops.h | 12 ++++++++++++
 net/wireless/util.c     | 33 ++++++++++++++++++++++++++-------
 4 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index a3cdad3a9305..bb3b803e5468 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1598,6 +1598,7 @@ struct cfg80211_color_change_settings {
  *
  * Used to pass interface combination parameters
  *
+ * @radio_idx: wiphy radio index or -1 for global
  * @num_different_channels: the number of different channels we want
  *	to use for verification
  * @radar_detect: a bitmap where each bit corresponds to a channel
@@ -1611,6 +1612,7 @@ struct cfg80211_color_change_settings {
  *	the verification
  */
 struct iface_combination_params {
+	int radio_idx;
 	int num_different_channels;
 	u8 radar_detect;
 	int iftype_num[NUM_NL80211_IFTYPES];
@@ -4580,6 +4582,8 @@ struct mgmt_frame_regs {
  *
  * @set_hw_timestamp: Enable/disable HW timestamping of TM/FTM frames.
  * @set_ttlm: set the TID to link mapping.
+ * @get_radio_mask: get bitmask of radios in use.
+ *	(invoked with the wiphy mutex held)
  */
 struct cfg80211_ops {
 	int	(*suspend)(struct wiphy *wiphy, struct cfg80211_wowlan *wow);
@@ -4941,6 +4945,7 @@ struct cfg80211_ops {
 				    struct cfg80211_set_hw_timestamp *hwts);
 	int	(*set_ttlm)(struct wiphy *wiphy, struct net_device *dev,
 			    struct cfg80211_ttlm_params *params);
+	u32	(*get_radio_mask)(struct wiphy *wiphy, struct net_device *dev);
 };
 
 /*
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index c6d5f73119d8..27f0db2e9796 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -3944,6 +3944,7 @@ int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
 	int total = 1;
 	struct iface_combination_params params = {
 		.radar_detect = radar_detect,
+		.radio_idx = -1,
 	};
 
 	lockdep_assert_wiphy(local->hw.wiphy);
@@ -4034,7 +4035,9 @@ int ieee80211_max_num_channels(struct ieee80211_local *local)
 	struct ieee80211_chanctx *ctx;
 	u32 max_num_different_channels = 1;
 	int err;
-	struct iface_combination_params params = {0};
+	struct iface_combination_params params = {
+		.radio_idx = -1,
+	};
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index 8f15658002ee..ec3f4aa1c807 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -1532,4 +1532,16 @@ rdev_set_ttlm(struct cfg80211_registered_device *rdev,
 
 	return ret;
 }
+
+static inline u32
+rdev_get_radio_mask(struct cfg80211_registered_device *rdev,
+		    struct net_device *dev)
+{
+	struct wiphy *wiphy = &rdev->wiphy;
+
+	if (!rdev->ops->get_radio_mask)
+		return 0;
+
+	return rdev->ops->get_radio_mask(wiphy, dev);
+}
 #endif /* __CFG80211_RDEV_OPS */
diff --git a/net/wireless/util.c b/net/wireless/util.c
index af6ec719567f..2492f259621f 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2307,13 +2307,16 @@ static int cfg80211_wdev_bi(struct wireless_dev *wdev)
 
 static void cfg80211_calculate_bi_data(struct wiphy *wiphy, u32 new_beacon_int,
 				       u32 *beacon_int_gcd,
-				       bool *beacon_int_different)
+				       bool *beacon_int_different,
+				       int radio_idx)
 {
+	struct cfg80211_registered_device *rdev;
 	struct wireless_dev *wdev;
 
 	*beacon_int_gcd = 0;
 	*beacon_int_different = false;
 
+	rdev = wiphy_to_rdev(wiphy);
 	list_for_each_entry(wdev, &wiphy->wdev_list, list) {
 		int wdev_bi;
 
@@ -2321,6 +2324,11 @@ static void cfg80211_calculate_bi_data(struct wiphy *wiphy, u32 new_beacon_int,
 		if (wdev->valid_links)
 			continue;
 
+		/* skip wdevs not active on the given wiphy radio */
+		if (radio_idx >= 0 &&
+		    !(rdev_get_radio_mask(rdev, wdev->netdev) & BIT(radio_idx)))
+			continue;
+
 		wdev_bi = cfg80211_wdev_bi(wdev);
 
 		if (!wdev_bi)
@@ -2368,14 +2376,19 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 					    void *data),
 			       void *data)
 {
+	const struct wiphy_radio *radio = NULL;
+	const struct ieee80211_iface_combination *c, *cs;
 	const struct ieee80211_regdomain *regdom;
 	enum nl80211_dfs_regions region = 0;
-	int i, j, iftype;
+	int i, j, n, iftype;
 	int num_interfaces = 0;
 	u32 used_iftypes = 0;
 	u32 beacon_int_gcd;
 	bool beacon_int_different;
 
+	if (params->radio_idx >= 0)
+		radio = &wiphy->radio[params->radio_idx];
+
 	/*
 	 * This is a bit strange, since the iteration used to rely only on
 	 * the data given by the driver, but here it now relies on context,
@@ -2387,7 +2400,8 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 	 * interfaces (while being brought up) and channel/radar data.
 	 */
 	cfg80211_calculate_bi_data(wiphy, params->new_beacon_int,
-				   &beacon_int_gcd, &beacon_int_different);
+				   &beacon_int_gcd, &beacon_int_different,
+				   params->radio_idx);
 
 	if (params->radar_detect) {
 		rcu_read_lock();
@@ -2404,13 +2418,18 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 			used_iftypes |= BIT(iftype);
 	}
 
-	for (i = 0; i < wiphy->n_iface_combinations; i++) {
-		const struct ieee80211_iface_combination *c;
+	if (radio) {
+		cs = radio->iface_combinations;
+		n = radio->n_iface_combinations;
+	} else {
+		cs = wiphy->iface_combinations;
+		n = wiphy->n_iface_combinations;
+	}
+	for (i = 0; i < n; i++) {
 		struct ieee80211_iface_limit *limits;
 		u32 all_iftypes = 0;
 
-		c = &wiphy->iface_combinations[i];
-
+		c = &cs[i];
 		if (num_interfaces > c->max_interfaces)
 			continue;
 		if (params->num_different_channels > c->num_different_channels)
-- 
git-series 0.9.1


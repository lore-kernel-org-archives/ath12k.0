Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94BBC27C78
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 16:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wE/YU98+K8BqdghEcxaZaMQZPrB2kjkbkWY/y+8Q9Vk=; b=o+lp5PKiQcN+PikxdRCyDMjGtd
	yJ3NMluu9BJEkr6UmgIvyir1D4sVjUuePUuw+XfFBpSGkW69e/jVv58Y9uo2dsTh4UWbMNtkDVhXJ
	qFNMlmM8L1ZMATuOFXG6gsL8GonQcBFk7gZUSxB7uykppKBDtQwvbMKheeBXZ5LEpRIA0XaeldFlL
	SYuqc+3hzhlSsJ9xaLf3zhAltAwpaFdYUrNPhO9yNSPHwq5b69JMxGebKW6ujT/EOjKvBdyQRwh8Y
	lpZrGp2mlxsJTj/Ej3Fzh1bQB5jqkfN0OO19PdZsGZsN/TWV8cmXL912AzUSAuNJWKyrfOT/niIFe
	fsZ7RZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6P-0000000Eqno-2FzO
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 16:06:05 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6H-0000000EqgL-2FxZ
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 16:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wE/YU98+K8BqdghEcxaZaMQZPrB2kjkbkWY/y+8Q9Vk=; b=fjMG+2lIJR1PW1tDktGU/kmElk
	5Bb1mQWOhRz6CRbxGvmBvZb238kyATX9Mh4/WACswzjFODNh4pCUcQ7qHkv1EiraY8lfieIV4Q89F
	6DIurvCFohUif+BvgwROXZtbmpf70db1njwMSJkj+gjL4jxut+8LvxZ1PoUI//K2zTlA=;
Received: from p4ff13226.dip0.t-ipconnect.de ([79.241.50.38] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFc6B-008xPc-1y;
	Fri, 07 Jun 2024 18:05:51 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v4 7/9] wifi: mac80211: extend ifcomb check functions for multi-radio
Date: Fri,  7 Jun 2024 18:05:46 +0200
Message-ID: <040a8ca9ec858bf9a2328dbf01ec046e659f8b36.1717776325.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.0af6292ae793f7b9927ab6583791b58daedc9104.1717776325.git-series.nbd@nbd.name>
References: <cover.0af6292ae793f7b9927ab6583791b58daedc9104.1717776325.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_090557_952451_0261D2CB 
X-CRM114-Status: GOOD (  17.03  )
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

Add support for counting global and per-radio max/current number of
channels, as well as checking radio-specific interface combinations.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/mac80211/cfg.c         |   7 +-
 net/mac80211/chan.c        |  17 +++--
 net/mac80211/ibss.c        |   2 +-
 net/mac80211/ieee80211_i.h |   5 +-
 net/mac80211/iface.c       |   2 +-
 net/mac80211/util.c        | 126 ++++++++++++++++++++++++++------------
 6 files changed, 108 insertions(+), 51 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 62119e957cd8..950b7b72f0b8 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -263,7 +263,7 @@ static int ieee80211_start_p2p_device(struct wiphy *wiphy,
 
 	lockdep_assert_wiphy(sdata->local->hw.wiphy);
 
-	ret = ieee80211_check_combinations(sdata, NULL, 0, 0);
+	ret = ieee80211_check_combinations(sdata, NULL, 0, 0, -1);
 	if (ret < 0)
 		return ret;
 
@@ -285,7 +285,7 @@ static int ieee80211_start_nan(struct wiphy *wiphy,
 
 	lockdep_assert_wiphy(sdata->local->hw.wiphy);
 
-	ret = ieee80211_check_combinations(sdata, NULL, 0, 0);
+	ret = ieee80211_check_combinations(sdata, NULL, 0, 0, -1);
 	if (ret < 0)
 		return ret;
 
@@ -4001,7 +4001,7 @@ __ieee80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 		goto out;
 
 	/* if reservation is invalid then this will fail */
-	err = ieee80211_check_combinations(sdata, NULL, chanctx->mode, 0);
+	err = ieee80211_check_combinations(sdata, NULL, chanctx->mode, 0, -1);
 	if (err) {
 		ieee80211_link_unreserve_chanctx(link_data);
 		goto out;
@@ -5199,4 +5199,5 @@ const struct cfg80211_ops mac80211_config_ops = {
 	.del_link_station = ieee80211_del_link_station,
 	.set_hw_timestamp = ieee80211_set_hw_timestamp,
 	.set_ttlm = ieee80211_set_ttlm,
+	.get_radio_mask = ieee80211_get_radio_mask,
 };
diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index 574ae961a7cf..0e899c07bc2b 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -47,24 +47,29 @@ int ieee80211_chanctx_refcount(struct ieee80211_local *local,
 	       ieee80211_chanctx_num_reserved(local, ctx);
 }
 
-static int ieee80211_num_chanctx(struct ieee80211_local *local)
+static int ieee80211_num_chanctx(struct ieee80211_local *local, int radio_idx)
 {
 	struct ieee80211_chanctx *ctx;
 	int num = 0;
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
-	list_for_each_entry(ctx, &local->chanctx_list, list)
+	list_for_each_entry(ctx, &local->chanctx_list, list) {
+		if (radio_idx >= 0 && ctx->conf.radio_idx != radio_idx)
+			continue;
 		num++;
+	}
 
 	return num;
 }
 
-static bool ieee80211_can_create_new_chanctx(struct ieee80211_local *local)
+static bool ieee80211_can_create_new_chanctx(struct ieee80211_local *local,
+					     int radio_idx)
 {
 	lockdep_assert_wiphy(local->hw.wiphy);
 
-	return ieee80211_num_chanctx(local) < ieee80211_max_num_channels(local);
+	return ieee80211_num_chanctx(local, radio_idx) <
+	       ieee80211_max_num_channels(local, radio_idx);
 }
 
 static struct ieee80211_chanctx *
@@ -1072,7 +1077,7 @@ int ieee80211_link_reserve_chanctx(struct ieee80211_link_data *link,
 
 	new_ctx = ieee80211_find_reservation_chanctx(local, chanreq, mode);
 	if (!new_ctx) {
-		if (ieee80211_can_create_new_chanctx(local)) {
+		if (ieee80211_can_create_new_chanctx(local, -1)) {
 			new_ctx = ieee80211_new_chanctx(local, chanreq, mode,
 							false);
 			if (IS_ERR(new_ctx))
@@ -1767,7 +1772,7 @@ int _ieee80211_link_use_channel(struct ieee80211_link_data *link,
 	link->radar_required = ret;
 
 	ret = ieee80211_check_combinations(sdata, &chanreq->oper, mode,
-					   radar_detect_width);
+					   radar_detect_width, -1);
 	if (ret < 0)
 		goto out;
 
diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index bf338f3d4dd3..522e964bb186 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -1745,7 +1745,7 @@ int ieee80211_ibss_join(struct ieee80211_sub_if_data *sdata,
 		IEEE80211_CHANCTX_SHARED : IEEE80211_CHANCTX_EXCLUSIVE;
 
 	ret = ieee80211_check_combinations(sdata, &params->chandef, chanmode,
-					   radar_detect_width);
+					   radar_detect_width, -1);
 	if (ret < 0)
 		return ret;
 
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 3fd7b1adbfab..d8cb93e5e255 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2038,6 +2038,7 @@ static inline bool ieee80211_sdata_running(struct ieee80211_sub_if_data *sdata)
 {
 	return test_bit(SDATA_STATE_RUNNING, &sdata->state);
 }
+u32 ieee80211_get_radio_mask(struct wiphy *wiphy, struct net_device *dev);
 
 /* link handling */
 void ieee80211_link_setup(struct ieee80211_link_data *link);
@@ -2620,8 +2621,8 @@ void ieee80211_recalc_dtim(struct ieee80211_local *local,
 int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
 				 const struct cfg80211_chan_def *chandef,
 				 enum ieee80211_chanctx_mode chanmode,
-				 u8 radar_detect);
-int ieee80211_max_num_channels(struct ieee80211_local *local);
+				 u8 radar_detect, int radio_idx);
+int ieee80211_max_num_channels(struct ieee80211_local *local, int radio_idx);
 void ieee80211_recalc_chanctx_chantype(struct ieee80211_local *local,
 				       struct ieee80211_chanctx *ctx);
 
diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index d1a49ee4a194..5dc85f9409cd 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -397,7 +397,7 @@ static int ieee80211_check_concurrent_iface(struct ieee80211_sub_if_data *sdata,
 		}
 	}
 
-	return ieee80211_check_combinations(sdata, NULL, 0, 0);
+	return ieee80211_check_combinations(sdata, NULL, 0, 0, -1);
 }
 
 static int ieee80211_check_queues(struct ieee80211_sub_if_data *sdata,
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 0d2927e53114..d9e41cb03676 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -3928,19 +3928,99 @@ static u8 ieee80211_chanctx_radar_detect(struct ieee80211_local *local,
 	return radar_detect;
 }
 
+static u32
+__ieee80211_get_radio_mask(struct ieee80211_sub_if_data *sdata)
+{
+	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_chanctx_conf *conf;
+	unsigned int link_id;
+	u32 mask = 0;
+
+	for_each_vif_active_link(&sdata->vif, link_conf, link_id) {
+		conf = rcu_dereference(link_conf->chanctx_conf);
+		if (!conf || conf->radio_idx < 0)
+			continue;
+
+		mask |= BIT(conf->radio_idx);
+	}
+
+	return mask;
+}
+
+u32 ieee80211_get_radio_mask(struct wiphy *wiphy, struct net_device *dev)
+{
+	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
+
+	return __ieee80211_get_radio_mask(sdata);
+}
+
+static bool
+ieee80211_sdata_uses_radio(struct ieee80211_sub_if_data *sdata, int radio_idx)
+{
+	if (radio_idx < 0)
+		return true;
+
+	return __ieee80211_get_radio_mask(sdata) & BIT(radio_idx);
+}
+
+static void
+ieee80211_fill_ifcomb_params(struct ieee80211_local *local,
+			     struct iface_combination_params *params,
+			     const struct cfg80211_chan_def *chandef,
+			     struct ieee80211_sub_if_data *sdata)
+{
+	struct ieee80211_sub_if_data *sdata_iter;
+	struct ieee80211_chanctx *ctx;
+
+	list_for_each_entry(ctx, &local->chanctx_list, list) {
+		if (ctx->replace_state == IEEE80211_CHANCTX_WILL_BE_REPLACED)
+			continue;
+
+		if (params->radio_idx >= 0 &&
+		    ctx->conf.radio_idx != params->radio_idx)
+			continue;
+
+		if (chandef &&
+		    cfg80211_chandef_compatible(chandef, &ctx->conf.def))
+			continue;
+
+		params->num_different_channels++;
+
+		params->radar_detect |=
+			ieee80211_chanctx_radar_detect(local, ctx);
+	}
+
+	list_for_each_entry_rcu(sdata_iter, &local->interfaces, list) {
+		struct wireless_dev *wdev_iter;
+
+		wdev_iter = &sdata_iter->wdev;
+
+		if (sdata_iter == sdata ||
+		    !ieee80211_sdata_running(sdata_iter) ||
+		    cfg80211_iftype_allowed(local->hw.wiphy,
+					    wdev_iter->iftype, 0, 1))
+			continue;
+
+		if (!ieee80211_sdata_uses_radio(sdata_iter, params->radio_idx))
+			continue;
+
+		params->iftype_num[wdev_iter->iftype]++;
+	}
+}
+
 int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
 				 const struct cfg80211_chan_def *chandef,
 				 enum ieee80211_chanctx_mode chanmode,
-				 u8 radar_detect)
+				 u8 radar_detect, int radio_idx)
 {
+	bool shared = chanmode == IEEE80211_CHANCTX_SHARED;
 	struct ieee80211_local *local = sdata->local;
-	struct ieee80211_sub_if_data *sdata_iter;
 	enum nl80211_iftype iftype = sdata->wdev.iftype;
 	struct ieee80211_chanctx *ctx;
 	int total = 1;
 	struct iface_combination_params params = {
 		.radar_detect = radar_detect,
-		.radio_idx = -1,
+		.radio_idx = radio_idx,
 	};
 
 	lockdep_assert_wiphy(local->hw.wiphy);
@@ -3978,6 +4058,8 @@ int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
 	if (iftype != NL80211_IFTYPE_UNSPECIFIED)
 		params.iftype_num[iftype] = 1;
 
+	ieee80211_fill_ifcomb_params(local, &params, shared ? chandef : NULL,
+				     sdata);
 	list_for_each_entry(ctx, &local->chanctx_list, list) {
 		if (ctx->replace_state == IEEE80211_CHANCTX_WILL_BE_REPLACED)
 			continue;
@@ -3987,28 +4069,9 @@ int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
 			params.num_different_channels++;
 			continue;
 		}
-		if (chandef && chanmode == IEEE80211_CHANCTX_SHARED &&
-		    cfg80211_chandef_compatible(chandef,
-						&ctx->conf.def))
-			continue;
 		params.num_different_channels++;
 	}
 
-	list_for_each_entry_rcu(sdata_iter, &local->interfaces, list) {
-		struct wireless_dev *wdev_iter;
-
-		wdev_iter = &sdata_iter->wdev;
-
-		if (sdata_iter == sdata ||
-		    !ieee80211_sdata_running(sdata_iter) ||
-		    cfg80211_iftype_allowed(local->hw.wiphy,
-					    wdev_iter->iftype, 0, 1))
-			continue;
-
-		params.iftype_num[wdev_iter->iftype]++;
-		total++;
-	}
-
 	if (total == 1 && !params.radar_detect)
 		return 0;
 
@@ -4025,30 +4088,17 @@ ieee80211_iter_max_chans(const struct ieee80211_iface_combination *c,
 					  c->num_different_channels);
 }
 
-int ieee80211_max_num_channels(struct ieee80211_local *local)
+int ieee80211_max_num_channels(struct ieee80211_local *local, int radio_idx)
 {
-	struct ieee80211_sub_if_data *sdata;
-	struct ieee80211_chanctx *ctx;
 	u32 max_num_different_channels = 1;
 	int err;
 	struct iface_combination_params params = {
-		.radio_idx = -1,
+		.radio_idx = radio_idx,
 	};
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
-	list_for_each_entry(ctx, &local->chanctx_list, list) {
-		if (ctx->replace_state == IEEE80211_CHANCTX_WILL_BE_REPLACED)
-			continue;
-
-		params.num_different_channels++;
-
-		params.radar_detect |=
-			ieee80211_chanctx_radar_detect(local, ctx);
-	}
-
-	list_for_each_entry_rcu(sdata, &local->interfaces, list)
-		params.iftype_num[sdata->wdev.iftype]++;
+	ieee80211_fill_ifcomb_params(local, &params, NULL, NULL);
 
 	err = cfg80211_iter_combinations(local->hw.wiphy, &params,
 					 ieee80211_iter_max_chans,
-- 
git-series 0.9.1


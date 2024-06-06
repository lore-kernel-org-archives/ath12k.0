Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6742C27C5E
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmZIy0qpabGlPgxqphOmYu7ybMcD+XW/n7nuwdYBhtc=; b=OIJfaidy8cjvtpf/uDM3jMUZCp
	roxoOyWwx+ePSzRKi/OYzw5wgbp0e7Nt9gxqR4b+mJq+4+KWLmVqPfvd8Ps83DfcAnRHYF9loAblj
	BEhW3jbiF3GeSmposOmKoiSpbBrVMDzFojuYolIT1PK7Pt939b2WelTsC8Z7qpFKXTGnNImVYbGy1
	oUyNH49f7UrcEXmFlkRCy0EmT0oG/wccbyF4a/wTgg8QxuHeeQGVV0FkICaj2M25530DgsL5C7gX3
	W2uEJJ5sQVy8yZA5pyMXGMVsJZ8J7kRje3X7vTzbx55BVOMXrDHPQBRWSBCbkpI12KRK5Cz6XD/cQ
	w+uBELkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHWJ-0000000As5P-1dn5
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 18:07:27 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHWD-0000000As1b-3DTi
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 18:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rmZIy0qpabGlPgxqphOmYu7ybMcD+XW/n7nuwdYBhtc=; b=kDQC4E/3aDjU9GObnnp6BDv9SB
	T5WVYlc6TFCRaswOtfeOYsXdt/DTq8VAyKYrxPlziWIwuayr7hJXsmwx6GNSNrsPQoPQjs2kN5Zad
	GuK92Iaxw0ZBKaEL26BT+LvnnPFf1C9QFSwR/Kqvhb2OBRnlj3J3naaPKJV9eoEh1Oao=;
Received: from p4ff130d0.dip0.t-ipconnect.de ([79.241.48.208] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFHW8-008aic-0o;
	Thu, 06 Jun 2024 20:07:16 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v3 8/8] wifi: mac80211: add wiphy radio assignment and validation
Date: Thu,  6 Jun 2024 20:07:13 +0200
Message-ID: <9b331a61b8d53284b044bc594cf9952c60164e5f.1717696995.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_110721_955257_4C5A3319 
X-CRM114-Status: GOOD (  13.68  )
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

Validate number of channels and interface combinations per radio.
Assign each channel context to a radio.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/mac80211/chan.c | 70 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index ac49c2c71d2b..257ee3b1100b 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -696,14 +696,15 @@ static struct ieee80211_chanctx *
 ieee80211_new_chanctx(struct ieee80211_local *local,
 		      const struct ieee80211_chan_req *chanreq,
 		      enum ieee80211_chanctx_mode mode,
-		      bool assign_on_failure)
+		      bool assign_on_failure,
+		      int radio_idx)
 {
 	struct ieee80211_chanctx *ctx;
 	int err;
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
-	ctx = ieee80211_alloc_chanctx(local, chanreq, mode, -1);
+	ctx = ieee80211_alloc_chanctx(local, chanreq, mode, radio_idx);
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
@@ -1060,6 +1061,24 @@ int ieee80211_link_unreserve_chanctx(struct ieee80211_link_data *link)
 	return 0;
 }
 
+static bool
+ieee80211_radio_freq_match(const struct wiphy_radio *radio,
+			   const struct ieee80211_chan_req *chanreq)
+{
+	const struct wiphy_radio_freq_range *r;
+	u32 freq;
+	int i;
+
+	freq = ieee80211_channel_to_khz(chanreq->oper.chan);
+	for (i = 0; i < radio->n_freq_range; i++) {
+		r = &radio->freq_range[i];
+		if (freq >= r->start_freq && freq <= r->end_freq)
+			return true;
+	}
+
+	return false;
+}
+
 static struct ieee80211_chanctx *
 ieee80211_replace_chanctx(struct ieee80211_local *local,
 			  const struct ieee80211_chan_req *chanreq,
@@ -1067,6 +1086,8 @@ ieee80211_replace_chanctx(struct ieee80211_local *local,
 			  struct ieee80211_chanctx *curr_ctx)
 {
 	struct ieee80211_chanctx *new_ctx, *ctx;
+	struct wiphy *wiphy = local->hw.wiphy;
+	const struct wiphy_radio *radio;
 
 	if (!curr_ctx || (curr_ctx->replace_state ==
 			  IEEE80211_CHANCTX_WILL_BE_REPLACED) ||
@@ -1096,6 +1117,12 @@ ieee80211_replace_chanctx(struct ieee80211_local *local,
 			if (!list_empty(&ctx->reserved_links))
 				continue;
 
+			if (ctx->conf.radio_idx >= 0) {
+					radio = &wiphy->radio[ctx->conf.radio_idx];
+					if (!ieee80211_radio_freq_match(radio, chanreq))
+							continue;
+			}
+
 			curr_ctx = ctx;
 			break;
 		}
@@ -1125,6 +1152,34 @@ ieee80211_replace_chanctx(struct ieee80211_local *local,
 	return new_ctx;
 }
 
+static bool
+ieee80211_find_available_radio(struct ieee80211_local *local,
+			       const struct ieee80211_chan_req *chanreq,
+			       int *radio_idx)
+{
+	struct wiphy *wiphy = local->hw.wiphy;
+	const struct wiphy_radio *radio;
+	int i;
+
+	*radio_idx = -1;
+	if (!wiphy->n_radio)
+		return true;
+
+	for (i = 0; i < wiphy->n_radio; i++) {
+		radio = &wiphy->radio[i];
+		if (!ieee80211_radio_freq_match(radio, chanreq))
+			continue;
+
+		if (!ieee80211_can_create_new_chanctx(local, i))
+			continue;
+
+		*radio_idx = i;
+		return true;
+	}
+
+	return false;
+}
+
 int ieee80211_link_reserve_chanctx(struct ieee80211_link_data *link,
 				   const struct ieee80211_chan_req *chanreq,
 				   enum ieee80211_chanctx_mode mode,
@@ -1133,6 +1188,7 @@ int ieee80211_link_reserve_chanctx(struct ieee80211_link_data *link,
 	struct ieee80211_sub_if_data *sdata = link->sdata;
 	struct ieee80211_local *local = sdata->local;
 	struct ieee80211_chanctx *new_ctx, *curr_ctx;
+	int radio_idx;
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
@@ -1142,9 +1198,10 @@ int ieee80211_link_reserve_chanctx(struct ieee80211_link_data *link,
 
 	new_ctx = ieee80211_find_reservation_chanctx(local, chanreq, mode);
 	if (!new_ctx) {
-		if (ieee80211_can_create_new_chanctx(local, -1))
+		if (ieee80211_can_create_new_chanctx(local, -1) &&
+		    ieee80211_find_available_radio(local, chanreq, &radio_idx))
 			new_ctx = ieee80211_new_chanctx(local, chanreq, mode,
-							false);
+							false, radio_idx);
 		else
 			new_ctx = ieee80211_replace_chanctx(local, chanreq,
 							    mode, curr_ctx);
@@ -1755,6 +1812,7 @@ int _ieee80211_link_use_channel(struct ieee80211_link_data *link,
 	struct ieee80211_chanctx *ctx;
 	u8 radar_detect_width = 0;
 	bool reserved = false;
+	int radio_idx;
 	int ret;
 
 	lockdep_assert_wiphy(local->hw.wiphy);
@@ -1785,9 +1843,11 @@ int _ieee80211_link_use_channel(struct ieee80211_link_data *link,
 	/* Note: context is now reserved */
 	if (ctx)
 		reserved = true;
+	else if (!ieee80211_find_available_radio(local, chanreq, &radio_idx))
+		ctx = ERR_PTR(-EBUSY);
 	else
 		ctx = ieee80211_new_chanctx(local, chanreq, mode,
-					    assign_on_failure);
+					    assign_on_failure, radio_idx);
 	if (IS_ERR(ctx)) {
 		ret = PTR_ERR(ctx);
 		goto out;
-- 
git-series 0.9.1


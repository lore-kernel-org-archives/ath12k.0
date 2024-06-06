Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D43FC27C77
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9Ks4PmBveZAlHQui94XwD5dy02OUcuU876KxxPP2nc=; b=EE46HAfhrjEGWifuZ0M+94osOH
	oAF74JgMlgMk4CzfPB48hSTNExbKZn+SzxA7aGHRFXUHsCKOLH6u3phYu2aykJT0hqU73WCohyeg7
	B3aMBM+fgAnXoCjJ6Wma8Wl/9k8ZGJQJLrMxPzeF4ZUFSqE9bYFp0gPwfW0K5/sbUubbiEa6NsXzm
	Ixv95mniZn3ka3xnBidEKqQ4m6kwgD+BGy21HY0Js53dssyQ8qPvqsh9zTWkEEwbQrA5zpneQvx8f
	S/J3CavQFKY7kIVXfjDjOokxZ9Y51E2PPLox+/2iuuJ3+/RPXhh3QzIQFd6e8hC/APVKtZ6x2xzG0
	9DUN/Esg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHWL-0000000As6S-18PQ
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 18:07:29 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHWE-0000000As1m-25zl
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 18:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H9Ks4PmBveZAlHQui94XwD5dy02OUcuU876KxxPP2nc=; b=YkOhsdF5HY2cDW0im9bZTLlfc9
	nzbKUIMaO0wjL1uXnAOGZF16xZO84QyIM0wC2/0lb27xFzlBQRQ0Hee8ZJxLeII3NyYOXb2XEkHGg
	cjiCHKjN74KwjMQWetfCUfIpgWKkZOh/18YYjtzNiHVk8BrCicLLZNKuTLTzJE9707m0=;
Received: from p4ff130d0.dip0.t-ipconnect.de ([79.241.48.208] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFHW7-008aic-37;
	Thu, 06 Jun 2024 20:07:16 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v3 7/8] wifi: mac80211: move code in ieee80211_link_reserve_chanctx to a helper
Date: Thu,  6 Jun 2024 20:07:12 +0200
Message-ID: <2d403d1c3bb29f84a74543561326fcdbfbd8e983.1717696995.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_110722_552391_318EB5AF 
X-CRM114-Status: GOOD (  16.08  )
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

Reduces indentation in preparation for further changes

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/mac80211/chan.c | 141 ++++++++++++++++++++++-----------------------
 1 file changed, 72 insertions(+), 69 deletions(-)

diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index 0e899c07bc2b..ac49c2c71d2b 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -1060,6 +1060,71 @@ int ieee80211_link_unreserve_chanctx(struct ieee80211_link_data *link)
 	return 0;
 }
 
+static struct ieee80211_chanctx *
+ieee80211_replace_chanctx(struct ieee80211_local *local,
+			  const struct ieee80211_chan_req *chanreq,
+			  enum ieee80211_chanctx_mode mode,
+			  struct ieee80211_chanctx *curr_ctx)
+{
+	struct ieee80211_chanctx *new_ctx, *ctx;
+
+	if (!curr_ctx || (curr_ctx->replace_state ==
+			  IEEE80211_CHANCTX_WILL_BE_REPLACED) ||
+	    !list_empty(&curr_ctx->reserved_links)) {
+		/*
+		 * Another link already requested this context for a
+		 * reservation. Find another one hoping all links assigned
+		 * to it will also switch soon enough.
+		 *
+		 * TODO: This needs a little more work as some cases
+		 * (more than 2 chanctx capable devices) may fail which could
+		 * otherwise succeed provided some channel context juggling was
+		 * performed.
+		 *
+		 * Consider ctx1..3, link1..6, each ctx has 2 links. link1 and
+		 * link2 from ctx1 request new different chandefs starting 2
+		 * in-place reserations with ctx4 and ctx5 replacing ctx1 and
+		 * ctx2 respectively. Next link5 and link6 from ctx3 reserve
+		 * ctx4. If link3 and link4 remain on ctx2 as they are then this
+		 * fails unless `replace_ctx` from ctx5 is replaced with ctx3.
+		 */
+		list_for_each_entry(ctx, &local->chanctx_list, list) {
+			if (ctx->replace_state !=
+			    IEEE80211_CHANCTX_REPLACE_NONE)
+				continue;
+
+			if (!list_empty(&ctx->reserved_links))
+				continue;
+
+			curr_ctx = ctx;
+			break;
+		}
+	}
+
+	/*
+	 * If that's true then all available contexts already have reservations
+	 * and cannot be used.
+	 */
+	if (!curr_ctx || (curr_ctx->replace_state ==
+			  IEEE80211_CHANCTX_WILL_BE_REPLACED) ||
+	    !list_empty(&curr_ctx->reserved_links))
+		return ERR_PTR(-EBUSY);
+
+	new_ctx = ieee80211_alloc_chanctx(local, chanreq, mode, -1);
+	if (!new_ctx)
+		return ERR_PTR(-ENOMEM);
+
+	new_ctx->replace_ctx = curr_ctx;
+	new_ctx->replace_state = IEEE80211_CHANCTX_REPLACES_OTHER;
+
+	curr_ctx->replace_ctx = new_ctx;
+	curr_ctx->replace_state = IEEE80211_CHANCTX_WILL_BE_REPLACED;
+
+	list_add_rcu(&new_ctx->list, &local->chanctx_list);
+
+	return new_ctx;
+}
+
 int ieee80211_link_reserve_chanctx(struct ieee80211_link_data *link,
 				   const struct ieee80211_chan_req *chanreq,
 				   enum ieee80211_chanctx_mode mode,
@@ -1067,7 +1132,7 @@ int ieee80211_link_reserve_chanctx(struct ieee80211_link_data *link,
 {
 	struct ieee80211_sub_if_data *sdata = link->sdata;
 	struct ieee80211_local *local = sdata->local;
-	struct ieee80211_chanctx *new_ctx, *curr_ctx, *ctx;
+	struct ieee80211_chanctx *new_ctx, *curr_ctx;
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
@@ -1077,76 +1142,14 @@ int ieee80211_link_reserve_chanctx(struct ieee80211_link_data *link,
 
 	new_ctx = ieee80211_find_reservation_chanctx(local, chanreq, mode);
 	if (!new_ctx) {
-		if (ieee80211_can_create_new_chanctx(local, -1)) {
+		if (ieee80211_can_create_new_chanctx(local, -1))
 			new_ctx = ieee80211_new_chanctx(local, chanreq, mode,
 							false);
-			if (IS_ERR(new_ctx))
-				return PTR_ERR(new_ctx);
-		} else {
-			if (!curr_ctx ||
-			    (curr_ctx->replace_state ==
-			     IEEE80211_CHANCTX_WILL_BE_REPLACED) ||
-			    !list_empty(&curr_ctx->reserved_links)) {
-				/*
-				 * Another link already requested this context
-				 * for a reservation. Find another one hoping
-				 * all links assigned to it will also switch
-				 * soon enough.
-				 *
-				 * TODO: This needs a little more work as some
-				 * cases (more than 2 chanctx capable devices)
-				 * may fail which could otherwise succeed
-				 * provided some channel context juggling was
-				 * performed.
-				 *
-				 * Consider ctx1..3, link1..6, each ctx has 2
-				 * links. link1 and link2 from ctx1 request new
-				 * different chandefs starting 2 in-place
-				 * reserations with ctx4 and ctx5 replacing
-				 * ctx1 and ctx2 respectively. Next link5 and
-				 * link6 from ctx3 reserve ctx4. If link3 and
-				 * link4 remain on ctx2 as they are then this
-				 * fails unless `replace_ctx` from ctx5 is
-				 * replaced with ctx3.
-				 */
-				list_for_each_entry(ctx, &local->chanctx_list,
-						    list) {
-					if (ctx->replace_state !=
-					    IEEE80211_CHANCTX_REPLACE_NONE)
-						continue;
-
-					if (!list_empty(&ctx->reserved_links))
-						continue;
-
-					curr_ctx = ctx;
-					break;
-				}
-			}
-
-			/*
-			 * If that's true then all available contexts already
-			 * have reservations and cannot be used.
-			 */
-			if (!curr_ctx ||
-			    (curr_ctx->replace_state ==
-			     IEEE80211_CHANCTX_WILL_BE_REPLACED) ||
-			    !list_empty(&curr_ctx->reserved_links))
-				return -EBUSY;
-
-			new_ctx = ieee80211_alloc_chanctx(local, chanreq, mode, -1);
-			if (!new_ctx)
-				return -ENOMEM;
-
-			new_ctx->replace_ctx = curr_ctx;
-			new_ctx->replace_state =
-					IEEE80211_CHANCTX_REPLACES_OTHER;
-
-			curr_ctx->replace_ctx = new_ctx;
-			curr_ctx->replace_state =
-					IEEE80211_CHANCTX_WILL_BE_REPLACED;
-
-			list_add_rcu(&new_ctx->list, &local->chanctx_list);
-		}
+		else
+			new_ctx = ieee80211_replace_chanctx(local, chanreq,
+							    mode, curr_ctx);
+		if (IS_ERR(new_ctx))
+			return PTR_ERR(new_ctx);
 	}
 
 	list_add(&link->reserved_chanctx_list, &new_ctx->reserved_links);
-- 
git-series 0.9.1


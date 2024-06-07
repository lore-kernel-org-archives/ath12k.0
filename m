Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3C7C27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 16:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnRLGsQdHzBIFwy2a7a4pMb4QdK2fWR40v5UFjKAhTw=; b=hWe3upOxMSDUshpczXwlsALkqU
	UVvmye6C6ZXT2FmmkSv4pz7CH9Iw6b9rjaLjKDPu4+Nd4QcnMym914uTaarE6rabhQuIfokOgusSy
	fOS4n3EP3eBK1npp66TBJ3/POYlKzNFsLp/w2bbchlAyltf9amsjF2X+qag9OHvEmC1xACMzTpNkJ
	8vLfdo1WT5ItXSzAnK+32/vYPbJfZEMSOYYDkyUhv9RB0LTb5Qa/WsYaGgPDIcu5ylnqOX6GEhoL5
	cB/A3g4MOHdbPfHFBDEgpFyZBb+wRLZMABJ4RMKx55gWICcDnhrQD0wEAsZPxotB/Fcdsr5hL8c7v
	7oY8EkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6O-0000000Eqmw-3BJ7
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 16:06:04 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6H-0000000EqgS-2Fr6
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 16:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BnRLGsQdHzBIFwy2a7a4pMb4QdK2fWR40v5UFjKAhTw=; b=CdOGA7UGs62JgEBz9UhuNTowLb
	LiR5j2+ZHKeuyrB+WCAvc3Yjzpb/BAHVmnJLxtypAyr0x1VwN1w178EXRYgag+hkaOEa2IOPVooI3
	4IaYtgEZ9EA0sgqDDfum1YXrM8OtlFjtJIL2k4WP/In1eJvBjipzQNkcKkTSgV3BA0PM=;
Received: from p4ff13226.dip0.t-ipconnect.de ([79.241.50.38] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFc6B-008xPc-18;
	Fri, 07 Jun 2024 18:05:51 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v4 6/9] wifi: mac80211: add radio index to ieee80211_chanctx_conf
Date: Fri,  7 Jun 2024 18:05:45 +0200
Message-ID: <6a568ace507286c97a60e2f7cb809c0a31f18ecf.1717776325.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.0af6292ae793f7b9927ab6583791b58daedc9104.1717776325.git-series.nbd@nbd.name>
References: <cover.0af6292ae793f7b9927ab6583791b58daedc9104.1717776325.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_090557_737233_8C39F352 
X-CRM114-Status: GOOD (  10.43  )
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

Will be used to explicitly assign a channel context to a wiphy radio.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 include/net/mac80211.h | 2 ++
 net/mac80211/chan.c    | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index ecfa65ade226..98394970c991 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -250,6 +250,7 @@ struct ieee80211_chan_req {
  * @min_def: the minimum channel definition currently required.
  * @ap: the channel definition the AP actually is operating as,
  *	for use with (wider bandwidth) OFDMA
+ * @radio_idx: index of the wiphy radio used used for this channel
  * @rx_chains_static: The number of RX chains that must always be
  *	active on the channel to receive MIMO transmissions
  * @rx_chains_dynamic: The number of RX chains that must be enabled
@@ -264,6 +265,7 @@ struct ieee80211_chanctx_conf {
 	struct cfg80211_chan_def min_def;
 	struct cfg80211_chan_def ap;
 
+	int radio_idx;
 	u8 rx_chains_static, rx_chains_dynamic;
 
 	bool radar_enabled;
diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index ec16d7676088..574ae961a7cf 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -638,7 +638,8 @@ ieee80211_chanctx_radar_required(struct ieee80211_local *local,
 static struct ieee80211_chanctx *
 ieee80211_alloc_chanctx(struct ieee80211_local *local,
 			const struct ieee80211_chan_req *chanreq,
-			enum ieee80211_chanctx_mode mode)
+			enum ieee80211_chanctx_mode mode,
+			int radio_idx)
 {
 	struct ieee80211_chanctx *ctx;
 
@@ -656,6 +657,7 @@ ieee80211_alloc_chanctx(struct ieee80211_local *local,
 	ctx->conf.rx_chains_dynamic = 1;
 	ctx->mode = mode;
 	ctx->conf.radar_enabled = false;
+	ctx->conf.radio_idx = radio_idx;
 	_ieee80211_recalc_chanctx_min_def(local, ctx, NULL);
 
 	return ctx;
@@ -696,7 +698,7 @@ ieee80211_new_chanctx(struct ieee80211_local *local,
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
-	ctx = ieee80211_alloc_chanctx(local, chanreq, mode);
+	ctx = ieee80211_alloc_chanctx(local, chanreq, mode, -1);
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
@@ -1126,7 +1128,7 @@ int ieee80211_link_reserve_chanctx(struct ieee80211_link_data *link,
 			    !list_empty(&curr_ctx->reserved_links))
 				return -EBUSY;
 
-			new_ctx = ieee80211_alloc_chanctx(local, chanreq, mode);
+			new_ctx = ieee80211_alloc_chanctx(local, chanreq, mode, -1);
 			if (!new_ctx)
 				return -ENOMEM;
 
-- 
git-series 0.9.1


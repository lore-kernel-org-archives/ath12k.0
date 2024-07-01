Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA996C30653
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tojz4OudxD5DBp2PA2+KRIAkcR1dJrFxmA0POn6n400=; b=HubKWyuIt+jxcus19BNvMQ/Vpj
	5SN71nDIUypYXt2r/4EB4D3+Gh/swMksl6GiR4+z+idKBklN5k8IVxLtsMizQZ9osTF/xy4iTpZak
	rks+54r4gEOYWlRiB++Mo7XDtmH9w3fOkrny7d8fY8I4L4EiN64JdLfeB6O3PDZKU39UJ8+QEuCua
	IJqPxfN2SfYdhv8/YySokqVlWutssP6RlyKFAkKG0IBxFM6QHqdpEzOeLVSVTwkOkWsd1VPf8pmw/
	CS71P2/SmbctLFzNz2V3KosMh9FBTNTO7BqSIvR3pkVXsknhnhdDHVgs6PKkQ9a3vx1YohH10K3Sz
	TdoFmiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHmq-00000003g46-1s1Z
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 14:13:44 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHmi-00000003fwm-0ndN
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 14:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Tojz4OudxD5DBp2PA2+KRIAkcR1dJrFxmA0POn6n400=; b=jiorGqoZi+CSQ84RJtKJ1bkpuA
	5XUXfU179hwSeNR5tKPC35Ju0uTOkYCkCe9C2Ith5clNJJ4y0tRWNEidk9lSTxTeO4huX9jFbeC0m
	68MtsTDJ9UrPCBkln05wkQVNYkPHRZFx5eoG0tI4weOmkOC1JjW2BjGxFUBobQytGNt8=;
Received: from p4ff13dca.dip0.t-ipconnect.de ([79.241.61.202] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sOHma-001Qfu-0J;
	Mon, 01 Jul 2024 16:13:28 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [PATCH v3 06/10] wifi: mac80211: add radio index to ieee80211_chanctx_conf
Date: Mon,  1 Jul 2024 16:13:21 +0200
Message-ID: <5e82c58a18e6684537415a5cfd17a55de90bdcbc.1719843147.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a50ea6fd728e14cfdaafeb9cfac003364713c8e7.1719843147.git-series.nbd@nbd.name>
References: <cover.a50ea6fd728e14cfdaafeb9cfac003364713c8e7.1719843147.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_071336_812432_B73C54F4 
X-CRM114-Status: GOOD (  10.97  )
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
index bd0f8aefa797..e78ccbe38d6d 100644
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
index 06a65dc6f6c6..6c4d02cb07bb 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -656,7 +656,8 @@ ieee80211_chanctx_radar_required(struct ieee80211_local *local,
 static struct ieee80211_chanctx *
 ieee80211_alloc_chanctx(struct ieee80211_local *local,
 			const struct ieee80211_chan_req *chanreq,
-			enum ieee80211_chanctx_mode mode)
+			enum ieee80211_chanctx_mode mode,
+			int radio_idx)
 {
 	struct ieee80211_chanctx *ctx;
 
@@ -674,6 +675,7 @@ ieee80211_alloc_chanctx(struct ieee80211_local *local,
 	ctx->conf.rx_chains_dynamic = 1;
 	ctx->mode = mode;
 	ctx->conf.radar_enabled = false;
+	ctx->conf.radio_idx = radio_idx;
 	_ieee80211_recalc_chanctx_min_def(local, ctx, NULL, false);
 
 	return ctx;
@@ -714,7 +716,7 @@ ieee80211_new_chanctx(struct ieee80211_local *local,
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
-	ctx = ieee80211_alloc_chanctx(local, chanreq, mode);
+	ctx = ieee80211_alloc_chanctx(local, chanreq, mode, -1);
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
@@ -1155,7 +1157,7 @@ int ieee80211_link_reserve_chanctx(struct ieee80211_link_data *link,
 			    !list_empty(&curr_ctx->reserved_links))
 				return -EBUSY;
 
-			new_ctx = ieee80211_alloc_chanctx(local, chanreq, mode);
+			new_ctx = ieee80211_alloc_chanctx(local, chanreq, mode, -1);
 			if (!new_ctx)
 				return -ENOMEM;
 
-- 
git-series 0.9.1


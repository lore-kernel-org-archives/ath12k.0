Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1CAC27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jO2vhMaVvl/vQmUG+SrrjOxh6ONrrAkIS1HZcuEVUY8=; b=J89ROnSg1XiYbMC5tUcZA2UI9V
	7f1JEiyoyKYGJOjwTXDrqTb6izy2dhjL81cpM9uJx/w57J5DiQextGdLJWHkYgTB7I2aCqS70C1dL
	3ECljRjIvzw7EeLhMtdtcMwqKp2hx8zJlzYozyZ4phcpGCtywNaZx1bca3JcYmmtsF9XjoE1RsOS6
	MUs8ywAF+Hjkeyum+ftQrb/hNFSAi2B82bgyO86B34TukNSc/azDRTCHAJeUbWyTrQo42iHUyWtPu
	XM4WSbI9UX2pMFMeB+xhur8Y3tlj11hCUhMG7OupwqUc7OFtdzo+LZkC8Ijbua8z11Onbyy7fhaFs
	mdiNbbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6L-0000000Eqkd-2hYI
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 16:06:01 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6H-0000000EqgQ-2FY2
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 16:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jO2vhMaVvl/vQmUG+SrrjOxh6ONrrAkIS1HZcuEVUY8=; b=b126mnQ33d17gws1JCxBB5FPGF
	WyGpdA87O6IQcFho8SAUALQqhrxaeqh0Hq1T27lAoSA9ekXdvg1zO8jMaA6oUt2hHewVGYxtMpCnA
	u1VfOUZrbEOiGo8wLzx55TQllP8iLxM2sxHdjmf78aW8KvJPatC18ckd8E/9Z1PqhQG4=;
Received: from p4ff13226.dip0.t-ipconnect.de ([79.241.50.38] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFc69-008xPc-2t;
	Fri, 07 Jun 2024 18:05:49 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v4 1/9] wifi: nl80211: split helper function from nl80211_put_iface_combinations
Date: Fri,  7 Jun 2024 18:05:40 +0200
Message-ID: <2160a27fc614e2a9a3cba9902e14d305db15530e.1717776325.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.0af6292ae793f7b9927ab6583791b58daedc9104.1717776325.git-series.nbd@nbd.name>
References: <cover.0af6292ae793f7b9927ab6583791b58daedc9104.1717776325.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_090557_723968_C5FCDDEE 
X-CRM114-Status: GOOD (  12.86  )
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

Create a helper function that puts the data from struct
ieee80211_iface_combination to a nl80211 message.
This will be used for adding per-radio interface combination data.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/wireless/nl80211.c | 111 ++++++++++++++++++++++--------------------
 1 file changed, 59 insertions(+), 52 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 8ff5f79d446a..7b0ba0fff082 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1622,71 +1622,78 @@ static int nl80211_put_iftypes(struct sk_buff *msg, u32 attr, u16 ifmodes)
 	return -ENOBUFS;
 }
 
-static int nl80211_put_iface_combinations(struct wiphy *wiphy,
-					  struct sk_buff *msg,
-					  bool large)
+static int nl80211_put_ifcomb_data(struct sk_buff *msg, bool large, int idx,
+				   const struct ieee80211_iface_combination *c)
 {
-	struct nlattr *nl_combis;
-	int i, j;
+	struct nlattr *nl_combi, *nl_limits;
+	int i;
 
-	nl_combis = nla_nest_start_noflag(msg,
-					  NL80211_ATTR_INTERFACE_COMBINATIONS);
-	if (!nl_combis)
+	nl_combi = nla_nest_start_noflag(msg, idx);
+	if (!nl_combi)
 		goto nla_put_failure;
 
-	for (i = 0; i < wiphy->n_iface_combinations; i++) {
-		const struct ieee80211_iface_combination *c;
-		struct nlattr *nl_combi, *nl_limits;
+	nl_limits = nla_nest_start_noflag(msg, NL80211_IFACE_COMB_LIMITS);
+	if (!nl_limits)
+		goto nla_put_failure;
 
-		c = &wiphy->iface_combinations[i];
+	for (i = 0; i < c->n_limits; i++) {
+		struct nlattr *nl_limit;
 
-		nl_combi = nla_nest_start_noflag(msg, i + 1);
-		if (!nl_combi)
+		nl_limit = nla_nest_start_noflag(msg, i + 1);
+		if (!nl_limit)
 			goto nla_put_failure;
-
-		nl_limits = nla_nest_start_noflag(msg,
-						  NL80211_IFACE_COMB_LIMITS);
-		if (!nl_limits)
+		if (nla_put_u32(msg, NL80211_IFACE_LIMIT_MAX, c->limits[i].max))
 			goto nla_put_failure;
+		if (nl80211_put_iftypes(msg, NL80211_IFACE_LIMIT_TYPES,
+					c->limits[i].types))
+			goto nla_put_failure;
+		nla_nest_end(msg, nl_limit);
+	}
 
-		for (j = 0; j < c->n_limits; j++) {
-			struct nlattr *nl_limit;
+	nla_nest_end(msg, nl_limits);
 
-			nl_limit = nla_nest_start_noflag(msg, j + 1);
-			if (!nl_limit)
-				goto nla_put_failure;
-			if (nla_put_u32(msg, NL80211_IFACE_LIMIT_MAX,
-					c->limits[j].max))
-				goto nla_put_failure;
-			if (nl80211_put_iftypes(msg, NL80211_IFACE_LIMIT_TYPES,
-						c->limits[j].types))
-				goto nla_put_failure;
-			nla_nest_end(msg, nl_limit);
-		}
+	if (c->beacon_int_infra_match &&
+	    nla_put_flag(msg, NL80211_IFACE_COMB_STA_AP_BI_MATCH))
+		goto nla_put_failure;
+	if (nla_put_u32(msg, NL80211_IFACE_COMB_NUM_CHANNELS,
+			c->num_different_channels) ||
+	    nla_put_u32(msg, NL80211_IFACE_COMB_MAXNUM,
+			c->max_interfaces))
+		goto nla_put_failure;
+	if (large &&
+	    (nla_put_u32(msg, NL80211_IFACE_COMB_RADAR_DETECT_WIDTHS,
+			c->radar_detect_widths) ||
+	     nla_put_u32(msg, NL80211_IFACE_COMB_RADAR_DETECT_REGIONS,
+			c->radar_detect_regions)))
+		goto nla_put_failure;
+	if (c->beacon_int_min_gcd &&
+	    nla_put_u32(msg, NL80211_IFACE_COMB_BI_MIN_GCD,
+			c->beacon_int_min_gcd))
+		goto nla_put_failure;
 
-		nla_nest_end(msg, nl_limits);
+	nla_nest_end(msg, nl_combi);
 
-		if (c->beacon_int_infra_match &&
-		    nla_put_flag(msg, NL80211_IFACE_COMB_STA_AP_BI_MATCH))
-			goto nla_put_failure;
-		if (nla_put_u32(msg, NL80211_IFACE_COMB_NUM_CHANNELS,
-				c->num_different_channels) ||
-		    nla_put_u32(msg, NL80211_IFACE_COMB_MAXNUM,
-				c->max_interfaces))
-			goto nla_put_failure;
-		if (large &&
-		    (nla_put_u32(msg, NL80211_IFACE_COMB_RADAR_DETECT_WIDTHS,
-				c->radar_detect_widths) ||
-		     nla_put_u32(msg, NL80211_IFACE_COMB_RADAR_DETECT_REGIONS,
-				c->radar_detect_regions)))
-			goto nla_put_failure;
-		if (c->beacon_int_min_gcd &&
-		    nla_put_u32(msg, NL80211_IFACE_COMB_BI_MIN_GCD,
-				c->beacon_int_min_gcd))
-			goto nla_put_failure;
+	return 0;
+nla_put_failure:
+	return -ENOBUFS;
+}
 
-		nla_nest_end(msg, nl_combi);
-	}
+static int nl80211_put_iface_combinations(struct wiphy *wiphy,
+					  struct sk_buff *msg,
+					  bool large)
+{
+	struct nlattr *nl_combis;
+	int i;
+
+	nl_combis = nla_nest_start_noflag(msg,
+					  NL80211_ATTR_INTERFACE_COMBINATIONS);
+	if (!nl_combis)
+		goto nla_put_failure;
+
+	for (i = 0; i < wiphy->n_iface_combinations; i++)
+		if (nl80211_put_ifcomb_data(msg, large, i + 1,
+					    &wiphy->iface_combinations[i]))
+			goto nla_put_failure;
 
 	nla_nest_end(msg, nl_combis);
 
-- 
git-series 0.9.1


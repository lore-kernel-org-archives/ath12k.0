Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7553DC3065F
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBRjVM0iFUMY2+yuroIWllgnt6Y3JiWSjurhpm0ox9w=; b=uJagdy+nqRhKZtOULiSoL9xGzB
	/dbdCjtrN8g4DnDkxvR0J/60j1HbG1+qOOrZrSrhBWnzFmJUXis/EUXzv8hGjPsFNw5eZCCrf1VfS
	lusUzsWt9sgwZhWNlqjqjDjhhU8u4zQBjpfBN3OsgqJwYf55UZOIBKCj7BO6Ql3j7G+ls7VCNrJoX
	Z6Q0NGSc/BqItec7dgY8CAUZuNOjOd1tXVANcMc3z42yvbqo6GdaCOGmQsLjtjl1pcBEaFXQ7CkCt
	RBTRrfiFTTBLOzA++zpNBLkZW4vfUY2BrbAIpgpAnNUOTOaDaFx61aaoeiNFcfsnXa23ehDejLt0o
	Wu/vwQ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHmr-00000003g4m-0lSl
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 14:13:45 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHmi-00000003fwz-45iv
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 14:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SBRjVM0iFUMY2+yuroIWllgnt6Y3JiWSjurhpm0ox9w=; b=i27Fcr+3OEjPr9BoSrHhkUrDkg
	S4863mWeh/FyD5lzbhEREEYN3jbg0PAPDmkHZsGf9JpvaDvtbRJewTmVK/gGzr55buuAigJSRh/l8
	jL5fGhv6a9qoepVHvR8Dn/Z4K9lZDWDX8EbxfiZ/E8n1TmOcVSizEw5BjulJg5l9hjOU=;
Received: from p4ff13dca.dip0.t-ipconnect.de ([79.241.61.202] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sOHmZ-001Qfu-1r;
	Mon, 01 Jul 2024 16:13:27 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [PATCH v3 04/10] wifi: cfg80211: add helper for checking if a chandef is valid on a radio
Date: Mon,  1 Jul 2024 16:13:19 +0200
Message-ID: <eb4cfb174f0241d69842feee7fc30d8af4fb0371.1719843147.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a50ea6fd728e14cfdaafeb9cfac003364713c8e7.1719843147.git-series.nbd@nbd.name>
References: <cover.a50ea6fd728e14cfdaafeb9cfac003364713c8e7.1719843147.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_071337_240971_8B73F6AA 
X-CRM114-Status: GOOD (  10.27  )
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

Check if the full channel width is in the radio's frequency range.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 include/net/cfg80211.h |  9 +++++++++
 net/wireless/util.c    | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index bb3b803e5468..f39e4d1b2793 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6507,6 +6507,15 @@ static inline bool cfg80211_channel_is_psc(struct ieee80211_channel *chan)
 }
 
 /**
+ * cfg80211_radio_chandef_valid - Check if the radio supports the chandef
+ *
+ * @radio: wiphy radio
+ * @chandef: chandef for current channel
+ */
+bool cfg80211_radio_chandef_valid(const struct wiphy_radio *radio,
+				  const struct cfg80211_chan_def *chandef);
+
+/**
  * ieee80211_get_response_rate - get basic rate for a given rate
  *
  * @sband: the band to look for rates in
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 2492f259621f..9a7c3adc8a3b 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2886,3 +2886,38 @@ cfg80211_get_iftype_ext_capa(struct wiphy *wiphy, enum nl80211_iftype type)
 	return NULL;
 }
 EXPORT_SYMBOL(cfg80211_get_iftype_ext_capa);
+
+static bool
+ieee80211_radio_freq_range_valid(const struct wiphy_radio *radio,
+				 u32 freq, u32 width)
+{
+	const struct wiphy_radio_freq_range *r;
+	int i;
+
+	for (i = 0; i < radio->n_freq_range; i++) {
+		r = &radio->freq_range[i];
+		if (freq - width / 2 >= r->start_freq &&
+		    freq + width / 2 <= r->end_freq)
+			return true;
+	}
+
+	return false;
+}
+
+bool cfg80211_radio_chandef_valid(const struct wiphy_radio *radio,
+				  const struct cfg80211_chan_def *chandef)
+{
+	u32 freq, width;
+
+	freq = ieee80211_chandef_to_khz(chandef);
+	width = nl80211_chan_width_to_mhz(chandef->width);
+	if (!ieee80211_radio_freq_range_valid(radio, freq, width))
+		return false;
+
+	freq = MHZ_TO_KHZ(chandef->center_freq2);
+	if (freq && !ieee80211_radio_freq_range_valid(radio, freq, width))
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL(cfg80211_radio_chandef_valid);
-- 
git-series 0.9.1


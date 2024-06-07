Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91198C27C7B
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8GPMQ3+e8e1LRdC4JDZxr/6CKNOR5J/wAjrc6pDDYw=; b=fXDflw+K8api8g3aCIFe0KG+1F
	j+RVEs8SyTAfM7wPdsQzoKptaq2DUv8T5P7Ezv0Z2W8xyBK2ZBlmiQ4k2k+gdViSf22u3Ssw7lK2K
	ZarqWRINWqm4FDr4cd/gnq7jIeh3G57sT1V6fIyDOnJgPpdQRf/Cfx7mac9S0KyxGdjpFkZWZHdg1
	w/faBSnrzEajThWUUAKZI/KIUQpkOjBoZ61MdiXFij/iHjzm73pKaa4UulrYPJT+Qndm20jQiv1MW
	M4oBQd2nGs0UN4yvCl0x12+5AYT1Y++pOPfcWuuDNsJyR1y+AvD1daIbb8w74IuP7CzgJN8idXUv5
	qxNNGGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6R-0000000EqpE-0weY
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 16:06:07 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6M-0000000EqkW-1ZtB
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 16:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Z8GPMQ3+e8e1LRdC4JDZxr/6CKNOR5J/wAjrc6pDDYw=; b=BLKaVbINDfgTuffRdx2V4DWgI/
	PIFnNebtJQAC173OMtQljM7AMpvvbqavmJjiIfFu/JKWksUHYTcYsLCKjq1NJo2q9mmreW/mQDm1d
	mrXaq9UKuFJs2zIXdAq7T955lzl/L4IWmwlFsQOVsp0/HB+cFLtky8ROrUuTSvDbob80=;
Received: from p4ff13226.dip0.t-ipconnect.de ([79.241.50.38] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFc6A-008xPc-2g;
	Fri, 07 Jun 2024 18:05:50 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v4 4/9] wifi: cfg80211: add helper for checking if a chandef is valid on a radio
Date: Fri,  7 Jun 2024 18:05:43 +0200
Message-ID: <2b6364366796642a1018272fc63ee69a56339c17.1717776325.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.0af6292ae793f7b9927ab6583791b58daedc9104.1717776325.git-series.nbd@nbd.name>
References: <cover.0af6292ae793f7b9927ab6583791b58daedc9104.1717776325.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_090602_500287_BDAC1888 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
index 307b77e166c1..6ecc7f914bae 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6488,6 +6488,15 @@ static inline bool cfg80211_channel_is_psc(struct ieee80211_channel *chan)
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
index 3da04ceb6054..a0bbb76be502 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2879,3 +2879,38 @@ cfg80211_get_iftype_ext_capa(struct wiphy *wiphy, enum nl80211_iftype type)
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


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54046C41513
	for <ath12k@archiver.kernel.org>; Tue,  2 Jul 2024 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jP2Eybihza/RBgEQCv9/PsS0Cokn008GYzz9X6AIvjI=; b=PKOD18gchcZGi08SYklEiPlPls
	fp8LiJJYyaqIiP24Zsz8JiSw+Rm04JaTCu8XXlVOeOyrieJXZQpUct4/4dYHNWvbzG1HvkEEgd2Gq
	Fox6flTc5kCIBv736zzmbqdoZH+hDOja8yLEzXWJdHAzCwKm8mQCmF9TfS8QXLL7a15E/rij/W2zP
	kZAqQ15vAXdr5nKzyVrLvEw8u7s+kGs4DVD71r+3P1BuxoliRc+5qH/584W1KoJbiTEE4AigbDhw9
	ZvbNflGFmcslPyfMzKbyXAaY5/zrTSzM6+aYjK+p3YU11fn0JJiSKwYB6D250kEyB2a55OxPxpNrQ
	2xW97+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObo4-00000006US0-06NE
	for ath12k@archiver.kernel.org;
	Tue, 02 Jul 2024 11:36:20 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObo0-00000006UOz-18ZK
	for ath12k@lists.infradead.org;
	Tue, 02 Jul 2024 11:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jP2Eybihza/RBgEQCv9/PsS0Cokn008GYzz9X6AIvjI=; b=q7wo4tEshVgj7DESAaO0SDeL8w
	DzH25pEkG7SM9AD6NCXfBxZ2LJN5nA0ry0q1DUbWXgBj1Pih0GCeYw0A5Wig6jWUQqxO38Hkijkd6
	c1t41z7q8lTjeKpYVw1F2aAnwbGfaUmLdhJDX6xBtpf7MmoLNrbEXPOXV1hhcnVaF684=;
Received: from p54ae9766.dip0.t-ipconnect.de ([84.174.151.102] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sObnr-001lDm-2n;
	Tue, 02 Jul 2024 13:36:07 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [PATCH v4 05/10] wifi: mac80211: add support for DFS with multiple radios
Date: Tue,  2 Jul 2024 13:36:00 +0200
Message-ID: <dbef62d963b4cd28246fccefdccadbfb5d14bcd5.1719919832.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.39da4d3b01ce5545ac85da8cab3179f7c7a351a8.1719919832.git-series.nbd@nbd.name>
References: <cover.39da4d3b01ce5545ac85da8cab3179f7c7a351a8.1719919832.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_043616_363436_9D3E7CEC 
X-CRM114-Status: GOOD (  14.03  )
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

DFS can be supported with multi-channel combinations, as long as each DFS
capable radio only supports one channel.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/mac80211/main.c | 50 ++++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 7578ea56c12f..4acfb17cf626 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1091,6 +1091,27 @@ static int ieee80211_init_cipher_suites(struct ieee80211_local *local)
 	return 0;
 }
 
+static bool
+ieee80211_ifcomb_check(const struct ieee80211_iface_combination *c, int n_comb)
+{
+	int i, j;
+
+	for (i = 0; i < n_comb; i++, c++) {
+		/* DFS is not supported with multi-channel combinations yet */
+		if (c->radar_detect_widths &&
+		    c->num_different_channels > 1)
+			return false;
+
+		/* mac80211 doesn't support more than one IBSS interface */
+		for (j = 0; j < c->n_limits; j++)
+			if ((c->limits[j].types & BIT(NL80211_IFTYPE_ADHOC)) &&
+			    c->limits[j].max > 1)
+				return false;
+	}
+
+	return true;
+}
+
 int ieee80211_register_hw(struct ieee80211_hw *hw)
 {
 	struct ieee80211_local *local = hw_to_local(hw);
@@ -1177,17 +1198,20 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 			if (comb->num_different_channels > 1)
 				return -EINVAL;
 		}
-	} else {
-		/* DFS is not supported with multi-channel combinations yet */
-		for (i = 0; i < local->hw.wiphy->n_iface_combinations; i++) {
-			const struct ieee80211_iface_combination *comb;
+	}
 
-			comb = &local->hw.wiphy->iface_combinations[i];
+	if (hw->wiphy->n_radio) {
+		for (i = 0; i < hw->wiphy->n_radio; i++) {
+			const struct wiphy_radio *radio = &hw->wiphy->radio[i];
 
-			if (comb->radar_detect_widths &&
-			    comb->num_different_channels > 1)
+			if (!ieee80211_ifcomb_check(radio->iface_combinations,
+						    radio->n_iface_combinations))
 				return -EINVAL;
 		}
+	} else {
+		if (!ieee80211_ifcomb_check(hw->wiphy->iface_combinations,
+					    hw->wiphy->n_iface_combinations))
+			return -EINVAL;
 	}
 
 	/* Only HW csum features are currently compatible with mac80211 */
@@ -1317,18 +1341,6 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 	hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_MONITOR);
 	hw->wiphy->software_iftypes |= BIT(NL80211_IFTYPE_MONITOR);
 
-	/* mac80211 doesn't support more than one IBSS interface right now */
-	for (i = 0; i < hw->wiphy->n_iface_combinations; i++) {
-		const struct ieee80211_iface_combination *c;
-		int j;
-
-		c = &hw->wiphy->iface_combinations[i];
-
-		for (j = 0; j < c->n_limits; j++)
-			if ((c->limits[j].types & BIT(NL80211_IFTYPE_ADHOC)) &&
-			    c->limits[j].max > 1)
-				return -EINVAL;
-	}
 
 	local->int_scan_req = kzalloc(sizeof(*local->int_scan_req) +
 				      sizeof(void *) * channels, GFP_KERNEL);
-- 
git-series 0.9.1


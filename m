Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5C2C27C79
	for <ath12k@archiver.kernel.org>; Thu, 20 Jun 2024 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34pDim3q98b+di9DArDJuxpv+10vrgDHS+iLBvplmv0=; b=onAMy6ELcRG2US8Z7MTDd96Xjx
	PaJzUlM3qmXKD2PQsegdNZcgj5Vz+K+jriBebAlGOsIgusCmQvdYGMiMDZYnE3TAqjH4JQ74yKRh/
	LKD4MEKLY9v9+1NhqUgJ146/jCt49Zy1/sLBiX5ciMBkkEKVieWNT2QItQdoiDozYt/VTaKQ84150
	bLWd6IgyAOzSlomabZU3N3ChwcXQgOqAiQyoaL/pYIRNMvGIOHYFGMyR3svSDlAIT1OjgzNzMb5+g
	Uwbv1f8BIDafcHsn7kCTqPaYNqgJbxQlMYxdPUuGpGOeWWK3222qlnhDFthBxN+vC6tWYI250AZDR
	2jOECLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKFhb-00000004hYL-3e5G
	for ath12k@archiver.kernel.org;
	Thu, 20 Jun 2024 11:11:39 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKFhU-00000004hQQ-2liP
	for ath12k@lists.infradead.org;
	Thu, 20 Jun 2024 11:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=34pDim3q98b+di9DArDJuxpv+10vrgDHS+iLBvplmv0=; b=Q3hN52i88wV+Zt4M+5OxWRAq/6
	xLKWI9TDAV0w/vbAzlEEQe/iNo1sE2nCuT08Q5SG0yFmzBnho3oDLE7bAS2dk+bqHwR8yCM9S+JEc
	KttzZPtfqF1FQ1FoEtoK8pmQMdnFr9m2sPkpM8n4Nttsa0u+0e3il7J1v6+eZE4DQzNw=;
Received: from p4ff13dca.dip0.t-ipconnect.de ([79.241.61.202] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sKFhM-00Ei9k-36;
	Thu, 20 Jun 2024 13:11:25 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [PATCH 05/10] wifi: mac80211: add support for DFS with multiple radios
Date: Thu, 20 Jun 2024 13:11:17 +0200
Message-ID: <48c34615b839768f7149180c419c90c0c1f2e27d.1718881762.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a7730420cfba0f204a60e4c30e6b0e07b441ff6b.1718881762.git-series.nbd@nbd.name>
References: <cover.a7730420cfba0f204a60e4c30e6b0e07b441ff6b.1718881762.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_041132_827857_407E91AA 
X-CRM114-Status: GOOD (  13.23  )
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
 net/mac80211/main.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 40fbf397ce74..e9c4cf611e94 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1084,6 +1084,21 @@ static int ieee80211_init_cipher_suites(struct ieee80211_local *local)
 	return 0;
 }
 
+static bool
+ieee80211_ifcomb_check_radar(const struct ieee80211_iface_combination *comb,
+			     int n_comb)
+{
+	int i;
+
+	/* DFS is not supported with multi-channel combinations yet */
+	for (i = 0; i < n_comb; i++, comb++)
+		if (comb->radar_detect_widths &&
+		    comb->num_different_channels > 1)
+			return false;
+
+	return true;
+}
+
 int ieee80211_register_hw(struct ieee80211_hw *hw)
 {
 	struct ieee80211_local *local = hw_to_local(hw);
@@ -1173,17 +1188,18 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 			if (comb->num_different_channels > 1)
 				return -EINVAL;
 		}
-	} else {
-		/* DFS is not supported with multi-channel combinations yet */
-		for (i = 0; i < local->hw.wiphy->n_iface_combinations; i++) {
-			const struct ieee80211_iface_combination *comb;
-
-			comb = &local->hw.wiphy->iface_combinations[i];
+	} else if (hw->wiphy->n_radio) {
+		for (i = 0; i < hw->wiphy->n_radio; i++) {
+			const struct wiphy_radio *radio = &hw->wiphy->radio[i];
 
-			if (comb->radar_detect_widths &&
-			    comb->num_different_channels > 1)
+			if (!ieee80211_ifcomb_check_radar(radio->iface_combinations,
+							  radio->n_iface_combinations))
 				return -EINVAL;
 		}
+	} else {
+		if (!ieee80211_ifcomb_check_radar(hw->wiphy->iface_combinations,
+						  hw->wiphy->n_iface_combinations))
+			return -EINVAL;
 	}
 
 	/* Only HW csum features are currently compatible with mac80211 */
-- 
git-series 0.9.1


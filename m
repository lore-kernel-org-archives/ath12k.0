Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B19EB4914
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhPBz7+tj7yd+44S6wLmgT5a0ZZddDSRoKD28qCw7Ps=; b=ZMzRVm+ycT0H6DGi9tN27rqDZ9
	AaAtfKhbeY6iaKhStkPohJ9TmVY4Z5bxChlOh1cyx4cmWZGNbdrdF+13/0CRHm1QJKxEzO1BoYpvM
	S+AqTtfxGPNROaoYJQC102scgLU8WO6sF2gw3Sm4vD4g+q1srsmNxuC2vRLlEjHFZ4Zf0qPG3HlHA
	Erc7Q6QYeYryZ7hdhwM8cSnc96+x7G4I2rptJTDrLRs2dj89UesuwtxwMs/bhK00os4pmk8jqP594
	JZSF1PZb/8D0vEsNQ3etK/VuSeVr/tZJl1qBJzn+ovKViPR6f3i4pxRR6308L9aPuLlOKoL0NlkfD
	C9lPgdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVeH-000000024Us-1ebh;
	Thu, 12 Feb 2026 12:18:21 +0000
Received: from forward102a.mail.yandex.net ([178.154.239.85])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVeD-000000024Sy-1qCV
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 12:18:19 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 0EA7EC00A5;
	Thu, 12 Feb 2026 15:18:13 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id pHTFRX8GA8c0-u7ochj6i;
	Thu, 12 Feb 2026 15:18:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1770898692; bh=vhPBz7+tj7yd+44S6wLmgT5a0ZZddDSRoKD28qCw7Ps=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=VUxcVIRyUZ1/WkJ7Adv4LbqDVHTj/bnZiBqZY5aAKoF0Q9zKzCLr3oOnXW8ZS+GIz
	 szcf86fjCfY7pC4rkiPvVr7PCPmABHXAaAZVl/i0Zc7+9W9G8Hi/k9KhTeBpzVb4nN
	 dgABOC9/mIg4xDmJFqauYoCgTrntjU2VYGlclutM=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: m.limarencko@yandex.ru
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Limarenko <m.limarencko@yandex.ru>
Subject: [PATCH ath-next v2 3/4] wifi: ath12k: sanitize invalid MCS metadata in rx path
Date: Thu, 12 Feb 2026 15:17:45 +0300
Message-ID: <20260212121746.329619-4-m.limarencko@yandex.ru>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212121746.329619-1-m.limarencko@yandex.ru>
References: <20260212121746.329619-1-m.limarencko@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_041817_863254_DF5AD054 
X-CRM114-Status: UNSURE (   9.07  )
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

From: Mikhail Limarenko <m.limarencko@yandex.ru>

Malformed or unsupported rate metadata from firmware can carry

invalid MCS values into mac80211 status handling.

This was observed with HE MCS=12 and coincided with

ieee80211_rx_list warnings.

When MCS is out of range, fall back to legacy metadata and use

ratelimited diagnostics.

Tested-on: QCNFA765 (WCN785x), kernel 6.18.5+deb13-amd64
Signed-off-by: Mikhail Limarenko <m.limarencko@yandex.ru>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 39 +++++++++++++++----------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 99d29ed..f0c56a9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2534,9 +2534,11 @@ static void ath12k_dp_rx_h_rate(struct ath12k *ar, struct ath12k_dp_rx_info *rx_
 	case RX_MSDU_START_PKT_TYPE_11N:
 		rx_status->encoding = RX_ENC_HT;
 		if (rate_mcs > ATH12K_HT_MCS_MAX) {
-			ath12k_warn(ar->ab,
-				    "Received with invalid mcs in HT mode %d\n",
-				     rate_mcs);
+			dev_warn_ratelimited(ar->ab->dev,
+					     "ath12k: invalid HT mcs %u, forcing legacy rate metadata\n",
+					     rate_mcs);
+			rx_status->encoding = RX_ENC_LEGACY;
+			rx_status->rate_idx = 0;
 			break;
 		}
 		rx_status->rate_idx = rate_mcs + (8 * (nss - 1));
@@ -2546,42 +2548,47 @@ static void ath12k_dp_rx_h_rate(struct ath12k *ar, struct ath12k_dp_rx_info *rx_
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AC:
 		rx_status->encoding = RX_ENC_VHT;
-		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_VHT_MCS_MAX) {
-			ath12k_warn(ar->ab,
-				    "Received with invalid mcs in VHT mode %d\n",
-				     rate_mcs);
+			dev_warn_ratelimited(ar->ab->dev,
+					     "ath12k: invalid VHT mcs %u, forcing legacy rate metadata\n",
+					     rate_mcs);
+			rx_status->encoding = RX_ENC_LEGACY;
+			rx_status->rate_idx = 0;
 			break;
 		}
+		rx_status->rate_idx = rate_mcs;
 		rx_status->nss = nss;
 		if (sgi)
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 		rx_status->bw = ath12k_mac_bw_to_mac80211_bw(bw);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AX:
-		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_HE_MCS_MAX) {
-			ath12k_warn(ar->ab,
-				    "Received with invalid mcs in HE mode %d\n",
-				    rate_mcs);
+			dev_warn_ratelimited(ar->ab->dev,
+					     "ath12k: invalid HE mcs %u, forcing legacy rate metadata\n",
+					     rate_mcs);
+			rx_status->encoding = RX_ENC_LEGACY;
+			rx_status->rate_idx = 0;
 			break;
 		}
 		rx_status->encoding = RX_ENC_HE;
+		rx_status->rate_idx = rate_mcs;
 		rx_status->nss = nss;
 		rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
 		rx_status->bw = ath12k_mac_bw_to_mac80211_bw(bw);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11BE:
-		rx_status->rate_idx = rate_mcs;
-
 		if (rate_mcs > ATH12K_EHT_MCS_MAX) {
-			ath12k_warn(ar->ab,
-				    "Received with invalid mcs in EHT mode %d\n",
-				    rate_mcs);
+			dev_warn_ratelimited(ar->ab->dev,
+					     "ath12k: invalid EHT mcs %u, forcing legacy rate metadata\n",
+					     rate_mcs);
+			rx_status->encoding = RX_ENC_LEGACY;
+			rx_status->rate_idx = 0;
 			break;
 		}
 
 		rx_status->encoding = RX_ENC_EHT;
+		rx_status->rate_idx = rate_mcs;
 		rx_status->nss = nss;
 		rx_status->eht.gi = ath12k_mac_eht_gi_to_nl80211_eht_gi(sgi);
 		rx_status->bw = ath12k_mac_bw_to_mac80211_bw(bw);
-- 
2.47.3



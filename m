Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C663EF0706
	for <ath12k@archiver.kernel.org>; Mon,  9 Feb 2026 03:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2rzyeifuTvLESFEtUsG8awO2sxZc/zhl6syNBHYDnA=; b=bNx8VxaTfcB0k0sbQYtsjSimKd
	54uQ396KLvvFPFWzRm8gHOcv9Ry18EOlNjc95gpAasmca2G+oCZdZHkEGyx7zEXaaGFGIoH6lvtgE
	JSiEn0rFGQEZuzGKj1lnsKtrGLFOifWIUUzAhkpTFYtGiKk7yGMJzLX0W81DyTwJGKj7kdbIZxhff
	5zCZXmwewlZXfNPEn+b6Kd45MZY5wrkT+jTgU0fw5FJUPI5KhP3936QtBIvn/pM3VUQyaQnWRW/Vh
	Vlua+f/S5tGx4mu42JB5oBhfCWZuM79Pf9aSTbxaOgDqt8R9oBvQ+zgyA5JViVHg+COnlF0HI9WDV
	WKyiKzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHYO-0000000EkBW-3Jn4;
	Mon, 09 Feb 2026 03:03:12 +0000
Received: from forward103a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHYK-0000000Ek8B-1kdg
	for ath12k@lists.infradead.org;
	Mon, 09 Feb 2026 03:03:11 +0000
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:190d:0:640:bab5:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id E9CE88087F;
	Mon, 09 Feb 2026 06:02:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id s2H8uoNGO0U0-dI9Bbd29;
	Mon, 09 Feb 2026 06:02:58 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1770606178; bh=l2rzyeifuTvLESFEtUsG8awO2sxZc/zhl6syNBHYDnA=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=CjtLErJesnAQ45HNe2kQZFyrnYE/fDffNbvekhw7czZzP4QK+JRQQg+YIuBqyt/4c
	 yFkuAR7RIvC8n8wBP3BQMjmYsyCftIwsrEWNyM/xVr5p3vvO6lL+GKvXJ0EZqMi6K+
	 LpnQIlKtcMcSA4pRiy/eRq9kmFvYpn2nY8eGi9+Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: m.limarencko@yandex.ru
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Limarenko <m.limarencko@yandex.ru>
Subject: [PATCH ath-next 4/4] wifi: ath12k: sanitize invalid MCS metadata in monitor rx path
Date: Mon,  9 Feb 2026 06:02:43 +0300
Message-ID: <20260209030243.1530075-5-m.limarencko@yandex.ru>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260209030243.1530075-1-m.limarencko@yandex.ru>
References: <20260209030243.1530075-1-m.limarencko@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_190308_689977_041520B0 
X-CRM114-Status: UNSURE (   8.17  )
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

Apply the same invalid-MCS hardening in monitor path status

conversion to keep metadata handling consistent in both data and

monitor pipelines.

Tested-on: QCNFA765 (WCN785x), kernel 6.18.5+deb13-amd64
Signed-off-by: Mikhail Limarenko <m.limarencko@yandex.ru>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 38 ++++++++++++++----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 009c495..6e894ef 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1922,9 +1922,11 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 	case RX_MSDU_START_PKT_TYPE_11N:
 		rx_status->encoding = RX_ENC_HT;
 		if (rate_mcs > ATH12K_HT_MCS_MAX) {
-			ath12k_warn(ar->ab,
-				    "Received with invalid mcs in HT mode %d\n",
-				     rate_mcs);
+			dev_warn_ratelimited(ar->ab->dev,
+					     "ath12k: invalid HT mcs %u in monitor path, forcing legacy rate metadata\n",
+					     rate_mcs);
+			rx_status->encoding = RX_ENC_LEGACY;
+			rx_status->rate_idx = 0;
 			break;
 		}
 		rx_status->rate_idx = rate_mcs + (8 * (nss - 1));
@@ -1933,35 +1935,41 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AC:
 		rx_status->encoding = RX_ENC_VHT;
-		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_VHT_MCS_MAX) {
-			ath12k_warn(ar->ab,
-				    "Received with invalid mcs in VHT mode %d\n",
-				     rate_mcs);
+			dev_warn_ratelimited(ar->ab->dev,
+					     "ath12k: invalid VHT mcs %u in monitor path, forcing legacy rate metadata\n",
+					     rate_mcs);
+			rx_status->encoding = RX_ENC_LEGACY;
+			rx_status->rate_idx = 0;
 			break;
 		}
+		rx_status->rate_idx = rate_mcs;
 		if (sgi)
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AX:
-		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_HE_MCS_MAX) {
-			ath12k_warn(ar->ab,
-				    "Received with invalid mcs in HE mode %d\n",
-				    rate_mcs);
+			dev_warn_ratelimited(ar->ab->dev,
+					     "ath12k: invalid HE mcs %u in monitor path, forcing legacy rate metadata\n",
+					     rate_mcs);
+			rx_status->encoding = RX_ENC_LEGACY;
+			rx_status->rate_idx = 0;
 			break;
 		}
+		rx_status->rate_idx = rate_mcs;
 		rx_status->encoding = RX_ENC_HE;
 		rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11BE:
-		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_EHT_MCS_MAX) {
-			ath12k_warn(ar->ab,
-				    "Received with invalid mcs in EHT mode %d\n",
-				    rate_mcs);
+			dev_warn_ratelimited(ar->ab->dev,
+					     "ath12k: invalid EHT mcs %u in monitor path, forcing legacy rate metadata\n",
+					     rate_mcs);
+			rx_status->encoding = RX_ENC_LEGACY;
+			rx_status->rate_idx = 0;
 			break;
 		}
+		rx_status->rate_idx = rate_mcs;
 		rx_status->encoding = RX_ENC_EHT;
 		rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
 		break;
-- 
2.47.3



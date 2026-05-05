Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89DDCD3430
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 04:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FEKvwvtC9Ho//T6jaZrPqgMRsDZPXlaiGIh7vpUvlmo=; b=xLerqsV85JONyqP7H78b1cMnGW
	iGcv9szow8bsI2cr4ZkLPvHpy2LxGCvwuiHraDNoy0EpsH6MlFPfxKvFoWI1fFUHBq7jRbCItpQf+
	Osg2d2VCcvHbPn9TYx7cngSCChleXsYUviz50QmkduMlob9AwFlczpN9vMsiNruz/x1vfprPw9zZ6
	HCvJdSajDL5a5hLNq7KapxeHldsuFwNjKTdlwJijAh5S1H2f9UkGYfxTeJrftoCkuvQECKtmTqE87
	YTZMIK4i8MCFt9d8Q+7pM/uLFNovkOAlWBfNl7r02kixCA9pzpqJQiVJAAISM3mrTbO1YdCTbLxQh
	2P/OUglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK76u-0000000F53h-1tMM;
	Tue, 05 May 2026 04:10:16 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK76r-0000000F53G-2Deh
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 04:10:14 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-364f7c42c62so2144686a91.0
        for <ath12k@lists.infradead.org>; Mon, 04 May 2026 21:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777954212; x=1778559012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FEKvwvtC9Ho//T6jaZrPqgMRsDZPXlaiGIh7vpUvlmo=;
        b=Z/Uux7qCRsCyJnCUC8nss19sgvyrsmGVky/yYw3JEQQAmyhtMomLq5XctINg0cV4up
         WFQCqZf6mXy3C0VT6PQh8GXwx+XVLGsLcu3d58ONJ1J1MDXygMe3fX0QWIS0H09bDhVY
         PahH9QEzmHj8NSQtnPd8+AO3nPgkkEb1HY+RB8zQWGJAavMuKAfwchRnk/uNCj6+WoIc
         FM6C+95sf1khDWtzohi9faorOQIMCtljuJOn2Cqm1VhG2NHgOAUkkZEKXMZu3YQXfKMN
         dxwH3A7cPa/LflDyHxr7UPZLxD7AppBFSm++Ml4oS5DSp6TT66jPil8Tq0Jivi5B0Q0V
         a6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777954212; x=1778559012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEKvwvtC9Ho//T6jaZrPqgMRsDZPXlaiGIh7vpUvlmo=;
        b=a5+7mqWP2k8TPf6F1ivSoeShAbwW219KexpDzQdhfrhtjAGUMaRSs6euEVhfYlOmKr
         K6dM4E76FkTuLhNg83/3QJKfrH2eVSiiliEXWu01aQoAar0Zuru3WRQB+/axpV2nok9y
         q07AQS4tTlWVpVpbxe4OX+IEAIhaKdsApUZSrap5npZ+QacLV6QKqYI91yKZleJd9L8e
         KvTVgeE8Z2NAFrRXyk1NQtHxQgipyRjitrJmUlHQ49a70XLc7rjUxiJuwjsU+5Nu+2Cm
         tPWpsU/gcmKL7z3IaeTSEc3SJyIWAcUruFASAZdjLkI4UoRpZfCsYshyREQqtv42mwLO
         kYvA==
X-Gm-Message-State: AOJu0Yxi/uMT4EksKWLbGQeby4ilOzf+qlrXg6Kn89et3zQULACf2tUO
	BQEdBST2RCjciJqVHVgOKxhxU2LNv4WUu4RCDOJ7QgQUA/y14F3QLWA/0x4roA==
X-Gm-Gg: AeBDietDFbQTQH7N4oz7mjQMqvd+I1FhajWvgd3xr9nsUqkOXOdzsBZIh9vKk5gy6X5
	oxiLHDcufIbBQqDVk8WkLJ3kgV3V+A+j+1bEE38eGCoR3P9kVJUWgnRb2xnSUfKbzHMRA95fT6r
	9RK3Oj7cW6sOVGD1dTxh+R0Zv7y3LcJLTaxBIFMv/EDw98Ec9uVd7zBzNHsnuHrJtFYTu3NLJEP
	xsUJGinN+kAOBO7n9y5NMm2OiP5yrYKCNxGJe82hjv64aDAUsBvkVW9K/Vq4ip4RI3496CUUKVq
	Jow3STmo8ON57VufVQ9+1nS+dRFQa6rwbr0MmG0TrifLMClCpn4B2FMjyJr4UUh5y3blKJxXTM3
	NP5Dr8S2fJ8mmYMVk7Kz4vKTEA0MSCVHkfdnhYn46GV6rPDJZSYMpYtPIdd5HYem8VQv/7+GyJb
	y/2XjC9GHg8SY4JhGvJjnwoFHeaRiEa31A9bbM
X-Received: by 2002:a17:90b:548d:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-3650ce4b8abmr11212846a91.17.1777954212150;
        Mon, 04 May 2026 21:10:12 -0700 (PDT)
Received: from kwan-H610MHP.. ([180.75.11.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec737fsm13093866a91.4.2026.05.04.21.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 21:10:11 -0700 (PDT)
From: kwan1996 <laicheehou9@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kwan1996 <laicheehou9@gmail.com>
Subject: [PATCH v2] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS reporting in monitor mode
Date: Tue,  5 May 2026 12:09:20 +0800
Message-Id: <20260505040920.57521-1-laicheehou9@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_211013_594650_3132FBEF 
X-CRM114-Status: GOOD (  10.52  )
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

In monitor mode, the driver incorrectly assigns the legacy rate
to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
frames, ignoring the actual MCS value parsed from the hardware.

This causes packet analyzers (like Wireshark) to display incorrect
MCS values (e.g., legacy base rates instead of the true MCS).

Fix this by assigning ppdu_info->mcs instead of ppdu_info->rate
for HT/VHT/HE/EHT frame types in ath12k_dp_mon_fill_rx_rate()
and ath12k_dp_mon_update_radiotap().

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220864

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ

Signed-off-by: kwan1996 <laicheehou9@gmail.com>

---

v2: Fix indentation and formatting issues in v1.

---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 39d1967..4119bb8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1925,6 +1925,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 		}
 		break;
 	case RX_MSDU_START_PKT_TYPE_11N:
+		rate_mcs = ppdu_info->mcs;
 		rx_status->encoding = RX_ENC_HT;
 		if (rate_mcs > ATH12K_HT_MCS_MAX) {
 			ath12k_warn(ar->ab,
@@ -1937,6 +1938,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AC:
+		rate_mcs = ppdu_info->mcs;
 		rx_status->encoding = RX_ENC_VHT;
 		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_VHT_MCS_MAX) {
@@ -1949,6 +1951,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AX:
+		rate_mcs = ppdu_info->mcs;
 		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_HE_MCS_MAX) {
 			ath12k_warn(ar->ab,
@@ -1960,6 +1963,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 		rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11BE:
+		rate_mcs = ppdu_info->mcs;
 		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_EHT_MCS_MAX) {
 			ath12k_warn(ar->ab,
@@ -2259,13 +2263,13 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 		rxs->encoding = RX_ENC_HE;
 		ptr = skb_push(mon_skb, sizeof(struct ieee80211_radiotap_he));
 		ath12k_dp_mon_rx_update_radiotap_he(ppduinfo, ptr);
-		rxs->rate_idx = ppduinfo->rate;
+		rxs->rate_idx = ppduinfo->mcs;
 	} else if (ppduinfo->vht_flags) {
 		rxs->encoding = RX_ENC_VHT;
-		rxs->rate_idx = ppduinfo->rate;
+		rxs->rate_idx = ppduinfo->mcs;
 	} else if (ppduinfo->ht_flags) {
 		rxs->encoding = RX_ENC_HT;
-		rxs->rate_idx = ppduinfo->rate;
+		rxs->rate_idx = ppduinfo->mcs;
 	} else {
 		rxs->encoding = RX_ENC_LEGACY;
 		sband = &ar->mac.sbands[rxs->band];
-- 
2.34.1



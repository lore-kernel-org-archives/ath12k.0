Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB81CD3436
	for <ath12k@archiver.kernel.org>; Thu,  7 May 2026 01:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zBhSoKKWUqXo8+LRVDmtBG4+Ndb/qncanTXygRC1tEs=; b=iToKxU2kWyK8ftPNR8Nm+ckHpX
	APIXTxcz8QwqYCaUiLIkPTJBTTXxhWcHJl1kaqM10zPI5Ez0wAZqtrhRgPXYGI9K5vaEZRiWHF5BP
	oPNLs+MM3ton+yrArMyoLkaosKKeXNBHuFXNw7H6bZHaf5S0kJdKqZjEJgj53xmWxI8jLXysj2thm
	4MYePOy7xs0NywbOZA+uqm1zlyfGyFNjMIS5C7CfjO/yWhOgcQXl+7KAk760Y+BY6HRnHTPUDv+oI
	8v8QYCM9Y4rCkywp9piJ/hb5txLt/l7XJaYKUJeafkGbg1k3nsTwsB6woA5IUs4G9Q1cXpBnZQKiu
	uj/UCqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnwB-00000002TGK-3Nj6;
	Thu, 07 May 2026 01:54:03 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnwA-00000002TFp-31JD
	for ath12k@lists.infradead.org;
	Thu, 07 May 2026 01:54:02 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c801d732058so134802a12.1
        for <ath12k@lists.infradead.org>; Wed, 06 May 2026 18:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778118841; x=1778723641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBhSoKKWUqXo8+LRVDmtBG4+Ndb/qncanTXygRC1tEs=;
        b=F0+I1u74i06ptAxcw9gitf0ik3hBCjexzB+eVfHbRnecsfjn+5HMEB25HrdlFlq1LS
         nStx3JtJxVSdpoOWAt2qK/nZXlE14R/qLZD8EZXBDlHRTsFUGv12Uwx5zebtYB/AD2/F
         y8YRexiO6J8rdgYzfNmRjE9O4QfiaF9CqlmlbC+0weX6bcjYpq72/OIg1WZix96EVXEL
         sZbDxr2nVBhxk8katiFlCVS0WjodgznNP+CQV18X4W79qFDZSnb7fxqNVcGsAxA4VNXG
         za5l3Olg9P3/yAjKPPhVmryBGvgJklWq5z7bAmZhB1uPqW4hUARpHhigbt123F3POae6
         tdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778118841; x=1778723641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBhSoKKWUqXo8+LRVDmtBG4+Ndb/qncanTXygRC1tEs=;
        b=AQJWDKSXdDOJ5SDXDD/XP2LMxUJKM8RmXDJ5/f+hXuuIE3LvhnT/IWXNfu9hGUxhLu
         Pes3ExsjUjaeg3Xny36SxxpfTQiVK9J65r1gi0gH9DimxVLM4bPCksJnOHOhiEnNhieL
         raBjaHc7I23HrAI68hQkL7pjEywmVODSk56drz5S52fV297XjTVzQx/oJDp5dgOJgT/y
         yG5Fz9xiBsbm9Ur3R1wZKhshBTEcNI0VwAutAlBBY+m1gzAZjf7CklyFaSuWs96qayQe
         IBdtdwzEiQyAQxZrQK/MO5sXzmWWoHW/C1NqoULPSb5XeJdQFs/Op3tg2cpEOmSgI7W7
         cF0A==
X-Gm-Message-State: AOJu0YwJgt/prYL0ubFiB1dzR10Hdje7dHPbJdM7aCQzs+5q4LZfcdDy
	AZsIM/tG08xhzphFutOyBC3Mh8mUIh8YnjAMeDITZ4loU9BZhC+XrP4hdlrESw==
X-Gm-Gg: AeBDieuAzqkBEDF2yb9V4ADRqsGjbUsCW3eRNBE12v+AuOK5fEg1vHFDQCn5htDhxnk
	TCR3NW6E1FqMFBzHKZpXAp5/UUXJBMvi/JtNxYuTh3GGp5omO/tsrJ5+Xka8QSG3iL2aPAzD5GY
	7GdX5ZvtiCndE98kcCZ7y2v/BBEWOc2y5pK/ZAf4gJIFEoYdCQw4X5UjnfUpGDie5V5zfL3imv1
	u+a2cJoZWtCLkK2dYLsMP/e3W/xyVzMvxOdjbE0O8WLianhUeyv8/EFk87tztfREU9gglVIMn5a
	znkHlpzc8OHYLyI0x4bxcIIFRKHg1f5DER5aNBnb9NextBkggwHBFyrZF8j20IILnITS+VKsMty
	DKw0M8NOFVIR5O0m8LMuuC8rE1NfmEGMFQHFj3FbMWTSobhCOXw+X4Yr63ph3I9lnL45jcA3+OC
	xBiZfOKiRyDZutN2oFi1OVPjBk+9tQW0sc+Ge/
X-Received: by 2002:a05:6a20:12cf:b0:39c:2d2a:632e with SMTP id adf61e73a8af0-3aa8bebfecdmr916136637.11.1778118841282;
        Wed, 06 May 2026 18:54:01 -0700 (PDT)
Received: from kwan-H610MHP.. ([180.75.11.76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82537949c1sm426455a12.12.2026.05.06.18.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:54:00 -0700 (PDT)
From: kwan1996 <laicheehou9@gmail.com>
To: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Kwan Lai Chee Hou <laicheehou9@gmail.com>
Subject: [PATCH v3] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS reporting in monitor mode
Date: Thu,  7 May 2026 09:53:35 +0800
Message-Id: <20260507015336.14636-1-laicheehou9@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_185402_765387_C49A9811 
X-CRM114-Status: GOOD (  10.86  )
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

From: Kwan Lai Chee Hou <laicheehou9@gmail.com>

In monitor mode, the driver incorrectly assigns the legacy rate
to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
frames, ignoring the actual MCS value parsed from the hardware.

This causes packet analyzers (like Wireshark) to display incorrect
MCS values (e.g., legacy base rates instead of the true MCS).

Fix this by assigning ppdu_info->mcs as the default rate_mcs
in ath12k_dp_mon_fill_rx_rate(), and remove rate_idx assignments in 
ath12k_dp_mon_update_radiotap() to preserve
the previously calculated MCS values (including the HT NSS offset).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220864

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ

Signed-off-by: Kwan Lai Chee Hou <laicheehou9@gmail.com>

---
v3: 
 - Simplify rate_mcs assignment logic in ath12k_dp_mon_fill_rx_rate.
 - remove rate_idx assignments in ath12k_dp_mon_update_radiotap to avoid overwriting the HT (802.11n) MCS calculated earlier.
 
v2: Fix indentation and formatting issues in v1.
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 39d1967..79347c3 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1910,13 +1910,14 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 	bool is_cck;
 
 	pkt_type = ppdu_info->preamble_type;
-	rate_mcs = ppdu_info->rate;
+	rate_mcs = ppdu_info->mcs;
 	nss = ppdu_info->nss;
 	sgi = ppdu_info->gi;
 
 	switch (pkt_type) {
 	case RX_MSDU_START_PKT_TYPE_11A:
 	case RX_MSDU_START_PKT_TYPE_11B:
+		rate_mcs = ppdu_info->rate;
 		is_cck = (pkt_type == RX_MSDU_START_PKT_TYPE_11B);
 		if (rx_status->band < NUM_NL80211_BANDS) {
 			sband = &ar->mac.sbands[rx_status->band];
@@ -2259,13 +2260,10 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 		rxs->encoding = RX_ENC_HE;
 		ptr = skb_push(mon_skb, sizeof(struct ieee80211_radiotap_he));
 		ath12k_dp_mon_rx_update_radiotap_he(ppduinfo, ptr);
-		rxs->rate_idx = ppduinfo->rate;
 	} else if (ppduinfo->vht_flags) {
 		rxs->encoding = RX_ENC_VHT;
-		rxs->rate_idx = ppduinfo->rate;
 	} else if (ppduinfo->ht_flags) {
 		rxs->encoding = RX_ENC_HT;
-		rxs->rate_idx = ppduinfo->rate;
 	} else {
 		rxs->encoding = RX_ENC_LEGACY;
 		sband = &ar->mac.sbands[rxs->band];
-- 
2.34.1



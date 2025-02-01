Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AC0C0218A
	for <ath12k@archiver.kernel.org>; Sat,  1 Feb 2025 21:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IAXOnX62cZ6i8kI2tncb0QO6ket58w+Pb9EoHU06fZ0=; b=se6A2nPSpkzCKSygZXVdQSq+0V
	ao/HIU06Aqp9eqwkWHGlr0wUDvhwQVP4Ubqtxn/ZhfjfJ+2MeiWWlu4NhOPqb5ItPmADBmuhGmY1I
	FT17z9hjD7qzM0VLnWFBer8kaQEGMJuF/6l3v/ssTrIG3m1dWjr7LpNckVx8tJ2hJkpuJzkFa8IUH
	WHfa9hbIQjYs1gmI7P12LpkNWHo3qGPIy4DJNKN4VTGBGjTkxU0zcZaERbXjvQm/E0p1bIhS+2/FI
	FLIvuz+vgWwjsC1UKkYdgnrsbvn1QIKjeo8R5/6p5hTKYDvBmL9GyUA1oCUijS1lL0nRwitLELFKc
	uqWezANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teKnc-0000000D7xn-2t2k
	for ath12k@archiver.kernel.org;
	Sat, 01 Feb 2025 21:13:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teKnZ-0000000D7xQ-3DQt
	for ath12k@lists.infradead.org;
	Sat, 01 Feb 2025 21:13:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436202dd730so22649595e9.2
        for <ath12k@lists.infradead.org>; Sat, 01 Feb 2025 13:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738444383; x=1739049183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAXOnX62cZ6i8kI2tncb0QO6ket58w+Pb9EoHU06fZ0=;
        b=VYH9G+maaFsdNxlDwVzEtrMk6eu0TiZamkWSpww9wY/q59IiJCKX9LuvsYPeDoPggG
         3jaSJhdsvtQ3RnAfHsVzXk53OF0JYGiKU3BI1rk5FrdV56UWTEs6hnwhgtT85vIuNpA0
         FlxftvC31WRweze7MF3Z3Biz6GknNVjezW1dWFAE4UjORuCqE2+QpdnWx8f3xDNNgrSS
         Ki7vZiCz/XklDKl8OUQhHhnuJV/jIHPmH45RDjreUy4eiEY34wLkaQG5VwLWCNiVFLnB
         jfNPsWzwkHdSpWQJDHSD/H1DYbACYf9cn5L57XlSkzjd0kHzrtJs4DRovtAqLkazdFED
         +6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738444383; x=1739049183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAXOnX62cZ6i8kI2tncb0QO6ket58w+Pb9EoHU06fZ0=;
        b=lsOgGSEhZDT96MM9vIxnbpspJ3jzDzVU4Mo6DpX6tGA3wfMJ3wdbUXb3zdi3paXExS
         7Cf2vHtl0lQlnAV5NBXHW4n/1OWcsfG/iUhODSyZrdHZu6IgJFx+2ojoAOgniFa8Sncd
         V5FvgyoNq1O+nJ2Ijx/Pj3r2htjKIQoJDawzd5dH9vUa20W4w+gw/AIWMjnVgzZ+dSWr
         w+Oz7KF95HOCJtCZlV/SA7BWyCgTJnHXlqBClHb6HiC9U7e0miAqYZwPVigX/xQj0plD
         F9dSglkbD/Ja3ONQw+sUNcUrBEDAeFsY6AIsdCutfGgH8boqXciygzaOU6/WOLLrrZNZ
         YQcQ==
X-Gm-Message-State: AOJu0YwZiNqAGyWwJ6/SqzFMI8D/6A+dKuhc3r9yB3tY0EGFWsoRyRYT
	C3aXGCPQvtjGFDVBK0W6xRKVD6CdWKRyeLTkex/PY+ZCS7AN0Yk8cGBOpg==
X-Gm-Gg: ASbGncvDvh4P4jkRNiZi3kARFmW1DPtIP1QMouRT8jJcl9AUUWCL1Bsfk/3yZBE1s5q
	I154eWNZnrds2p16g+/FFnwW/h4ncQC1WDi1jq262RU1I14d9Q5ZmWHvC7CLa13N5owuRFlmAcn
	1TQteBJ3uAWWbCOFlTyB8W9+MjNYm8Vba0SHbgPw21sTn8bS8KP4X++fGj5tcPqop0achhMCdmi
	pbHo+AaXvRDLHIb6Txo2L/U6KtapxLA258Ha6xJVaNcSnENde32FOQoNF/u0e/z/K7oC6Q5ZxgZ
	L8Ns0yCR1x1kzIdFGHEmkCXXwJbMW0s5KUQUYGj8khckKwoz
X-Google-Smtp-Source: AGHT+IGJVRa/bkKZeoR0SoJZrw3nAzxaFe6fY+cQyOj44g9IOuf6m6TluWguF2EWZf8oAfQEl2oWbQ==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-438dc3a40d3mr160996275e9.5.1738444382813;
        Sat, 01 Feb 2025 13:13:02 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm100349485e9.28.2025.02.01.13.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 13:13:02 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v3] wifi: ath12k: add support of station average signal strength
Date: Sat,  1 Feb 2025 22:13:01 +0100
Message-ID: <20250201211301.357985-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_131305_844588_8BA6756B 
X-CRM114-Status: GOOD (  12.91  )
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

This adds support for reporting to the kernel the average rssi. This is
done the same way as it was done in ath11k. A simple ewma (with the same
parameters) is updated with each rssi update.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
v3:
  - rebased on ToT
  - now also handles db2dbm

v2: https://lore.kernel.org/ath12k/20250121093834.25132-1-nico.escande@gmail.com/
  - removed spurious exta new line at the beggining of core.h

v1: https://lore.kernel.org/ath12k/20250117172819.3357534-1-nico.escande@gmail.com/
  - initial version
---
 drivers/net/wireless/ath/ath12k/core.h   | 4 ++++
 drivers/net/wireless/ath/ath12k/dp_mon.c | 2 ++
 drivers/net/wireless/ath/ath12k/mac.c    | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 28db100cfac0..2a53712bd606 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -15,6 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/firmware.h>
 #include <linux/panic_notifier.h>
+#include <linux/average.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -480,6 +481,8 @@ struct ath12k_wbm_tx_stats {
 	u64 wbm_tx_comp_stats[HAL_WBM_REL_HTT_TX_COMP_STATUS_MAX];
 };
 
+DECLARE_EWMA(avg_rssi, 10, 8)
+
 struct ath12k_link_sta {
 	struct ath12k_link_vif *arvif;
 	struct ath12k_sta *ahsta;
@@ -499,6 +502,7 @@ struct ath12k_link_sta {
 	u64 rx_duration;
 	u64 tx_duration;
 	u8 rssi_comb;
+	struct ewma_avg_rssi avg_rssi;
 	u8 link_id;
 	struct ath12k_rx_peer_stats *rx_stats;
 	struct ath12k_wbm_tx_stats *wbm_tx_stats;
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 4e9a60181c06..d529229f2d0f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2002,6 +2002,7 @@ static void ath12k_dp_mon_rx_update_peer_su_stats(struct ath12k *ar,
 		return;
 
 	arsta->rssi_comb = ppdu_info->rssi_comb;
+	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
 
 	num_msdu = ppdu_info->tcp_msdu_count + ppdu_info->tcp_ack_msdu_count +
 		   ppdu_info->udp_msdu_count + ppdu_info->other_msdu_count;
@@ -2174,6 +2175,7 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k *ar,
 		return;
 
 	arsta->rssi_comb = ppdu_info->rssi_comb;
+	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
 
 	num_msdu = user_stats->tcp_msdu_count + user_stats->tcp_ack_msdu_count +
 		   user_stats->udp_msdu_count + user_stats->other_msdu_count;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e9663c6ac72c..807638d30e7b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5484,6 +5484,7 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 		}
 	}
 
+	ewma_avg_rssi_init(&arsta->avg_rssi);
 	return 0;
 
 free_peer:
@@ -10200,6 +10201,13 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->signal = db2dbm ? signal : signal + ATH12K_DEFAULT_NOISE_FLOOR;
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 	}
+
+	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi);
+
+	if (!db2dbm)
+		sinfo->signal_avg += ATH12K_DEFAULT_NOISE_FLOOR;
+
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
 }
 
 static int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,
-- 
2.48.1



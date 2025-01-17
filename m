Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B57C02183
	for <ath12k@archiver.kernel.org>; Fri, 17 Jan 2025 17:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PLN3gOcLDJS36tJv//bMowXpxsTR9Nhq+LKenQnzMwM=; b=GEFPRaOTNjOc6X82hudIx/iBnU
	mX5EczB/gx2m6KFafpG51vzDp6bAd7eFkChKiCnWy2ypMKN3Gi/iwDap2anM/P0hIK2CEbk+AUzS+
	B5r2ZTbiwv++DE9F1WSzZuTR7koP6zSkbjKDEK3RhDufEQgKfmjt/Lg/+vmjQfyLwzSHegFzLkf67
	CiCa+p1Df51AsXN8RQmNUCeR4HN/GIadBuV4BDJpfmD6UzxkuKf1KJw41LR7CMsSpqV42YF+m1VjF
	CiGsCHyhgALbawt26l6UHddEHKg6LZ2wAqsRFznAb3jjNeniSdsW7JMDtYUMq0Ys9tyiB037mmzFP
	SnM/GokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYq8u-00000000xaE-0kTA
	for ath12k@archiver.kernel.org;
	Fri, 17 Jan 2025 17:28:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYq8s-00000000xZl-1YYK
	for ath12k@lists.infradead.org;
	Fri, 17 Jan 2025 17:28:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso21681875e9.0
        for <ath12k@lists.infradead.org>; Fri, 17 Jan 2025 09:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737134901; x=1737739701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLN3gOcLDJS36tJv//bMowXpxsTR9Nhq+LKenQnzMwM=;
        b=khWBpX2Ioa1c361XkaNg5zxdwqd+hl2o1mZqKYA5+pazJx5NVlMtYIAAcQsTWF5PDE
         8W24HHAEj9ovyZJ5kPfJPnq56iEYyJyh25IptbwKvZZN8jUcJGrtnDtBn6HPRXqvOmQG
         3+uyobqSUOdNrDwdzK6RicENKVuuoMVRzDNCyAZu+QI7KKF9FAH8Caw2HmkeNEbFjU8e
         wF0Nz8GEyXJCooabh5eQd/fCZjgBQ4rpRlDTjUt0hzo0XPCgHtn0vG3imyH+OH8qa/m0
         DH9sJw1qmk1fwzx4yg97OU69c5JSE4CtBo1kwCA9nq045ZLqKcDnpQgcZeehxPu4Dxyt
         shJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737134901; x=1737739701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLN3gOcLDJS36tJv//bMowXpxsTR9Nhq+LKenQnzMwM=;
        b=oH9r8aKrYnSL0/q6MOnItTxhwT2WVS/ksvJZAbwFrjRhxPcx6TqRghs5mDrjoSDQeN
         HWbxDlMr6XsQzK2CrLGrNbLg0eb5B/BGATDl2ZRRQWqlLDMXCazZrJ4HfLz7qY4ENH6A
         p/Dokg/pb05UyXudES2dUAcCrIaklIJ7c9P2s6qc2Wgd6/U/CGmoeewKccav55l7SfA/
         yMjRA8iHz06zr1kVRReBabM68vEFc4lzT+OAdReWzRcWWGVsWHX+/ZT7jACFbQG1zWBv
         M/cK9AzISLndeu77bTaCrXfqbCeSuoVmMqq81qusdnDm8afJHBNf9FWiHmr7TG4pmA6L
         gC2A==
X-Gm-Message-State: AOJu0YzpDwyubHih4hjMcc5ejNIPdv4w3j1LqRM7lACR8b9ADcfhWbyV
	aM8dKEYjT5MNneAmKfDwQO8KogrfSBENnoO4WoCw3t/m2dFOrwd1IWt0Pw==
X-Gm-Gg: ASbGncsUL3pWplMcpgeIohoUE9gkIyyuPfq8T5bKgTnsd/QodLjyk7xh2oe1BuE7Mai
	zcOUZz8965Qgv8eTqTYPQ9SNKfrZTk5Lo+QMX+Rd8fuqlmYZq8DDBYwJS3I8++XO72xxGZI8hqB
	PjYjpkj9neCyNJVkbz94s1+GvKYmqkAXd1Zhit6kIy8FCZzL+gcN+fWTGKTvd6Al0hei5HB4rNS
	XeYEki7XHIb8i6D/Q7hvsD8RhRWWDP+ghuxMfGKyXYjf70e3hlIkylB8gkfCbdHhsyqKnyFyAYy
	ASduvE180Rejcg==
X-Google-Smtp-Source: AGHT+IEWE12BcgR5C6nhlkhA8r092LE4py8JIqeiQuML0tzebpzWr5c0O4QRGGHiyGRxQjTxGW7+PA==
X-Received: by 2002:a5d:648c:0:b0:385:f892:c8be with SMTP id ffacd0b85a97d-38bec54290dmr9388114f8f.23.1737134900453;
        Fri, 17 Jan 2025 09:28:20 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275562sm3074631f8f.66.2025.01.17.09.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:28:19 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: add support of station average signal strength
Date: Fri, 17 Jan 2025 18:28:19 +0100
Message-ID: <20250117172819.3357534-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_092822_409919_3762C18F 
X-CRM114-Status: GOOD (  12.45  )
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
 drivers/net/wireless/ath/ath12k/core.h   | 5 +++++
 drivers/net/wireless/ath/ath12k/dp_mon.c | 2 ++
 drivers/net/wireless/ath/ath12k/mac.c    | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index ee595794a7aee..9408d8a528580 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1,3 +1,4 @@
+
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
@@ -15,6 +16,7 @@
 #include <linux/ctype.h>
 #include <linux/firmware.h>
 #include <linux/panic_notifier.h>
+#include <linux/average.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -477,6 +479,8 @@ struct ath12k_wbm_tx_stats {
 	u64 wbm_tx_comp_stats[HAL_WBM_REL_HTT_TX_COMP_STATUS_MAX];
 };
 
+DECLARE_EWMA(avg_rssi, 10, 8)
+
 struct ath12k_link_sta {
 	struct ath12k_link_vif *arvif;
 	struct ath12k_sta *ahsta;
@@ -496,6 +500,7 @@ struct ath12k_link_sta {
 	u64 rx_duration;
 	u64 tx_duration;
 	u8 rssi_comb;
+	struct ewma_avg_rssi avg_rssi;
 	u8 link_id;
 	struct ath12k_rx_peer_stats *rx_stats;
 	struct ath12k_wbm_tx_stats *wbm_tx_stats;
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 5a21961cfd465..e53d5674b4368 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2157,6 +2157,7 @@ static void ath12k_dp_mon_rx_update_peer_su_stats(struct ath12k *ar,
 		return;
 
 	arsta->rssi_comb = ppdu_info->rssi_comb;
+	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
 
 	num_msdu = ppdu_info->tcp_msdu_count + ppdu_info->tcp_ack_msdu_count +
 		   ppdu_info->udp_msdu_count + ppdu_info->other_msdu_count;
@@ -2329,6 +2330,7 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k *ar,
 		return;
 
 	arsta->rssi_comb = ppdu_info->rssi_comb;
+	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
 
 	num_msdu = user_stats->tcp_msdu_count + user_stats->tcp_ack_msdu_count +
 		   user_stats->udp_msdu_count + user_stats->other_msdu_count;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2d062b5904a8e..5be8cf0e41279 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5403,6 +5403,7 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 		}
 	}
 
+	ewma_avg_rssi_init(&arsta->avg_rssi);
 	return 0;
 
 free_peer:
@@ -10054,6 +10055,10 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	/* TODO: Use real NF instead of default one. */
 	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
+
+	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi) +
+		ATH12K_DEFAULT_NOISE_FLOOR;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
 }
 
 static int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,
-- 
2.48.0



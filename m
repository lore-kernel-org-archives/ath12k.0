Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91E7C02182
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8aWBFwCxuTMNSEwJNIJNMuustMzcc59od6w7veOripo=; b=lqi3/OIWBSrH3UuVPtJwcwp+Qf
	HioVzOg87Iu55XuQp89QHZGOJjHk4eIa0AtUFCInmIEaKGTpjuyU0BM2fwfeeLDeprQ/lBsql+L65
	7mw+Y26J4bhtwnI6M4AhmNco2ql2/FLAMagnxUKVA065VOJhUj0AsVVDdzTlEgDuOwfQ4zun2IYlN
	THTK6O7TWOXjGJS9CRi33Zqr8tA7mctyvtQTBeOAt51AHoXEWFBCHTgxVsuIWBlPbgqgRHxqVNJd8
	SMoe/6L51BtTUHkoBAhwQpY15x5Ze1t0LGcs+a53fMwkbm52Xq8uHQdkL6wXJu/wHuvQX9h35aNaL
	Oatty3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAlI-00000007RVi-2LUS
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 09:41:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAiT-00000007R6x-1Z9n
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 09:38:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385e3621518so2457353f8f.1
        for <ath12k@lists.infradead.org>; Tue, 21 Jan 2025 01:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737452315; x=1738057115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8aWBFwCxuTMNSEwJNIJNMuustMzcc59od6w7veOripo=;
        b=dTpaCGI0tdjsoQhVMBKHe1cacTI+oApYaA6q3+2PUiq10ijmyXFdHPA22UWwAS5j3Z
         EbJbCjowk37spaM8RJq24bC+LCZHu7ZVKrzquRKgXYnlX+Z3SW8UJmXotL/jQ5/QD+QA
         iPwkt01CJ3D55jXDgPldBS88OhNUAAVV8wpdWNLgwKfzpLgthzPq0PGiw2I0BF5l3PNe
         gJq1dcVcos164St4UoXjhTmCeJ9WMGnBBhjL6qOBNbgAMxKfg7yM/C/T4VmzM7A7q4nu
         uCmJQMtmlbW8mfyejHpUnk6yI7/NB0rZ/+y4qgy+piAKnuZNZX/vetI+bsR+rMn1nJpM
         OPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737452315; x=1738057115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aWBFwCxuTMNSEwJNIJNMuustMzcc59od6w7veOripo=;
        b=xEuyvlhppmNstaiOtwKkkyYS06TkF/ssG5VAWrPfmEI1Y33O+8wzFjK3yPLU5Y+2/v
         4PE4Hlz9seFLJxoytzfv1qSGaXsXpU/MQlgVWWKAi0WSWT3Y/Y07PkHgU9J5t+7dKP8S
         d2D3gfPBS4MdzNjg3RoaLIYLMO3vl1wbvb7D0uEEMhwKX3DhmzkNtMv/D3W1t6TbrsPT
         f6cB32JiXnnyEG9RypX4sRIH3oZ3iHZGiD0O137u/GkzynmodVeGbqrVmqHgnYQvsjxl
         pRrflgZuCqlVE50G2BBrzbHgb2cS2qWKtBDyyLdR6BbKhKGJNOyiwNOuWebxLol+qis5
         HI+g==
X-Gm-Message-State: AOJu0Yypy4H8HNn9qrzQo/ID0smLjoNjER+94i/sVLmPhDsVS14e5FW8
	9EVMdGrWsTNqe6lJ2MgZub+wq5pcsCiHl5QaZmt606GR81YBQEapJc8pPA==
X-Gm-Gg: ASbGncshEWsy3CAhJ3uf+k66wjKcVxmaat0UIV446eL78JAQUIQF4HJzwtrkk2as+46
	mYKRhJa5+6uLWwAGa9/LG6DrXva9h6zXSRBI7ZZNPE6MUCNEDFlxg431PgBmSX7UjjWLZcwNCC6
	o/hdjIjpVmeJy7odJhOOsr2PTgofNJM+hWuUGahcS6fSPlNco4nYd0wS7a4lGyA8Q6xG/xO17jp
	nSPD10HrUanx/ckRkPpAGU1em7NTVjQjGRoEyoCU2oEztV1JWaWX/WIMsG2IxbciNzOE8Sh8NtE
	UoIoUgsfH0h/AHN9D794C9N0EbM=
X-Google-Smtp-Source: AGHT+IGe6ZZbfjEVfRn72Mek0BAT7AU+yqft+pgybUOtamCDVmNeN3NqhM9C/Xq7qne6eBPntBylHA==
X-Received: by 2002:a05:6000:2a9:b0:38a:86fe:52b5 with SMTP id ffacd0b85a97d-38bf566274amr16918094f8f.14.1737452315428;
        Tue, 21 Jan 2025 01:38:35 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32221a8sm12993488f8f.37.2025.01.21.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 01:38:35 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2] wifi: ath12k: add support of station average signal strength
Date: Tue, 21 Jan 2025 10:38:34 +0100
Message-ID: <20250121093834.25132-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_013837_411460_0158FA0C 
X-CRM114-Status: GOOD (  12.83  )
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
v2:
  - removed spurious exta new line at the beggining of core.h

v1: https://lore.kernel.org/ath12k/20250117172819.3357534-1-nico.escande@gmail.com/
  - initial version
---
 drivers/net/wireless/ath/ath12k/core.h   | 4 ++++
 drivers/net/wireless/ath/ath12k/dp_mon.c | 2 ++
 drivers/net/wireless/ath/ath12k/mac.c    | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index ee595794a7aee..83af4381b79ff 100644
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
@@ -477,6 +478,8 @@ struct ath12k_wbm_tx_stats {
 	u64 wbm_tx_comp_stats[HAL_WBM_REL_HTT_TX_COMP_STATUS_MAX];
 };
 
+DECLARE_EWMA(avg_rssi, 10, 8)
+
 struct ath12k_link_sta {
 	struct ath12k_link_vif *arvif;
 	struct ath12k_sta *ahsta;
@@ -496,6 +499,7 @@ struct ath12k_link_sta {
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
2.48.1



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFD7C3ABB6
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 00:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hm2NMTsdF2pMXOEFIRBFGnxNwUTC27XyeYpQWgryk2c=; b=XN9+urOf4eSTTeuUPrZwpasdD9
	laDv8xHlB9bV48TmzTwzOmccZ92Inv9RBwzGTc2Cz+l8XELugY+hUiznHK8CK+LdI7W3Wh3eYMNjJ
	Vlirv559bWhmCFlKyv3mNSBpsv8oLopZc1ax/g7S9Fr6hJZHkPMYBTIcSGo5mmt748DbXd8Hcaq1+
	RVp9aS+TkJ1YGxiP8E5Yj6YqwzHKTf69grurcdEUYooVsiiqhcptNZ0Wh29byu6rbs7balt+y1fDg
	ztRmDJ7r+h0vJsNnECf2++iBsznVSlbFKdTGxdIr2Wqgfw9d7DUKsBdlU4xOUp22uGXl1lURe0h8Z
	dgX6ZBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6NQ-00000009LOO-0sOy;
	Tue, 06 May 2025 00:41:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Sp-00000008ozJ-2CFM
	for ath12k@bombadil.infradead.org;
	Mon, 05 May 2025 22:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hm2NMTsdF2pMXOEFIRBFGnxNwUTC27XyeYpQWgryk2c=; b=QvydtxOiACbliBU4MQfUA8mO6k
	CiUbwZH7oM2LJfssp8l9RkIb/8wOsSsOJEwmFZV8PaitwHt7FPiorlodOtQ+73XAmmBLlRanDthOM
	33Kgs03+3LXpBIAawjpgSC/yeK8qJlVUCvApRt3DBnv5fUHDbftJkaU6EgULC3t/mUN3qJTFgeOPg
	2a5VSylkM0tD/Y5zlQouD3gZAYKpvn1yx03l1zzU3AkOjQ9RiBUdQpblzXHv1QpqiN3dtW5YsJf4v
	swflRB9DjNMEYf5vVkbSwHQjRkfBkZ4e+3x2AwVaJNNetuibXbGoSCk8oWHja2+ImwpJxbtf7keQl
	lhF5MiGQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uC4Rf-0000000FYqb-2l3k
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74BCAA4CF2F;
	Mon,  5 May 2025 22:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA3AC4CEED;
	Mon,  5 May 2025 22:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484673;
	bh=2wCDXJ3KB6rJrT615y9l6S5rXrHyOtXU93HvlCVo9dM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rkaN5W0Azb3fCv2+AYEs1cmCSRdnBF6zZqKNHn1kvuTubQxG2iHHjCFu8CZHArlbl
	 oSDcWTMi/a0gj/rqV8++J04rJI2C+9eDzDtCKFBnbp92LddCtgY7NSrqbzMcwLLL9R
	 bR6dP+kTVoCsfpyxv/1UOeRDpqFEUnYACrYyVo5MGFbtbmwvoUOqp3rqexKOJYd0Sq
	 9LjxG41i19dFx0BwUFyIAzxcdLQUWPKjP0MbsEqE59e5IQxH6+HTDJZrAkK87lUHEL
	 8i3GJ+JVXw8kfSouGkO/zXfqAoJd3Qkw0iUSS7nux8AQsiQhUMnl+9b7mWzvGLjYip
	 gurDAKVyUZ3UA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lingbo Kong <quic_lingbok@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 600/642] wifi: ath12k: report station mode transmit rate
Date: Mon,  5 May 2025 18:13:36 -0400
Message-Id: <20250505221419.2672473-600-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_233857_035771_8E8B5098 
X-CRM114-Status: GOOD (  20.28  )
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

From: Lingbo Kong <quic_lingbok@quicinc.com>

[ Upstream commit 8a9c06b40882ebea45563059ddc5d57acdec9dda ]

Currently, the transmit rate of "iw dev xxx station dump" command
always show an invalid value.

To address this issue, ath12k parse the info of transmit complete
report from firmware and indicate the transmit rate to mac80211.

This patch affects the station mode of WCN7850 and QCN9274.

After that, "iw dev xxx station dump" show the correct transmit rate.
Such as:

Station 00:03:7f:12:03:03 (on wlo1)
        inactive time:  872 ms
        rx bytes:       219111
        rx packets:     1133
        tx bytes:       53767
        tx packets:     462
        tx retries:     51
        tx failed:      0
        beacon loss:    0
        beacon rx:      403
        rx drop misc:   74
        signal:         -95 dBm
        beacon signal avg:      -18 dBm
        tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219715
Link: https://patch.msgid.link/20250115063537.35797-2-quic_lingbok@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/core.h    |   2 +
 drivers/net/wireless/ath/ath12k/dp_rx.h   |   5 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c   | 139 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal_rx.h  |   5 +-
 drivers/net/wireless/ath/ath12k/hal_tx.h  |  10 +-
 drivers/net/wireless/ath/ath12k/mac.c     |  79 ++++++++++++
 drivers/net/wireless/ath/ath12k/mac.h     |   5 +-
 drivers/net/wireless/ath/ath12k/rx_desc.h |   3 +-
 8 files changed, 238 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 2699c383fc4c9..96b2830e891bd 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -87,6 +87,7 @@ enum wme_ac {
 #define ATH12K_HT_MCS_MAX	7
 #define ATH12K_VHT_MCS_MAX	9
 #define ATH12K_HE_MCS_MAX	11
+#define ATH12K_EHT_MCS_MAX	15
 
 enum ath12k_crypt_mode {
 	/* Only use hardware crypto engine */
@@ -501,6 +502,7 @@ struct ath12k_link_sta {
 	struct ath12k_rx_peer_stats *rx_stats;
 	struct ath12k_wbm_tx_stats *wbm_tx_stats;
 	u32 bw_prev;
+	u32 peer_nss;
 
 	/* For now the assoc link will be considered primary */
 	bool is_assoc_link;
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 1ce82088c9540..c0aa965f47e77 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #ifndef ATH12K_DP_RX_H
 #define ATH12K_DP_RX_H
@@ -79,6 +79,9 @@ static inline u32 ath12k_he_gi_to_nl80211_he_gi(u8 sgi)
 	case RX_MSDU_START_SGI_3_2_US:
 		ret = NL80211_RATE_INFO_HE_GI_3_2;
 		break;
+	default:
+		ret = NL80211_RATE_INFO_HE_GI_0_8;
+		break;
 	}
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index a39bfb959797a..7dc3576287850 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -8,6 +8,8 @@
 #include "dp_tx.h"
 #include "debug.h"
 #include "hw.h"
+#include "peer.h"
+#include "mac.h"
 
 static enum hal_tcl_encap_type
 ath12k_dp_tx_get_encap_type(struct ath12k_link_vif *arvif, struct sk_buff *skb)
@@ -582,6 +584,124 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab,
 	}
 }
 
+static void ath12k_dp_tx_update_txcompl(struct ath12k *ar, struct hal_tx_status *ts)
+{
+	struct ath12k_base *ab = ar->ab;
+	struct ath12k_peer *peer;
+	struct ieee80211_sta *sta;
+	struct ath12k_sta *ahsta;
+	struct ath12k_link_sta *arsta;
+	struct rate_info txrate = {0};
+	u16 rate, ru_tones;
+	u8 rate_idx = 0;
+	int ret;
+
+	spin_lock_bh(&ab->base_lock);
+	peer = ath12k_peer_find_by_id(ab, ts->peer_id);
+	if (!peer || !peer->sta) {
+		ath12k_dbg(ab, ATH12K_DBG_DP_TX,
+			   "failed to find the peer by id %u\n", ts->peer_id);
+		spin_unlock_bh(&ab->base_lock);
+		return;
+	}
+	sta = peer->sta;
+	ahsta = ath12k_sta_to_ahsta(sta);
+	arsta = &ahsta->deflink;
+
+	/* This is to prefer choose the real NSS value arsta->last_txrate.nss,
+	 * if it is invalid, then choose the NSS value while assoc.
+	 */
+	if (arsta->last_txrate.nss)
+		txrate.nss = arsta->last_txrate.nss;
+	else
+		txrate.nss = arsta->peer_nss;
+	spin_unlock_bh(&ab->base_lock);
+
+	switch (ts->pkt_type) {
+	case HAL_TX_RATE_STATS_PKT_TYPE_11A:
+	case HAL_TX_RATE_STATS_PKT_TYPE_11B:
+		ret = ath12k_mac_hw_ratecode_to_legacy_rate(ts->mcs,
+							    ts->pkt_type,
+							    &rate_idx,
+							    &rate);
+		if (ret < 0) {
+			ath12k_warn(ab, "Invalid tx legacy rate %d\n", ret);
+			return;
+		}
+
+		txrate.legacy = rate;
+		break;
+	case HAL_TX_RATE_STATS_PKT_TYPE_11N:
+		if (ts->mcs > ATH12K_HT_MCS_MAX) {
+			ath12k_warn(ab, "Invalid HT mcs index %d\n", ts->mcs);
+			return;
+		}
+
+		if (txrate.nss != 0)
+			txrate.mcs = ts->mcs + 8 * (txrate.nss - 1);
+
+		txrate.flags = RATE_INFO_FLAGS_MCS;
+
+		if (ts->sgi)
+			txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
+		break;
+	case HAL_TX_RATE_STATS_PKT_TYPE_11AC:
+		if (ts->mcs > ATH12K_VHT_MCS_MAX) {
+			ath12k_warn(ab, "Invalid VHT mcs index %d\n", ts->mcs);
+			return;
+		}
+
+		txrate.mcs = ts->mcs;
+		txrate.flags = RATE_INFO_FLAGS_VHT_MCS;
+
+		if (ts->sgi)
+			txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
+		break;
+	case HAL_TX_RATE_STATS_PKT_TYPE_11AX:
+		if (ts->mcs > ATH12K_HE_MCS_MAX) {
+			ath12k_warn(ab, "Invalid HE mcs index %d\n", ts->mcs);
+			return;
+		}
+
+		txrate.mcs = ts->mcs;
+		txrate.flags = RATE_INFO_FLAGS_HE_MCS;
+		txrate.he_gi = ath12k_he_gi_to_nl80211_he_gi(ts->sgi);
+		break;
+	case HAL_TX_RATE_STATS_PKT_TYPE_11BE:
+		if (ts->mcs > ATH12K_EHT_MCS_MAX) {
+			ath12k_warn(ab, "Invalid EHT mcs index %d\n", ts->mcs);
+			return;
+		}
+
+		txrate.mcs = ts->mcs;
+		txrate.flags = RATE_INFO_FLAGS_EHT_MCS;
+		txrate.eht_gi = ath12k_mac_eht_gi_to_nl80211_eht_gi(ts->sgi);
+		break;
+	default:
+		ath12k_warn(ab, "Invalid tx pkt type: %d\n", ts->pkt_type);
+		return;
+	}
+
+	txrate.bw = ath12k_mac_bw_to_mac80211_bw(ts->bw);
+
+	if (ts->ofdma && ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11AX) {
+		txrate.bw = RATE_INFO_BW_HE_RU;
+		ru_tones = ath12k_mac_he_convert_tones_to_ru_tones(ts->tones);
+		txrate.he_ru_alloc =
+			ath12k_he_ru_tones_to_nl80211_he_ru_alloc(ru_tones);
+	}
+
+	if (ts->ofdma && ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11BE) {
+		txrate.bw = RATE_INFO_BW_EHT_RU;
+		txrate.eht_ru_alloc =
+			ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(ts->tones);
+	}
+
+	spin_lock_bh(&ab->base_lock);
+	arsta->txrate = txrate;
+	spin_unlock_bh(&ab->base_lock);
+}
+
 static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 				       struct sk_buff *msdu,
 				       struct hal_tx_status *ts)
@@ -660,6 +780,8 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	 * Might end up reporting it out-of-band from HTT stats.
 	 */
 
+	ath12k_dp_tx_update_txcompl(ar, ts);
+
 	ieee80211_tx_status_skb(ath12k_ar_to_hw(ar), msdu);
 
 exit:
@@ -670,6 +792,8 @@ static void ath12k_dp_tx_status_parse(struct ath12k_base *ab,
 				      struct hal_wbm_completion_ring_tx *desc,
 				      struct hal_tx_status *ts)
 {
+	u32 info0 = le32_to_cpu(desc->rate_stats.info0);
+
 	ts->buf_rel_source =
 		le32_get_bits(desc->info0, HAL_WBM_COMPL_TX_INFO0_REL_SRC_MODULE);
 	if (ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_FW &&
@@ -684,10 +808,17 @@ static void ath12k_dp_tx_status_parse(struct ath12k_base *ab,
 
 	ts->ppdu_id = le32_get_bits(desc->info1,
 				    HAL_WBM_COMPL_TX_INFO1_TQM_STATUS_NUMBER);
-	if (le32_to_cpu(desc->rate_stats.info0) & HAL_TX_RATE_STATS_INFO0_VALID)
-		ts->rate_stats = le32_to_cpu(desc->rate_stats.info0);
-	else
-		ts->rate_stats = 0;
+
+	ts->peer_id = le32_get_bits(desc->info3, HAL_WBM_COMPL_TX_INFO3_PEER_ID);
+
+	if (info0 & HAL_TX_RATE_STATS_INFO0_VALID) {
+		ts->pkt_type = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_PKT_TYPE);
+		ts->mcs = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_MCS);
+		ts->sgi = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_SGI);
+		ts->bw = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_BW);
+		ts->tones = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_TONES_IN_RU);
+		ts->ofdma = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_OFDMA_TX);
+	}
 }
 
 void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 55b2dd5b76f6b..ac3b3f17ec2c8 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_HAL_RX_H
@@ -666,6 +666,9 @@ enum nl80211_he_ru_alloc ath12k_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones)
 	case RU_996:
 		ret = NL80211_RATE_INFO_HE_RU_ALLOC_996;
 		break;
+	case RU_2X996:
+		ret = NL80211_RATE_INFO_HE_RU_ALLOC_2x996;
+		break;
 	case RU_26:
 		fallthrough;
 	default:
diff --git a/drivers/net/wireless/ath/ath12k/hal_tx.h b/drivers/net/wireless/ath/ath12k/hal_tx.h
index 3cf5973771d78..eb065a79f6c64 100644
--- a/drivers/net/wireless/ath/ath12k/hal_tx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_tx.h
@@ -1,7 +1,8 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024-2025 Qualcomm Innovation Center, Inc.
+ * All rights reserved.
  */
 
 #ifndef ATH12K_HAL_TX_H
@@ -63,7 +64,12 @@ struct hal_tx_status {
 	u8 try_cnt;
 	u8 tid;
 	u16 peer_id;
-	u32 rate_stats;
+	enum hal_tx_rate_stats_pkt_type pkt_type;
+	enum hal_tx_rate_stats_sgi sgi;
+	enum ath12k_supported_bw bw;
+	u8 mcs;
+	u16 tones;
+	u8 ofdma;
 };
 
 #define HAL_TX_PHY_DESC_INFO0_BF_TYPE		GENMASK(17, 16)
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 95ad9fefbdfcd..5f6d9896ef613 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -337,6 +337,82 @@ static const char *ath12k_mac_phymode_str(enum wmi_phy_mode mode)
 	return "<unknown>";
 }
 
+u16 ath12k_mac_he_convert_tones_to_ru_tones(u16 tones)
+{
+	switch (tones) {
+	case 26:
+		return RU_26;
+	case 52:
+		return RU_52;
+	case 106:
+		return RU_106;
+	case 242:
+		return RU_242;
+	case 484:
+		return RU_484;
+	case 996:
+		return RU_996;
+	case (996 * 2):
+		return RU_2X996;
+	default:
+		return RU_26;
+	}
+}
+
+enum nl80211_eht_gi ath12k_mac_eht_gi_to_nl80211_eht_gi(u8 sgi)
+{
+	switch (sgi) {
+	case RX_MSDU_START_SGI_0_8_US:
+		return NL80211_RATE_INFO_EHT_GI_0_8;
+	case RX_MSDU_START_SGI_1_6_US:
+		return NL80211_RATE_INFO_EHT_GI_1_6;
+	case RX_MSDU_START_SGI_3_2_US:
+		return NL80211_RATE_INFO_EHT_GI_3_2;
+	default:
+		return NL80211_RATE_INFO_EHT_GI_0_8;
+	}
+}
+
+enum nl80211_eht_ru_alloc ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(u16 ru_tones)
+{
+	switch (ru_tones) {
+	case 26:
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_26;
+	case 52:
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_52;
+	case (52 + 26):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_52P26;
+	case 106:
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_106;
+	case (106 + 26):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_106P26;
+	case 242:
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_242;
+	case 484:
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_484;
+	case (484 + 242):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_484P242;
+	case 996:
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_996;
+	case (996 + 484):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_996P484;
+	case (996 + 484 + 242):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_996P484P242;
+	case (2 * 996):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_2x996;
+	case (2 * 996 + 484):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_2x996P484;
+	case (3 * 996):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_3x996;
+	case (3 * 996 + 484):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_3x996P484;
+	case (4 * 996):
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_4x996;
+	default:
+		return NL80211_RATE_INFO_EHT_RU_ALLOC_26;
+	}
+}
+
 enum rate_info_bw
 ath12k_mac_bw_to_mac80211_bw(enum ath12k_supported_bw bw)
 {
@@ -3116,6 +3192,7 @@ static void ath12k_peer_assoc_prepare(struct ath12k *ar,
 	ath12k_peer_assoc_h_smps(arsta, arg);
 	ath12k_peer_assoc_h_mlo(arsta, arg);
 
+	arsta->peer_nss = arg->peer_nss;
 	/* TODO: amsdu_disable req? */
 }
 
@@ -10042,6 +10119,8 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->txrate.he_gi = arsta->txrate.he_gi;
 		sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
 		sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
+		sinfo->txrate.eht_gi = arsta->txrate.eht_gi;
+		sinfo->txrate.eht_ru_alloc = arsta->txrate.eht_ru_alloc;
 	}
 	sinfo->txrate.flags = arsta->txrate.flags;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 3594729b63974..1acaf3f68292c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_MAC_H
@@ -108,5 +108,8 @@ int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif);
 void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
 					  struct ieee80211_chanctx_conf *conf,
 					  void *data);
+u16 ath12k_mac_he_convert_tones_to_ru_tones(u16 tones);
+enum nl80211_eht_ru_alloc ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(u16 ru_tones);
+enum nl80211_eht_gi ath12k_mac_eht_gi_to_nl80211_eht_gi(u8 sgi);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/rx_desc.h b/drivers/net/wireless/ath/ath12k/rx_desc.h
index fc1eceb2d99bb..7367935ee68b3 100644
--- a/drivers/net/wireless/ath/ath12k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath12k/rx_desc.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #ifndef ATH12K_RX_DESC_H
 #define ATH12K_RX_DESC_H
@@ -1548,5 +1548,6 @@ struct hal_rx_desc {
 #define RU_242 9
 #define RU_484 18
 #define RU_996 37
+#define RU_2X996 74
 
 #endif /* ATH12K_RX_DESC_H */
-- 
2.39.5



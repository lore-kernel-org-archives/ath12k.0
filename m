Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157F5C02182
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIbrWrMI+N2BWb9uyfGS6uE12sHHLEMOfoLvYjprF24=; b=3r5/K9jZphRQqn8mc7/ckRudEe
	mxZHYdPcR8TYNZw1cfAhdwsSQowYDM9+pwwc/V70MjxAHLD/4MoHWVVIeR27VqyJtvbXsSGJD7HaT
	HU2QBSLQRVAytFPytilSj7dnREcUY+Z+o93KebtBTeEVnrT6p/Aso6jaiSxlEf3F1H+5xpjm/cdQu
	/TdMmKJ9Jc8VW/EX4VZSnEeeejcfsDQ9ZaZYrmmGV2L/osvEi6caeROjLSKykSNKuxXR+HDhreYST
	MyOxsnTopUKrK/PMzYmiOIDrLO0w27nVcI551SFmF+Q29+eAot7DHtbidp4V5ZW7WVKZcUDCtK6Pk
	T982gC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taau2-0000000AIma-3UdU
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 13:36:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taat4-0000000AIgd-07zR
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 13:35:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9CrN0011285;
	Wed, 22 Jan 2025 13:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GIbrWrMI+N2BWb9uyfGS6uE12sHHLEMOfoLvYjprF24=; b=U4iohUV48gCFsyPT
	LR/0eEnNmobzzZlvykm1VDWva8dSwxWz85x/wC4TmN9n+NPdhm19cXbndCsRRJAZ
	thTHwCMDHSh3x6CcHc5GS+3pYmwKuihCCTRtQXWEpw7nniu35Hxg80cKajmYP8Ym
	olQApRzUj2H5bGRn6SPvd0gyAzyKXJ9Vwx/yNBOSlYMATa6VS+1vGP8/N+hS5pR9
	aFXCvzydsBryyLEBXdut3VdcVKlsgzCwzekAE4aTxO7CAjjtqj8dlhNbSs09Eb/S
	DqWbstjGe1qDRc8QjSmW+l3UCssPA0uhkfqA+hWQhk1ga+0S2+sSbGeSsv0RN630
	SmJ78A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44awuh0mak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 13:35:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50MDZFMb012447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 13:35:15 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 Jan 2025 05:35:13 -0800
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Sarika
 Sharma" <quic_sarishar@quicinc.com>
Subject: [PATCH RFC 2/3] wifi: ath12k: add link support for multi-link in arsta
Date: Wed, 22 Jan 2025 19:04:23 +0530
Message-ID: <20250122133424.1226555-3-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122133424.1226555-1-quic_sarishar@quicinc.com>
References: <20250122133424.1226555-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XwjydktoHqKCGYqy-G-C5r5myqzAqDGG
X-Proofpoint-ORIG-GUID: XwjydktoHqKCGYqy-G-C5r5myqzAqDGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=847 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_053518_187259_7E5E0E6B 
X-CRM114-Status: GOOD (  17.62  )
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

Currently, statistics in arsta are updated at deflink for both non-ML
and multi-link(ML) station. Link statistics are not updated for
multi-link operation(MLO).

Hence, add support to correctly obtain the link ID if the peer is ML,
fetch the arsta from the appropriate link ID, and update the
statistics in the corresponding arsta.

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 25 +++++++++++++++-------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 11 ++++++----
 drivers/net/wireless/ath/ath12k/peer.h   | 27 +++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 53f8e8f8959a..1d9efc4682c6 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "dp_mon.h"
@@ -2303,7 +2303,6 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k *ar,
 				   struct hal_rx_mon_ppdu_info *ppdu_info,
 				   u32 uid)
 {
-	struct ath12k_sta *ahsta;
 	struct ath12k_link_sta *arsta;
 	struct ath12k_rx_peer_stats *rx_stats = NULL;
 	struct hal_rx_user_status *user_stats = &ppdu_info->userstats[uid];
@@ -2321,10 +2320,14 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k *ar,
 		return;
 	}
 
-	ahsta = ath12k_sta_to_ahsta(peer->sta);
-	arsta = &ahsta->deflink;
-	rx_stats = arsta->rx_stats;
+	arsta = ath12k_peer_get_link_sta(ar->ab, peer);
+	if (!arsta) {
+		ath12k_warn(ar->ab, "link sta not found on peer %pM id %d\n",
+			    peer->addr, peer->peer_id);
+		return;
+	}
 
+	rx_stats = arsta->rx_stats;
 	if (!rx_stats)
 		return;
 
@@ -2429,7 +2432,6 @@ int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
 	struct dp_srng *mon_dst_ring;
 	struct hal_srng *srng;
 	struct dp_rxdma_mon_ring *buf_ring;
-	struct ath12k_sta *ahsta = NULL;
 	struct ath12k_link_sta *arsta;
 	struct ath12k_peer *peer;
 	u64 cookie;
@@ -2499,8 +2501,15 @@ int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
 			}
 
 			if (ppdu_info->reception_type == HAL_RX_RECEPTION_TYPE_SU) {
-				ahsta = ath12k_sta_to_ahsta(peer->sta);
-				arsta = &ahsta->deflink;
+				arsta = ath12k_peer_get_link_sta(ar->ab, peer);
+				if (!arsta) {
+					ath12k_warn(ar->ab, "link sta not found on peer %pM id %d\n",
+						    peer->addr, peer->peer_id);
+					spin_unlock_bh(&ab->base_lock);
+					rcu_read_unlock();
+					dev_kfree_skb_any(skb);
+					continue;
+				}
 				ath12k_dp_mon_rx_update_peer_su_stats(ar, arsta,
 								      ppdu_info);
 			} else if ((ppdu_info->fc_valid) &&
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index dad35bfd83f6..eae85849c88f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/ieee80211.h>
@@ -1362,7 +1362,6 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_peer *peer;
 	struct ieee80211_sta *sta;
-	struct ath12k_sta *ahsta;
 	struct ath12k_link_sta *arsta;
 	struct htt_ppdu_stats_user_rate *user_rate;
 	struct ath12k_per_peer_tx_stats *peer_stats = &ar->peer_tx_stats;
@@ -1444,8 +1443,12 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 	}
 
 	sta = peer->sta;
-	ahsta = ath12k_sta_to_ahsta(sta);
-	arsta = &ahsta->deflink;
+	arsta = ath12k_peer_get_link_sta(ab, peer);
+	if (!arsta) {
+		spin_unlock_bh(&ab->base_lock);
+		rcu_read_unlock();
+		return;
+	}
 
 	memset(&arsta->txrate, 0, sizeof(arsta->txrate));
 
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index 5870ee11a8c7..7474053f54b0 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_PEER_H
@@ -90,5 +90,30 @@ struct ath12k_peer *ath12k_peer_find_by_ast(struct ath12k_base *ab, int ast_hash
 int ath12k_peer_ml_create(struct ath12k_hw *ah, struct ieee80211_sta *sta);
 int ath12k_peer_ml_delete(struct ath12k_hw *ah, struct ieee80211_sta *sta);
 int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_sta *ahsta);
+static inline
+struct ath12k_link_sta *ath12k_peer_get_link_sta(struct ath12k_base *ab,
+						 struct ath12k_peer *peer)
+{
+	struct ath12k_sta *ahsta;
+	struct ath12k_link_sta *arsta;
+
+	if (!peer->sta)
+		return NULL;
+
+	ahsta = ath12k_sta_to_ahsta(peer->sta);
+	if (peer->ml_id & ATH12K_PEER_ML_ID_VALID) {
+		if (!(ahsta->links_map & BIT(peer->link_id))) {
+			ath12k_warn(ab, "peer %pM id %d link_id %d can't found in STA link_map 0x%x\n",
+				    peer->addr, peer->peer_id, peer->link_id, ahsta->links_map);
+			return NULL;
+		}
+		arsta = rcu_dereference(ahsta->link[peer->link_id]);
+		if (!arsta)
+			return NULL;
+	} else {
+		arsta =  &ahsta->deflink;
+	}
+	return arsta;
+}
 
 #endif /* _PEER_H_ */
-- 
2.34.1



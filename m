Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A31CE77198
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 02:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XGvDgByCz8sIMX5YaFKLA0vS+Nm1Q+Der5bG+5txxU=; b=TrMVGEkQQfP7Gx3+w1DosylHM4
	PxXge9GM/lkIlu66cOWrFMLoDudoMEjmxyAy6yk5pqR2/GS8hV8k1ZZq9zwV5KWfTinMZK2FJYWRU
	N3tNNrcNcN3fELRnn+Y+Kz15WU4NpT5V1NP0HHbwRF3snS9F/QlLFKJ2bIiQlz8NW4pyuzinKGY/I
	OuOlnGtjtd5t1o/bG8LIZAn24oDK5bophpz++AU5mpENfDnfecEs2vbjl2BIsk4gczI7IQqjIwJg8
	FIfjzvHmzByQqtNmdryre2YtrIEOHlYN+sj3ZgUSPGRt6zXOQSWT/OyoLRLs29KZ5PvO0++sAhZSu
	nLpGOOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUz3W-00000003BGP-0ULv
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 02:10:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUz3S-00000003BD6-0Q6K
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 02:10:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5070MYHT006449;
	Tue, 7 Jan 2025 02:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XGvDgByCz8sIMX5YaFKLA0vS+Nm1Q+Der5bG+5txxU=; b=bHK5KZFMwfomB+DZ
	PImdKY2uyRpPRSkRGNiW4IS445hO/hRWsMjKDF9xpGN/Ax+tdD3i2GTn/Szy3Pwr
	9IV+TYILR7qfE8/hoPWOw58k6In2yMruuS+SjmJwvFZr2sEu3C5ySPsIHZ4z6sXU
	v8kSjECau8/kH/6/3AxXiMu1ZybLIt6PuIsBl7n/dUsAkSnGupr5OheOcxP4LheB
	0eGdQL4xmaYhAONZwqf98UvpgtrAPoIzp4bnK99U9sckHjrxhCpBD/XYCxoRshEk
	+62VVIXkG5wxcUmaBrHViJHPsCD3WpSqKz/+Mh//iQrE9SnHatUlzvof/Kwe6tCw
	EHJgUQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440m4a0vu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 02:10:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5072AnHg010443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 02:10:49 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 6 Jan 2025 18:10:47 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: [PATCH 7/7] wifi: ath12k: add monitor interface support on QCN9274
Date: Tue, 7 Jan 2025 07:40:17 +0530
Message-ID: <20250107021017.3857555-8-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
References: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kjnslIJi6PbMiK0MtAelVJUkupkIMa2Q
X-Proofpoint-ORIG-GUID: kjnslIJi6PbMiK0MtAelVJUkupkIMa2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_181050_154207_8342ACAA 
X-CRM114-Status: GOOD (  19.95  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

Currently, the monitor interface is not supported. To support the monitor
interface, configure the monitor vdev state identifier, configure the HTT
filter setup, subscribe the mac80211 WANT_MONITOR_VIF feature and prevent
monitor interface to transmit packet. Therefore, add these procedures to
add monitor interface support and enable the monitor interface support on
the QCN9274 platform through the hardware parameter.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c  |  7 ++++++-
 drivers/net/wireless/ath/ath12k/dp_tx.c |  4 +++-
 drivers/net/wireless/ath/ath12k/hw.c    |  4 ++--
 drivers/net/wireless/ath/ath12k/mac.c   | 22 ++++++++++++++++++++++
 4 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c6b35aac96e..3a194cc52598 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -1261,6 +1261,11 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 				     ath12k_mac_tx_mgmt_pending_free, ar);
 			idr_destroy(&ar->txmgmt_idr);
 			wake_up(&ar->txmgmt_empty_waitq);
+
+			ar->monitor_vdev_id = -1;
+			ar->monitor_conf_enabled = false;
+			ar->monitor_vdev_created = false;
+			ar->monitor_started = false;
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index b8f0df6f7a05..81d1ff918f48 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
@@ -1277,6 +1277,8 @@ int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
 					HTT_RX_MON_MO_CTRL_FILTER_FLASG3 |
 					HTT_RX_MON_FP_DATA_FILTER_FLASG3 |
 					HTT_RX_MON_MO_DATA_FILTER_FLASG3;
+	} else {
+		tlv_filter.rxmon_disable = true;
 	}
 
 	if (ab->hw_params->rxdma1_enable) {
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index a106ebed7870..021a4b565e8b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/types.h>
@@ -1049,7 +1049,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 					BIT(NL80211_IFTYPE_AP) |
 					BIT(NL80211_IFTYPE_MESH_POINT) |
 					BIT(NL80211_IFTYPE_AP_VLAN),
-		.supports_monitor = false,
+		.supports_monitor = true,
 
 		.idle_ps = false,
 		.download_calib = true,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index abf7c7ed8967..27d44b508884 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1264,6 +1264,12 @@ static int ath12k_mac_monitor_start(struct ath12k *ar)
 		return ret;
 	}
 
+	ret = ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
+	if (ret) {
+		ath12k_warn(ar->ab, "fail to set monitor filter: %d\n", ret);
+		return ret;
+	}
+
 	ar->monitor_started = true;
 	ar->num_started_vdevs++;
 	ret = ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
@@ -7170,6 +7176,11 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 	u8 link_id;
 	int ret;
 
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
+		ieee80211_free_txskb(hw, skb);
+		return;
+	}
+
 	link_id = u32_get_bits(info->control.flags, IEEE80211_TX_CTRL_MLO_LINK);
 	memset(skb_cb, 0, sizeof(*skb_cb));
 	skb_cb->vif = vif;
@@ -7253,6 +7264,8 @@ static int ath12k_mac_config_mon_status_default(struct ath12k *ar, bool enable)
 	else
 		tlv_filter.rxmon_disable = true;
 
+	tlv_filter.offset_valid = false;
+
 	for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++) {
 		ring_id = ar->dp.rxdma_mon_dst_ring[i].ring_id;
 		ret = ath12k_dp_tx_htt_rx_filter_setup(ab, ring_id,
@@ -8021,6 +8034,9 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	}
 
 err_vdev_del:
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR)
+		ar->monitor_vdev_id = -1;
+
 	ath12k_wmi_vdev_delete(ar, arvif->vdev_id);
 	ar->num_created_vdevs--;
 	arvif->is_created = false;
@@ -10894,6 +10910,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	ieee80211_hw_set(hw, QUEUE_CONTROL);
 	ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
 	ieee80211_hw_set(hw, REPORTS_LOW_ACK);
+	ieee80211_hw_set(hw, WANT_MONITOR_VIF);
 
 	if ((ht_cap & WMI_HT_CAP_ENABLED) || is_6ghz) {
 		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
@@ -11089,6 +11106,11 @@ static void ath12k_mac_setup(struct ath12k *ar)
 
 	wiphy_work_init(&ar->wmi_mgmt_tx_work, ath12k_mgmt_over_wmi_tx_work);
 	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
+
+	ar->monitor_vdev_id = -1;
+	ar->monitor_conf_enabled = false;
+	ar->monitor_vdev_created = false;
+	ar->monitor_started = false;
 }
 
 static int __ath12k_mac_mlo_setup(struct ath12k *ar)
-- 
2.34.1



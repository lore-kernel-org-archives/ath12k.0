Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6DCE77190
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 06:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BO3T0BLegpRuLbS0SyEfl5KrbyKkCpJ8omkLZns9JWw=; b=0O4FcjBKz9c4q+kaabsML9avBS
	beiAXnWdiGE1SSOmqikqO3uVfbNpsOfSUaIKViwG2nC4Z79CY6jAqAeniNfn/C9tIdC0ndyPa4CRi
	FJDSxujOiyLqk+4QyvMeAmKYYdTs2urbmg6r1U4KSoagQqVvy84nK2aiXq5bacFRjHVd/xXFC9+Wn
	GjaNvFa0N80KQ0eDO7kd6hgyZHAkDlMfoHJZiWw3A2X4kqFFQ2yNsYhuO23fhpRtwh69Iy5azKN0x
	lR5pnKMhm3JPYplKSEf9t7VR8TN9pWcUPoDnhLY50IAZq5eas/Pka7rcVnNWoOZoaOG+oACFPaTQh
	Q+k6ixkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbW4-00000009NN8-3mhQ
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 06:02:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbVr-00000009NJR-18iz
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 06:01:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5rSbQ018255;
	Mon, 23 Dec 2024 06:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BO3T0BLegpRuLbS0SyEfl5KrbyKkCpJ8omkLZns9JWw=; b=n6JfL4p9+Ks1YcRM
	UrfNwTay9AVAfN6BDMdVrCguHPc2TsFuaaKrZkyziNT0Z5AHaxn8H5+dP6hqUofB
	23T7osnpBej50RF4fPjffWTC11CPIncq45D/cP4lpPgLHOIiq7s6p3aWUZAnbvjv
	HceCN6OeV705LzVIpYM+uu8fwTi/VIBfc0O3tdua3Ixo7Tl+oUATxCpTr2UHOLV6
	SquqVSWF280Fyv18N+F0+tSGuRzVSZGi+SBmxo0TKZtRhNRnrN4x09Ps0kkzXZmG
	eULGhfkn5iVm+q25B9OKVx+tqHbhCVe4iAXVPKcmxnJUuGK/GcKeWBsta64QZ3bC
	nKGt5Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q2458113-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:01:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN61su8023855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:01:54 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 22 Dec 2024 22:01:52 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v2 03/14] wifi: ath12k: Avoid multiple times configuring monitor filter
Date: Mon, 23 Dec 2024 11:31:21 +0530
Message-ID: <20241223060132.3506372-4-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
References: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OcSEIeldhVUu1K7RWXvpYqNru6QEiBIA
X-Proofpoint-GUID: OcSEIeldhVUu1K7RWXvpYqNru6QEiBIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=968 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_220155_341039_15F7925A 
X-CRM114-Status: GOOD (  17.25  )
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

ath12k_mac_op_configure_filter() gets called multiple times during
interface bringup. Applying filter configuration from this function leads
to writing same filter configurations multiple times.

Resolve this issue by relocating the filter configuration to
ath12k_mac_config_mon_status_default(), which is invoked by both
ath12k_mac_op_start() and ath12k_mac_op_stop(). Additionally, set the
rxmon_disable flag to true when called from ath12k_mac_op_stop() to
disable the monitor destination ring.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 57 +++++++++++++++------------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6f10813d9378..5b9d583d37dd 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7237,8 +7237,36 @@ void ath12k_mac_drain_tx(struct ath12k *ar)
 
 static int ath12k_mac_config_mon_status_default(struct ath12k *ar, bool enable)
 {
-	return -EOPNOTSUPP;
-	/* TODO: Need to support new monitor mode */
+	struct htt_rx_ring_tlv_filter tlv_filter = {};
+	struct ath12k_base *ab = ar->ab;
+	u32 ring_id, i;
+	int ret = 0;
+
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	if (!ab->hw_params->rxdma1_enable)
+		return ret;
+
+	if (enable)
+		tlv_filter = ath12k_mac_mon_status_filter_default;
+	else
+		tlv_filter.rxmon_disable = true;
+
+	for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++) {
+		ring_id = ar->dp.rxdma_mon_dst_ring[i].ring_id;
+		ret = ath12k_dp_tx_htt_rx_filter_setup(ab, ring_id,
+						       ar->dp.mac_id + i,
+						       HAL_RXDMA_MONITOR_DST,
+						       DP_RXDMA_REFILL_RING_SIZE,
+						       &tlv_filter);
+		if (ret) {
+			ath12k_err(ab,
+				   "failed to setup filter for monitor buf %d\n",
+				   ret);
+		}
+	}
+
+	return ret;
 }
 
 static int ath12k_mac_start(struct ath12k *ar)
@@ -8363,29 +8391,6 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	FIF_PROBE_REQ |				\
 	FIF_FCSFAIL)
 
-static void ath12k_mac_configure_filter(struct ath12k *ar,
-					unsigned int total_flags)
-{
-	bool reset_flag;
-	int ret;
-
-	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
-
-	ar->filter_flags = total_flags;
-
-	/* For monitor mode */
-	reset_flag = !(ar->filter_flags & FIF_BCN_PRBRESP_PROMISC);
-
-	ret = ath12k_dp_tx_htt_monitor_mode_ring_config(ar, reset_flag);
-	if (ret)
-		ath12k_warn(ar->ab,
-			    "fail to set monitor filter: %d\n", ret);
-
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
-		   "total_flags:0x%x, reset_flag:%d\n",
-		   total_flags, reset_flag);
-}
-
 static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
 					   unsigned int changed_flags,
 					   unsigned int *total_flags,
@@ -8399,7 +8404,7 @@ static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
 	ar = ath12k_ah_to_ar(ah, 0);
 
 	*total_flags &= SUPPORTED_FILTERS;
-	ath12k_mac_configure_filter(ar, *total_flags);
+	ar->filter_flags = *total_flags;
 }
 
 static int ath12k_mac_op_get_antenna(struct ieee80211_hw *hw, u32 *tx_ant, u32 *rx_ant)
-- 
2.34.1



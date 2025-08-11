Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430FCC87FDB
	for <ath12k@archiver.kernel.org>; Mon, 11 Aug 2025 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/rMs0uaMR+KgQCMTKv07jLHHPepVpjxPo8VxUHc8UZ8=; b=NYVHZ5e0LglcQ4ok4n6YNDh3QT
	g5F+kQ+UZQkScFbgmq7mQPqlGYRLUTcwPo616GctLgsqvyHFDaR7JoPTONYXtWmRPopS+Sv5flhRM
	/s/EBdTCtzE1exmqXSslTOrJf4pcHNR8HrY3T3vpQkTehjlwQSwe+DSGFOrqveRJAfhUIiSssGSAK
	6fSSES5aH/Jn1gatjgUQuUmee6m+JLZ2Ac/1hE9z+tw54WypYd8GphXk5CBPKO4HXBGmqeEH2hfGE
	hUS7YD5SNcL+URPpSQ4hc/MvsOg0fBwBvaFFLydb6+GHa0hWxkq5ZhSZxJRUNKvKvMbDiffzMU3JM
	t1r+T49Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQs3-00000007YHa-48K7;
	Mon, 11 Aug 2025 11:39:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQbO-00000007Uqy-1YAg
	for ath12k@lists.infradead.org;
	Mon, 11 Aug 2025 11:22:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dafL019469;
	Mon, 11 Aug 2025 11:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/rMs0uaMR+KgQCMTKv07jL
	HHPepVpjxPo8VxUHc8UZ8=; b=Ku67LWi48PcABcMi2p8wqpNEoFAqs1en7f5FvP
	CjcSoPTWsRcs42QG9wmpCxSQDt0P2tODQtPvfOljhNK5WePGPnib98OLwvlL1Ynr
	lm0hGBT8A6C4RYa15UArPXiA5BbWqJ+lI8h0BwEMyjjUZk1uzFkXqSeXlljp7MRh
	dwZpBS45eM8jlSaiOwDwSVehm7GpbMRShAShUbdIOh3RYWIxYMZ6g2pknlbhtWKq
	hF1Hr+pKNJR4pb05LknpDHN5N0YhWUVy+8D2STHJb4EqIbRP9r+iS+rmPCpRkFMA
	2vLLQTgX3079iUft52KflwsQ/u4c1Op8vj36Qy1bVMdFQ2Qg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g44x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 11:22:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BBM4C2022112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 11:22:04 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 11 Aug 2025 04:22:03 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH ath-next v3] wifi: ath12k: report station mode per-chain signal strength
Date: Mon, 11 Aug 2025 19:21:32 +0800
Message-ID: <20250811112132.48946-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899d25d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=k1aAsksJOUkTdZsVf0wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX+NFqfNN3k96d
 ph5jXI++mHeS8RzuJFqaWd5wG/BNgIgfk7bqf8wRgZG59+4YlLa+DyN0GDS8a36UkUy7aauCj+o
 /RbiDwBP3dFR2PSZWmYPQnAqBZYssCot9FzqILScWxk11xnKF9WCRm3kGejpKfK3qYIHl/aOE6Y
 jWhdy7qK6DN/K7sVGYvL8lnrO6mBtbciQhWUe8H5VfYQywTYD0dlRPsRvBrS1sqZHdOLJJ9ZTsa
 B1bMylMrX/uqSqGyt7M7VLkaby0AU9gOvViMlc/S5wPESpFPD6CNfqYIbnqjnLJUECQ6tp6Cj1s
 7cSGsWvAD5hQwS8DEgifMGqtR4TLEaZLi8nX/q1W/QCrMJ3vUrBRnxMs/UzPZeoSqXE5ebWW/Fk
 g333PRj7
X-Proofpoint-GUID: Qr4KxOGUVy2r4JWNbsTNhmu5gkyI8otw
X-Proofpoint-ORIG-GUID: Qr4KxOGUVy2r4JWNbsTNhmu5gkyI8otw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_042206_423833_02DC446F 
X-CRM114-Status: GOOD (  21.18  )
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

Currently, command “iw wlan0 station dump” does not show per-chain signal
strength.

This is because ath12k does not handle the num_per_chain_rssi and
rssi_avg_beacon reported by firmware to ath12k.

To address this, update ath12k to send WMI_REQUEST_STATS_CMDID with the
flag WMI_REQUEST_RSSI_PER_CHAIN_STAT to the firmware. Then, add logic to
handle num_per_chain_rssi and rssi_avg_beacon in the
ath12k_wmi_tlv_fw_stats_parse(), and assign the resulting per-chain signal
strength to the chain_signal of struct station_info.

After that, "iw dev xxx station dump" shows the correct per-chain signal
strength.
Such as:

Station AA:BB:CC:DD:EE:FF (on wlan0)
        inactive time:  212 ms
        rx bytes:       10398
        rx packets:     64
        tx bytes:       4362
        tx packets:     33
        tx retries:     49
        tx failed:      0
        beacon loss:    0
        beacon rx:      14
        rx drop misc:   16
        signal:         -45 [-51, -46] dBm
        beacon signal avg:      -44 dBm

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219751
Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
v3:
1.rebase to d9104cec3e8f

v2:
1.add break to avoid warning

 drivers/net/wireless/ath/ath12k/core.h |  4 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 27 +++++++
 drivers/net/wireless/ath/ath12k/wmi.c  | 98 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  | 18 ++++-
 4 files changed, 144 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 519f826f56c8..3c1996400512 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -72,6 +72,9 @@
 #define ATH12K_MAX_MLO_PEERS            256
 #define ATH12K_MLO_PEER_ID_INVALID      0xFFFF
 
+#define ATH12K_INVALID_RSSI_FULL -1
+#define ATH12K_INVALID_RSSI_EMPTY -128
+
 enum ath12k_bdf_search {
 	ATH12K_BDF_SEARCH_DEFAULT,
 	ATH12K_BDF_SEARCH_BUS_AND_BOARD,
@@ -560,6 +563,7 @@ struct ath12k_link_sta {
 	u32 bw_prev;
 	u32 peer_nss;
 	s8 rssi_beacon;
+	s8 chain_signal[IEEE80211_MAX_CHAINS];
 
 	/* For now the assoc link will be considered primary */
 	bool is_assoc_link;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bd1ec3b2c084..e02617e8ee7b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12598,6 +12598,27 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	return 0;
 }
 
+static void ath12k_mac_put_chain_rssi(struct station_info *sinfo,
+				      struct ath12k_link_sta *arsta)
+{
+	s8 rssi;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
+		sinfo->chains &= ~BIT(i);
+		rssi = arsta->chain_signal[i];
+
+		if (rssi != ATH12K_DEFAULT_NOISE_FLOOR &&
+		    rssi != ATH12K_INVALID_RSSI_FULL &&
+		    rssi != ATH12K_INVALID_RSSI_EMPTY &&
+		    rssi != 0) {
+			sinfo->chain_signal[i] = rssi;
+			sinfo->chains |= BIT(i);
+			sinfo->filled |= BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL);
+		}
+	}
+}
+
 static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 					 struct ieee80211_vif *vif,
 					 struct ieee80211_sta *sta,
@@ -12655,6 +12676,12 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	    !(ath12k_mac_get_fw_stats(ar, &params)))
 		signal = arsta->rssi_beacon;
 
+	params.stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
+	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL)) &&
+	    ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
+	    !(ath12k_mac_get_fw_stats(ar, &params)))
+		ath12k_mac_put_chain_rssi(sinfo, arsta);
+
 	spin_lock_bh(&ar->data_lock);
 	noise_floor = ath12k_pdev_get_noise_floor(ar);
 	spin_unlock_bh(&ar->data_lock);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index da85c28ec355..12eb72fc4713 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -30,6 +30,9 @@ struct ath12k_wmi_svc_ready_parse {
 struct wmi_tlv_fw_stats_parse {
 	const struct wmi_stats_event *ev;
 	struct ath12k_fw_stats *stats;
+	const struct wmi_per_chain_rssi_stat_params *rssi;
+	int rssi_num;
+	bool chain_rssi_done;
 };
 
 struct ath12k_wmi_dma_ring_caps_parse {
@@ -185,6 +188,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_p2p_noa_event) },
 	[WMI_TAG_11D_NEW_COUNTRY_EVENT] = {
 		.min_len = sizeof(struct wmi_11d_new_cc_event) },
+	[WMI_TAG_PER_CHAIN_RSSI_STATS] = {
+		.min_len = sizeof(struct wmi_per_chain_rssi_stat_params) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -8218,6 +8223,77 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 	return ret;
 }
 
+static int ath12k_wmi_tlv_rssi_chain_parse(struct ath12k_base *ab,
+					   u16 tag, u16 len,
+					   const void *ptr, void *data)
+{
+	const struct wmi_rssi_stat_params *stats_rssi = ptr;
+	struct wmi_tlv_fw_stats_parse *parse = data;
+	const struct wmi_stats_event *ev = parse->ev;
+	struct ath12k_fw_stats *stats = parse->stats;
+	struct ath12k_link_vif *arvif;
+	struct ath12k_link_sta *arsta;
+	struct ieee80211_sta *sta;
+	struct ath12k_sta *ahsta;
+	struct ath12k *ar;
+	int vdev_id;
+	int j;
+
+	if (!ev) {
+		ath12k_warn(ab, "failed to fetch update stats ev");
+		return -EPROTO;
+	}
+
+	if (tag != WMI_TAG_RSSI_STATS)
+		return -EPROTO;
+
+	if (!stats)
+		return -EINVAL;
+
+	stats->pdev_id = le32_to_cpu(ev->pdev_id);
+	vdev_id = le32_to_cpu(stats_rssi->vdev_id);
+	guard(rcu)();
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, stats->pdev_id);
+	if (!ar) {
+		ath12k_warn(ab, "invalid pdev id %d in rssi chain parse\n",
+			    stats->pdev_id);
+		return -EPROTO;
+	}
+
+	arvif = ath12k_mac_get_arvif(ar, vdev_id);
+	if (!arvif) {
+		ath12k_warn(ab, "not found vif for vdev id %d\n", vdev_id);
+		return -EPROTO;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "stats bssid %pM vif %p\n",
+		   arvif->bssid, arvif->ahvif->vif);
+
+	sta = ieee80211_find_sta_by_ifaddr(ath12k_ar_to_hw(ar),
+					   arvif->bssid,
+					   NULL);
+	if (!sta) {
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "not found station of bssid %pM for rssi chain\n",
+			   arvif->bssid);
+		return -EPROTO;
+	}
+
+	ahsta = ath12k_sta_to_ahsta(sta);
+	arsta = &ahsta->deflink;
+
+	BUILD_BUG_ON(ARRAY_SIZE(arsta->chain_signal) >
+		     ARRAY_SIZE(stats_rssi->rssi_avg_beacon));
+
+	for (j = 0; j < ARRAY_SIZE(arsta->chain_signal); j++)
+		arsta->chain_signal[j] = le32_to_cpu(stats_rssi->rssi_avg_beacon[j]);
+
+	stats->stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
+
+	return 0;
+}
+
 static int ath12k_wmi_tlv_fw_stats_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
@@ -8232,6 +8308,22 @@ static int ath12k_wmi_tlv_fw_stats_parse(struct ath12k_base *ab,
 	case WMI_TAG_ARRAY_BYTE:
 		ret = ath12k_wmi_tlv_fw_stats_data_parse(ab, parse, ptr, len);
 		break;
+	case WMI_TAG_PER_CHAIN_RSSI_STATS:
+		parse->rssi = ptr;
+		if (le32_to_cpu(parse->ev->stats_id) & WMI_REQUEST_RSSI_PER_CHAIN_STAT)
+			parse->rssi_num = le32_to_cpu(parse->rssi->num_per_chain_rssi);
+		break;
+	case WMI_TAG_ARRAY_STRUCT:
+		if (parse->rssi_num && !parse->chain_rssi_done) {
+			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+						  ath12k_wmi_tlv_rssi_chain_parse,
+						  parse);
+			if (ret)
+				return ret;
+
+			parse->chain_rssi_done = true;
+		}
+		break;
 	default:
 		break;
 	}
@@ -8345,6 +8437,12 @@ static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *sk
 		goto complete;
 	}
 
+	/* Handle WMI_REQUEST_RSSI_PER_CHAIN_STAT status update */
+	if (stats.stats_id == WMI_REQUEST_RSSI_PER_CHAIN_STAT) {
+		complete(&ar->fw_stats_done);
+		goto complete;
+	}
+
 	/* Handle WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT updates. */
 	ath12k_wmi_fw_stats_process(ar, &stats);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index f3b0a6f57ec2..4ae9a58f944a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -5875,9 +5875,10 @@ struct wmi_stats_event {
 } __packed;
 
 enum wmi_stats_id {
-	WMI_REQUEST_PDEV_STAT	= BIT(2),
-	WMI_REQUEST_VDEV_STAT	= BIT(3),
-	WMI_REQUEST_BCN_STAT	= BIT(11),
+	WMI_REQUEST_PDEV_STAT		= BIT(2),
+	WMI_REQUEST_VDEV_STAT		= BIT(3),
+	WMI_REQUEST_RSSI_PER_CHAIN_STAT	= BIT(8),
+	WMI_REQUEST_BCN_STAT		= BIT(11),
 };
 
 struct wmi_request_stats_cmd {
@@ -5888,6 +5889,17 @@ struct wmi_request_stats_cmd {
 	__le32 pdev_id;
 } __packed;
 
+struct wmi_rssi_stat_params {
+	__le32 vdev_id;
+	__le32 rssi_avg_beacon[WMI_MAX_CHAINS];
+	__le32 rssi_avg_data[WMI_MAX_CHAINS];
+	struct ath12k_wmi_mac_addr_params peer_macaddr;
+} __packed;
+
+struct wmi_per_chain_rssi_stat_params {
+	__le32 num_per_chain_rssi;
+} __packed;
+
 #define WLAN_MAX_AC 4
 #define MAX_TX_RATE_VALUES 10
 

base-commit: d9104cec3e8fe4b458b74709853231385779001f
-- 
2.34.1



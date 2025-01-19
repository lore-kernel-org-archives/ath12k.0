Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BCFC02183
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqq9voYnQgFTqgDU7jiRYtljwgeqn7yK8wE659SdkFs=; b=MhT++rdQJVPp8lR5gxKQWhi4n3
	gJbOokscJBxUOQtBoOW6mnydQPfqsb87xLxGL461I2aglRqr0nfMj7Lc799Kuw2H46D2lzjhDyflH
	bpF9LMZjRelbUxUMt9eQmYP1Py+66DZNWKooFipyI5BOMlWBSqz6UuV1xFvB5uviJU2epJjuLNiAm
	mXAMar8yjCC2w9lxiVvWAaDthQhtXVPO4LZvcODhajet1Bat9vf3mKrnCZ8nMmkqLBpp4hZ4FxtKF
	LyOMgZJvhwvyzuP08QPALUy/AmfDOpcUVu8fuuR8rcRSBPhD/UlOwIqAvOCGwWoOLxNNp8Zc6OKO9
	Gcf0jlLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZVou-00000003y7M-445P
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 13:58:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZVos-00000003y5O-1Raq
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 13:58:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JCMVjv019964;
	Sun, 19 Jan 2025 13:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqq9voYnQgFTqgDU7jiRYtljwgeqn7yK8wE659SdkFs=; b=Ys+1htFq/br+3ZTg
	2TpzNG8VEHHiyafKbVqJaaTQ5yEArhM0gY7pIBB8Q/o9Gy/+K+Wi9G6IqIMRchOT
	MNnBn7Zk4MQVpURR5YthiPrPnYOTbiVJAT2FEd7CJheq4jOeHNXket4JyxxmhbW0
	6UP5nbzLsxukBO0QHAicPGTv4Vspy5JYqgOYPA/z/w/dEa+oU/zHVOcKT4ukXy8b
	YBLGMFoUZNFs21cjB8XnLKiYiyEEMGa1JrC3PX14rBWHk0fQdGTJvwBCh7rPUQE5
	jUYpJuIr6h/WRVkcwUJYDMeniceZz7nmfh3fr5V58Zef0LqhvP0ejn39RgfDIOlt
	6WCuXQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4483vwa4cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 13:58:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JDwSrN021524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 13:58:28 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 05:58:26 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Balamurugan Mahalingam
	<quic_bmahalin@quicinc.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v3 08/10] wifi: ath12k: Refactor the format of peer rate table information
Date: Sun, 19 Jan 2025 19:27:49 +0530
Message-ID: <20250119135751.2221902-9-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119135751.2221902-1-quic_periyasa@quicinc.com>
References: <20250119135751.2221902-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1X40j7heQRuXYS1oDx_ujgDtBuwY0LrN
X-Proofpoint-ORIG-GUID: 1X40j7heQRuXYS1oDx_ujgDtBuwY0LrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501190106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_055830_505599_AE0C7E10 
X-CRM114-Status: GOOD (  13.61  )
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

From: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>

Currently, peer rate table information involves complex computation for
the rate index to update the rate table. To simplify this process, avoid
the rate index calculation by defining the rate table with bandwidth, GI,
NSS, MCS. Therefore, update the rate information based on the bandwidth,
GI, NSS and MCS information from the TLV data of monitor status Rx path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h   |  6 +----
 drivers/net/wireless/ath/ath12k/dp_mon.c | 29 +++++++++++-------------
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index f88768da5c66..6ccdd655b63e 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -52,8 +52,6 @@
 
 #define ATH12K_INVALID_HW_MAC_ID	0xFF
 #define ATH12K_CONNECTION_LOSS_HZ	(3 * HZ)
-#define	ATH12K_RX_RATE_TABLE_NUM	320
-#define	ATH12K_RX_RATE_TABLE_11AX_NUM	576
 
 #define ATH12K_MON_TIMER_INTERVAL  10
 #define ATH12K_RESET_TIMEOUT_HZ			(20 * HZ)
@@ -358,8 +356,6 @@ struct ath12k_vif_iter {
 #define HAL_RX_MAX_MCS_BE	15
 #define HAL_RX_MAX_NSS		8
 #define HAL_RX_MAX_NUM_LEGACY_RATES 12
-#define ATH12K_RX_RATE_TABLE_11AX_NUM	576
-#define ATH12K_RX_RATE_TABLE_NUM 320
 
 struct ath12k_rx_peer_rate_stats {
 	u64 ht_mcs_count[HAL_RX_MAX_MCS_HT + 1];
@@ -370,7 +366,7 @@ struct ath12k_rx_peer_rate_stats {
 	u64 bw_count[HAL_RX_BW_MAX];
 	u64 gi_count[HAL_RX_GI_MAX];
 	u64 legacy_count[HAL_RX_MAX_NUM_LEGACY_RATES];
-	u64 rx_rate[ATH12K_RX_RATE_TABLE_11AX_NUM];
+	u64 rx_rate[HAL_RX_BW_MAX][HAL_RX_GI_MAX][HAL_RX_MAX_NSS][HAL_RX_MAX_MCS_HT + 1];
 };
 
 struct ath12k_rx_peer_stats {
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index dae430ee3c19..7e679ce177d3 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2946,34 +2946,31 @@ ath12k_dp_mon_rx_update_peer_rate_table_stats(struct ath12k_rx_peer_stats *rx_st
 					      struct hal_rx_user_status *user_stats,
 					      u32 num_msdu)
 {
-	u32 rate_idx = 0;
+	struct ath12k_rx_peer_rate_stats *stats;
 	u32 mcs_idx = (user_stats) ? user_stats->mcs : ppdu_info->mcs;
 	u32 nss_idx = (user_stats) ? user_stats->nss - 1 : ppdu_info->nss - 1;
 	u32 bw_idx = ppdu_info->bw;
 	u32 gi_idx = ppdu_info->gi;
+	u32 len;
 
-	if ((mcs_idx > HAL_RX_MAX_MCS_HE) || (nss_idx >= HAL_RX_MAX_NSS) ||
-	    (bw_idx >= HAL_RX_BW_MAX) || (gi_idx >= HAL_RX_GI_MAX)) {
+	if (mcs_idx > HAL_RX_MAX_MCS_HT || nss_idx >= HAL_RX_MAX_NSS ||
+	    bw_idx >= HAL_RX_BW_MAX || gi_idx >= HAL_RX_GI_MAX) {
 		return;
 	}
 
-	if (ppdu_info->preamble_type == HAL_RX_PREAMBLE_11N ||
-	    ppdu_info->preamble_type == HAL_RX_PREAMBLE_11AC) {
-		rate_idx = mcs_idx * 8 + 8 * 10 * nss_idx;
-		rate_idx += bw_idx * 2 + gi_idx;
-	} else if (ppdu_info->preamble_type == HAL_RX_PREAMBLE_11AX) {
+	if (ppdu_info->preamble_type == HAL_RX_PREAMBLE_11AX ||
+	    ppdu_info->preamble_type == HAL_RX_PREAMBLE_11BE)
 		gi_idx = ath12k_he_gi_to_nl80211_he_gi(ppdu_info->gi);
-		rate_idx = mcs_idx * 12 + 12 * 12 * nss_idx;
-		rate_idx += bw_idx * 3 + gi_idx;
-	} else {
-		return;
-	}
 
-	rx_stats->pkt_stats.rx_rate[rate_idx] += num_msdu;
+	rx_stats->pkt_stats.rx_rate[bw_idx][gi_idx][nss_idx][mcs_idx] += num_msdu;
+	stats = &rx_stats->byte_stats;
+
 	if (user_stats)
-		rx_stats->byte_stats.rx_rate[rate_idx] += user_stats->mpdu_ok_byte_count;
+		len = user_stats->mpdu_ok_byte_count;
 	else
-		rx_stats->byte_stats.rx_rate[rate_idx] += ppdu_info->mpdu_len;
+		len = ppdu_info->mpdu_len;
+
+	stats->rx_rate[bw_idx][gi_idx][nss_idx][mcs_idx] += len;
 }
 
 static void ath12k_dp_mon_rx_update_peer_su_stats(struct ath12k *ar,
-- 
2.34.1



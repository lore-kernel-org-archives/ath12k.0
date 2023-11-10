Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA59CC4332F
	for <ath12k@archiver.kernel.org>; Fri, 10 Nov 2023 08:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoqaUI6xnpCfvF6fcDzccV/0ixU0ueGXO4/plG4LxkU=; b=xecMuKfWYt8irE
	cWfkEf+baoY8Xco05fAHw7BSlNSHYQZUb0UgoU48okJuD8jTLzXWA4HVbeDxh5ggBzjBGQtc/tK86
	INcZKNKka+PxRPUhWq1JKZdjOqI3KkGYMJGMHm8nU7sPIpDAFIp/bMDduPQZbZsxF59v2pDOwSfcL
	Mv7ckbggw0MK85vDlG7p9jAUIkbH/ydhE6M7Aigrb2yIzmQ8LsWWqX3UcIJaX8GPYvRLzU6/Stm83
	1y5YBQohMzM3mGUjR3/dpeBI6FQmL6VFK5c2MlpMXQ4mbAHKvyaxQiZAKqFvq8ekC0TRuBBl9ScSd
	obp1EslSHlrPoGXyq2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Mei-00845W-1c
	for ath12k@archiver.kernel.org;
	Fri, 10 Nov 2023 08:14:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Mef-00844i-0n
	for ath12k@lists.infradead.org;
	Fri, 10 Nov 2023 08:14:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA7fv1M010164;
	Fri, 10 Nov 2023 08:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=+hqU5tkNI2B1H0/whYLHX2tnk8i5R1+HkG3shxBzx5A=;
 b=JMy/cEApSfi4o2UcBX6RrMLSrvucxATjiyxHJMXVMRlMO6YoMIyrrAZ2yUb5ZBMz2yd8
 BnxgKMMbzGGTxy+0nioQ8iPiv8kScWCQsjxkr5cQOxFHDJOu3gixZWXDD3Y+1aTogYCf
 4Rq9X7ow+Fv449R9RcvZusmIei7mVsPrPzI9X7c8qei1qwJEz4uZCOAYr4Lnl0CCibB5
 JYX6Rf5fO7FlwmegsarIhgui0Kr8ImwPGrZ1R7B9Hn7xTdZ1LYwy2YG6F38O0ymKxch3
 yFREeuEsFnlrjFmCugPA/z318XYSXJ/rG56UhrK3Nl8KJUbB1eG7C/8lxJohGkGS7hx7 /g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u93qy9jva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 08:14:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA8Dgmu022176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 08:13:42 GMT
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 10 Nov 2023 00:13:40 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 4/4] wifi: ath12k: refactor DP Rxdma ring structure
Date: Fri, 10 Nov 2023 13:43:17 +0530
Message-ID: <20231110081317.19608-5-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231110081317.19608-1-quic_periyasa@quicinc.com>
References: <20231110081317.19608-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LmD3EAtDkN7iTreqs1_i7qWA7nh7jGG2
X-Proofpoint-GUID: LmD3EAtDkN7iTreqs1_i7qWA7nh7jGG2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_04,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=701 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311100069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_001417_289411_15CE682C 
X-CRM114-Status: GOOD (  20.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently data path Rxdma ring structure store the IDR buffer and lock.
These IDR handling is needed only for SW cookie conversion and not
needed for HW cookie conversion. REO Rxdma ring use the HW cookie
conversion and monitor Rxdma ring use the SW cookie conversion.
Since idr not needed for REO Rxdma ring, remove the IDR data entity
from the data path Rxdma ring structure. Introduce the new data path ring
structure for monitor rxmda rings since it need IDR data entity.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h     | 11 +++--
 drivers/net/wireless/ath/ath12k/dp_mon.c | 10 ++---
 drivers/net/wireless/ath/ath12k/dp_mon.h |  2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 56 ++++++++++++------------
 4 files changed, 43 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 61f765432516..7586eb92a910 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -31,7 +31,7 @@ struct dp_srng {
 	u32 ring_id;
 };
 
-struct dp_rxdma_ring {
+struct dp_rxdma_mon_ring {
 	struct dp_srng refill_buf_ring;
 	struct idr bufs_idr;
 	/* Protects bufs_idr */
@@ -39,6 +39,11 @@ struct dp_rxdma_ring {
 	int bufs_max;
 };
 
+struct dp_rxdma_ring {
+	struct dp_srng refill_buf_ring;
+	int bufs_max;
+};
+
 #define ATH12K_TX_COMPL_NEXT(x)	(((x) + 1) % DP_TX_COMP_RING_SIZE)
 
 struct dp_tx_ring {
@@ -353,8 +358,8 @@ struct ath12k_dp {
 	struct dp_rxdma_ring rx_refill_buf_ring;
 	struct dp_srng rx_mac_buf_ring[MAX_RXDMA_PER_PDEV];
 	struct dp_srng rxdma_err_dst_ring[MAX_RXDMA_PER_PDEV];
-	struct dp_rxdma_ring rxdma_mon_buf_ring;
-	struct dp_rxdma_ring tx_mon_buf_ring;
+	struct dp_rxdma_mon_ring rxdma_mon_buf_ring;
+	struct dp_rxdma_mon_ring tx_mon_buf_ring;
 	struct ath12k_reo_q_addr_lut reoq_lut;
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f44bc5494ce7..1319c1938772 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -797,7 +797,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		/* TODO: add msdu start parsing logic */
 		break;
 	case HAL_MON_BUF_ADDR: {
-		struct dp_rxdma_ring *buf_ring = &ab->dp.rxdma_mon_buf_ring;
+		struct dp_rxdma_mon_ring *buf_ring = &ab->dp.rxdma_mon_buf_ring;
 		struct dp_mon_packet_info *packet_info =
 			(struct dp_mon_packet_info *)tlv_data;
 		int buf_id = u32_get_bits(packet_info->cookie,
@@ -1259,7 +1259,7 @@ ath12k_dp_mon_rx_parse_mon_status(struct ath12k *ar,
 }
 
 int ath12k_dp_mon_buf_replenish(struct ath12k_base *ab,
-				struct dp_rxdma_ring *buf_ring,
+				struct dp_rxdma_mon_ring *buf_ring,
 				int req_entries)
 {
 	struct hal_mon_buf_ring *mon_buf;
@@ -1902,7 +1902,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_MON_BUF_ADDR: {
-		struct dp_rxdma_ring *buf_ring = &ab->dp.tx_mon_buf_ring;
+		struct dp_rxdma_mon_ring *buf_ring = &ab->dp.tx_mon_buf_ring;
 		struct dp_mon_packet_info *packet_info =
 			(struct dp_mon_packet_info *)tlv_data;
 		int buf_id = u32_get_bits(packet_info->cookie,
@@ -2067,7 +2067,7 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int mac_id, int *budget,
 	struct ath12k_skb_rxcb *rxcb;
 	struct dp_srng *mon_dst_ring;
 	struct hal_srng *srng;
-	struct dp_rxdma_ring *buf_ring;
+	struct dp_rxdma_mon_ring *buf_ring;
 	u64 cookie;
 	u32 ppdu_id;
 	int num_buffs_reaped = 0, srng_id, buf_id;
@@ -2480,7 +2480,7 @@ int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
 	struct ath12k_skb_rxcb *rxcb;
 	struct dp_srng *mon_dst_ring;
 	struct hal_srng *srng;
-	struct dp_rxdma_ring *buf_ring;
+	struct dp_rxdma_mon_ring *buf_ring;
 	struct ath12k_sta *arsta = NULL;
 	struct ath12k_peer *peer;
 	u64 cookie;
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.h b/drivers/net/wireless/ath/ath12k/dp_mon.h
index c18c385798a1..c3e66d31b597 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.h
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.h
@@ -80,7 +80,7 @@ ath12k_dp_mon_rx_parse_mon_status(struct ath12k *ar,
 				  int mac_id, struct sk_buff *skb,
 				  struct napi_struct *napi);
 int ath12k_dp_mon_buf_replenish(struct ath12k_base *ab,
-				struct dp_rxdma_ring *buf_ring,
+				struct dp_rxdma_mon_ring *buf_ring,
 				int req_entries);
 int ath12k_dp_mon_srng_process(struct ath12k *ar, int mac_id,
 			       int *budget, enum dp_monitor_mode monitor_mode,
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 0c47a242cdd8..8b6458d84a47 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -364,8 +364,8 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab,
 	return req_entries - num_remain;
 }
 
-static int ath12k_dp_rxdma_buf_ring_free(struct ath12k_base *ab,
-					 struct dp_rxdma_ring *rx_ring)
+static int ath12k_dp_rxdma_mon_buf_ring_free(struct ath12k_base *ab,
+					     struct dp_rxdma_mon_ring *rx_ring)
 {
 	struct sk_buff *skb;
 	int buf_id;
@@ -390,44 +390,49 @@ static int ath12k_dp_rxdma_buf_ring_free(struct ath12k_base *ab,
 static int ath12k_dp_rxdma_buf_free(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = &ab->dp;
-	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
 
-	ath12k_dp_rxdma_buf_ring_free(ab, rx_ring);
+	ath12k_dp_rxdma_mon_buf_ring_free(ab, &dp->rxdma_mon_buf_ring);
+
+	ath12k_dp_rxdma_mon_buf_ring_free(ab, &dp->tx_mon_buf_ring);
+
+	return 0;
+}
+
+static int ath12k_dp_rxdma_mon_ring_buf_setup(struct ath12k_base *ab,
+					      struct dp_rxdma_mon_ring *rx_ring,
+					      u32 ringtype)
+{
+	int num_entries;
 
-	rx_ring = &dp->rxdma_mon_buf_ring;
-	ath12k_dp_rxdma_buf_ring_free(ab, rx_ring);
+	num_entries = rx_ring->refill_buf_ring.size /
+		ath12k_hal_srng_get_entrysize(ab, ringtype);
 
-	rx_ring = &dp->tx_mon_buf_ring;
-	ath12k_dp_rxdma_buf_ring_free(ab, rx_ring);
+	rx_ring->bufs_max = num_entries;
+	ath12k_dp_mon_buf_replenish(ab, rx_ring, num_entries);
 
 	return 0;
 }
 
 static int ath12k_dp_rxdma_ring_buf_setup(struct ath12k_base *ab,
-					  struct dp_rxdma_ring *rx_ring,
-					  u32 ringtype)
+					  struct dp_rxdma_ring *rx_ring)
 {
 	int num_entries;
 
 	num_entries = rx_ring->refill_buf_ring.size /
-		ath12k_hal_srng_get_entrysize(ab, ringtype);
+		ath12k_hal_srng_get_entrysize(ab, HAL_RXDMA_BUF);
 
 	rx_ring->bufs_max = num_entries;
-	if ((ringtype == HAL_RXDMA_MONITOR_BUF) || (ringtype == HAL_TX_MONITOR_BUF))
-		ath12k_dp_mon_buf_replenish(ab, rx_ring, num_entries);
-	else
-		ath12k_dp_rx_bufs_replenish(ab, rx_ring, num_entries);
+	ath12k_dp_rx_bufs_replenish(ab, rx_ring, num_entries);
+
 	return 0;
 }
 
 static int ath12k_dp_rxdma_buf_setup(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = &ab->dp;
-	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
 	int ret;
 
-	ret = ath12k_dp_rxdma_ring_buf_setup(ab, rx_ring,
-					     HAL_RXDMA_BUF);
+	ret = ath12k_dp_rxdma_ring_buf_setup(ab, &dp->rx_refill_buf_ring);
 	if (ret) {
 		ath12k_warn(ab,
 			    "failed to setup HAL_RXDMA_BUF\n");
@@ -435,18 +440,18 @@ static int ath12k_dp_rxdma_buf_setup(struct ath12k_base *ab)
 	}
 
 	if (ab->hw_params->rxdma1_enable) {
-		rx_ring = &dp->rxdma_mon_buf_ring;
-		ret = ath12k_dp_rxdma_ring_buf_setup(ab, rx_ring,
-						     HAL_RXDMA_MONITOR_BUF);
+		ret = ath12k_dp_rxdma_mon_ring_buf_setup(ab,
+							 &dp->rxdma_mon_buf_ring,
+							 HAL_RXDMA_MONITOR_BUF);
 		if (ret) {
 			ath12k_warn(ab,
 				    "failed to setup HAL_RXDMA_MONITOR_BUF\n");
 			return ret;
 		}
 
-		rx_ring = &dp->tx_mon_buf_ring;
-		ret = ath12k_dp_rxdma_ring_buf_setup(ab, rx_ring,
-						     HAL_TX_MONITOR_BUF);
+		ret = ath12k_dp_rxdma_mon_ring_buf_setup(ab,
+							 &dp->tx_mon_buf_ring,
+							 HAL_TX_MONITOR_BUF);
 		if (ret) {
 			ath12k_warn(ab,
 				    "failed to setup HAL_TX_MONITOR_BUF\n");
@@ -4060,9 +4065,6 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
 	struct ath12k_dp *dp = &ab->dp;
 	int i, ret;
 
-	idr_init(&dp->rx_refill_buf_ring.bufs_idr);
-	spin_lock_init(&dp->rx_refill_buf_ring.idr_lock);
-
 	idr_init(&dp->rxdma_mon_buf_ring.bufs_idr);
 	spin_lock_init(&dp->rxdma_mon_buf_ring.idr_lock);
 
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

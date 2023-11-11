Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04519C072DD
	for <ath12k@archiver.kernel.org>; Sat, 11 Nov 2023 04:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RN444aB+APCZUm+WzjdXPMBLTZ+1+fCsQ0qQYNPO1rM=; b=nRbV6OSDebCVKp
	CrlY1oH5H7PAaJm00/9Dd5hwFsYlr1uq6w8ldPxM2xtmtRjUWVcXeN5crgNEgRmsg057lrfkomr1Z
	XrkUEdsYCto9m1EdlAXTbvVsrrbT84iYfH5FvhLeYPQ6ailjs768y8re0y9QShrmPRv0iOC0aFt5o
	+3IDVHSRdCeLXOw+RYJVyfu8UJl3r06MuCqKkFzP284qDHxlEo7uJcG2dbplgfPsOllbe1xv+2Okf
	N1e5ucHnspShW00z4PYcV4UJ/q8Tuh8O3yrZdlzkLxDUkkpAKyt3nTXtTrA5WVcciVliOeFQ96yfI
	hQ7PuAQvO+LN7BvTPXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1fms-00A1ik-2H
	for ath12k@archiver.kernel.org;
	Sat, 11 Nov 2023 04:40:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1fmp-00A1h5-20
	for ath12k@lists.infradead.org;
	Sat, 11 Nov 2023 04:40:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AB4dZEq031054;
	Sat, 11 Nov 2023 04:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=QtN2qqfr5A81PvJ22qJzxbn9n1hS4zkQFPNS2YTtnUM=;
 b=bzFn/5K9VTedducm36kP5noOMnilFw4BNrCOR/rhj1bB2OZ9L8BWASQ1Xl4EKElfxtU0
 ng4UfYyd4YstrW5eZArynFwnuj5anvLXpdDl6ZIYA9HOj5lcsdknRJ1blZQMEtd1Hb8j
 JJtUyh57HtmEB4ZI9LTwZuD0ZfrFdhncxOZUcVnSnVgqxIs/QEvxtDwksKfiD0lbU9Jh
 FYLHWWc4I32obxJvaLs/AvaXMyo5558zkfJrK4sl4U6jzzHP0wNRaaMt5kw3Y+W2QL2X
 963fI03dMke/vZhvanI+nHcIEwfgGtrd6A94SCs4mINzwc5XQDILybg8X+3w38s4nPMG 3w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u9xytra51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Nov 2023 04:39:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AB4dv1M002010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Nov 2023 04:39:57 GMT
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 10 Nov 2023 20:39:56 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 3/4] wifi: ath12k: avoid explicit HW conversion argument in Rxdma replenish
Date: Sat, 11 Nov 2023 10:09:33 +0530
Message-ID: <20231111043934.20485-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231111043934.20485-1-quic_periyasa@quicinc.com>
References: <20231111043934.20485-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5mIN1d8RTQgHljHodf9aPoiW9K1MlDJ1
X-Proofpoint-ORIG-GUID: 5mIN1d8RTQgHljHodf9aPoiW9K1MlDJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-11_01,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_spam policy=outbound score=58 lowpriorityscore=0
 suspectscore=0 spamscore=58 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 mlxscore=58 phishscore=0 impostorscore=0 mlxlogscore=-13
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311110036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_203959_775935_CAEA3988 
X-CRM114-Status: GOOD (  21.43  )
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

Currently Rxdma replenish require HW conversion argument which is
unnecessary argument since ath12k driver configures the Rxdma only
in HW conversion. To optimize the rx data path per packet, avoid
the explicit unnecessary argument and condition check in the rx
replenish.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c    |  3 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 78 +++++++++----------------
 drivers/net/wireless/ath/ath12k/dp_rx.h |  3 +-
 3 files changed, 31 insertions(+), 53 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 6bd16dbef2ef..a6f81f2f97ef 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -961,8 +961,7 @@ int ath12k_dp_service_srng(struct ath12k_base *ab,
 		struct ath12k_dp *dp = &ab->dp;
 		struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
 
-		ath12k_dp_rx_bufs_replenish(ab, rx_ring, 0,
-					    true);
+		ath12k_dp_rx_bufs_replenish(ab, rx_ring, 0);
 	}
 
 	/* TODO: Implement handler for other interrupts */
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 94e04b65bb64..2098a5f8fb70 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -258,15 +258,13 @@ static int ath12k_dp_purge_mon_ring(struct ath12k_base *ab)
 /* Returns number of Rx buffers replenished */
 int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab,
 				struct dp_rxdma_ring *rx_ring,
-				int req_entries,
-				bool hw_cc)
+				int req_entries)
 {
 	struct ath12k_buffer_addr *desc;
 	struct hal_srng *srng;
 	struct sk_buff *skb;
 	int num_free;
 	int num_remain;
-	int buf_id;
 	u32 cookie;
 	dma_addr_t paddr;
 	struct ath12k_dp *dp = &ab->dp;
@@ -307,40 +305,29 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab,
 		if (dma_mapping_error(ab->dev, paddr))
 			goto fail_free_skb;
 
-		if (hw_cc) {
-			spin_lock_bh(&dp->rx_desc_lock);
-
-			/* Get desc from free list and store in used list
-			 * for cleanup purposes
-			 *
-			 * TODO: pass the removed descs rather than
-			 * add/read to optimize
-			 */
-			rx_desc = list_first_entry_or_null(&dp->rx_desc_free_list,
-							   struct ath12k_rx_desc_info,
-							   list);
-			if (!rx_desc) {
-				spin_unlock_bh(&dp->rx_desc_lock);
-				goto fail_dma_unmap;
-			}
-
-			rx_desc->skb = skb;
-			cookie = rx_desc->cookie;
-			list_del(&rx_desc->list);
-			list_add_tail(&rx_desc->list, &dp->rx_desc_used_list);
+		spin_lock_bh(&dp->rx_desc_lock);
 
+		/* Get desc from free list and store in used list
+		 * for cleanup purposes
+		 *
+		 * TODO: pass the removed descs rather than
+		 * add/read to optimize
+		 */
+		rx_desc = list_first_entry_or_null(&dp->rx_desc_free_list,
+						   struct ath12k_rx_desc_info,
+						   list);
+		if (!rx_desc) {
 			spin_unlock_bh(&dp->rx_desc_lock);
-		} else {
-			spin_lock_bh(&rx_ring->idr_lock);
-			buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 0,
-					   rx_ring->bufs_max * 3, GFP_ATOMIC);
-			spin_unlock_bh(&rx_ring->idr_lock);
-			if (buf_id < 0)
-				goto fail_dma_unmap;
-			cookie = u32_encode_bits(buf_id,
-						 DP_RXDMA_BUF_COOKIE_BUF_ID);
+			goto fail_dma_unmap;
 		}
 
+		rx_desc->skb = skb;
+		cookie = rx_desc->cookie;
+		list_del(&rx_desc->list);
+		list_add_tail(&rx_desc->list, &dp->rx_desc_used_list);
+
+		spin_unlock_bh(&dp->rx_desc_lock);
+
 		desc = ath12k_hal_srng_src_get_next_entry(ab, srng);
 		if (!desc)
 			goto fail_buf_unassign;
@@ -359,17 +346,11 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab,
 	return req_entries - num_remain;
 
 fail_buf_unassign:
-	if (hw_cc) {
-		spin_lock_bh(&dp->rx_desc_lock);
-		list_del(&rx_desc->list);
-		list_add_tail(&rx_desc->list, &dp->rx_desc_free_list);
-		rx_desc->skb = NULL;
-		spin_unlock_bh(&dp->rx_desc_lock);
-	} else {
-		spin_lock_bh(&rx_ring->idr_lock);
-		idr_remove(&rx_ring->bufs_idr, buf_id);
-		spin_unlock_bh(&rx_ring->idr_lock);
-	}
+	spin_lock_bh(&dp->rx_desc_lock);
+	list_del(&rx_desc->list);
+	list_add_tail(&rx_desc->list, &dp->rx_desc_free_list);
+	rx_desc->skb = NULL;
+	spin_unlock_bh(&dp->rx_desc_lock);
 fail_dma_unmap:
 	dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
 			 DMA_FROM_DEVICE);
@@ -435,8 +416,7 @@ static int ath12k_dp_rxdma_ring_buf_setup(struct ath12k_base *ab,
 	if ((ringtype == HAL_RXDMA_MONITOR_BUF) || (ringtype == HAL_TX_MONITOR_BUF))
 		ath12k_dp_mon_buf_replenish(ab, rx_ring, num_entries);
 	else
-		ath12k_dp_rx_bufs_replenish(ab, rx_ring, num_entries,
-					    ringtype == HAL_RXDMA_BUF);
+		ath12k_dp_rx_bufs_replenish(ab, rx_ring, num_entries);
 	return 0;
 }
 
@@ -2708,7 +2688,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 	if (!total_msdu_reaped)
 		goto exit;
 
-	ath12k_dp_rx_bufs_replenish(ab, rx_ring, num_buffs_reaped, true);
+	ath12k_dp_rx_bufs_replenish(ab, rx_ring, num_buffs_reaped);
 
 	ath12k_dp_rx_process_received_packets(ab, napi, &msdu_list,
 					      ring_id);
@@ -3486,7 +3466,7 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 
 	rx_ring = &dp->rx_refill_buf_ring;
 
-	ath12k_dp_rx_bufs_replenish(ab, rx_ring, tot_n_bufs_reaped, true);
+	ath12k_dp_rx_bufs_replenish(ab, rx_ring, tot_n_bufs_reaped);
 
 	return tot_n_bufs_reaped;
 }
@@ -3799,7 +3779,7 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 	if (!num_buffs_reaped)
 		goto done;
 
-	ath12k_dp_rx_bufs_replenish(ab, rx_ring, num_buffs_reaped, true);
+	ath12k_dp_rx_bufs_replenish(ab, rx_ring, num_buffs_reaped);
 
 	rcu_read_lock();
 	for (i = 0; i <  ab->num_radios; i++) {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index b0fb806a3b14..05b3d5581dbe 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -118,8 +118,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int mac_id,
 			 int budget);
 int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab,
 				struct dp_rxdma_ring *rx_ring,
-				int req_entries,
-				bool hw_cc);
+				int req_entries);
 int ath12k_dp_rx_pdev_mon_attach(struct ath12k *ar);
 int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id);
 
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

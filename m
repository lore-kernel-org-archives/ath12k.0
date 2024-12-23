Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B09E77191
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 06:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAIrZT8g9syoizujVZE6+SeJPZZ9GwhI3SiYpOPIZV0=; b=WyVI9e9YOAq4pNc4ERiEv+bByg
	Cu5iw6PlKDsjyHkSXKP+rMiRyrcR6VLwyeAHpptqZehGVhlB66/LTmJLkxNrZP8dwsPgicPHKxLRJ
	gM+liS3x6mYfG3Om1s/rXtea7e41vmF8rRvtvDi52BHfA8ngkq1SvsxHE8GU+CBJ4bikUYGUnVh3j
	hM127e3eIgzZPopFs2su2u//E7MZD8DXSx187T9Xbfih6VtaNcUK47oj3acpn1GRx79FNFOldznyb
	CEPEv/3FKurytNk5BfdiRhT511129+SZ1M+Zlg5hbTnwOKLOiL7BCOgRUCYbBJ59KoKzbEkPiR0Fn
	SCjNIn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbW5-00000009NO3-1ylZ
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 06:02:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbVt-00000009NJm-00Xf
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 06:01:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BMMPBHS028828;
	Mon, 23 Dec 2024 06:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAIrZT8g9syoizujVZE6+SeJPZZ9GwhI3SiYpOPIZV0=; b=C/Oy0aPIwtYVYPm3
	yx7uGi5ldJT7eKrz1fffpMNmICXoBTtGh6VOf1J8vTxgnT9obDLjbJ95ujaEkT+A
	j/Nk8AonRLLGa8tFgpWbwjnQv/oXpYt6bf7+BCalSHY8ZQIHXP7EJEb0r8azZ/JR
	o4XdfokHQ3drSiwPrgtrFPEDaKTYhLXYa4LF54pzl4gtIgIBxiM6JsbqXRC2K7ZV
	mfkaFJBd69dW/i6gA0qXbiWBH3x7Px40UycNZnV6+8B5TvX0l8fZvCU3vFlXINhp
	Y+2N8BeNVVmHtYPgA6JSqtmesRMisf1aeazMTLyOlztgMTNX6AS7WHGMMIJIpOPM
	Mp6Q9w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ptdnh9db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:01:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN61tNF023860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:01:56 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 22 Dec 2024 22:01:54 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v2 04/14] wifi: ath12k: Avoid code duplication in monitor ring processing
Date: Mon, 23 Dec 2024 11:31:22 +0530
Message-ID: <20241223060132.3506372-5-quic_ppranees@quicinc.com>
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
X-Proofpoint-GUID: 75F2ZWyHIykvQ3-SdKnyjn1gM4JLhSj1
X-Proofpoint-ORIG-GUID: 75F2ZWyHIykvQ3-SdKnyjn1gM4JLhSj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=835 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_220157_042091_22E6B960 
X-CRM114-Status: GOOD (  17.89  )
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

The current implementation processes the monitor destination ring using
two separate functions, ath12k_dp_mon_srng_process() for standalone
monitor mode and ath12k_dp_mon_rx_process_stats() for statistics.
However, both functions contain same code which performs monitor ring
reaping and skb data processing. To eliminate redundancy, remove the
duplicate code and use a single function to handle both the cases.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 126 ++---------------------
 drivers/net/wireless/ath/ath12k/dp_mon.h |   6 +-
 2 files changed, 9 insertions(+), 123 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 53f8e8f8959a..08f92e74fede 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2000,116 +2000,6 @@ ath12k_dp_mon_tx_parse_mon_status(struct ath12k *ar,
 	return tlv_status;
 }
 
-int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
-			       enum dp_monitor_mode monitor_mode,
-			       struct napi_struct *napi)
-{
-	struct hal_mon_dest_desc *mon_dst_desc;
-	struct ath12k_pdev_dp *pdev_dp = &ar->dp;
-	struct ath12k_mon_data *pmon = (struct ath12k_mon_data *)&pdev_dp->mon_data;
-	struct ath12k_base *ab = ar->ab;
-	struct ath12k_dp *dp = &ab->dp;
-	struct sk_buff *skb;
-	struct ath12k_skb_rxcb *rxcb;
-	struct dp_srng *mon_dst_ring;
-	struct hal_srng *srng;
-	struct dp_rxdma_mon_ring *buf_ring;
-	u64 cookie;
-	u32 ppdu_id;
-	int num_buffs_reaped = 0, srng_id, buf_id;
-	u8 dest_idx = 0, i;
-	bool end_of_ppdu;
-	struct hal_rx_mon_ppdu_info *ppdu_info;
-	struct ath12k_peer *peer = NULL;
-	u8 pdev_idx = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, ar->pdev_idx);
-
-	ppdu_info = &pmon->mon_ppdu_info;
-	memset(ppdu_info, 0, sizeof(*ppdu_info));
-	ppdu_info->peer_id = HAL_INVALID_PEERID;
-
-	srng_id = ath12k_hw_mac_id_to_srng_id(ab->hw_params, pdev_idx);
-
-	if (monitor_mode == ATH12K_DP_RX_MONITOR_MODE) {
-		mon_dst_ring = &pdev_dp->rxdma_mon_dst_ring[srng_id];
-		buf_ring = &dp->rxdma_mon_buf_ring;
-	} else {
-		return 0;
-	}
-
-	srng = &ab->hal.srng_list[mon_dst_ring->ring_id];
-
-	spin_lock_bh(&srng->lock);
-	ath12k_hal_srng_access_begin(ab, srng);
-
-	while (likely(*budget)) {
-		*budget -= 1;
-		mon_dst_desc = ath12k_hal_srng_dst_peek(ab, srng);
-		if (unlikely(!mon_dst_desc))
-			break;
-
-		cookie = le32_to_cpu(mon_dst_desc->cookie);
-		buf_id = u32_get_bits(cookie, DP_RXDMA_BUF_COOKIE_BUF_ID);
-
-		spin_lock_bh(&buf_ring->idr_lock);
-		skb = idr_remove(&buf_ring->bufs_idr, buf_id);
-		spin_unlock_bh(&buf_ring->idr_lock);
-
-		if (unlikely(!skb)) {
-			ath12k_warn(ab, "monitor destination with invalid buf_id %d\n",
-				    buf_id);
-			goto move_next;
-		}
-
-		rxcb = ATH12K_SKB_RXCB(skb);
-		dma_unmap_single(ab->dev, rxcb->paddr,
-				 skb->len + skb_tailroom(skb),
-				 DMA_FROM_DEVICE);
-
-		pmon->dest_skb_q[dest_idx] = skb;
-		dest_idx++;
-		ppdu_id = le32_to_cpu(mon_dst_desc->ppdu_id);
-		end_of_ppdu = le32_get_bits(mon_dst_desc->info0,
-					    HAL_MON_DEST_INFO0_END_OF_PPDU);
-		if (!end_of_ppdu)
-			continue;
-
-		for (i = 0; i < dest_idx; i++) {
-			skb = pmon->dest_skb_q[i];
-
-			if (monitor_mode == ATH12K_DP_RX_MONITOR_MODE)
-				ath12k_dp_mon_rx_parse_mon_status(ar, pmon,
-								  skb, napi);
-			else
-				ath12k_dp_mon_tx_parse_mon_status(ar, pmon,
-								  skb, napi, ppdu_id);
-
-			peer = ath12k_peer_find_by_id(ab, ppdu_info->peer_id);
-
-			if (!peer || !peer->sta) {
-				ath12k_dbg(ab, ATH12K_DBG_DATA,
-					   "failed to find the peer with peer_id %d\n",
-					   ppdu_info->peer_id);
-				dev_kfree_skb_any(skb);
-				continue;
-			}
-
-			dev_kfree_skb_any(skb);
-			pmon->dest_skb_q[i] = NULL;
-		}
-
-		dest_idx = 0;
-move_next:
-		ath12k_dp_mon_buf_replenish(ab, buf_ring, 1);
-		ath12k_hal_srng_src_get_next_entry(ab, srng);
-		num_buffs_reaped++;
-	}
-
-	ath12k_hal_srng_access_end(ab, srng);
-	spin_unlock_bh(&srng->lock);
-
-	return num_buffs_reaped;
-}
-
 static void
 ath12k_dp_mon_rx_update_peer_rate_table_stats(struct ath12k_rx_peer_stats *rx_stats,
 					      struct hal_rx_mon_ppdu_info *ppdu_info,
@@ -2415,8 +2305,8 @@ ath12k_dp_mon_rx_update_peer_mu_stats(struct ath12k *ar,
 		ath12k_dp_mon_rx_update_user_stats(ar, ppdu_info, i);
 }
 
-int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
-				   struct napi_struct *napi, int *budget)
+int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
+			       struct napi_struct *napi)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_pdev_dp *pdev_dp = &ar->dp;
@@ -2437,8 +2327,9 @@ int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
 	u8 dest_idx = 0, i;
 	bool end_of_ppdu;
 	u32 hal_status;
+	u8 pdev_idx = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, ar->pdev_idx);
 
-	srng_id = ath12k_hw_mac_id_to_srng_id(ab->hw_params, mac_id);
+	srng_id = ath12k_hw_mac_id_to_srng_id(ab->hw_params, pdev_idx);
 	mon_dst_ring = &pdev_dp->rxdma_mon_dst_ring[srng_id];
 	buf_ring = &dp->rxdma_mon_buf_ring;
 
@@ -2535,11 +2426,10 @@ int ath12k_dp_mon_process_ring(struct ath12k_base *ab, int mac_id,
 	struct ath12k *ar = ath12k_ab_to_ar(ab, mac_id);
 	int num_buffs_reaped = 0;
 
-	if (!ar->monitor_started)
-		ath12k_dp_mon_rx_process_stats(ar, mac_id, napi, &budget);
-	else
-		num_buffs_reaped = ath12k_dp_mon_srng_process(ar, &budget,
-							      monitor_mode, napi);
+	if (ab->hw_params->rxdma1_enable) {
+		if (monitor_mode == ATH12K_DP_RX_MONITOR_MODE)
+			num_buffs_reaped = ath12k_dp_mon_srng_process(ar, &budget, napi);
+	}
 
 	return num_buffs_reaped;
 }
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.h b/drivers/net/wireless/ath/ath12k/dp_mon.h
index 64c959c36459..e4368eb42aca 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.h
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.h
@@ -82,9 +82,6 @@ ath12k_dp_mon_rx_parse_mon_status(struct ath12k *ar,
 int ath12k_dp_mon_buf_replenish(struct ath12k_base *ab,
 				struct dp_rxdma_mon_ring *buf_ring,
 				int req_entries);
-int ath12k_dp_mon_srng_process(struct ath12k *ar,
-			       int *budget, enum dp_monitor_mode monitor_mode,
-			       struct napi_struct *napi);
 int ath12k_dp_mon_process_ring(struct ath12k_base *ab, int mac_id,
 			       struct napi_struct *napi, int budget,
 			       enum dp_monitor_mode monitor_mode);
@@ -100,6 +97,5 @@ ath12k_dp_mon_tx_parse_mon_status(struct ath12k *ar,
 				  struct napi_struct *napi,
 				  u32 ppdu_id);
 void ath12k_dp_mon_rx_process_ulofdma(struct hal_rx_mon_ppdu_info *ppdu_info);
-int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
-				   struct napi_struct *napi, int *budget);
+int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget, struct napi_struct *napi);
 #endif
-- 
2.34.1



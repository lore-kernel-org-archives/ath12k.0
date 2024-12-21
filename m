Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D44EE7718B
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 04:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwBAlWdLm/ZrxIwm4bMfyTlx/G2eqBfVTVg0OLjo/kA=; b=ymUqt/jSreYJLWhXdIIQ6YGD7z
	1cAfCtQrlYckRe19HuT6khO/RQSsKu2532JrxRnYAscGaH/ox4JJmv7B8Zl9XqnLEjoOBHzfl/A3i
	7XVpC32e21q4SBxIchZbJLpa2pFbNtIbZn++wa0xFr1xZ/It4P82RsAyD00zMlweHp/iprmcIvbja
	s30SipodbeV0cleMG1cHXOpRPkQW+AncOgppsMSfXyRn05o9gZlmjl+P04PvXPRb8KaT0q5DUloAF
	Qr4+82pwnmWtWcjz3AW82vPJ5PKVT7KpBx38ZvzZ2S1s47SKJ5KaNR2aY1raSIZ7WP1zcI4LgMs+A
	Kx7oNmAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr9O-00000006Xh7-0RJo
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 04:31:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr9L-00000006Xev-02E4
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 04:31:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL0giq3008108;
	Sat, 21 Dec 2024 04:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwBAlWdLm/ZrxIwm4bMfyTlx/G2eqBfVTVg0OLjo/kA=; b=PTgli9KnovyF3bXk
	5A+hb3jTWEIYhyxMqxoZ1jDGc5GRZANkCbTC7lZ/brKKTo3NgT2s7IKYyFtvJsqh
	QSclIIceElnN1E5Ci8ckeh8+GjsRNrnVH/d4zHuRpqSLjurajP7ayN6DwPNhcMGW
	v9zZuO9dDSHwmIDK/XI+ZUUuFx/64W5Tbe2YSGTowL3gdzgqgGilvtMmN3nphUHV
	9mxVqPlmnAKzDG8Z+mSa9BRUv2lN7mLNtRRL+Lq2JgiJruKGoZFG3bwaoftcccJm
	bdt4hrCDoj8EMnULRqm2VA1+tZUTbwZEt8XaMjJciWYoObGpkN5skaXEk5uskzyv
	1BAaAQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nkcc8cgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL4VXqe016875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:33 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 20:31:32 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 12/14] wifi: ath12k: Avoid memory leak while enabling statistics
Date: Sat, 21 Dec 2024 10:00:12 +0530
Message-ID: <20241221043014.1252841-13-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
References: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3-xl1YpaQ4RFzFdIKuJa47UyEAx7wUxo
X-Proofpoint-GUID: 3-xl1YpaQ4RFzFdIKuJa47UyEAx7wUxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412210035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_203135_084392_11A9F765 
X-CRM114-Status: GOOD (  15.94  )
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

Driver uses monitor destination rings for extended statistics mode and
standalone monitor mode. In extended statistics mode, TLVs are parsed from
the buffer received from the monitor destination ring and assigned to the
ppdu_info structure to update per-packet statistics. In standalone monitor
mode, along with per-packet statistics, the packet data (payload) is
captured, and the driver updates per MSDU to mac80211.

When the AP interface is enabled, only extended statistics mode is
activated. As part of enabling monitor rings for collecting statistics,
the driver subscribes to HAL_RX_MPDU_START TLV in the filter
configuration. This TLV is received from the monitor destination ring, and
kzalloc for the mon_mpdu object occurs, which is not freed, leading to a
memory leak. The kzalloc for the mon_mpdu object is only required while
enabling the standalone monitor interface. This causes a memory leak while
enabling extended statistics mode in the driver.

Fix this memory leak by removing the kzalloc for the mon_mpdu object in
the HAL_RX_MPDU_START TLV handling. Additionally, remove the standalone
monitor mode handlings in the HAL_MON_BUF_ADDR and HAL_RX_MSDU_END TLVs.
These TLV tags will be handled properly when enabling standalone monitor
mode in the future.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 65 ++++--------------------
 drivers/net/wireless/ath/ath12k/hal_rx.h |  3 ++
 2 files changed, 12 insertions(+), 56 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 4b35dfcbdfe1..23b1a41c6fd2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -567,7 +567,6 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 				  struct ath12k_mon_data *pmon,
 				  const struct hal_tlv_64_hdr *tlv)
 {
-	struct ath12k_base *ab = ar->ab;
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
 	const void *tlv_data = tlv->value;
 	u32 info[7], userid;
@@ -748,7 +747,6 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 	}
 	case HAL_RX_MPDU_START: {
 		const struct hal_rx_mpdu_start *mpdu_start = tlv_data;
-		struct dp_mon_mpdu *mon_mpdu = pmon->mon_mpdu;
 		u16 peer_id;
 
 		info[1] = __le32_to_cpu(mpdu_start->info1);
@@ -765,65 +763,17 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 				u32_get_bits(info[0], HAL_RX_MPDU_START_INFO1_PEERID);
 		}
 
-		mon_mpdu = kzalloc(sizeof(*mon_mpdu), GFP_ATOMIC);
-		if (!mon_mpdu)
-			return HAL_RX_MON_STATUS_PPDU_NOT_DONE;
-
 		break;
 	}
 	case HAL_RX_MSDU_START:
 		/* TODO: add msdu start parsing logic */
 		break;
-	case HAL_MON_BUF_ADDR: {
-		struct dp_rxdma_mon_ring *buf_ring = &ab->dp.rxdma_mon_buf_ring;
-		const struct dp_mon_packet_info *packet_info = tlv_data;
-		int buf_id = u32_get_bits(packet_info->cookie,
-					  DP_RXDMA_BUF_COOKIE_BUF_ID);
-		struct sk_buff *msdu;
-		struct dp_mon_mpdu *mon_mpdu = pmon->mon_mpdu;
-		struct ath12k_skb_rxcb *rxcb;
-
-		spin_lock_bh(&buf_ring->idr_lock);
-		msdu = idr_remove(&buf_ring->bufs_idr, buf_id);
-		spin_unlock_bh(&buf_ring->idr_lock);
-
-		if (unlikely(!msdu)) {
-			ath12k_warn(ab, "monitor destination with invalid buf_id %d\n",
-				    buf_id);
-			return HAL_RX_MON_STATUS_PPDU_NOT_DONE;
-		}
-
-		rxcb = ATH12K_SKB_RXCB(msdu);
-		dma_unmap_single(ab->dev, rxcb->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
-
-		if (mon_mpdu->tail)
-			mon_mpdu->tail->next = msdu;
-		else
-			mon_mpdu->tail = msdu;
-
-		ath12k_dp_mon_buf_replenish(ab, buf_ring, 1);
-
-		break;
-	}
-	case HAL_RX_MSDU_END: {
-		const struct rx_msdu_end_qcn9274 *msdu_end = tlv_data;
-		bool is_first_msdu_in_mpdu;
-		u16 msdu_end_info;
-
-		msdu_end_info = __le16_to_cpu(msdu_end->info5);
-		is_first_msdu_in_mpdu = u32_get_bits(msdu_end_info,
-						     RX_MSDU_END_INFO5_FIRST_MSDU);
-		if (is_first_msdu_in_mpdu) {
-			pmon->mon_mpdu->head = pmon->mon_mpdu->tail;
-			pmon->mon_mpdu->tail = NULL;
-		}
-		break;
-	}
+	case HAL_MON_BUF_ADDR:
+		return HAL_RX_MON_STATUS_BUF_ADDR;
+	case HAL_RX_MSDU_END:
+		return HAL_RX_MON_STATUS_MSDU_END;
 	case HAL_RX_MPDU_END:
-		list_add_tail(&pmon->mon_mpdu->list, &pmon->dp_rx_mon_mpdu_list);
-		break;
+		return HAL_RX_MON_STATUS_MPDU_END;
 	case HAL_DUMMY:
 		return HAL_RX_MON_STATUS_BUF_DONE;
 	case HAL_RX_PPDU_END_STATUS_DONE:
@@ -1215,7 +1165,10 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k *ar, struct ath12k_mon_data *pmon,
 		if ((ptr - skb->data) >= DP_RX_BUFFER_SIZE)
 			break;
 
-	} while (hal_status == HAL_RX_MON_STATUS_PPDU_NOT_DONE);
+	} while ((hal_status == HAL_RX_MON_STATUS_PPDU_NOT_DONE) ||
+		 (hal_status == HAL_RX_MON_STATUS_BUF_ADDR) ||
+		 (hal_status == HAL_RX_MON_STATUS_MPDU_END) ||
+		 (hal_status == HAL_RX_MON_STATUS_MSDU_END));
 
 	return hal_status;
 }
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 294583edd7a2..e4f9e21158dc 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -108,6 +108,9 @@ enum hal_rx_mon_status {
 	HAL_RX_MON_STATUS_PPDU_NOT_DONE,
 	HAL_RX_MON_STATUS_PPDU_DONE,
 	HAL_RX_MON_STATUS_BUF_DONE,
+	HAL_RX_MON_STATUS_BUF_ADDR,
+	HAL_RX_MON_STATUS_MPDU_END,
+	HAL_RX_MON_STATUS_MSDU_END,
 };
 
 #define HAL_RX_MAX_MPDU		256
-- 
2.34.1



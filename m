Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F34C25B78
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 00:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTZtXcapNF3pX025IfIAmuPZ3VEyklP/Ft5kgyE+KD0=; b=L/Ydzg6EG2eyTb/9mJHvHQ5sE9
	hbVkQInh1qDE5d/uvSaqZ/+1quqKLlCIWGxqdFuQ+MwD/yn3Z5PJJgD8R7hn3hGKr72J6IPlG4+Mb
	KSmNxXl7GPq5kR3RTD+BWo4im0z6P15MMLoLcesDOAW/hrFbHgPm3q6tvh9NrkCJvGl5k9GaVGt0p
	DRnoHvfI3AZw8hcK9ctM9ihfEF3ufHeLb5ctX+62pzYUU3xEq1AhYnvr57GpMor8U09OQC3w4IwJl
	aIaTtIY+/D8FK02itoVnoOV14xM0+cGCJaMjXNtdIsCsIssliTWbzxsrsfgBq91xo75QTx/XvTDDY
	R0tA8iPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ofk-00000003Dy6-26a9
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 00:08:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ofe-00000003Dw8-33WP
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 00:08:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FMomsf027349;
	Thu, 16 May 2024 00:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=FTZtXcapNF3pX025IfIAmuPZ3VEyklP/Ft5kgyE+KD0=; b=Ai
	gH9jBs5UJw8ZfWWU8Nugx+1JVZMTz6DmHjPeMQ+jYVBobsrRQPMa5GFS6QSwkhcq
	0gSKQIXYAtAySAq/UDANwmGPFNLrNc1AZArsjiCV6UgpQx6rOJWSEIO+UILdNXNH
	B/4INwuKm6ev1Xp5i2cm5wTuWdhVexmOfB2yv5yH3bD8uIOdbLkjsv64SKJ+wcK4
	HWhEx/xSrNeEG0RNxUhKe2Mmrbi6j2PKjo9h1XEZohxQOob8rXB389z+4YgMgUra
	TQYZ/ejP7X6nsrlpFbdQHgB/a5Bh4HMwC/bvgiKtFCQb9nNr3mBp0UyMCBok0g+6
	q1ZQ/DlyfnOb88oLRtWQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y42kvvvdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 00:08:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G08RVd005280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 00:08:27 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 17:08:25 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 1/2] wifi: ath12k: Refactor Rx descriptor CMEM configuration
Date: Thu, 16 May 2024 05:38:06 +0530
Message-ID: <20240516000807.1704913-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516000807.1704913-1-quic_periyasa@quicinc.com>
References: <20240516000807.1704913-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YYl0jYaDywEvnzdsJJV4cBttbxMfXsVe
X-Proofpoint-ORIG-GUID: YYl0jYaDywEvnzdsJJV4cBttbxMfXsVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_14,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=482 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_170830_911351_239EB8F7 
X-CRM114-Status: GOOD (  15.42  )
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

Currently, data path Rx descriptor placed in the CMEM memory respective
to the Rx offset. This Rx descriptor CMEM placement is not meeting the
requirements to support inter device MLO. In inter device MLO, multiple
devices participate in a group. The device specific Rx descriptor buffers
transmit to multiple device REO rings. To distinguish between device
specific Rx descriptor buffers, the CMEM setup configuration need to
choose a different placement based on the unique identifier (device index).

Below are the CMEM configuration placement representation:

Intra-Device MLO scenario:

        Device 0                                Device 1

     +-------------+                         +-------------+
     |             |                         |             |
     |     Tx      |                         |     Tx      |
     |             |                         |             |
     +-------------+                         +-------------+
     |             |                         |             |
     |     Rx      |                         |     Rx      |
     |             |                         |             |
     +-------------+                         +-------------+

Inter-Device MLO scenario:

        Device 0                                Device 1

     +-------------+                         +-------------+
     |             |                         |             |
     |     Tx      |                         |     Tx      |
     |             |                         |             |
     +-------------+                         +-------------+
     |             |                         |             |
     |     Rx      |                         |   Reserved  |
     |  Device 0   |                         |             |
     |             |                         |             |
     +-------------+                         +-------------+
     |             |                         |     Rx      |
     |   Reserved  |                         |   Device 1  |
     |             |                         |             |
     +-------------+                         +-------------+

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 11 ++++++++---
 drivers/net/wireless/ath/ath12k/dp.h |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 412ab08e6cca..db388eeb901c 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1341,13 +1341,14 @@ static inline void *ath12k_dp_cc_get_desc_addr_ptr(struct ath12k_base *ab,
 struct ath12k_rx_desc_info *ath12k_dp_get_rx_desc(struct ath12k_base *ab,
 						  u32 cookie)
 {
+	struct ath12k_dp *dp = &ab->dp;
 	struct ath12k_rx_desc_info **desc_addr_ptr;
 	u16 start_ppt_idx, end_ppt_idx, ppt_idx, spt_idx;
 
 	ppt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_PPT);
 	spt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_SPT);
 
-	start_ppt_idx = ATH12K_RX_SPT_PAGE_OFFSET;
+	start_ppt_idx = dp->rx_ppt_base + ATH12K_RX_SPT_PAGE_OFFSET;
 	end_ppt_idx = start_ppt_idx + ATH12K_NUM_RX_SPT_PAGES;
 
 	if (ppt_idx < start_ppt_idx ||
@@ -1355,6 +1356,7 @@ struct ath12k_rx_desc_info *ath12k_dp_get_rx_desc(struct ath12k_base *ab,
 	    spt_idx > ATH12K_MAX_SPT_ENTRIES)
 		return NULL;
 
+	ppt_idx = ppt_idx - dp->rx_ppt_base;
 	desc_addr_ptr = ath12k_dp_cc_get_desc_addr_ptr(ab, ppt_idx, spt_idx);
 
 	return *desc_addr_ptr;
@@ -1389,7 +1391,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 	struct ath12k_rx_desc_info *rx_descs, **rx_desc_addr;
 	struct ath12k_tx_desc_info *tx_descs, **tx_desc_addr;
 	u32 i, j, pool_id, tx_spt_page;
-	u32 ppt_idx;
+	u32 ppt_idx, cookie_ppt_idx;
 
 	spin_lock_bh(&dp->rx_desc_lock);
 
@@ -1404,10 +1406,11 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 		}
 
 		ppt_idx = ATH12K_RX_SPT_PAGE_OFFSET + i;
+		cookie_ppt_idx = dp->rx_ppt_base + ppt_idx;
 		dp->spt_info->rxbaddr[i] = &rx_descs[0];
 
 		for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
-			rx_descs[j].cookie = ath12k_dp_cc_cookie_gen(ppt_idx, j);
+			rx_descs[j].cookie = ath12k_dp_cc_cookie_gen(cookie_ppt_idx, j);
 			rx_descs[j].magic = ATH12K_DP_RX_DESC_MAGIC;
 			list_add_tail(&rx_descs[j].list, &dp->rx_desc_free_list);
 
@@ -1468,6 +1471,7 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 		end = start + ATH12K_NUM_TX_SPT_PAGES;
 		break;
 	case ATH12K_DP_RX_DESC:
+		cmem_base += ATH12K_PPT_ADDR_OFFSET(dp->rx_ppt_base);
 		start = ATH12K_RX_SPT_PAGE_OFFSET;
 		end = start + ATH12K_NUM_RX_SPT_PAGES;
 		break;
@@ -1510,6 +1514,7 @@ static int ath12k_dp_cc_init(struct ath12k_base *ab)
 		return -ENOMEM;
 	}
 
+	dp->rx_ppt_base = ab->device_id * ATH12K_NUM_RX_SPT_PAGES;
 	for (i = 0; i < dp->num_spt_pages; i++) {
 		dp->spt_info[i].vaddr = dma_alloc_coherent(ab->dev,
 							   ATH12K_PAGE_SIZE,
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 43589c3dd4bc..742094545089 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -350,6 +350,7 @@ struct ath12k_dp {
 	struct ath12k_hp_update_timer tx_ring_timer[DP_TCL_NUM_RING_MAX];
 	struct ath12k_spt_info *spt_info;
 	u32 num_spt_pages;
+	u32 rx_ppt_base;
 	struct list_head rx_desc_free_list;
 	/* protects the free desc list */
 	spinlock_t rx_desc_lock;
-- 
2.34.1



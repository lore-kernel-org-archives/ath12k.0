Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8971DCD1292
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTat1aGhrTMsPxIa4P5iCvAo8M35yIrsp4enyOWUkwA=; b=N8vylXc4vFDF2Bvqa2Ozzfh5b9
	tQD3vCxiqQUdHTR/otRo3MozUbWQlv3IoB4aCXpgbJfaM4Ukr4DpoNP/iJsiyXbi7x9XBaR4BEqwZ
	k1JG80wSKBZIpsmfrLmlzDoV+FSL0RowLx2uwOUTbdpYBWba0emISTYOTsOza6CvlxcrGxRlmdUvq
	agtnCc5HmQDeW3vEwfp7qiGoDXstFLI8i9mZ5dRM1pWEByikmt3GcCMdAX1L6FJowo0GCJfLlXtNY
	I1JNZOKRseykLfA3T1AYP0rEVU8pQXgLi5aOfTjOy/us27YZUhKlfA9v0FTvZrwYjYYi25AB+44fx
	EHPh8OSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rura1-0000000BV1L-17sS
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 10:22:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurZx-0000000BUyu-1GEJ
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 10:22:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43B6xKjJ028335;
	Thu, 11 Apr 2024 10:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=BTat1aGhrTMsPxIa4P5iCvAo8M35yIrsp4enyOWUkwA=; b=aG
	J29woBvt33R2DOQKh7bYwiq/SafclMDcv3d0Br4uKm0zlLNi/hQYwCe2cLlHaEnf
	xmxNnBL69FKgXUz9EBdEMpgpmFxT7c7VyzqzQLGcCuaFoOn87Ge0s+BUumy+nV/w
	/xenLy9T9vbNTYL+Mm6gClUEJOaetvs55nz5gpDj7/9LkW/uX8Lh+xlFcm8BycAl
	9WFUkkOAJQo0hTqqe2akB8HwcDqFUI2yifws5M7kyLlYt/UaQNaBdWRMG9E+bii/
	B+kHnu3Q0lycyUvFK9+7CDTDHEF3HsUpcRKpCD8yz+Pkw2oS72UOkRofE1Ecy4Cj
	HtFf6yfK457YFt2GyFaw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeb2rgwnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:22:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BAMkAN005705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:22:46 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 03:22:43 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3 2/4] wifi: ath12k: Refactor the hardware cookie conversion init
Date: Thu, 11 Apr 2024 15:52:24 +0530
Message-ID: <20240411102226.4045323-3-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411102226.4045323-1-quic_periyasa@quicinc.com>
References: <20240411102226.4045323-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LHifg9K-D_-8XTefbJsQSDBRZJpos2zC
X-Proofpoint-GUID: LHifg9K-D_-8XTefbJsQSDBRZJpos2zC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_032249_470055_335F796A 
X-CRM114-Status: GOOD (  15.92  )
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

Currently, the Rx descriptor is placed before the Tx descriptor in the
primary page table of the hardware cookie conversion configuration. The
Tx and Rx descriptor offsets are implicitly hardcoded. To allow for easy
displacement of Tx and Rx descriptors, introduce Tx and Rx offset based
cookie conversion initializationi. Additionally, should consider
validating the respective offset ranges while retrieving the Tx and Rx
descriptors. This change will be utilize by the next patch in the series.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 25 +++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h |  3 +++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 796c757c0f58..c8b2eb80b160 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1344,12 +1344,16 @@ struct ath12k_rx_desc_info *ath12k_dp_get_rx_desc(struct ath12k_base *ab,
 						  u32 cookie)
 {
 	struct ath12k_rx_desc_info **desc_addr_ptr;
-	u16 ppt_idx, spt_idx;
+	u16 start_ppt_idx, end_ppt_idx, ppt_idx, spt_idx;
 
 	ppt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_PPT);
 	spt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_SPT);
 
-	if (ppt_idx > ATH12K_NUM_RX_SPT_PAGES ||
+	start_ppt_idx = ATH12K_RX_SPT_PAGE_OFFSET;
+	end_ppt_idx = start_ppt_idx + ATH12K_NUM_RX_SPT_PAGES;
+
+	if (ppt_idx < start_ppt_idx ||
+	    ppt_idx >= end_ppt_idx ||
 	    spt_idx > ATH12K_MAX_SPT_ENTRIES)
 		return NULL;
 
@@ -1362,13 +1366,17 @@ struct ath12k_tx_desc_info *ath12k_dp_get_tx_desc(struct ath12k_base *ab,
 						  u32 cookie)
 {
 	struct ath12k_tx_desc_info **desc_addr_ptr;
-	u16 ppt_idx, spt_idx;
+	u16 start_ppt_idx, end_ppt_idx, ppt_idx, spt_idx;
 
 	ppt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_PPT);
 	spt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_SPT);
 
-	if (ppt_idx < ATH12K_NUM_RX_SPT_PAGES ||
-	    ppt_idx > ab->dp.num_spt_pages ||
+	start_ppt_idx = ATH12K_TX_SPT_PAGE_OFFSET;
+	end_ppt_idx = start_ppt_idx +
+		      (ATH12K_TX_SPT_PAGES_PER_POOL * ATH12K_HW_MAX_QUEUES);
+
+	if (ppt_idx < start_ppt_idx ||
+	    ppt_idx >= end_ppt_idx ||
 	    spt_idx > ATH12K_MAX_SPT_ENTRIES)
 		return NULL;
 
@@ -1397,15 +1405,16 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 			return -ENOMEM;
 		}
 
+		ppt_idx = ATH12K_RX_SPT_PAGE_OFFSET + i;
 		dp->spt_info->rxbaddr[i] = &rx_descs[0];
 
 		for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
-			rx_descs[j].cookie = ath12k_dp_cc_cookie_gen(i, j);
+			rx_descs[j].cookie = ath12k_dp_cc_cookie_gen(ppt_idx, j);
 			rx_descs[j].magic = ATH12K_DP_RX_DESC_MAGIC;
 			list_add_tail(&rx_descs[j].list, &dp->rx_desc_free_list);
 
 			/* Update descriptor VA in SPT */
-			rx_desc_addr = ath12k_dp_cc_get_desc_addr_ptr(ab, i, j);
+			rx_desc_addr = ath12k_dp_cc_get_desc_addr_ptr(ab, ppt_idx, j);
 			*rx_desc_addr = &rx_descs[j];
 		}
 	}
@@ -1425,7 +1434,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 			}
 
 			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
-			ppt_idx = ATH12K_NUM_RX_SPT_PAGES + tx_spt_page;
+			ppt_idx = ATH12K_TX_SPT_PAGE_OFFSET + tx_spt_page;
 
 			dp->spt_info->txbaddr[tx_spt_page] = &tx_descs[0];
 
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 4939aa41dd87..57aba97cbdce 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -223,6 +223,9 @@ struct ath12k_pdev_dp {
 #define ATH12K_NUM_TX_SPT_PAGES	(ATH12K_TX_SPT_PAGES_PER_POOL * ATH12K_HW_MAX_QUEUES)
 #define ATH12K_NUM_SPT_PAGES	(ATH12K_NUM_RX_SPT_PAGES + ATH12K_NUM_TX_SPT_PAGES)
 
+#define ATH12K_TX_SPT_PAGE_OFFSET ATH12K_NUM_RX_SPT_PAGES
+#define ATH12K_RX_SPT_PAGE_OFFSET 0
+
 /* The SPT pages are divided for RX and TX, first block for RX
  * and remaining for TX
  */
-- 
2.34.1



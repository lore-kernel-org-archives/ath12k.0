Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC43AD206A0
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1aF9O9TLW0RfvaLz1H+9s7BMNEqY2REKMO1tAKtxMM=; b=ldP7tYpwxXeTiaO4YzRQGIKwkO
	sMBdEkdPWGphfknnMTy7Iun2Ka1JjKrhO3Ks2hD2yn6blEG/lY6SWLFn4t+0KDgrND+dijWG9PEgO
	XEoH9lG1Btr/cunUcZ4kCgf9U3JwmmUSOpgdUUinfA7cnK42kBDhnawC2SQb2E+V+HFXnXWo3iFjs
	KuB0/YMs38GpMA0tkyq84Fa8lSteLJkCr0GxXWqB35DdUKYbJSgy37s7+OSN3GHc/0ltZR0VzfQ3U
	cJsF5I9w240Wd0QJbX0eLFaZIybg1Bu1/PR36y4Y9ut/aBpo7/w1xx34WEdPvgVWY47h+qRpNHCxw
	igUbL2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y1p-0000000AleW-0ali
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 07:01:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xyM-0000000Akgd-1upW
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 06:57:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G07AR0017040;
	Wed, 16 Oct 2024 06:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1aF9O9TLW0RfvaLz1H+9s7BMNEqY2REKMO1tAKtxMM=; b=k9WzAQAAUzMDCZxa
	wsbLk/84sIvCRwbzERGm0GlIXdkYNV1bGxMeGj2NBC+w2TRQZZ/PB4CE91StDU1k
	5c1q2FO8L+InmqrbVqK4z/uon1NyY3p+ufYSv5B2+nF0pm10448CmKsGI70PctSc
	v5nZed0npuGMNCeMM2hZvsRn9xQ0YSOLnTUG5ezC9lo27pCjYXYP0y+u+4Vh8wHs
	iQ+G+QKa5MueM6eKDsL+ZBgjXthKCFYG4Cw9+xXvZ47FpUOopjsBft7+3b6GZ9U7
	O+KGygbz6B0qGAhSlYwYnJtKWiz3huTINRn6KTVvjBYVfUvY8WIGISjtHrITWoQb
	30TV0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429t5kjjsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 06:57:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G6vTG5018936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 06:57:29 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 23:57:27 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v3 03/11] wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
Date: Wed, 16 Oct 2024 14:56:52 +0800
Message-ID: <20241016065700.1090-4-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241016065700.1090-1-quic_kangyang@quicinc.com>
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gsf4nth0dSloLimG1UF51wF7X5O6pVMI
X-Proofpoint-GUID: Gsf4nth0dSloLimG1UF51wF7X5O6pVMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=2 impostorscore=0
 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=824
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410160044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_235730_522708_72AA2F04 
X-CRM114-Status: GOOD (  11.77  )
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

Current struct hal_rx_ppdu_end_user_stats in hal_rx.h is not matched
with hardware descriptor definition.

So update this structure and related code.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 10 +++++-----
 drivers/net/wireless/ath/ath12k/hal_rx.h | 22 +++++++++++-----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 5c6749bc4039..8d0d3c849c90 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -21,20 +21,20 @@ static void ath12k_dp_mon_rx_handle_ofdma_info(void *rx_tlv,
 		__le32_to_cpu(ppdu_end_user->usr_resp_ref_ext);
 }
 
-static void
+static inline void
 ath12k_dp_mon_rx_populate_byte_count(const struct hal_rx_ppdu_end_user_stats *stats,
 				     void *ppduinfo,
 				     struct hal_rx_user_status *rx_user_status)
 {
-	u32 mpdu_ok_byte_count = __le32_to_cpu(stats->mpdu_ok_cnt);
-	u32 mpdu_err_byte_count = __le32_to_cpu(stats->mpdu_err_cnt);
+	u32 mpdu_ok_byte_count = __le32_to_cpu(stats->info7);
+	u32 mpdu_err_byte_count = __le32_to_cpu(stats->info8);
 
 	rx_user_status->mpdu_ok_byte_count =
 		u32_get_bits(mpdu_ok_byte_count,
-			     HAL_RX_PPDU_END_USER_STATS_MPDU_DELIM_OK_BYTE_COUNT);
+			     HAL_RX_PPDU_END_USER_STATS_INFO7_MPDU_OK_BYTE_COUNT);
 	rx_user_status->mpdu_err_byte_count =
 		u32_get_bits(mpdu_err_byte_count,
-			     HAL_RX_PPDU_END_USER_STATS_MPDU_DELIM_ERR_BYTE_COUNT);
+			     HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_ERR_BYTE_COUNT);
 }
 
 static void
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 095216eabc01..837ba4adba88 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_HAL_RX_H
@@ -240,13 +240,13 @@ struct hal_rx_ppdu_start {
 	__le32 ppdu_start_ts;
 } __packed;
 
-#define HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR	GENMASK(25, 16)
+#define HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR	GENMASK(26, 16)
 
-#define HAL_RX_PPDU_END_USER_STATS_INFO1_MPDU_CNT_FCS_OK	GENMASK(8, 0)
-#define HAL_RX_PPDU_END_USER_STATS_INFO1_FC_VALID		BIT(9)
-#define HAL_RX_PPDU_END_USER_STATS_INFO1_QOS_CTRL_VALID		BIT(10)
-#define HAL_RX_PPDU_END_USER_STATS_INFO1_HT_CTRL_VALID		BIT(11)
-#define HAL_RX_PPDU_END_USER_STATS_INFO1_PKT_TYPE		GENMASK(23, 20)
+#define HAL_RX_PPDU_END_USER_STATS_INFO1_MPDU_CNT_FCS_OK	GENMASK(10, 0)
+#define HAL_RX_PPDU_END_USER_STATS_INFO1_FC_VALID		BIT(11)
+#define HAL_RX_PPDU_END_USER_STATS_INFO1_QOS_CTRL_VALID		BIT(12)
+#define HAL_RX_PPDU_END_USER_STATS_INFO1_HT_CTRL_VALID		BIT(13)
+#define HAL_RX_PPDU_END_USER_STATS_INFO1_PKT_TYPE              GENMASK(24, 21)
 
 #define HAL_RX_PPDU_END_USER_STATS_INFO2_AST_INDEX		GENMASK(15, 0)
 #define HAL_RX_PPDU_END_USER_STATS_INFO2_FRAME_CTRL		GENMASK(31, 16)
@@ -262,8 +262,8 @@ struct hal_rx_ppdu_start {
 #define HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP		GENMASK(15, 0)
 #define HAL_RX_PPDU_END_USER_STATS_INFO6_TID_EOSP_BITMAP	GENMASK(31, 16)
 
-#define HAL_RX_PPDU_END_USER_STATS_MPDU_DELIM_OK_BYTE_COUNT	GENMASK(24, 0)
-#define HAL_RX_PPDU_END_USER_STATS_MPDU_DELIM_ERR_BYTE_COUNT	GENMASK(24, 0)
+#define HAL_RX_PPDU_END_USER_STATS_INFO7_MPDU_OK_BYTE_COUNT    GENMASK(24, 0)
+#define HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_ERR_BYTE_COUNT   GENMASK(24, 0)
 
 struct hal_rx_ppdu_end_user_stats {
 	__le32 rsvd0[2];
@@ -278,9 +278,9 @@ struct hal_rx_ppdu_end_user_stats {
 	__le32 usr_resp_ref;
 	__le32 info6;
 	__le32 rsvd3[4];
-	__le32 mpdu_ok_cnt;
+	__le32 info7;
 	__le32 rsvd4;
-	__le32 mpdu_err_cnt;
+	__le32 info8;
 	__le32 rsvd5[2];
 	__le32 usr_resp_ref_ext;
 	__le32 rsvd6;
-- 
2.34.1



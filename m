Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697ACD15D9D
	for <ath12k@archiver.kernel.org>; Tue, 22 Oct 2024 11:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1PDkp5+lrNSmOYv75sfgOzIDz2rQkUNbwmcrVYDI/0=; b=XI4tMq4k+t0kMElI423zy+lxPG
	jLfofC1GY895F5ouALCgoddKyiZq7EbQifgwl/bzEqiEis/4tspk5msbfqa4ofLtlffuo3Clq1j34
	BggzkeCfSTuqdfAYuZKaiHU+b4CO5laLO5rOY7DzbS4z5ivLtyTGGipjTTN+8TYjNPf9Gj3SRmxbz
	UST3tWxvffppTs74Uoz7DRNL3LpQbMSX8e4cM12UoRLPPokKBpnZNiAgCs5n9iXn/ui/Xefi3peZ+
	qQdEIAXbF4LVG8cIc+xBMgwpjlaNH3D0UVb93IFH3CnPP1kJRU47Sw+cJh515/rnrk2WyvtSZ0bED
	OdQb6gUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CmR-0000000AeTI-0Ozs
	for ath12k@archiver.kernel.org;
	Tue, 22 Oct 2024 11:10:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ckz-0000000AeF1-45O9
	for ath12k@lists.infradead.org;
	Tue, 22 Oct 2024 11:08:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M6l3rP009622;
	Tue, 22 Oct 2024 11:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1PDkp5+lrNSmOYv75sfgOzIDz2rQkUNbwmcrVYDI/0=; b=pMKBfR6lutZI2/wN
	1LyBYQaIGnB1BDhau6rNaczdEhoHTBZ0mwDfktuB4A3VcfA1dn3qvpDrw5IdE6d9
	TAg+fSQM2V38pvzmm0ciw6J8giEaQxrKzk4H4hH1ah7I3TMbEcDuNaSE8atewWjB
	hWR7faJULY7kBRuAdYOOwk/EzLKkbV0BXvNywG4Ii+NOWHsFk4C+/w3heDWfyMmW
	EdI60AMhqrmc4GKcro0P0FAxkthQajwRfSfVlVQa82o9FB2PA19ojlSEA7Y33Dh8
	L0B1mVR3NkgAGNadvdObIJC/JermoHdfKpo5e2Wf+naBTMnYgXuXdAYuXt0vLzdU
	o5aHMg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkbt4ac4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:08:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MB8tFH012493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:08:55 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 04:08:54 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 2/8] wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
Date: Tue, 22 Oct 2024 19:08:25 +0800
Message-ID: <20241022110831.974-3-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241022110831.974-1-quic_kangyang@quicinc.com>
References: <20241022110831.974-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T6gLO1S8m-zhk0hI-LTc1W5meBFtxs0v
X-Proofpoint-GUID: T6gLO1S8m-zhk0hI-LTc1W5meBFtxs0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=924 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_040858_164081_DF86CFE7 
X-CRM114-Status: GOOD (  11.54  )
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
with hardware descriptor definition. This hardware descriptor definition
is determined by hardware. Host shall follow it. 

So update struct hal_rx_ppdu_end_user_stats and related code.

Both QCN9274 and WCN7850 need this modification.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 11 ++++-------
 drivers/net/wireless/ath/ath12k/hal_rx.h | 22 +++++++++++-----------
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f688f4ad5168..6454ceba142a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -26,15 +26,12 @@ ath12k_dp_mon_rx_populate_byte_count(const struct hal_rx_ppdu_end_user_stats *st
 				     void *ppduinfo,
 				     struct hal_rx_user_status *rx_user_status)
 {
-	u32 mpdu_ok_byte_count = __le32_to_cpu(stats->mpdu_ok_cnt);
-	u32 mpdu_err_byte_count = __le32_to_cpu(stats->mpdu_err_cnt);
-
 	rx_user_status->mpdu_ok_byte_count =
-		u32_get_bits(mpdu_ok_byte_count,
-			     HAL_RX_PPDU_END_USER_STATS_MPDU_DELIM_OK_BYTE_COUNT);
+		le32_get_bits(stats->info7,
+			      HAL_RX_PPDU_END_USER_STATS_INFO7_MPDU_OK_BYTE_COUNT);
 	rx_user_status->mpdu_err_byte_count =
-		u32_get_bits(mpdu_err_byte_count,
-			     HAL_RX_PPDU_END_USER_STATS_MPDU_DELIM_ERR_BYTE_COUNT);
+		le32_get_bits(stats->info8,
+			      HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_ERR_BYTE_COUNT);
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



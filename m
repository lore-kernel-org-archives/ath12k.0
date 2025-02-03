Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9DCC02196
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=losvfwiy+oxSC//U9hZClq2UjaEKhbLny1GwfnJpMyM=; b=sMUaC0+BOMXAKAiSLq7qKLW5m6
	4OjbnXmfPAOpusXDqMJKohZaJ0rPxqOkzCnakVJPpKxVm4FPs+WsB28OGyGZzQkF+gSJRM2MV6AFe
	Dp2JuioTAvlUfr5qpKJxKmvT6nd/Fr9ZWnULxXRTVGeXrXe1tHFiFqwnEE6N7/yh98832ctNj3gXF
	qJa6kGGIzFQGcyNiRVYkGQUhN1vs9pgSooM8UQ88+rvRuZn92vYs+yIC9Ej8vBmruCrwmDCJrPhRW
	UyXtjZqnUVog8vsGnh96LLVCI55NMb9umLqfTqCIEgPcZ2Gtorh+k/SjQneoelM/UntSg8sjkkBNx
	7iXlp5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terKU-0000000Ekkz-1Q9S
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 07:57:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1terJL-0000000EkcG-0lfm
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 07:56:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135bgFo014692;
	Mon, 3 Feb 2025 07:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	losvfwiy+oxSC//U9hZClq2UjaEKhbLny1GwfnJpMyM=; b=YNV3B6NhdolMNslG
	5xtRVPWJGhGYDGX1hAL8f4C5soxsdG8dCJrnmMy1a3SExrDu5/8BJ70o+BOzSDnb
	9CgILKGCOHnOVWEShUFtKsJJBDpUMs/ZNSU9buNU3KF5n4JlWXDv9fgKiJ4KH/vC
	uWMSjMtnlT3449yrPHXw2GkSikSDMdYBUIaYmRvMUUbmoYs35yxz0A6U6kFhYPrx
	WEFPv/uN7/dR4Cr6/mkUPfGZCUm9DtIbkSWjdNahPa9Unf0lTd6x6yhDToZOFLy8
	9/4BVbeI93pO0aAhC2eUlh9WQqsZwn+03XFKMgR7NlN1sR6QWLQKF/phJgT1x1gE
	txfBcQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqtng8tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 07:56:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5137u0rq009521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 07:56:00 GMT
Received: from hu-bmahalin-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Feb 2025 23:55:59 -0800
From: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bmahalin@quicinc.com>
Subject: [PATCH v3 1/2] wifi: ath12k: Update HTT_TCL_METADATA version and bit mask definitions
Date: Sun, 2 Feb 2025 23:55:37 -0800
Message-ID: <20250203075538.3982875-2-quic_bmahalin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203075538.3982875-1-quic_bmahalin@quicinc.com>
References: <20250203075538.3982875-1-quic_bmahalin@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TgUbH3WV6Q23wSjrXvO0POvzVMZYTSv9
X-Proofpoint-ORIG-GUID: TgUbH3WV6Q23wSjrXvO0POvzVMZYTSv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_235603_329844_9D8A8F39 
X-CRM114-Status: GOOD (  14.29  )
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

Update the HTT_TCL_METADATA version to the latest version (2)
as the bit definitions have changed a little to support more
features. This new version allows the host to submit a packet with
more information to the firmware. Firmware uses this additional
information to do special processing for certain frames.

All the firmware binaries available in upstream/public are compatible with
this HTT version update.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    | 21 ++++++++++++++-------
 drivers/net/wireless/ath/ath12k/dp_tx.c | 12 ++++++++++--
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index f68bb78d4a11..7cdc62aa35be 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_DP_H
@@ -372,17 +372,18 @@ struct ath12k_dp {
 };
 
 /* HTT definitions */
+#define HTT_TAG_TCL_METADATA_VERSION		5
 
-#define HTT_TCL_META_DATA_TYPE			BIT(0)
-#define HTT_TCL_META_DATA_VALID_HTT		BIT(1)
+#define HTT_TCL_META_DATA_TYPE			GENMASK(1, 0)
+#define HTT_TCL_META_DATA_VALID_HTT		BIT(2)
 
 /* vdev meta data */
-#define HTT_TCL_META_DATA_VDEV_ID		GENMASK(9, 2)
-#define HTT_TCL_META_DATA_PDEV_ID		GENMASK(11, 10)
-#define HTT_TCL_META_DATA_HOST_INSPECTED	BIT(12)
+#define HTT_TCL_META_DATA_VDEV_ID		 GENMASK(10, 3)
+#define HTT_TCL_META_DATA_PDEV_ID		 GENMASK(12, 11)
+#define HTT_TCL_META_DATA_HOST_INSPECTED_MISSION BIT(13)
 
 /* peer meta data */
-#define HTT_TCL_META_DATA_PEER_ID		GENMASK(15, 2)
+#define HTT_TCL_META_DATA_PEER_ID		GENMASK(15, 3)
 
 /* HTT tx completion is overlaid in wbm_release_ring */
 #define HTT_TX_WBM_COMP_INFO0_STATUS		GENMASK(16, 13)
@@ -413,9 +414,15 @@ enum htt_h2t_msg_type {
 };
 
 #define HTT_VER_REQ_INFO_MSG_ID		GENMASK(7, 0)
+#define HTT_OPTION_TCL_METADATA_VER_V2	2
+#define HTT_OPTION_TAG			GENMASK(7, 0)
+#define HTT_OPTION_LEN			GENMASK(15, 8)
+#define HTT_OPTION_VALUE		GENMASK(31, 16)
+#define HTT_TCL_METADATA_VER_SZ		4
 
 struct htt_ver_req_cmd {
 	__le32 ver_reg_info;
+	__le32 tcl_metadata_version;
 } __packed;
 
 enum htt_srng_ring_type {
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index aa8058dd2da6..5ed41783d039 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
@@ -1103,7 +1103,15 @@ int ath12k_dp_tx_htt_h2t_ver_req_msg(struct ath12k_base *ab)
 	skb_put(skb, len);
 	cmd = (struct htt_ver_req_cmd *)skb->data;
 	cmd->ver_reg_info = le32_encode_bits(HTT_H2T_MSG_TYPE_VERSION_REQ,
-					     HTT_VER_REQ_INFO_MSG_ID);
+					     HTT_OPTION_TAG);
+
+	cmd->tcl_metadata_version = le32_encode_bits(HTT_TAG_TCL_METADATA_VERSION,
+						     HTT_OPTION_TAG);
+	cmd->tcl_metadata_version |= le32_encode_bits(HTT_TCL_METADATA_VER_SZ,
+						      HTT_OPTION_LEN);
+	cmd->tcl_metadata_version |=
+			le32_encode_bits(HTT_OPTION_TCL_METADATA_VER_V2,
+					 HTT_OPTION_VALUE);
 
 	ret = ath12k_htc_send(&ab->htc, dp->eid, skb);
 	if (ret) {
-- 
2.34.1



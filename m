Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D627CA0FF6
	for <ath12k@archiver.kernel.org>; Thu, 28 Aug 2025 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eea2h7gGop78I4biOnk1ZeiZpbObDE8lZuwwlJ5P/PI=; b=M+Ebo6tA97WhsiAbcZuL8tQXim
	7DCRcVN0/vqV4dxNI+1/A+/TzN5zYbhzwazyggio7dlpXmbe43dgsx8x95NroW36Is9OeLcDlZqao
	DDgn0RwOv7Oq76C0KjkehU7KLGUMa1Wue/gfTJA7RfH2p4aX0I75R0xupAVR05UKNy/phf/TZuSaY
	PDw+WMOS5sf4kZz9vuWcWsQEJtU2AUB2L20ZH/g+pOY8S/6Pvx0xfgpvElb1DjR8It30rKvbHTwja
	EP1RpdjLaK6iHGM/TWabyapdq54/eWAq9tLQTtIUo2eOL6ItlIbuEa2iTVITD08QehNRNL9P9N08u
	i/hZ5qGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urk7X-00000003LNU-3pPq;
	Thu, 28 Aug 2025 21:25:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgXy-00000002YeN-2Lcy
	for ath12k@bombadil.infradead.org;
	Thu, 28 Aug 2025 17:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Eea2h7gGop78I4biOnk1ZeiZpbObDE8lZuwwlJ5P/PI=; b=TeKUjsA/uon5oFtGZc4jKcKtXh
	RgdXOR09268WTD7Gbs08appBNqdd3NVUDKatESRt8N1YX23oLgr1UuKW1E/T1swnNMegVOsQ+9sR2
	KRqxfYV9UqQRry4TvCZZkEPrR8eNqAtxEFbjEWId1vLJQQvbvVABUaguqRBcg2KR9LQvpPcDrRl5Y
	GMD8WwKaHfBwJyqouu+inHEpFWD74K+FfaW9g7dl2kjYs3Ty2eFUsMml40cqfZ9zPti6EJDHGDa8N
	0dpNzgaxduOaoJi0bYs2kDRkmtFv0l26T8Yvq3HY/kbHucWSvjFAfjD8C3vm6bdxYloKzZKGDRfzP
	JiX4hoHA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgXv-00000002pAA-11vY
	for ath12k@lists.infradead.org;
	Thu, 28 Aug 2025 17:36:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SEDxH2031332;
	Thu, 28 Aug 2025 17:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eea2h7gGop78I4biOnk1ZeiZpbObDE8lZuwwlJ5P/PI=; b=nDMjxE/slDz6hoSM
	OAZ6sKUbGhAZtChJQOn8uh3ngMs4Dgi13oEdSynELyNLkBT7Pn+HNd8kVZrQPnU0
	nZJ0SRC3FoNcPllPDO4ZqFF6zSluONy8h3srtUm3V6Mj/u/HyyQbqRYazayToEuA
	weQNI4FWe4bBY0xL9UeuDneh1Z4OqVABpi70d4tXBmlO8jc+1HmZPCKB21ATbo+/
	astQ1Y6PmY/MXEaE5FGtiECkRjAHZKtmLRshw2aDZI7S0sCFKKMydmwwq6SyjbCd
	+sl3QcrQz1cAhCM2nBSmDW7sKMJYnBuDRgJek7X3yq5F+Pi7VQVqm8PT78Ol9eWi
	gokjIQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615s2u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SHaKce008998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:20 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 10:36:19 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 07/20] wifi: ath12k: Move rx_desc.h file to wifi7 directory
Date: Thu, 28 Aug 2025 23:05:40 +0530
Message-ID: <20250828173553.3341351-8-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
References: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX7UJlxIY75/Ho
 Lhz/ojXaFNjaE6z5eyBbGZGmMq3TOhyCOCWqyAjzNBc2vbY7Fa5accOmBLYdLQeECBtA8dEuPuu
 B4UsbXqhWvDKRTFTAFDfFPPi6KVaR/uh3N/07JHG49bvTHgu9+kgGfv3W1pMFUtSHwGLAlMnnYc
 Osd7Z75LPTfwLlifPzVPN5VkPPqbzumh48mB302kaOzft2sfUnoftCUc41ub8sBmERlI9gXlCcp
 ebyAo6E3s5ydsbO1gvef7ZI7Vr8hM67PHgO9QA2xL/AfQZjnLQUk0lSxLkHds+afVVOiAQYTgKY
 hJTuAS6+ue31+N7FCgWS5ppZzUn02d70oaJ5N8dIH5UYQAeER6GxLDDjp4UJUzgqRW8+teAxuSo
 lQv04SMz
X-Proofpoint-GUID: o28t2Kbvkd9XCmi-JU1SnnDoEjt8ShcS
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b09395 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=CWIswwSOSLXq1aIOl4QA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: o28t2Kbvkd9XCmi-JU1SnnDoEjt8ShcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_183623_987796_9F629312 
X-CRM114-Status: GOOD (  13.69  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

Move wifi7 architecture specific file rx_desc.h to wifi7 directory
and rename it to hal_rx_desc.h to match the naming convention used,
and move the common part from it to hal.h file which is in the
common directory.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  2 +-
 drivers/net/wireless/ath/ath12k/hal.h         | 48 ++++++++++++++++++-
 .../ath12k/{rx_desc.h => wifi7/hal_rx_desc.h} | 48 +------------------
 3 files changed, 49 insertions(+), 49 deletions(-)
 rename drivers/net/wireless/ath/ath12k/{rx_desc.h => wifi7/hal_rx_desc.h} (97%)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 1909f9070d46..caff92bffb84 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -7,7 +7,7 @@
 #define ATH12K_DP_RX_H
 
 #include "core.h"
-#include "rx_desc.h"
+#include "wifi7/hal_rx_desc.h"
 #include "debug.h"
 
 #define DP_MAX_NWIFI_HDR_LEN	30
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index ec8a078f0739..c99878262a4a 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -8,7 +8,7 @@
 #define ATH12K_HAL_H
 
 #include "wifi7/hal_desc.h"
-#include "rx_desc.h"
+#include "wifi7/hal_rx_desc.h"
 
 struct ath12k_base;
 
@@ -30,6 +30,11 @@ struct ath12k_base;
 #define HAL_RX_MON_MAX_AGGR_SIZE	128
 #define HAL_MAX_UL_MU_USERS	37
 
+#define MAX_USER_POS 8
+#define MAX_MU_GROUP_ID 64
+#define MAX_MU_GROUP_SHOW 16
+#define MAX_MU_GROUP_LENGTH (6 * MAX_MU_GROUP_SHOW)
+
 #define HAL_CE_REMAP_REG_BASE	(ab->ce_remap_base_addr)
 
 #define HAL_LINK_DESC_SIZE			(32 << 2)
@@ -824,6 +829,47 @@ enum hal_srng_dir {
 	HAL_SRNG_DIR_DST
 };
 
+enum rx_msdu_start_pkt_type {
+	RX_MSDU_START_PKT_TYPE_11A,
+	RX_MSDU_START_PKT_TYPE_11B,
+	RX_MSDU_START_PKT_TYPE_11N,
+	RX_MSDU_START_PKT_TYPE_11AC,
+	RX_MSDU_START_PKT_TYPE_11AX,
+	RX_MSDU_START_PKT_TYPE_11BA,
+	RX_MSDU_START_PKT_TYPE_11BE,
+};
+
+enum rx_msdu_start_sgi {
+	RX_MSDU_START_SGI_0_8_US,
+	RX_MSDU_START_SGI_0_4_US,
+	RX_MSDU_START_SGI_1_6_US,
+	RX_MSDU_START_SGI_3_2_US,
+};
+
+enum rx_msdu_start_recv_bw {
+	RX_MSDU_START_RECV_BW_20MHZ,
+	RX_MSDU_START_RECV_BW_40MHZ,
+	RX_MSDU_START_RECV_BW_80MHZ,
+	RX_MSDU_START_RECV_BW_160MHZ,
+};
+
+enum rx_msdu_start_reception_type {
+	RX_MSDU_START_RECEPTION_TYPE_SU,
+	RX_MSDU_START_RECEPTION_TYPE_DL_MU_MIMO,
+	RX_MSDU_START_RECEPTION_TYPE_DL_MU_OFDMA,
+	RX_MSDU_START_RECEPTION_TYPE_DL_MU_OFDMA_MIMO,
+	RX_MSDU_START_RECEPTION_TYPE_UL_MU_MIMO,
+	RX_MSDU_START_RECEPTION_TYPE_UL_MU_OFDMA,
+	RX_MSDU_START_RECEPTION_TYPE_UL_MU_OFDMA_MIMO,
+};
+
+enum rx_desc_decap_type {
+	RX_DESC_DECAP_TYPE_RAW,
+	RX_DESC_DECAP_TYPE_NATIVE_WIFI,
+	RX_DESC_DECAP_TYPE_ETHERNET2_DIX,
+	RX_DESC_DECAP_TYPE_8023,
+};
+
 struct hal_rx_user_status {
 	u32 mcs:4,
 	nss:3,
diff --git a/drivers/net/wireless/ath/ath12k/rx_desc.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx_desc.h
similarity index 97%
rename from drivers/net/wireless/ath/ath12k/rx_desc.h
rename to drivers/net/wireless/ath/ath12k/wifi7/hal_rx_desc.h
index 6c600473b402..60f165a176e0 100644
--- a/drivers/net/wireless/ath/ath12k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx_desc.h
@@ -1,18 +1,11 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef ATH12K_RX_DESC_H
 #define ATH12K_RX_DESC_H
 
-enum rx_desc_decap_type {
-	RX_DESC_DECAP_TYPE_RAW,
-	RX_DESC_DECAP_TYPE_NATIVE_WIFI,
-	RX_DESC_DECAP_TYPE_ETHERNET2_DIX,
-	RX_DESC_DECAP_TYPE_8023,
-};
-
 enum rx_desc_decrypt_status_code {
 	RX_DESC_DECRYPT_STATUS_CODE_OK,
 	RX_DESC_DECRYPT_STATUS_CODE_UNPROTECTED_FRAME,
@@ -631,40 +624,6 @@ struct rx_mpdu_start_qcn9274_compact {
  *
  */
 
-enum rx_msdu_start_pkt_type {
-	RX_MSDU_START_PKT_TYPE_11A,
-	RX_MSDU_START_PKT_TYPE_11B,
-	RX_MSDU_START_PKT_TYPE_11N,
-	RX_MSDU_START_PKT_TYPE_11AC,
-	RX_MSDU_START_PKT_TYPE_11AX,
-	RX_MSDU_START_PKT_TYPE_11BA,
-	RX_MSDU_START_PKT_TYPE_11BE,
-};
-
-enum rx_msdu_start_sgi {
-	RX_MSDU_START_SGI_0_8_US,
-	RX_MSDU_START_SGI_0_4_US,
-	RX_MSDU_START_SGI_1_6_US,
-	RX_MSDU_START_SGI_3_2_US,
-};
-
-enum rx_msdu_start_recv_bw {
-	RX_MSDU_START_RECV_BW_20MHZ,
-	RX_MSDU_START_RECV_BW_40MHZ,
-	RX_MSDU_START_RECV_BW_80MHZ,
-	RX_MSDU_START_RECV_BW_160MHZ,
-};
-
-enum rx_msdu_start_reception_type {
-	RX_MSDU_START_RECEPTION_TYPE_SU,
-	RX_MSDU_START_RECEPTION_TYPE_DL_MU_MIMO,
-	RX_MSDU_START_RECEPTION_TYPE_DL_MU_OFDMA,
-	RX_MSDU_START_RECEPTION_TYPE_DL_MU_OFDMA_MIMO,
-	RX_MSDU_START_RECEPTION_TYPE_UL_MU_MIMO,
-	RX_MSDU_START_RECEPTION_TYPE_UL_MU_OFDMA,
-	RX_MSDU_START_RECEPTION_TYPE_UL_MU_OFDMA_MIMO,
-};
-
 #define RX_MSDU_END_64_TLV_SRC_LINK_ID		GENMASK(24, 22)
 
 #define RX_MSDU_END_INFO0_RXPCU_MPDU_FITLER	GENMASK(1, 0)
@@ -1536,9 +1495,4 @@ struct hal_rx_desc {
 	} u;
 } __packed;
 
-#define MAX_USER_POS 8
-#define MAX_MU_GROUP_ID 64
-#define MAX_MU_GROUP_SHOW 16
-#define MAX_MU_GROUP_LENGTH (6 * MAX_MU_GROUP_SHOW)
-
 #endif /* ATH12K_RX_DESC_H */
-- 
2.34.1



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5796FC0219D
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vw+oxc2DTKgUm3w2xXohf3VUmdQ2Fii77uEjt3LEYxg=; b=oVTNCf0ijVFohSnx8TkAfTSsTg
	QAOhoizDoAwxb6of7Eix1btjCy7VNJrHwnWEL32G1NIwuicFcIEkz+Mrqc+jNw9eJ67TGARNVtVKd
	GTWO5gU6x6y7ZRl9p7ZQO9lU6gpXvYAqn6uzNGZEMlxDWKGbNLUHfgAgvDUXFwK43DuEK98wLlb/k
	p7rFed/v++FzJ19vzD4k7xNX6A13CwbpB/2ypH91kpHcC3g5TcVrt6VUxrfqutkrSAzGza9AO9Az6
	lRwD67LWdTpUgB4niOoTSNGmU8Co+dpU5vhwFbFlPTzf47avM5e55IByNfNDdhO6H8wSO6qykvPWg
	7BuT23CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSOw-0000000AXVY-0GmE
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 17:44:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSBl-0000000AUul-3x5w
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 17:30:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517GuNMV003447;
	Fri, 7 Feb 2025 17:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vw+oxc2DTKgUm3w2xXohf3VU
	mdQ2Fii77uEjt3LEYxg=; b=JBBrB1ptL9qNjfEqUCwyK6gWKDXBUPMN14fTC7wr
	b9P4VTsVmdTcnveq+Ml+qgQ6mSCCiq4HQJPJedDvt2QtACijU/SK25RNcl96VLJj
	IKyu5eD9dQmsAdLg2mz4afJ8y3EjpAjYRiy6lSOTYRVYD9Bd98NXlObLv0cuR5qw
	VPb8abJ2juVrAMJHnBd7WX+uVPugivnjA6+/bQlur4/uQd8fF3MRPkUdn4r3NXup
	E8YwCi6Bobu8vOmC2eLfw5NOeNrl7GygQHjyiIriEDrTCfn6RB0Gl3jJd1CdN09j
	u+LpvovG1X9eRqDPmnWBDNtQawbVji5gaPerxS24j44gRA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44np4w02ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 17:30:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517HUmZL018687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 17:30:48 GMT
Received: from hu-nithp-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 09:30:46 -0800
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Balamurugan S
	<quic_bselvara@quicinc.com>,
        Nithyanantham Paramasivam
	<quic_nithp@quicinc.com>
Subject: [PATCH v2 2/3] wifi: ath12k: Add support to clear qdesc array in REO cache
Date: Fri, 7 Feb 2025 23:00:22 +0530
Message-ID: <20250207173023.3856217-3-quic_nithp@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250207173023.3856217-1-quic_nithp@quicinc.com>
References: <20250207173023.3856217-1-quic_nithp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ilcFstXqiD-VuswsW0767mnMxkXqsiSG
X-Proofpoint-GUID: ilcFstXqiD-VuswsW0767mnMxkXqsiSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=867 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502070131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_093049_978030_C3DBC15C 
X-CRM114-Status: GOOD (  14.52  )
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

From: Balamurugan S <quic_bselvara@quicinc.com>

Currently, the existing code lacks functionality to clear the qdesc
array in the REO cache. As a result, any updates in the LUT are not
reflected in the REO cache. To address this issue, add functionality
to clear the qdesc array in the REO cache during a peer TID update.
To do this, set the CLEAR_DESC_ARRAY field of
WCSS_UMAC_REO_R0_QDESC_ADDR_READ and then reset it.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c  |  1 +
 drivers/net/wireless/ath/ath12k/hal.h    |  1 +
 drivers/net/wireless/ath/ath12k/hal_rx.c | 19 ++++++++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8ca756d74b2d..9527e7fbe81a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -762,6 +762,7 @@ static void ath12k_peer_rx_tid_qref_setup(struct ath12k_base *ab, u16 peer_id, u
 	qref->info1 = u32_encode_bits(upper_32_bits(paddr),
 				      BUFFER_ADDR_INFO1_ADDR) |
 		      u32_encode_bits(tid, DP_REO_QREF_NUM);
+	ath12k_hal_reo_shared_qaddr_cache_clear(ab);
 }
 
 static void ath12k_peer_rx_tid_qref_reset(struct ath12k_base *ab, u16 peer_id, u16 tid)
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index f0e6ce235f1e..052e27338762 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1161,4 +1161,5 @@ int ath12k_hal_srng_update_shadow_config(struct ath12k_base *ab,
 void ath12k_hal_srng_shadow_config(struct ath12k_base *ab);
 void ath12k_hal_srng_shadow_update_hp_tp(struct ath12k_base *ab,
 					 struct hal_srng *srng);
+void ath12k_hal_reo_shared_qaddr_cache_clear(struct ath12k_base *ab);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index ac17d6223fa7..98eeccc68fcd 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "debug.h"
@@ -851,3 +851,20 @@ void ath12k_hal_reo_hw_setup(struct ath12k_base *ab, u32 ring_hash_map)
 	ath12k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_3,
 			   ring_hash_map);
 }
+
+void ath12k_hal_reo_shared_qaddr_cache_clear(struct ath12k_base *ab)
+{
+	u32 val;
+
+	lockdep_assert_held(&ab->base_lock);
+	val = ath12k_hif_read32(ab, HAL_SEQ_WCSS_UMAC_REO_REG +
+				HAL_REO1_QDESC_ADDR(ab));
+
+	val |= u32_encode_bits(1, HAL_REO_QDESC_ADDR_READ_CLEAR_QDESC_ARRAY);
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG +
+			   HAL_REO1_QDESC_ADDR(ab), val);
+
+	val &= ~HAL_REO_QDESC_ADDR_READ_CLEAR_QDESC_ARRAY;
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG +
+			   HAL_REO1_QDESC_ADDR(ab), val);
+}
-- 
2.17.1


